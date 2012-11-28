(*
 *  Haxe/Objective-C Compiler
 *  Copyright (c)2012 Băluță Cristian
 *  Based on and including code by (c)2005-2008 Nicolas Cannasse and Hugh Sanderson
 *
 *  This program is free software; you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation; either version 2 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program; if not, write to the Free Software
 *  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 *)
open Ast
open Type
open Common

let join_class_path path separator =
	let result = match fst path, snd path with
	| [], s -> s
	| el, s -> String.concat separator el ^ separator ^ s in
	if (String.contains result '+') then begin
		let idx = String.index result '+' in
		(String.sub result 0 idx) ^ (String.sub result (idx+1) ((String.length result) - idx -1 ) )
	end else
		result
;;

(* This packages are cocoa frameworks, do not include this classes but include the framework *)
let getFrameworkOfPath class_path = 
	let pack = fst class_path in
	if List.length pack < 1 then "" else
	match List.nth pack ((List.length pack) -1) with
	(* Commom *)
	| "foundation" -> "Foundation"
	| "addressbook" -> "AddressBook"
	| "av" -> "AVFoundation"
	| "network" -> "CFNetwork"
	| "coredata" -> "CoreData"
	| "coregraphics" -> "CoreGraphics"
	| "coreimage" -> "CoreImage"
	| "corelocation" -> "CoreLocation"
	| "gamekit" -> "GameKit"
	| "message" -> "MessageUI"
	| "openal" -> "OpenAL"
	| "opengles" -> "OpenGLES"
	| "quartz" -> "QuartzCore"
	| "store" -> "StoreKit"
	| "SanTestings" -> "SanTestings"
	(* iOS *)
	| "iad" -> "iAd"
	| "map" -> "MapKit"
	| "ui" -> "UIKit"
	| "mediaplayer" -> "MediaPlayer"
	| "twitter" -> "Twitter"
	(* OSX *)
	| _ -> ""
;;

let processFunctionName name = 
	match name with
	| "applicationWillFinishLaunchingWithOptions" -> "application"
	| "applicationDidFinishLaunchingWithOptions" -> "application"
	| "applicationHandleOpenURL" -> "application"
	| _ -> name
;;

type fileKind =
	| FSource
	| FResource
	| FFramework
	
class importsManager =
	object
	val mutable all_frameworks : string list = []
	val mutable class_frameworks : string list = []
	val mutable class_imports : path list = []
	method add_class_path class_path = match class_path with
		| ([],"Int")
		| ([],"Float")
		| ([],"String")
		| ([],"Dynamic")
		| ([],"Bool") -> ();
		| _ -> let f_name = getFrameworkOfPath class_path in
		if f_name <> "" then begin
			if not (List.mem f_name all_frameworks) then all_frameworks <- List.append all_frameworks [f_name];
			if not (List.mem f_name class_frameworks) then class_frameworks <- List.append class_frameworks [f_name];
		end else begin
			if not (List.mem class_path class_imports) then class_imports <- List.append class_imports [class_path];
		end
	method get_all_frameworks = all_frameworks
	method get_class_frameworks = class_frameworks
	method get_imports = class_imports
	method reset = class_frameworks <- []; class_imports <- []
end;;

class filesManager imports_manager =
	object(this)
	val mutable imports = imports_manager
	val mutable all_frameworks : (string * string * string) list = [](* UUID * fileRef * f_name *)
	val mutable source_files : (string * string * path * string) list = [](* UUID * fileRef * filepath * ext *)
	val mutable resource_files : (string * string * path * string) list = [](* UUID * fileRef * filepath * ext *)
	method generate_uuid =
		let id = String.make 24 'A' in
		let chars = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ" in
		for i = 0 to 23 do id.[i] <- chars.[Random.int 36] done;
		id
	method register_source_file file_path ext =
		source_files <- List.append source_files [this#generate_uuid, this#generate_uuid, file_path, ext];
	method register_resource_file file_path ext =
		resource_files <- List.append resource_files [this#generate_uuid, this#generate_uuid, file_path, ext];
	(* method get_uuid c_path =
		let id = ref "" in
		List.iter (
			fun (uuid, file_ref, path, ext) -> if path = c_path then id := uuid
		) files;
		!id
	method get_class_path uuid =
		let cl_path = ref ([],"") in
		List.iter (
			fun (id, path) -> if id = uuid then cl_path := path
		) files;
		!cl_path *)
	method get_source_files = source_files
	method get_resource_files = resource_files
	method get_frameworks =
		if List.length all_frameworks = 0 then
			List.iter (
				fun name -> all_frameworks <- List.append all_frameworks [this#generate_uuid, this#generate_uuid, name]
			) imports#get_all_frameworks;
		all_frameworks
	end
;;

class sourceWriter write_func close_func =
	object(this)
	val indent_str = "\t"
	val mutable indent = ""
	val mutable indents = []
	val mutable just_finished_block = false
	val mutable can_indent = true
	method close = close_func(); ()
	
	method indent_one = this#write indent_str
	method push_indent = indents <- indent_str::indents; indent <- String.concat "" indents
	method pop_indent = match indents with
						| h::tail -> indents <- tail; indent <- String.concat "" indents
						| [] -> indent <- "/*?*/";
	method get_indent = indent
	
	method new_line = this#write "\n"; can_indent <- true;
	method write str =
		write_func (if can_indent then (indent^str) else str);
		just_finished_block <- false;
		can_indent <- false
	
	method begin_block = this#write ("{"); this#push_indent; this#new_line
	method end_block = this#pop_indent; this#write "}"; just_finished_block <- true
	method terminate_line = this#write (if just_finished_block then "" else ";"); this#new_line
	
	method import_header (class_path:path) = this#write ("#import \"" ^ (snd class_path) ^ ".h\"\n")
	method import_headers class_paths =
		List.iter (fun class_path -> this#import_header class_path ) class_paths
	method import_frameworks f_list = 
		List.iter (fun name ->
			this#write ("#import <" ^ name ^ "/" ^ name ^ ".h>\n")
		) f_list
	method add_copy =
		this#write ("//
//  main.m
//  " ^ "app_delegate_class" ^ "
//
//  Source generated by Haxe Objective-C target
//
");
		this#new_line
	end
;;

let readWholeFile chan = Std.input_all chan;;

let rec mkdir base dir_list =
	( match dir_list with
	| [] -> ()
	| dir :: remaining ->
		let path = match base with
                   | "" ->  dir
                   | "/" -> "/" ^ dir
                   | _ -> base ^ "/" ^ dir  in
         if ( not ( (path="") ||
           ( ((String.length path)=2) && ((String.sub path 1 1)=":") ) ) ) then
		         if not (Sys.file_exists path) then
			          Unix.mkdir path 0o755;
		mkdir (if (path="") then "/" else path) remaining
	)
;;

let cachedSourceWriter filename =
	try
		let in_file = open_in filename in
		let old_contents = readWholeFile in_file in
		close_in in_file;
		let buffer = Buffer.create 0 in
		let add_buf str = Buffer.add_string buffer str in
		let close = fun () ->
			let contents = Buffer.contents buffer in
			if (not (contents=old_contents) ) then begin
				let out_file = open_out filename in
				output_string out_file contents;
				close_out out_file;
			end;
		in
		new sourceWriter (add_buf) (close);
	with _ ->
		let out_file = open_out filename in
		new sourceWriter (output_string out_file) (fun ()-> close_out out_file)
		
		(* fileSourceWriter filename *)
;;

let newSourceFile base_dir class_path extension =
	mkdir base_dir ("" :: (fst class_path));
	cachedSourceWriter (base_dir ^ "/" ^ ( String.concat "/" (fst class_path) ) ^ "/" ^ (snd class_path) ^ extension)
;;

(* let makeBaseDirectory file = mkdir "" ( ( Str.split_delim (Str.regexp "[\\/]+") file ) );; *)


(* Objective-C code generation context *)

type context = {
	com : Common.context;
	mutable ctx_file_info : (string,string) PMap.t ref;
	mutable writer : sourceWriter;
	mutable imports_manager : importsManager;
	mutable get_sets : (string * bool,string) Hashtbl.t;
	mutable class_def : tclass;
	mutable in_value : tvar option;
	mutable in_static : bool;
	mutable handle_break : bool;
	mutable generating_header : bool;
	mutable generating_constructor : bool;
	mutable generating_call : bool;
	mutable generating_self_access : bool;
	mutable generating_c_call : bool;
	mutable generating_string_append : int;
	mutable require_pointer : bool;
	mutable gen_uid : int;
	mutable local_types : t list;
}
let newContext common_ctx writer imports_manager file_info = {
	com = common_ctx;
	ctx_file_info = file_info;
	writer = writer;
	imports_manager = imports_manager;
	get_sets = Hashtbl.create 0;
	class_def = null_class;
	in_value = None;
	in_static = false;
	handle_break = false;
	generating_header = false;
	generating_constructor = false;
	generating_call = false;
	generating_self_access = false;
	generating_c_call = false;
	generating_string_append = 0;
	require_pointer = false;
	gen_uid = 0;
	local_types = [];
}

let debug ctx str =
	if false then ctx.writer#write str
;;

let isVarField e v =
	match e.eexpr, follow e.etype with
	| TTypeExpr (TClassDecl c),_
	| _,TInst(c,_) ->
		(try
			let f = try PMap.find v c.cl_fields	with Not_found -> PMap.find v c.cl_statics in
			(match f.cf_kind with Var _ -> true | _ -> false)
		with Not_found -> false)
	| _ -> false
;;

let isSpecialCompare e1 e2 =
	match e1.eexpr, e2.eexpr with
	| TConst TNull, _  | _ , TConst TNull -> None
	| _ ->
	match follow e1.etype, follow e2.etype with
	| TInst ({ cl_path = [],"Xml" } as c,_) , _ | _ , TInst ({ cl_path = [],"Xml" } as c,_) -> Some c
	| _ -> None
;;

let rec isString e =
	(match e.eexpr with
	| TBinop (op,e1,e2) -> isString e1 or isString e2
	| TLocal v ->
		(match v.v_type with
		(* match e.etype with *)
		| TMono r ->
			
			(match !r with
			| None -> false
			| Some t ->
			
				(match t with
				| TInst (c,tl) ->
					
					(match c.cl_path with
					| ([], "String") -> true
					| _ -> false)
					
				| _ -> false)
				
			)
			
		(* | TConst c -> true *)
		| _ -> false)
	| TConst v ->
		(match v with
		| TString s -> true
		| _ -> false)
	| _ -> false)
;;

let protect name =
	match name with
	| "Error" | "Namespace" -> "_" ^ name
	| _ -> name
;;

(* 'id' is a pointer but does not need to specify it *)
let isPointer t =
	match t with
	| "void" | "id" | "BOOL" | "int" | "uint" | "float" | "CGRect" | "CGPoint" | "CGSize" -> false
	| _ -> true
;;
let addPointerIfNeeded t =
	if (isPointer t) then "*" else ""
;;

(* Generating correct type *)
let processClassPath ctx is_static path pos =
	ctx.imports_manager#add_class_path path;
	match path with
	| ([],name) ->
		(match name with
		| "Int" -> "int"
		| "Float" -> "float"
		| "Dynamic" -> "id"
		| "Bool" -> "BOOL"
		| "String" -> "NSMutableString"
		| "Date" -> "NSDate"
		| "Array" -> "NSMutabeArray"
		| _ -> name)
	| (["haxe"],"Int32") when not is_static -> "int"
	| (pack,name) -> name
;;

let appName ctx =
	(* The name of the main class is the name of the app.  *)
	match ctx.main_class with
	| Some path -> (snd path)
	| _ -> "HaxeCocoaApp"
;;
let srcDir ctx = (ctx.file ^ "/" ^ (appName ctx))

let rec createDirectory acc = function
	| [] -> ()
	| d :: l ->
		let dir = String.concat "/" (List.rev (d :: acc)) in
		if not (Sys.file_exists dir) then Unix.mkdir dir 0o755;
		createDirectory (d :: acc) l
;;

let saveLocals ctx = (fun() -> ())
		
let genLocal ctx l =
	ctx.gen_uid <- ctx.gen_uid + 1;
	if ctx.gen_uid = 1 then l else l ^ string_of_int ctx.gen_uid
;;

let unsupported p = error "This expression cannot be generated to Objective-C" p

let rec concat ctx s f = function
	| [] -> ()
	| [x] -> f x
	| x :: l ->
		f x;
		ctx.writer#write s;
		concat ctx s f l
;;

let parent e =
	match e.eexpr with
	| TParenthesis _ -> e
	| _ -> mk (TParenthesis e) e.etype e.epos
;;

let rec typeToString ctx t p =
	match t with
	| TEnum _ | TInst _ when List.memq t ctx.local_types ->
		"id"
	| TAbstract (a,_) ->(* ctx.writer#write "TAbstract?"; *)
		(match a.a_path with
		| [], "Void" -> "void"
		| [], "UInt" -> "int"(* "NSNumber" *)
		| [], "Int" -> "int"(* "NSNumber" *)
		| [], "Float" -> "float"(* "NSNumber" *)
		| [], "Bool" -> "BOOL"
		| _ -> processClassPath ctx true a.a_path p)
	| TEnum (e,_) ->(* ctx.writer#write "TEnum?"; *)
		if e.e_extern then (match e.e_path with
			| [], "Void" -> "void"
			| [], "Bool" -> "BOOL"
			| _ ->
				let rec loop = function
					| [] -> "Object"
					| (":fakeEnum",[Ast.EConst (Ast.Ident n),_],_) :: _ ->
						(match n with
						| "Int" -> "int"
						| "UInt" -> "uint"
						| _ -> n)
					| _ :: l -> loop l
				in
				loop e.e_meta
		) else
			processClassPath ctx true e.e_path p
	| TInst (c,_) ->(* ctx.writer#write "TInst?"; *)
		(match c.cl_kind with
		| KNormal | KGeneric | KGenericInstance _ -> processClassPath ctx false c.cl_path p
		| KTypeParameter _ | KExtension _ | KExpr _ | KMacroType -> "id")
	| TFun _ ->
		"Function"
	| TMono r ->
		(* ctx.writer#write "TMono?"; *)
		(match !r with None -> "id" | Some t -> typeToString ctx t p)
	| TAnon _ | TDynamic _ ->
		"id"
	| TType (t,args) ->
		(* ctx.writer#write "TType?"; *)
		(match t.t_path with
		| [], "UInt" -> "uint"
		| [] , "Null" ->
			(match args with
			| [t] ->
				(match follow t with
				| TAbstract ({ a_path = [],"UInt" },_)
				| TAbstract ({ a_path = [],"Int" },_)
				| TAbstract ({ a_path = [],"Float" },_)
				| TAbstract ({ a_path = [],"Bool" },_)
				| TInst ({ cl_path = [],"Int" },_)
				| TInst ({ cl_path = [],"Float" },_)
				| TEnum ({ e_path = [],"Bool" },_) -> "id"
				| _ -> typeToString ctx t p)
			| _ -> assert false);
		| _ -> typeToString ctx (apply_params t.t_types args t.t_type) p)
	| TLazy f ->
		typeToString ctx ((!f)()) p
;;

let rec iterSwitchBreak in_switch e =
	match e.eexpr with
	| TFunction _ | TWhile _ | TFor _ -> ()
	| TSwitch _ | TMatch _ when not in_switch -> iterSwitchBreak true e
	| TBreak when in_switch -> raise Exit
	| _ -> iter (iterSwitchBreak in_switch) e
;;

let handleBreak ctx e =
	let old_handle = ctx.handle_break in
	try
		iterSwitchBreak false e;
		ctx.handle_break <- false;
		(fun() -> ctx.handle_break <- old_handle)
	with
		Exit ->
			ctx.writer#write "try {";
			ctx.writer#new_line;
			ctx.handle_break <- true;
			(fun() ->
				ctx.writer#begin_block;
				ctx.handle_break <- old_handle;
				ctx.writer#new_line;
				ctx.writer#write "} catch( e : * ) { if( e != \"__break__\" ) throw e; }";
			)
;;

let this ctx = if ctx.in_value <> None then "$this" else "self"

let escapeBin s =
	let b = Buffer.create 0 in
	for i = 0 to String.length s - 1 do
		match Char.code (String.unsafe_get s i) with
		| c when c < 32 -> Buffer.add_string b (Printf.sprintf "\\x%.2X" c)
		| c -> Buffer.add_char b (Char.chr c)
	done;
	Buffer.contents b
;;

(* TODO: Generate resources that Objective-C can understand *)
(* Put strings in a .plist file
Put images in the Resources directory *)

let generateResources common_ctx =
	if Hashtbl.length common_ctx.resources <> 0 then begin
		let dir = (common_ctx.file :: ["Resources"]) in
		createDirectory [] dir;
		
		let resource_file = newSourceFile common_ctx.file ([],"Resources") ".plist" in
		resource_file#write "#include <xxx.h>\n\n";
		
		(* let add_resource name data =
			let ch = open_out_bin (String.concat "/" (dir @ [name])) in
			output_string ch data;
			close_out ch
		in
		Hashtbl.iter (fun name data -> add_resource name data) infos.com.resources;
		let ctx = init infos ([],"__resources__") in
		ctx.writer#write "\timport flash.utils.Dictionary;\n";
		ctx.writer#write "\tpublic class __resources__ {\n";
		ctx.writer#write "\t\tpublic static var list:Dictionary;\n";
		let inits = ref [] in
		let k = ref 0 in
		Hashtbl.iter (fun name _ ->
			let varname = ("v" ^ (string_of_int !k)) in
			k := !k + 1;
			ctx.writer#write (Printf.sprintf "\t\t[Embed(source = \"__res/%s\", mimeType = \"application/octet-stream\")]\n" name;
			ctx.writer#write (Printf.sprintf "\t\tpublic static var %s:Class;\n" varname;
			inits := ("list[\"" ^name^ "\"] = " ^ varname ^ ";") :: !inits;
		) infos.com.resources;
		ctx.writer#write "\t\tstatic public function __init__():void {\n";
		ctx.writer#write "\t\t\tlist = new Dictionary();\n";
		List.iter (fun init ->
			ctx.writer#write (Printf.sprintf "\t\t\t%s\n" init
		) !inits;
		ctx.writer#write "\t\t}\n";
		ctx.writer#write "\t}\n";
		ctx.writer#write "}"; *)
		(* close ctx; *)
	end
;;

let generateConstant ctx p = function
	| TInt i ->
		if ctx.generating_string_append > 0 then
			ctx.writer#write (Printf.sprintf "@\"%ld\"" i)
		else if ctx.require_pointer then
			ctx.writer#write (Printf.sprintf "[NSNumber numberWithInt:%ld]" i) (* %ld = int32 = (Int32.to_string i) *)
		else
			ctx.writer#write (Printf.sprintf "%ld" i)
	| TFloat f ->
		if ctx.generating_string_append > 0 then
			ctx.writer#write (Printf.sprintf "@\"%s\"" f)
		else if ctx.require_pointer then
			ctx.writer#write (Printf.sprintf "[NSNumber numberWithFloat:%s]" f)
		else
			ctx.writer#write f
	| TString s -> ctx.writer#write (Printf.sprintf "@\"%s\"" (Ast.s_escape s))
	| TBool b -> ctx.writer#write (if b then "YES" else "NO")
	| TNull -> ctx.writer#write (if ctx.require_pointer then "[NSNull null]" else "nil")
	| TThis -> ctx.writer#write "self"; ctx.generating_self_access <- true
	| TSuper -> ctx.writer#write "super"
;;

(* A function header in objc is a message *)
(* We need to follow some strict rules *)
let generateFunctionHeader ctx name f params p =
	let old = ctx.in_value in
	let locals = saveLocals ctx in
	let old_t = ctx.local_types in
	ctx.in_value <- None;
	ctx.local_types <- List.map snd params @ ctx.local_types;
	let return_type = if ctx.generating_constructor then "id" else typeToString ctx f.tf_type p in
	ctx.writer#write (Printf.sprintf "(%s%s)" return_type (addPointerIfNeeded return_type));(* Print the return type of the function *)
	(* Generate function name. Some of them will need a rename, check with the database *)
	ctx.writer#write (Printf.sprintf "%s" (match name with None -> "" | Some (n,meta) ->
		let rec loop = function
			| [] -> processFunctionName n
			| _ :: l -> loop l
		in
		" " ^ loop meta
	));
	(* Generate the arguments of the function. Ignore the message name of the first arg *)
	let first_arg = ref true in
	concat ctx " " (fun (v,c) ->
		let type_name = typeToString ctx v.v_type p in
		let arg_name = v.v_name in
		let message_name = if !first_arg then "" else arg_name in
		(* let message_name = if List.length f.tf_args > 1 then arg_name else "" in *)
		ctx.writer#write (Printf.sprintf "%s:(%s%s)%s" message_name type_name (addPointerIfNeeded type_name) arg_name);
		first_arg := false;
		(* TODO: init args that have default values in the body of the function *)
		(* Match default values *)
		(* match c with
		| None ->
			if ctx.constructor_block then ctx.writer#write (Printf.sprintf " = %s" (defaultValue tstr));
		| Some c ->
			ctx.writer#write " = ";
			generateConstant ctx p c *)
	) f.tf_args;
	(fun () ->
		ctx.in_value <- old;
		locals();
		ctx.local_types <- old_t;
	)
;;

(* arg_list is of type Type.texpr list *)
let rec generateCall ctx func arg_list etype (* ctx e el r *) =
	debug ctx (" \"-CALL-"^(Type.s_expr_kind func)^">\" ");
	
	if ctx.generating_c_call then begin
		
	match func.eexpr, arg_list with
		| TCall (x,_) , el ->
			ctx.writer#write "(";
			generateValue ctx func;
			ctx.writer#write ")";
			ctx.writer#write "(";
			concat ctx ", " (generateValue ctx) arg_list;
			ctx.writer#write ")";
		| TField(ee,v),args when isVarField ee v ->
			ctx.writer#write "TField(";
			generateValue ctx func;
			ctx.writer#write ")";
			ctx.writer#write "(";
			concat ctx ", " (generateValue ctx) arg_list;
			ctx.writer#write ")"
		| _ ->
			generateValue ctx func;
			ctx.writer#write "(";
			concat ctx ", " (generateValue ctx) arg_list;
			ctx.writer#write ")";
	
	end else begin
		
	generateValue ctx func;	
	(* if List.length arg_list > 0 then ctx.writer#write ":"; *)
	(* concat ctx " otherArgName:" (generateValue ctx) arg_list *)
	
	(* In the general case, if e is TCall(func, call_args): 
	func.etype == TFun(args, ret) 
	args is of (string * bool * t) list, with string being the name 
	e.etype == ret, i.e. what you get by calling the function, i.e. the return type  *)
	
	(* List.iter (
		fun (e) -> ctx.writer#write ":"; generateValue ctx e
	) arg_list; *)
	
	if List.length arg_list > 0 then begin
	
	let args_array_e = Array.of_list arg_list in
	let index = ref 0 in
	(match func.etype with
		| TFun(args, ret) ->
			List.iter (
			fun (name, b, t) ->
				ctx.writer#write (if !index = 0 then ":" else (" "^name^":"));
				generateValue ctx args_array_e.(!index);
				index := !index + 1;
			) args;
		(* Dynamic value call function with a dynamic parameter *)
		| _ -> ctx.writer#write " \"-dynamic_param-\" ");
	
	end
	end
	
and generateValueOp ctx e =
	debug ctx "\"-gen_val_op-\"";
	match e.eexpr with
	| TBinop (op,_,_) when op = Ast.OpAnd || op = Ast.OpOr || op = Ast.OpXor ->
		ctx.writer#write "(";
		generateValue ctx e;
		ctx.writer#write ")";
	| _ ->
		generateValue ctx e

and generateFieldAccess ctx etype s to_method =
	debug ctx "\"-FA-\"";
	(* ctx.writer#write (Printf.sprintf ">%s<" t); *)
	let field c = match fst c.cl_path, snd c.cl_path with
		| [], "Math" ->
			(match s with
			| "PI" -> ctx.writer#write "M_PI"
			| "NaN" -> ctx.writer#write "NaN"
			| "NEGATIVE_INFINITY" -> ctx.writer#write "-DBL_MAX"
			| "POSITIVE_INFINITY" -> ctx.writer#write "DBL_MAX"
			| "min" | "max" -> ctx.writer#write ("f" ^ s ^ "f")
			| "random" -> ctx.writer#write "rand"
			| "isFinite" -> ctx.writer#write "isfinite"
			| "isNaN" -> ctx.writer#write "isnan"
			| _ -> ctx.writer#write (s ^ "f"))
		
		| [], "String" ->
			(match s with
			| "toLowerCase" -> ctx.writer#write " lowercaseString"
			| "toUpperCase" -> ctx.writer#write " uppercaseString"
			| "toString" -> ctx.writer#write " description"
			| "indexOf" -> ctx.writer#write " rangeOfString"
			| "lastIndexOf" -> ctx.writer#write " rangeOfString options:NSBackwardsSearch"
			| "charAt" -> ctx.writer#write " characterAtIndex"
			| "charCodeAt" -> ctx.writer#write " characterAtIndex"
			| "split" -> ctx.writer#write " componentsSeparatedByString"
			| "substr" | "substring" -> ctx.writer#write " substringWithRange"
			| _ -> ctx.writer#write s)
		
		| [], "Date" ->
			(match s with
			| "now" -> ctx.writer#write s
			| "fromTime" -> ctx.writer#write s
			| _ -> ctx.writer#write s)
		
		| _ ->
			(* Generating dot notation for property and space for methods *)
			let accesor = if to_method then
				(if ctx.generating_self_access then "." else " ")
			else if ctx.generating_call then
				" "
			else
				"." in
			ctx.writer#write (Printf.sprintf "%s%s" accesor s);
			ctx.generating_self_access <- false
	in
	match follow etype with
	| TInst (c,_) -> field c
	| TAnon a ->
		(match !(a.a_status) with
			(* Generate a static field access *)
			| Statics c -> field c
			(* Generate field access for an anonymous object, Dynamic *)
			| _ -> ctx.writer#write (Printf.sprintf " GFA2 .%s" s))
	| _ ->
		(* Method call on a Dynamic *)
		ctx.writer#write (Printf.sprintf " %s" s)
	
and generateExpression ctx e =
	debug ctx ("\"-E-"^(Type.s_expr_kind e)^">\"");
	(* ctx.writer#write ("-E-"^(Type.s_expr_kind e)^">"); *)
	match e.eexpr with
	| TConst c ->
		generateConstant ctx e.epos c
	| TLocal v ->
		ctx.writer#write v.v_name
	| TEnumField (en,s) ->
		ctx.writer#write (Printf.sprintf "%s.%s" (processClassPath ctx true en.e_path e.epos) (s))
	(* | TArray ({ eexpr = TLocal { v_name = "__global__" } },{ eexpr = TConst (TString s) }) ->
		let path = Ast.parse_path s in
		ctx.writer#write (processClassPath ctx false path e.epos) *)
	| TArray (e1,e2) ->
		(* Accesing an array element *)
		(* TODO: access pointers and primitives in a different way *)
		ctx.writer#write "[";
		generateValue ctx e1;
		ctx.writer#write " objectAtIndex:";
		generateValue ctx e2;
		ctx.writer#write "]";
	| TBinop (Ast.OpEq,e1,e2) when (match isSpecialCompare e1 e2 with Some c -> true | None -> false) ->
		ctx.writer#write "binop";
		let c = match isSpecialCompare e1 e2 with Some c -> c | None -> assert false in
		generateExpression ctx (mk (TCall (mk (TField (mk (TTypeExpr (TClassDecl c)) t_dynamic e.epos,"compare")) t_dynamic e.epos,[e1;e2])) ctx.com.basic.tbool e.epos);
		
	(* TODO: StringBuf: some concat problems left *)
	(* | TBinop (op,{ eexpr = TField (e1,s) },e2) ->
		ctx.writer#write "strange binop ";
		generateValueOp ctx e1;
		generateFieldAccess ctx e1.etype s;
		ctx.writer#write (Printf.sprintf " %s " (Ast.s_binop op));
		generateValueOp ctx e2; *)
	| TBinop (op,e1,e2) ->
		(* An assign to a property or mathematical/string operations *)
		let s_op = Ast.s_binop op in
		if (s_op="+" or s_op="+=") && (isString e1 or isString e2) then begin
			ctx.generating_string_append <- ctx.generating_string_append + 1;
			ctx.writer#write "[";
			generateValueOp ctx e1;
			ctx.writer#write (match s_op with
				| "+" -> " stringByAppendingString:"
				| "+=" -> " appendString:"
				| _ -> "");
			generateValueOp ctx e2;
			ctx.writer#write "]";
			ctx.generating_string_append <- ctx.generating_string_append - 1;
		end else begin
			generateValueOp ctx e1;
			ctx.writer#write (Printf.sprintf " %s " s_op);
			generateValueOp ctx e2
		end;
	(* variable fields on interfaces are generated as (class["field"] as class) *)
	| TField ({etype = TInst({cl_interface = true} as c,_)} as e,s)
	| TClosure ({etype = TInst({cl_interface = true} as c,_)} as e,s)
		when (try (match (PMap.find s c.cl_fields).cf_kind with Var _ -> true | _ -> false) with Not_found -> false) ->
		ctx.writer#write "(";
		generateValue ctx e;
		ctx.writer#write (Printf.sprintf "[\"%s\"]" s);
		ctx.writer#write (Printf.sprintf " as %s)" (typeToString ctx e.etype e.epos));		
	| TField (e,s) ->
		(* This is important, is generating a field access . *)
   		generateValue ctx e;
		generateFieldAccess ctx e.etype s false;
	| TClosure (e,s) ->
		(* Used in Reflect.isFunction *)
		ctx.writer#write (Printf.sprintf "@selector(%s)" s);
   		(* generateValue ctx e; *)
		(* generateFieldAccess ctx e.etype s true *)
	| TTypeExpr t ->
		(* Do not generate the Math class, make calls like in C *)
		let p = t_path t in
		(match p with
		| ([], "Math") -> ctx.generating_c_call <- true;
		| _ -> ctx.writer#write (processClassPath ctx true p e.epos));
	| TParenthesis e ->
		ctx.writer#write " (";
		generateValue ctx e;
		ctx.writer#write ")";
	| TReturn eo ->
		if ctx.in_value <> None then unsupported e.epos;
		(match eo with
		| None ->
			ctx.writer#write "return"
		| Some e when (match follow e.etype with TEnum({ e_path = [],"Void" },[]) | TAbstract ({ a_path = [],"Void" },[]) -> true | _ -> false) ->
			ctx.writer#write "{";
			ctx.writer#new_line;
			generateValue ctx e;
			ctx.writer#new_line;
			ctx.writer#write "return";
			ctx.writer#begin_block;
			ctx.writer#new_line;
			ctx.writer#write "}";
		| Some e ->
			ctx.writer#write "return ";
			generateValue ctx e);
	| TBreak ->
		if ctx.in_value <> None then unsupported e.epos;
		if ctx.handle_break then ctx.writer#write "throw \"__break__\"" else ctx.writer#write "break"
	| TContinue ->
		if ctx.in_value <> None then unsupported e.epos;
		ctx.writer#write "continue"
	| TBlock expr_list ->
		ctx.writer#begin_block;
		if ctx.generating_constructor then begin
			ctx.writer#write "self = [super init];";
			ctx.writer#new_line
		end;
		List.iter (fun e ->
			generateExpression ctx e;
			ctx.writer#terminate_line
		) expr_list;
		if ctx.generating_constructor then begin
			ctx.writer#write "return self;";
			ctx.writer#new_line;
			ctx.generating_constructor <- false
		end;
		ctx.writer#end_block;
	| TFunction f ->
		ctx.writer#write "^";
		let h = generateFunctionHeader ctx None f [] e.epos in
		let old = ctx.in_static in
		ctx.in_static <- true;
		generateExpression ctx f.tf_expr;
		ctx.in_static <- old;
		h();
	(* Generate a call to a function *)
	(* | TCall (func, arg_list) -> ctx.writer#write "GENERATE call (func, arg_list)"; *)
	| TCall (func, arg_list) when
		(match func.eexpr with
		| TLocal { v_name = "__objc__" } -> true
		| _ -> false) ->
		( match arg_list with
		| [{ eexpr = TConst (TString code) }] -> ctx.writer#write code;
		| _ -> error "__objc__ accepts only one string as an argument" func.epos)
	| TCall (func, arg_list) ->
		(match func.eexpr with
		| TField (e,s) ->
			(match e.eexpr with
			| TTypeExpr t ->
				(* Do not generate the Math class, make calls like in C *)
				(match (t_path t) with
				| ([], "Math") -> ctx.generating_c_call <- true;
				| _ -> ctx.writer#write "[")
			| _ -> ctx.writer#write "[")
		| _ -> ctx.writer#write "[");
		
		ctx.generating_call <- true;
		generateCall ctx func arg_list e.etype;
		ctx.generating_call <- false;
		
		if not ctx.generating_c_call then ctx.writer#write "]";
		ctx.generating_c_call <- false
	| TObjectDecl (
		("fileName" , { eexpr = (TConst (TString file)) }) ::
		("lineNumber" , { eexpr = (TConst (TInt line)) }) ::
		("className" , { eexpr = (TConst (TString class_name)) }) ::
		("methodName", { eexpr = (TConst (TString meth)) }) :: [] ) ->
			ctx.writer#write ("[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@\""^file^"\",@\""^(Printf.sprintf "%ld" line)^"\",@\""^class_name^"\",@\""^meth^"\",nil] forKeys:[NSArray arrayWithObjects:@\"fileName\",@\"lineNumber\",@\"className\",@\"methodName\",nil]]");
	| TObjectDecl fields ->
		ctx.writer#write "struct {";
		ctx.writer#new_line;
		concat ctx ";\n" (fun (f,e) -> ctx.writer#write (Printf.sprintf "%s:" (f)); generateValue ctx e) fields;
		ctx.writer#write "} structName"
	| TArrayDecl el ->
		ctx.writer#write "[[NSMutableArray alloc] initWithObjects:";
		ctx.require_pointer <- true;
		concat ctx ", " (generateValue ctx) el;
		ctx.require_pointer <- false;
		ctx.writer#write ", nil]]"
	| TThrow e ->
		ctx.writer#write "throw ";
		generateValue ctx e
	| TVars [] ->
		()
	| TVars vl ->
		(* Vars inside a method, not class vars *)
		concat ctx "; " (fun (v,eo) ->
			let t = (typeToString ctx v.v_type e.epos) in
			if isPointer t then ctx.writer#new_line;
			ctx.writer#write (Printf.sprintf "%s %s%s" t (addPointerIfNeeded t) (v.v_name));
			(* Check if this Type is a Class and if is imported *)
			(match v.v_type with
			| TMono r -> (match !r with None -> () | Some t -> 
				match t with
				| TInst (c,_) -> ctx.imports_manager#add_class_path c.cl_path
				| _ -> ())
			| _ -> ());
			match eo with
			| None -> ()
			| Some e ->
				ctx.writer#write " = ";
				generateValue ctx e
		) vl;
	| TNew (c,params,el) ->
		(* ctx.writer#write ("GEN_NEW>"^(snd c.cl_path)^(string_of_int (List.length params))); *)
		(*processClassPath ctx true c.cl_path e.epos) *)
		(match c.cl_path with
			| (["objc";"graphics"],"CGRect")
			| (["objc";"graphics"],"CGPoint")
			| (["objc";"graphics"],"CGSize") ->
				ctx.writer#write ((snd c.cl_path)^"Make (");
				concat ctx "," (generateValue ctx) el;
				ctx.writer#write ")"
			| (["objc";"foundation"],"NSRange") ->
				ctx.writer#write ("NSMakeRange (");
				concat ctx "," (generateValue ctx) el;
				ctx.writer#write ")"
			| _ ->
				ctx.writer#write (Printf.sprintf "[[%s alloc] new" (processClassPath ctx false c.cl_path c.cl_pos));
				if List.length el > 0 then ctx.writer#write ":";
				concat ctx "," (generateValue ctx) el;
				ctx.writer#write "]";
				
				(* ctx.writer#write "[";
				ctx.generating_call <- true;
				(* generateCall ctx c params e.etype; *)
				ctx.generating_call <- false;
				ctx.writer#write "]" *)
		)
	| TIf (cond,e,eelse) ->
		ctx.writer#write "if";
		generateValue ctx (parent cond);
		ctx.writer#write " ";
		generateExpression ctx e;
		(* ctx.writer#write ";"; *)
		(match eelse with
		| None -> ()
		| Some e ->
			ctx.writer#new_line;
			ctx.writer#write "else ";
			generateExpression ctx e);
	| TUnop (op,Ast.Prefix,e) ->
		ctx.writer#write (Ast.s_unop op);
		generateValue ctx e
	| TUnop (op,Ast.Postfix,e) ->
		generateValue ctx e;
		ctx.writer#write (Ast.s_unop op)
	| TWhile (cond,e,Ast.NormalWhile) ->
		(* This is the redefinition of a for loop *)
		let handleBreak = handleBreak ctx e in
		ctx.writer#write "while";
		generateValue ctx (parent cond);
		ctx.writer#write " ";
		generateExpression ctx e;
		handleBreak();
	| TWhile (cond,e,Ast.DoWhile) ->
		(* do { } while () *)
		let handleBreak = handleBreak ctx e in
		ctx.writer#write "do ";
		generateExpression ctx e;
		ctx.writer#write "while";
		generateValue ctx (parent cond);
		handleBreak();
	| TFor (v,it,e) ->
		(* When is this generated? *)
		ctx.writer#begin_block;
		let handleBreak = handleBreak ctx e in
		let tmp = genLocal ctx "$it" in
		ctx.writer#write (Printf.sprintf "{ var %s : * = " tmp);
		generateValue ctx it;
		ctx.writer#new_line;
		ctx.writer#write (Printf.sprintf "for ( %s.hasNext() ) { var %s : %s = %s.next()" tmp (v.v_name) (typeToString ctx v.v_type e.epos) tmp);
		ctx.writer#new_line;
		generateExpression ctx e;
		ctx.writer#new_line;
		ctx.writer#end_block;
		handleBreak();
	| TTry (e,catchs) ->
		(* TODO: objc has only one catch? *)
		ctx.writer#write "@try ";
		generateExpression ctx e;
		List.iter (fun (v,e) ->
			ctx.writer#new_line;
			ctx.writer#write (Printf.sprintf "@catch (NSException *%s) " (v.v_name));
			generateExpression ctx e;
		) catchs;
		(* (typeToString ctx v.v_type e.epos) *)
	| TMatch (e,_,cases,def) ->
		ctx.writer#begin_block;
		ctx.writer#new_line;
		let tmp = genLocal ctx "$e" in
		ctx.writer#write (Printf.sprintf "var %s : enum = " tmp);
		generateValue ctx e;
		ctx.writer#new_line;
		ctx.writer#write (Printf.sprintf "switch( %s.index ) {" tmp);
		List.iter (fun (cl,params,e) ->
			List.iter (fun c ->
				ctx.writer#new_line;
				ctx.writer#write (Printf.sprintf "case %d:" c);
			) cl;
			(match params with
			| None | Some [] -> ()
			| Some l ->
				let n = ref (-1) in
				let l = List.fold_left (fun acc v -> incr n; match v with None -> acc | Some v -> (v,!n) :: acc) [] l in
				match l with
				| [] -> ()
				| l ->
					ctx.writer#new_line;
					ctx.writer#write "var ";
					concat ctx ", " (fun (v,n) ->
						ctx.writer#write (Printf.sprintf "MATCH %s : %s = %s.params[%d]" (v.v_name) (typeToString ctx v.v_type e.epos) tmp n);
					) l);
			generateBlock ctx e;
			ctx.writer#write "break";
		) cases;
		(match def with
		| None -> ()
		| Some e ->
			ctx.writer#new_line;
			ctx.writer#write "default:";
			generateBlock ctx e;
			ctx.writer#write "break";
		);
		ctx.writer#new_line;
		ctx.writer#write "}";
		(* bend(); *)
		ctx.writer#new_line;
		ctx.writer#write "}";
	| TSwitch (e,cases,def) ->
		ctx.writer#write "switch"; generateValue ctx (parent e); ctx.writer#begin_block;
		List.iter (fun (el,e2) ->
			List.iter (fun e ->
				ctx.writer#write "case "; generateValue ctx e; ctx.writer#write ":";
			) el;
			generateBlock ctx e2;
			ctx.writer#write "break;";
			ctx.writer#new_line;
		) cases;
		(match def with
		| None -> ()
		| Some e ->
			ctx.writer#write "default:";
			generateBlock ctx e;
			ctx.writer#write "break";
			ctx.writer#new_line;
		);
		(* ctx.writer#write "}" *)
		ctx.writer#end_block
	| TCast (e1,None) ->
		ctx.writer#write "((";
		generateExpression ctx e1;
		ctx.writer#write (Printf.sprintf ") as %s)" (typeToString ctx e.etype e.epos));
	| TCast (e1,Some t) -> ()
		(* generateExpression ctx (Codegen.default_cast ctx.com e1 t e.etype e.epos) *)

and generateBlock ctx e =
	(* ctx.writer#new_line; *)
	ctx.writer#begin_block;
	match e.eexpr with
	| TBlock [] -> ()
	| _ -> generateExpression ctx e;
	ctx.writer#end_block
	
and generateValue ctx e =
	debug ctx ("\"-V-"^(Type.s_expr_kind e)^">\"");
	let assign e =
		mk (TBinop (Ast.OpAssign,
			mk (TLocal (match ctx.in_value with None -> assert false | Some r -> r)) t_dynamic e.epos,
			e
		)) e.etype e.epos
	in
	let block e =
		mk (TBlock [e]) e.etype e.epos
	in
	let value block =
		let old = ctx.in_value in
		let t = typeToString ctx e.etype e.epos in
		let r = alloc_var (genLocal ctx "$r") e.etype in
		ctx.in_value <- Some r;
		if ctx.in_static then
			ctx.writer#write (Printf.sprintf "- (%s*) " t)
		else
			ctx.writer#write (Printf.sprintf "((%s)($this:%s) " t "(snd ctx.path)");
		(fun() ->
			if block then begin
				ctx.writer#new_line;
				ctx.writer#write (Printf.sprintf "return %s" r.v_name);
				
				ctx.writer#begin_block;
				ctx.writer#new_line;
				ctx.writer#write (Printf.sprintf "%s* %s" t r.v_name);
				ctx.writer#end_block;
						
				ctx.writer#new_line;
				ctx.writer#write "}";
			end;
			ctx.in_value <- old;
			if ctx.in_static then
				ctx.writer#write "()"
			else
				ctx.writer#write (Printf.sprintf "(%s))" (this ctx))
		)
	in
	match e.eexpr with
	| TCall ({ eexpr = TLocal { v_name = "__keys__" } },_) 
	| TCall ({ eexpr = TLocal { v_name = "__hkeys__" } },_) ->
		ctx.writer#write "GENERATE_CALL_0 ";
		let v = value true in
		generateExpression ctx e;
		v()
	| TTypeExpr _
	| TConst _
	| TLocal _
	| TEnumField _
	| TArray _
	| TBinop _
	| TField _
	| TClosure _
	| TParenthesis _
	| TObjectDecl _
	| TArrayDecl _
	| TCall _
	| TNew _
	| TUnop _
	| TFunction _ ->
		generateExpression ctx e
	| TCast (e1,t) ->
		let t = typeToString ctx e.etype e.epos in
		ctx.writer#write (Printf.sprintf "(%s%s)" t (addPointerIfNeeded t));
		generateValue ctx e1;
		(* match t with
		| None ->
		generateValue ctx e1
		| Some t -> () *)
		(* generateValue ctx (match t with None -> e1 | Some t -> Codegen.default_cast ctx.com e1 t e.etype e.epos) *)
	| TReturn _
	| TBreak
	| TContinue ->
		unsupported e.epos
	| TVars _
	| TFor _ -> ctx.writer#write "generate TFor"
	| TWhile _
	| TThrow _ ->
		(* value is discarded anyway *)
		let v = value true in
		generateExpression ctx e;
		v()
	| TBlock [] ->
		ctx.writer#write "nil"
	| TBlock [e] ->
		generateValue ctx e
	| TBlock el ->
		let v = value true in
		let rec loop = function
			| [] ->
				ctx.writer#write "return nil";
			| [e] ->
				generateExpression ctx (assign e);
			| e :: l ->
				generateExpression ctx e;
				ctx.writer#new_line;
				loop l
		in
		loop el;
		v();
	| TIf (cond,e,eo) ->
		ctx.writer#write "(";
		generateValue ctx cond;
		ctx.writer#write " ? ";
		generateValue ctx e;
		ctx.writer#write " : ";
		(match eo with
		| None -> ctx.writer#write "nil"
		| Some e -> generateValue ctx e);
		ctx.writer#write ")"
	| TSwitch (cond,cases,def) ->
		let v = value true in
		generateExpression ctx (mk (TSwitch (cond,
			List.map (fun (e1,e2) -> (e1,assign e2)) cases,
			match def with None -> None | Some e -> Some (assign e)
		)) e.etype e.epos);
		v()
	| TMatch (cond,enum,cases,def) ->
		let v = value true in
		generateExpression ctx (mk (TMatch (cond,enum,
			List.map (fun (constr,params,e) -> (constr,params,assign e)) cases,
			match def with None -> None | Some e -> Some (assign e)
		)) e.etype e.epos);
		v()
	| TTry (b,catchs) ->
		let v = value true in
		generateExpression ctx (mk (TTry (block (assign b),
			List.map (fun (v,e) -> v, block (assign e)) catchs
		)) e.etype e.epos);
		v()

let final m = if has_meta ":final" m then "final " else ""

let generateProperty ctx field pos is_static =
	let id = field.cf_name in
	let t = typeToString ctx field.cf_type pos in
	(* let class_name = (snd ctx.class_def.cl_path) in *)
	if ctx.generating_header then begin
		if is_static then begin
			ctx.writer#write ("+ ("^t^(addPointerIfNeeded t)^") "^id^":("^t^(addPointerIfNeeded t)^")val;")
		end
	else begin
		let getter = match field.cf_kind with
		| Var v -> (match v.v_read with
			| AccCall s -> Printf.sprintf ", getter=%s" s;
			| _ -> "")
		| _ -> "" in
		let setter = match field.cf_kind with
		| Var v -> (match v.v_write with
			| AccCall s -> Printf.sprintf ", setter=%s" s;
			| _ -> "")
		| _ -> "" in
		let strong = if (isPointer t) then ", strong" else "" in
		let readonly = if false then ", readonly" else "" in
		ctx.writer#write (Printf.sprintf "@property (nonatomic%s%s%s%s) %s %s%s;" strong readonly getter setter t (addPointerIfNeeded t) id)
	end
	end
	else begin
		if is_static then begin
			let gen_init_value () = match field.cf_expr with
			| None -> ()
			| Some e -> generateValue ctx e in
		
			ctx.writer#write ("+ ("^t^(addPointerIfNeeded t)^") "^id^":("^t^(addPointerIfNeeded t)^")val {
	static "^t^" "^(addPointerIfNeeded t)^"_val;
	if (val == nil) { if (_val == nil) _val = ");
			gen_init_value();
			ctx.writer#write ("; }
	else { if (_val != nil) _val = val; }
	return _val;
}")
		end
		else ctx.writer#write (Printf.sprintf "@synthesize %s;" id)
	end
	(* Generate functions located in the hx interfaces *)
	(* let rec loop = function
		| [] -> field.cf_name
		| (":getter",[Ast.EConst (Ast.String name),_],_) :: _ -> "get " ^ name
		| (":setter",[Ast.EConst (Ast.String name),_],_) :: _ -> "set " ^ name
		| _ :: l -> loop l
	in
	ctx.writer#write (Printf.sprintf "(%s*) %s_" (typeToString ctx r p) (loop field.cf_meta));
	concat ctx " " (fun (arg,o,t) ->
		let tstr = typeToString ctx t p in
		ctx.writer#write (Printf.sprintf "%s:(%s*)%s" arg tstr arg);
		(* if o then ctx.writer#write (Printf.sprintf " = %s" (defaultValue tstr)); *)
	) args;
	ctx.writer#write ";"; *)
	(* let return_type = typeToString ctx r p in
	ctx.writer#write (Printf.sprintf "(%s%s)" return_type (addPointerIfNeeded return_type));(* Print the return type of the function *)
	(* Generate function name *)
	ctx.writer#write (Printf.sprintf "%s" (match name with None -> "" | Some (n,meta) ->
		let rec loop = function
			| [] -> n
			| _ :: l -> loop l
		in
		" " ^ loop meta
	));
	(* Generate the arguments of the function. Ignore the message name of the first arg *)
	let first_arg = ref true in
	concat ctx " " (fun (v,c) ->
		let type_name = typeToString ctx v.v_type p in
		let arg_name = v.v_name in
		let message_name = if !first_arg then "" else arg_name in
		ctx.writer#write (Printf.sprintf "%s:(%s%s)%s" message_name type_name (addPointerIfNeeded type_name) arg_name);
		first_arg := false;
	) args; *)
	
	(* let v = (match f.cf_kind with Var v -> v | _ -> assert false) in *)
	(* (match v.v_read with
	| AccNormal -> ""
	| AccCall m ->
		ctx.writer#write (Printf.sprintf "%s function get %s() : %s { return %s(); }" rights id t m);
		ctx.writer#new_line
	| AccNo | AccNever ->
		ctx.writer#write (Printf.sprintf "%s function get %s() : %s { return $%s; }" (if v.v_read = AccNo then "protected" else "private") id t id);
		ctx.writer#new_line
	| _ ->
		()); *)
	(* (match v.v_write with
	| AccNormal | AccCall m -> ""
	| AccNo | AccNever -> "readonly"
	| _ -> ()); *)
;;

let generateMain ctx fd =
	(* TODO: register the main.m file for pbxproj, but not necessary in this method *)
	let platform_class = ref "" in
	let app_delegate_class = ref "" in
	(match fd.tf_expr.eexpr with
		(* \ TBlock [] -> print_endline "objc_error: The main method should have a return" *)
		| TBlock expr_list ->
			(* Iterate over the expressions in the main block *)
			List.iter (fun e ->
			(match e.eexpr with
				| TReturn eo ->
					(match eo with
						| None -> print_endline "The static main method should return a: new UIApplicationMain()";
						| Some e ->
							(match e.eexpr with
							| TNew (c,params,el) ->
								platform_class := (snd c.cl_path);
								List.iter ( fun e ->
								(match e.eexpr with
									| TTypeExpr t ->
										let path = t_path t in
										app_delegate_class := snd path;
									| _ -> print_endline "objc_error: No AppDelegate found in the return";
								)) el
							| _ -> print_endline "No 'new' keyword found")
					);
				| _ -> print_endline "objc_error: The main method should have a return");
			) expr_list
		| _ -> print_endline "objc_error: The main method should have a return"
	);
	(* print_endline ("- app_delegate_class: "^ (!app_delegate_class)); *)
	let src_dir = srcDir ctx.com in
	let m_file = newSourceFile src_dir ([],"main") ".m" in
	(match !platform_class with
		| "UIApplicationMain" | "NSApplicationMain" ->
		m_file#write ("//
//  main.m
//  " ^ !app_delegate_class ^ "
//
//  Source generated by Haxe Objective-C target
//

#import <UIKit/UIKit.h>
#import \"" ^ !app_delegate_class ^ ".h\"

int main(int argc, char *argv[]) {
	@autoreleasepool {
		return " ^ !platform_class ^ "(argc, argv, nil, NSStringFromClass([" ^ !app_delegate_class ^ " class]));
	}
}
");
		m_file#close;
		| _ -> print_endline "objc_error: Supported returns are UIApplicationMain or NSApplicationMain"
	)
;;

let generateField ctx is_static field =
	debug ctx "\n-F-";
	(* ctx.writer#write ("\n-F-"^field.cf_name); *)
	ctx.writer#new_line;
	ctx.in_static <- is_static;
	ctx.gen_uid <- 0;
	
	(* List.iter (fun(m,pl,_) ->
		match m,pl with
		| ":meta", [Ast.ECall ((Ast.EConst (Ast.Ident n),_),args),_] ->
			let mk_arg (a,p) =
				match a with
				| Ast.EConst (Ast.String s) -> (None, s)
				| Ast.EBinop (Ast.OpAssign,(Ast.EConst (Ast.Ident n),_),(Ast.EConst (Ast.String s),_)) -> (Some n, s)
				| _ -> error "Invalid meta definition" p
			in
			ctx.writer#write (Printf.sprintf ">>>[%s" n);
			(match args with
			| [] -> ()
			| _ ->
				ctx.writer#write "---";
				concat ctx "," (fun a ->
					match mk_arg a with
					| None, s -> generateConstant ctx (snd a) (TString s)
					| Some s, e -> ctx.writer#write (Printf.sprintf "%s=" s); generateConstant ctx (snd a) (TString e)
				) args;
				ctx.writer#write ")");
			ctx.writer#write "]";
		| _ -> ()
	) field.cf_meta; *)
	
	(* let public = f.cf_public || Hashtbl.mem ctx.get_sets (f.cf_name,static) || 
	(f.cf_name = "main" && static) || f.cf_name = "resolve" || has_meta ":public" f.cf_meta in *)
	let pos = ctx.class_def.cl_pos in
	match field.cf_expr, field.cf_kind with
	(* MethDynamic not sure if must be here *)
	| Some { eexpr = TFunction fd }, Method (MethNormal | MethInline | MethDynamic) ->
		(* Find the static main method and generate a main.m file from it. *)
		if field.cf_name = "main" && is_static then begin
			if not ctx.generating_header then generateMain ctx fd;
		end
		else begin
			ctx.writer#write (Printf.sprintf "%s " (if is_static then "+" else "-"));
			(* Generate function header *)
			generateFunctionHeader ctx (Some (field.cf_name, field.cf_meta)) fd field.cf_params pos;
			(* Generate function content if is not a header file *)
			if not ctx.generating_header then
				generateExpression ctx fd.tf_expr
			else
				ctx.writer#write ";";
		end
	| _ ->
		let is_getset = (match field.cf_kind with Var { v_read = AccCall _ } | Var { v_write = AccCall _ } -> true | _ -> false) in
		match follow field.cf_type with
			| TFun (args,r) -> ()
			| _ when is_getset -> if ctx.generating_header then generateProperty ctx field pos is_static
			| _ -> generateProperty ctx field pos is_static
;;

let rec defineGetSet ctx is_static c =
	let def f name =
		Hashtbl.add ctx.get_sets (name,is_static) f.cf_name
	in
	let field f =
		match f.cf_kind with
		| Method _ -> ()
		| Var v ->
			(match v.v_read with AccCall m -> def f m | _ -> ());
			(match v.v_write with AccCall m -> def f m | _ -> ())
	in
	List.iter field (if is_static then c.cl_ordered_statics else c.cl_ordered_fields);
	match c.cl_super with
	| Some (c,_) when not is_static -> defineGetSet ctx is_static c
	| _ -> ()
;;

let makeImportPath (p,s) = match p with [] -> s | _ -> String.concat "/" p ^ "/" ^ s



(* GENERATE THE PROJECT DEFAULT FILES AND DIRECTORIES *)

let xcworkspacedata common_ctx = 
	let src_dir = srcDir common_ctx in
	let app_name = appName common_ctx in
	let file = newSourceFile (src_dir^".xcodeproj/project.xcworkspace") ([],"contents") ".xcworkspacedata" in
	file#write ("<?xml version=\"1.0\" encoding=\"UTF-8\"?>
<Workspace
   version = \"1.0\">
   <FileRef
      location = \"self:" ^ app_name ^ ".xcodeproj\">
   </FileRef>
</Workspace>
");
	file#close
;;
let pbxproj common_ctx files_manager = 
	let src_dir = srcDir common_ctx in
	let app_name = appName common_ctx in
	let owner = "Baluta Cristian" in
	let file = newSourceFile (src_dir^".xcodeproj") ([],"project") ".pbxproj" in
	file#write ("{
	archiveVersion = 1;
	classes = {
	};
	objectVersion = 46;
	objects = {");
	
	(* Begin PBXBuildFile section *)
	(* It holds .m files, resource files, and frameworks *)
	file#write ("\n/* Begin PBXBuildFile section */\n");
	List.iter ( fun (uuid, fileRef, name) -> file#write ("		"^uuid^" /* "^name^".framework in Frameworks */ = {isa = PBXBuildFile; fileRef = "^fileRef^"; };\n"); ) files_manager#get_frameworks;
	List.iter ( fun (uuid, fileRef, path, ext) -> if ext=".m" then file#write ("		"^uuid^" /* "^(snd path)^ext^" in Sources */ = {isa = PBXBuildFile; fileRef = "^fileRef^"; };\n"); ) files_manager#get_source_files;
	List.iter ( fun (uuid, fileRef, path, ext) -> file#write ("		"^uuid^" /* "^(snd path)^" in Resources */ = {isa = PBXBuildFile; fileRef = "^fileRef^"; };\n"); ) files_manager#get_resource_files;
	file#write ("/* End PBXBuildFile section */\n");
	
	(* Begin PBXContainerItemProxy section *)
	let container_item_proxy = files_manager#generate_uuid in
	let remote_global_id_string = appName common_ctx in
	let root_object = files_manager#generate_uuid in
	file#write ("\n/* Begin PBXContainerItemProxy section */
		"^container_item_proxy^" /* PBXContainerItemProxy */ = {
			isa = PBXContainerItemProxy;
			containerPortal = "^root_object^" /* Project object */;
			proxyType = 1;
			remoteGlobalIDString = "^remote_global_id_string^";
			remoteInfo = "^app_name^";
		};
/* End PBXContainerItemProxy section */\n");

	(* Begin PBXFileReference section *)
	file#write ("\n/* Begin PBXFileReference section */\n");
	let app_uuid = files_manager#generate_uuid in
	file#write ("		"^app_uuid^" /* "^app_name^".app */ = {isa = PBXFileReference; explicitFileType = wrapper.application; includeInIndex = 0; path = "^app_name^".app; sourceTree = BUILT_PRODUCTS_DIR; };\n");
	List.iter ( fun (uuid, fileRef, name) -> file#write ("		"^fileRef^" /* "^name^".framework */ = {isa = PBXFileReference; lastKnownFileType = wrapper.framework; name = "^name^".framework; path = System/Library/Frameworks/"^name^".framework; sourceTree = SDKROOT; };\n"); ) files_manager#get_frameworks;
	List.iter ( fun (uuid, fileRef, path, ext) -> file#write ("		"^fileRef^" /* "^(snd path)^ext^" */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.c."^(if ext=".h" then "h" else "objc")^"; path = "^(join_class_path path "/")^ext^"; sourceTree = \"<group>\"; };\n"); ) files_manager#get_source_files;
	file#write ("/* End PBXFileReference section */\n");
	
	(* Begin PBXFrameworksBuildPhase section *)
	let frameworks_build_phase_app = files_manager#generate_uuid in
	let frameworks_build_phase_tests = files_manager#generate_uuid in
	file#write ("\n/* Begin PBXFrameworksBuildPhase section */
		"^frameworks_build_phase_app^" /* Frameworks */ = {
			isa = PBXFrameworksBuildPhase;
			buildActionMask = 2147483647;
			files = (\n");
	List.iter ( fun (uuid, fileRef, name) -> file#write ("				"^uuid^" /* "^name^".framework in Frameworks */,\n"); ) files_manager#get_frameworks;
	file#write ("			);
			runOnlyForDeploymentPostprocessing = 0;
		};
		"^frameworks_build_phase_tests^" /* Frameworks */ = {
			isa = PBXFrameworksBuildPhase;
			buildActionMask = 2147483647;
			files = (\n");
	List.iter ( fun (uuid, fileRef, name) -> file#write ("				"^uuid^" /* "^name^".framework in Frameworks */,\n"); ) files_manager#get_frameworks;
	(* 28BFD9FE1628A95900882B34 /* SenTestingKit.framework in Frameworks */,
	28BFD9FF1628A95900882B34 /* UIKit.framework in Frameworks */,
	28BFDA001628A95900882B34 /* Foundation.framework in Frameworks */, *)
	file#write ("			);
			runOnlyForDeploymentPostprocessing = 0;
		};
/* End PBXFrameworksBuildPhase section */");

	(* Begin PBXGroup section *)
	let product_reference = files_manager#generate_uuid in
	let product_reference_tests = files_manager#generate_uuid in
	let main_group = files_manager#generate_uuid in
	let product_ref_group = files_manager#generate_uuid in
	let frameworks_group = files_manager#generate_uuid in
	let children_app = files_manager#generate_uuid in
	let children_tests = files_manager#generate_uuid in
	let children_supporting_files = files_manager#generate_uuid in
	let children_supporting_files_tests = files_manager#generate_uuid in
	file#write ("\n/* Begin PBXGroup section */
		"^main_group^" = {
			isa = PBXGroup;
			children = (
				"^children_app^" /* "^app_name^" */,
				"^children_tests^" /* "^app_name^"Tests */,
				"^frameworks_group^" /* Frameworks */,
				"^product_ref_group^" /* Products */,
			);
			sourceTree = \"<group>\";
		};
		"^product_ref_group^" /* Products */ = {
			isa = PBXGroup;
			children = (
				"^product_reference^" /* "^app_name^".app */,
				"^product_reference_tests^" /* "^app_name^"Tests.octest */,
			);
			name = Products;
			sourceTree = \"<group>\";
		};
		"^frameworks_group^" /* Frameworks */ = {
			isa = PBXGroup;
			children = (\n");
	List.iter ( fun (uuid, fileRef, name) -> file#write ("				"^uuid^" /* "^name^".framework in Frameworks */,\n"); ) files_manager#get_frameworks;
	file#write ("			);
			name = Frameworks;
			sourceTree = \"<group>\";
		};
		"^children_app^" /* "^app_name^" */ = {
			isa = PBXGroup;
			children = (
				28BFD9E81628A95900882B34 /* AppDelegate.h */,
				28BFD9E91628A95900882B34 /* AppDelegate.m */,
				28BFDA211638866C00882B34 /* CustomMapView.h */,
				28BFDA221638866C00882B34 /* CustomMapView.m */,
				"^children_supporting_files^" /* Supporting Files */,
			);
			path = "^app_name^";
			sourceTree = \"<group>\";
		};
		"^children_supporting_files^" /* Supporting Files */ = {
			isa = PBXGroup;
			children = (
				28BFD9E11628A95900882B34 /* "^app_name^"-Info.plist */,
				28BFD9E21628A95900882B34 /* InfoPlist.strings */,
				28BFD9E51628A95900882B34 /* main.m */,
				28BFD9E71628A95900882B34 /* "^app_name^"-Prefix.pch */,
			);
			name = \"Supporting Files\";
			sourceTree = \"<group>\";
		};
		"^children_tests^" /* "^app_name^"Tests */ = {
			isa = PBXGroup;
			children = (
				28BFDA091628A95900882B34 /* "^app_name^"Tests.h */,
				28BFDA0A1628A95900882B34 /* "^app_name^"Tests.m */,
				"^children_supporting_files_tests^" /* Supporting Files */,
			);
			path = "^app_name^"Tests;
			sourceTree = \"<group>\";
		};
		"^children_supporting_files_tests^" /* Supporting Files */ = {
			isa = PBXGroup;
			children = (
				28BFDA051628A95900882B34 /* "^app_name^"Tests-Info.plist */,
				28BFDA061628A95900882B34 /* InfoPlist.strings */,
			);
			name = \"Supporting Files\";
			sourceTree = \"<group>\";
		};
/* End PBXGroup section */");
	(* Begin PBXNativeTarget section *)
	let sources_build_phase_app = files_manager#generate_uuid in
	let sources_build_phase_tests = files_manager#generate_uuid in
	let resources_build_phase_app = files_manager#generate_uuid in
	let resources_build_phase_tests = files_manager#generate_uuid in
	let remote_global_id_string_tests = files_manager#generate_uuid in
	let shell_build_phase_tests = files_manager#generate_uuid in
	let target_dependency = files_manager#generate_uuid in
	let build_config_list_app = files_manager#generate_uuid in
	let build_config_list_tests = files_manager#generate_uuid in
	let build_config_list_proj = files_manager#generate_uuid in
	file#write ("\n/* Begin PBXNativeTarget section */
		"^remote_global_id_string^" /* "^app_name^" */ = {
			isa = PBXNativeTarget;
			buildConfigurationList = "^build_config_list_app^" /* Build configuration list for PBXNativeTarget \""^app_name^"\" */;
			buildPhases = (
				"^sources_build_phase_app^" /* Sources */,
				"^frameworks_build_phase_app^" /* Frameworks */,
				"^resources_build_phase_app^" /* Resources */,
			);
			buildRules = (
			);
			dependencies = (
			);
			name = "^app_name^";
			productName = "^app_name^";
			productReference = "^product_reference^" /* "^app_name^".app */;
			productType = \"com.apple.product-type.application\";
		};
		"^remote_global_id_string_tests^" /* "^app_name^"Tests */ = {
			isa = PBXNativeTarget;
			buildConfigurationList = "^build_config_list_tests^" /* Build configuration list for PBXNativeTarget \""^app_name^"Tests\" */;
			buildPhases = (
				"^sources_build_phase_tests^" /* Sources */,
				"^frameworks_build_phase_tests^" /* Frameworks */,
				"^resources_build_phase_tests^" /* Resources */,
				"^shell_build_phase_tests^" /* ShellScript */,
			);
			buildRules = (
			);
			dependencies = (
				"^target_dependency^" /* PBXTargetDependency */,
			);
			name = "^app_name^"Tests;
			productName = "^app_name^"Tests;
			productReference = "^product_reference_tests^" /* "^app_name^"Tests.octest */;
			productType = \"com.apple.product-type.bundle\";
		};
/* End PBXNativeTarget section */");
	(* Begin PBXProject section *)
	file#write ("\n/* Begin PBXProject section */
		"^root_object^" /* Project object */ = {
			isa = PBXProject;
			attributes = {
				LastUpgradeCheck = 0450;
				ORGANIZATIONNAME = \""^owner^"\";
			};
			buildConfigurationList = "^build_config_list_proj^" /* Build configuration list for PBXProject \""^app_name^"\" */;
			compatibilityVersion = \"Xcode 3.2\";
			developmentRegion = English;
			hasScannedForEncodings = 0;
			knownRegions = (
				en,
			);
			mainGroup = "^main_group^";
			productRefGroup = "^product_ref_group^" /* Products */;
			projectDirPath = \"\";
			projectRoot = \"\";
			targets = (
				"^remote_global_id_string^" /* "^app_name^" */,
				"^remote_global_id_string_tests^" /* "^app_name^"Tests */,
			);
		};
/* End PBXProject section */");
	(* Begin PBXResourcesBuildPhase section *)
	file#write ("\n/* Begin PBXResourcesBuildPhase section */
		"^resources_build_phase_app^" /* Resources */ = {
			isa = PBXResourcesBuildPhase;
			buildActionMask = 2147483647;
			files = (
				28BFD9E41628A95900882B34 /* InfoPlist.strings in Resources */,
			);
			runOnlyForDeploymentPostprocessing = 0;
		};
		"^resources_build_phase_tests^" /* Resources */ = {
			isa = PBXResourcesBuildPhase;
			buildActionMask = 2147483647;
			files = (
				28BFDA081628A95900882B34 /* InfoPlist.strings in Resources */,
			);
			runOnlyForDeploymentPostprocessing = 0;
		};
/* End PBXResourcesBuildPhase section */");
	(* Begin PBXShellScriptBuildPhase section *)
	file#write ("\n/* Begin PBXShellScriptBuildPhase section */
		"^shell_build_phase_tests^" /* ShellScript */ = {
			isa = PBXShellScriptBuildPhase;
			buildActionMask = 2147483647;
			files = (
			);
			inputPaths = (
			);
			outputPaths = (
			);
			runOnlyForDeploymentPostprocessing = 0;
			shellPath = /bin/sh;
			shellScript = \"# Run the unit tests in this test bundle.\\\n\\\"${SYSTEM_DEVELOPER_DIR}/Tools/RunUnitTests\\\"\\\n\";
		};
/* End PBXShellScriptBuildPhase section */");
	(* Begin PBXSourcesBuildPhase section *)
	file#write ("\n/* Begin PBXSourcesBuildPhase section */
		"^sources_build_phase_app^" /* Sources */ = {
			isa = PBXSourcesBuildPhase;
			buildActionMask = 2147483647;
			files = (\n");
	List.iter ( fun (uuid, fileRef, path, ext) -> if ext=".m" then file#write ("				"^uuid^" /* "^(snd path)^ext^" in Sources */,\n"); ) files_manager#get_source_files;
	file#write ("			);
			runOnlyForDeploymentPostprocessing = 0;
		};
		"^sources_build_phase_tests^" /* Sources */ = {
			isa = PBXSourcesBuildPhase;
			buildActionMask = 2147483647;
			files = (
				28BFDA0B1628A95900882B34 /* "^app_name^"Tests.m in Sources */,
			);
			runOnlyForDeploymentPostprocessing = 0;
		};
/* End PBXSourcesBuildPhase section */");
	(* Begin PBXTargetDependency section *)
	file#write ("\n/* Begin PBXTargetDependency section */
		"^target_dependency^" /* PBXTargetDependency */ = {
			isa = PBXTargetDependency;
			target = "^remote_global_id_string^" /* "^app_name^" */;
			targetProxy = "^container_item_proxy^" /* PBXContainerItemProxy */;
		};
/* End PBXTargetDependency section */");
	(* Begin PBXVariantGroup section *)
	file#write ("\n/* Begin PBXVariantGroup section */
		28BFD9E21628A95900882B34 /* InfoPlist.strings */ = {
			isa = PBXVariantGroup;
			children = (
				28BFD9E31628A95900882B34 /* en */,
			);
			name = InfoPlist.strings;
			sourceTree = \"<group>\";
		};
		28BFDA061628A95900882B34 /* InfoPlist.strings */ = {
			isa = PBXVariantGroup;
			children = (
				28BFDA071628A95900882B34 /* en */,
			);
			name = InfoPlist.strings;
			sourceTree = \"<group>\";
		};
/* End PBXVariantGroup section */");
	(* Begin XCBuildConfiguration section *)
	let build_config_list_proj_debug = files_manager#generate_uuid in
	let build_config_list_proj_release = files_manager#generate_uuid in
	let build_config_list_app_debug = files_manager#generate_uuid in
	let build_config_list_app_release = files_manager#generate_uuid in
	let build_config_list_tests_debug = files_manager#generate_uuid in
	let build_config_list_tests_release = files_manager#generate_uuid in
	file#write ("\n/* Begin XCBuildConfiguration section */
		"^build_config_list_proj_debug^" /* Debug */ = {
			isa = XCBuildConfiguration;
			buildSettings = {
				ALWAYS_SEARCH_USER_PATHS = NO;
				CLANG_CXX_LANGUAGE_STANDARD = \"gnu++0x\";
				CLANG_CXX_LIBRARY = \"libc++\";
				CLANG_ENABLE_OBJC_ARC = YES;
				CLANG_WARN_EMPTY_BODY = YES;
				CLANG_WARN__DUPLICATE_METHOD_MATCH = YES;
				\"CODE_SIGN_IDENTITY[sdk=iphoneos*]\" = \"iPhone Developer\";
				COPY_PHASE_STRIP = NO;
				GCC_C_LANGUAGE_STANDARD = gnu99;
				GCC_DYNAMIC_NO_PIC = NO;
				GCC_OPTIMIZATION_LEVEL = 0;
				GCC_PREPROCESSOR_DEFINITIONS = (
					\"DEBUG=1\",
					\"$(inherited)\",
				);
				GCC_SYMBOLS_PRIVATE_EXTERN = NO;
				GCC_WARN_ABOUT_RETURN_TYPE = YES;
				GCC_WARN_UNINITIALIZED_AUTOS = YES;
				GCC_WARN_UNUSED_VARIABLE = YES;
				IPHONEOS_DEPLOYMENT_TARGET = 6.0;
				SDKROOT = iphoneos;
			};
			name = Debug;
		};
		"^build_config_list_proj_release^" /* Release */ = {
			isa = XCBuildConfiguration;
			buildSettings = {
				ALWAYS_SEARCH_USER_PATHS = NO;
				CLANG_CXX_LANGUAGE_STANDARD = \"gnu++0x\";
				CLANG_CXX_LIBRARY = \"libc++\";
				CLANG_ENABLE_OBJC_ARC = YES;
				CLANG_WARN_EMPTY_BODY = YES;
				CLANG_WARN__DUPLICATE_METHOD_MATCH = YES;
				\"CODE_SIGN_IDENTITY[sdk=iphoneos*]\" = \"iPhone Developer\";
				COPY_PHASE_STRIP = YES;
				GCC_C_LANGUAGE_STANDARD = gnu99;
				GCC_WARN_ABOUT_RETURN_TYPE = YES;
				GCC_WARN_UNINITIALIZED_AUTOS = YES;
				GCC_WARN_UNUSED_VARIABLE = YES;
				IPHONEOS_DEPLOYMENT_TARGET = 6.0;
				OTHER_CFLAGS = \"-DNS_BLOCK_ASSERTIONS=1\";
				SDKROOT = iphoneos;
				VALIDATE_PRODUCT = YES;
			};
			name = Release;
		};
		"^build_config_list_app_debug^" /* Debug */ = {
			isa = XCBuildConfiguration;
			buildSettings = {
				GCC_PRECOMPILE_PREFIX_HEADER = YES;
				GCC_PREFIX_HEADER = \""^app_name^"/"^app_name^"-Prefix.pch\";
				INFOPLIST_FILE = \""^app_name^"/"^app_name^"-Info.plist\";
				PRODUCT_NAME = \"$(TARGET_NAME)\";
				WRAPPER_EXTENSION = app;
			};
			name = Debug;
		};
		"^build_config_list_app_release^" /* Release */ = {
			isa = XCBuildConfiguration;
			buildSettings = {
				GCC_PRECOMPILE_PREFIX_HEADER = YES;
				GCC_PREFIX_HEADER = \""^app_name^"/"^app_name^"-Prefix.pch\";
				INFOPLIST_FILE = \""^app_name^"/"^app_name^"-Info.plist\";
				PRODUCT_NAME = \"$(TARGET_NAME)\";
				WRAPPER_EXTENSION = app;
			};
			name = Release;
		};
		"^build_config_list_tests_debug^" /* Debug */ = {
			isa = XCBuildConfiguration;
			buildSettings = {
				BUNDLE_LOADER = \"$(BUILT_PRODUCTS_DIR)/"^app_name^".app/"^app_name^"\";
				FRAMEWORK_SEARCH_PATHS = (
					\"\\\"$(SDKROOT)/Developer/Library/Frameworks\\\"\",
					\"\\\"$(DEVELOPER_LIBRARY_DIR)/Frameworks\\\"\",
				);
				GCC_PRECOMPILE_PREFIX_HEADER = YES;
				GCC_PREFIX_HEADER = \""^app_name^"/"^app_name^"-Prefix.pch\";
				INFOPLIST_FILE = \""^app_name^"Tests/"^app_name^"Tests-Info.plist\";
				PRODUCT_NAME = \"$(TARGET_NAME)\";
				TEST_HOST = \"$(BUNDLE_LOADER)\";
				WRAPPER_EXTENSION = octest;
			};
			name = Debug;
		};
		"^build_config_list_tests_release^" /* Release */ = {
			isa = XCBuildConfiguration;
			buildSettings = {
				BUNDLE_LOADER = \"$(BUILT_PRODUCTS_DIR)/"^app_name^".app/"^app_name^"\";
				FRAMEWORK_SEARCH_PATHS = (
					\"\\\"$(SDKROOT)/Developer/Library/Frameworks\\\"\",
					\"\\\"$(DEVELOPER_LIBRARY_DIR)/Frameworks\\\"\",
				);
				GCC_PRECOMPILE_PREFIX_HEADER = YES;
				GCC_PREFIX_HEADER = \""^app_name^"/"^app_name^"-Prefix.pch\";
				INFOPLIST_FILE = \""^app_name^"Tests/"^app_name^"Tests-Info.plist\";
				PRODUCT_NAME = \"$(TARGET_NAME)\";
				TEST_HOST = \"$(BUNDLE_LOADER)\";
				WRAPPER_EXTENSION = octest;
			};
			name = Release;
		};
/* End XCBuildConfiguration section */");

	(* Begin XCConfigurationList section *)
	file#write ("\n/* Begin XCConfigurationList section */
		"^build_config_list_proj^" /* Build configuration list for PBXProject \""^app_name^"\" */ = {
			isa = XCConfigurationList;
			buildConfigurations = (
				"^build_config_list_proj_debug^" /* Debug */,
				"^build_config_list_proj_release^" /* Release */,
			);
			defaultConfigurationIsVisible = 0;
			defaultConfigurationName = Release;
		};
		"^build_config_list_app^" /* Build configuration list for PBXNativeTarget \""^app_name^"\" */ = {
			isa = XCConfigurationList;
			buildConfigurations = (
				"^build_config_list_app_debug^" /* Debug */,
				"^build_config_list_app_release^" /* Release */,
			);
			defaultConfigurationIsVisible = 0;
			defaultConfigurationName = Release;
		};
		"^build_config_list_tests^" /* Build configuration list for PBXNativeTarget \""^app_name^"Tests\" */ = {
			isa = XCConfigurationList;
			buildConfigurations = (
				"^build_config_list_tests_debug^" /* Debug */,
				"^build_config_list_tests_release^" /* Release */,
			);
			defaultConfigurationIsVisible = 0;
			defaultConfigurationName = Release;
		};
/* End XCConfigurationList section */");

	file#write ("	};
	rootObject = "^root_object^" /* Project object */;
}
");

	file#close
;;
let localizations common_ctx = 
	let src_dir = srcDir common_ctx in
	(* let app_name = appName common_ctx in *)
	let file = newSourceFile (src_dir^"/en.lproj") ([],"InfoPlist") ".strings" in
	file#write ("/* Localized versions of Info.plist keys */");
	file#close
;;
let generateXcodeStructure common_ctx =
	let app_name = appName common_ctx in
	let base_dir = common_ctx.file in
	(* Create classes directory *)
	mkdir base_dir ( app_name :: []);
		mkdir base_dir ( app_name :: ["en.lproj"]);
		
	(* Create utests directory *)
	mkdir base_dir ( (app_name^"Tests") :: []);
	
	(* Create Main Xcode bundle *)
	mkdir base_dir ( (app_name^".xcodeproj") :: []);
		mkdir base_dir ( (app_name^".xcodeproj") :: ["project.xcworkspace"]);
			mkdir base_dir ( (app_name^".xcodeproj") :: "project.xcworkspace" :: ["Cristi.xcuserdatad"])
;;

let generatePch common_ctx class_def =
	(* This class imports will be available in the entire Xcode project, we add here Std classes *)
	let app_name = appName common_ctx in
	let src_dir = srcDir common_ctx in
	let file = newSourceFile src_dir ([], app_name ^ "-Prefix") ".pch" in
	file#write "//
// Prefix header for all source files in the project
//

#import <Availability.h>

#ifndef __IPHONE_4_0
#warning \"This project uses features only available in iOS SDK 4.0 and later.\"
#endif

#ifdef __OBJC__
	#import <UIKit/UIKit.h>
	#import <Foundation/Foundation.h>
#endif";
	file#close
;;

let getMetaString key meta =
	let rec loop = function
		| [] -> ""
		| (k,[Ast.EConst (Ast.String name),_],_) :: _  when k=key-> name
		| _ :: l -> loop l
		in
	loop meta
;;
let generatePlist common_ctx class_def  =
	(* TODO: Read and parse the Main class for metadata *)
	let app_name = appName common_ctx in
	let src_dir = srcDir common_ctx in
	let identifier = "" in (* (getMetaString ":identifier" class_def.cl_meta) in *)
	let version = "" in
	(* let identifier = getMetaString class_def.cl_meta ":identifier" in
	let version = getMetaString class_def.cl_meta ":version" in *)
	let file = newSourceFile src_dir ([],app_name^"-Info") ".plist" in
	file#write ("<?xml version=\"1.0\" encoding=\"UTF-8\"?>
<!DOCTYPE plist PUBLIC \"-//Apple//DTD PLIST 1.0//EN\" \"http://www.apple.com/DTDs/PropertyList-1.0.dtd\">
<plist version=\"1.0\">
<dict>
	<key>CFBundleDevelopmentRegion</key>
	<string>en</string>
	<key>CFBundleDisplayName</key>
	<string>${PRODUCT_NAME}</string>
	<key>CFBundleExecutable</key>
	<string>${EXECUTABLE_NAME}</string>
	<key>CFBundleIdentifier</key>
	<string>" ^ identifier ^ "</string>
	<key>CFBundleInfoDictionaryVersion</key>
	<string>6.0</string>
	<key>CFBundleName</key>
	<string>${PRODUCT_NAME}</string>
	<key>CFBundlePackageType</key>
	<string>APPL</string>
	<key>CFBundleShortVersionString</key>
	<string>" ^ version ^ "</string>
	<key>CFBundleSignature</key>
	<string>????</string>
	<key>CFBundleVersion</key>
	<string>" ^ version ^ "</string>
	<key>LSRequiresIPhoneOS</key>
	<true/>
	<key>UIRequiredDeviceCapabilities</key>
	<array>
		<string>armv7</string>
	</array>
	<key>UISupportedInterfaceOrientations</key>
	<array>
		<string>UIInterfaceOrientationPortrait</string>
		<string>UIInterfaceOrientationLandscapeLeft</string>
		<string>UIInterfaceOrientationLandscapeRight</string>
	</array>
</dict>
</plist>");
	file#close
;;

let generateEnum ctx e =
	()
;;

(* Generate header + implementation *)

let generateClassFiles common_ctx class_def file_info files_manager imports_manager =
	print_endline ("> Generating class files for : "^(snd class_def.cl_path));
	
	(* When we create a new class reset the frameworks and imports that where stored for the previous class *)
	(* The frameworks are kept in a non-resetable variable also *)
	imports_manager#reset;
	files_manager#register_source_file class_def.cl_path ".m";
	
	if not class_def.cl_interface then begin
	
	(* Create the implementation file *)
	let src_dir = srcDir common_ctx in
	let class_path = class_def.cl_path in
	(* let class_name = (snd class_def.cl_path) in *)
	let m_file = newSourceFile src_dir class_path ".m" in
	let output_m = (m_file#write) in
	let ctx = newContext common_ctx m_file imports_manager file_info in
	ctx.class_def <- class_def;
	
	defineGetSet ctx true class_def;
	defineGetSet ctx false class_def;
	(* common_ctx.local_types <- List.map snd c.cl_types; *)
	
	(* imports_manager#add_class_path class_def.cl_path; *)
	ctx.writer#add_copy;
	ctx.writer#import_header class_def.cl_path;
	ctx.writer#new_line;
	output_m ("@implementation " ^ (snd class_def.cl_path));

	m_file#new_line;
	
	List.iter (generateField ctx true) class_def.cl_ordered_statics;
	List.iter (generateField ctx false) (List.rev class_def.cl_ordered_fields);
	
	(match class_def.cl_constructor with
	| None -> ();
		(* ctx.generating_constructor <- true; *)
		(* let f = {
			cf_name = "new"(* Rename the class constructor to 'init' snd class_def.cl_path *);
			cf_public = true;
			cf_kind = Method MethNormal;
		} in
		generateField ctx false f; *)
	| Some f ->
		let f = { f with
			cf_name = "new";
			cf_public = true;
			cf_kind = Method MethNormal;
		} in
		ctx.generating_constructor <- true;
		generateField ctx false f;
	);
	
	output_m "\n\n@end\n";
	m_file#close;
	
	end;
	
	
	(* Create the header file *)

	files_manager#register_source_file class_def.cl_path ".h";
	
	let src_dir = srcDir common_ctx in
	let class_path = class_def.cl_path in
	(* let class_name = (snd class_def.cl_path) in *)
	let h_file = newSourceFile src_dir class_path ".h" in
	let ctx = newContext common_ctx h_file imports_manager file_info in
	ctx.class_def <- class_def;
	ctx.writer#add_copy;
	ctx.generating_header <- true;
	
	(* Import the super class *)
	(match class_def.cl_super with
		| None -> ()
		| Some (csup,_) -> ctx.imports_manager#add_class_path csup.cl_path);
	ctx.writer#new_line;
	
	(* Import frameworks *)
	ctx.writer#import_frameworks imports_manager#get_class_frameworks;
	ctx.writer#new_line;
	
	(* Import classes *)
	ctx.writer#import_headers imports_manager#get_imports;
	ctx.writer#new_line;
	
	let isCategory = (has_meta ":category" class_def.cl_meta) in
	if isCategory then begin
		
		let category_class = (match (snd class_path) with
			| "String" -> "NSMutableString"
			| "Array" -> "NSMutableArray"
			| "Date" -> "NSDate"
			| "Hash" -> "NSMutableDictionary"
			| _ -> ""
		) in
		h_file#write ("@interface " ^ category_class ^ " ( " ^ (snd class_path) ^ " )");
		
		end
	else begin
		
		h_file#write ("@interface " ^ (snd class_path));
		(* Add the super class *)
		(match class_def.cl_super with
			| None -> h_file#write " : NSObject"
			| Some (csup,_) -> h_file#write (Printf.sprintf " : %s " (snd csup.cl_path)));
		(* ctx.writer#write (Printf.sprintf "\npublic %s%s%s %s " (final c.cl_meta) 
		(match c.cl_dynamic with None -> "" | Some _ -> if c.cl_interface then "" else "dynamic ") 
		(if c.cl_interface then "interface" else "class") (snd c.cl_path); *)
		if class_def.cl_implements != [] then begin
			(* Add implement *)
			h_file#write "<";
			(match class_def.cl_implements with
			| [] -> ()
			| l -> concat ctx ", " (fun (i,_) -> h_file#write (Printf.sprintf "%s" (snd i.cl_path))) l
			);
			h_file#write ">";
		end
	end;
	
	
	h_file#new_line;
	
	List.iter (generateField ctx true) class_def.cl_ordered_statics;
	List.iter (generateField ctx false) (List.rev class_def.cl_ordered_fields);
	
	(match class_def.cl_constructor with
	| None -> ();
		(* ctx.generating_constructor <- true; *)
		(* let f = {
			cf_name = "new"(* Rename the class constructor to 'init' snd class_def.cl_path *);
			cf_public = true;
			cf_kind = Method MethNormal;
		} in
		generateField ctx false f; *)
	| Some f ->
		let f = { f with
			cf_name = "new";
			cf_public = true;
			cf_kind = Method MethNormal;
		} in
		ctx.generating_constructor <- true;
		generateField ctx false f;
		ctx.generating_constructor <- false;
	);
	
	h_file#write "\n\n@end\n";
	h_file#close
;;

(* The main entry of the generator *)
let generate common_ctx =
	
	(* Generate XCode folders structure *)
	generateXcodeStructure common_ctx;
	
	let imports_manager = new importsManager in
	let files_manager = new filesManager imports_manager in
	let app_info = ref PMap.empty in
	(* Generate files for each class.
	When we reach the static main method generate a main.m file *)
	List.iter (fun object_def ->
		match object_def with
		| TClassDecl class_def ->
			(* if has_meta ":owner" class_def.cl_meta then 
				print_endline ("Has meta "^()); *)
			(* let class_def = (match class_def.cl_path with
				(*  ["flash"],"FlashXml__" -> { class_def with cl_path = [],"Xml" } *)
				| (pack,name) -> { class_def with cl_path = (pack, name) }
			) in *)
			if not class_def.cl_extern then
				generateClassFiles common_ctx class_def app_info files_manager imports_manager
		
		| TEnumDecl e ->
			let pack,name = e.e_path in
			let e = { e with e_path = (pack,protect name) } in
			if not e.e_extern then generateEnum common_ctx e
		
		| TTypeDecl _ | TAbstractDecl _ ->
			()
	) common_ctx.types;
	
	(* Register some default files *)
	(* files_manager#register_source_file class_def.cl_path ".m"; *)
	
	generatePch common_ctx app_info;
	generatePlist common_ctx app_info;
	generateResources common_ctx;
	(*  *)
	localizations common_ctx;
	xcworkspacedata common_ctx;
	pbxproj common_ctx files_manager
;;
