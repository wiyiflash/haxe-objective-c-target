(*
 *  Haxe/Objective-C Compiler
 *  Copyright (c)2013 Băluță Cristian
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
open Unix
open Gencommon

let d = false;;
let joinClassPath path separator =
	match fst path, snd path with
	| [], s -> s
	| el, s -> String.concat separator el ^ separator ^ s
;;
let getFirstMetaValue key meta =
	let rec loop = function
		| [] -> ""
		| (k,[Ast.EConst (Ast.String name),_],_) :: l when k = key -> name
		| _ :: l -> loop l
		in
	loop meta;
;;
let getAllMetaValues key meta =
	let values = ref [] in
	let rec loop = function
		| [] -> ()
		| (k,[Ast.EConst (Ast.String name),_],_) :: l when k = key ->
			values := name :: !values;
			loop l;
		| _ :: l -> loop l
		in
	loop meta;
	!values;
;;
let isSubstringOf s1 s2 =
	let re = Str.regexp_string s2 in
	try ignore (Str.search_forward re s1 0); true
	with Not_found -> false
;;

type header_kind =
	| HeaderObjc
	| HeaderObjcWithoutParams
	| HeaderBlock
	| HeaderBlockInline
	| HeaderDynamic

type call_kind =
	| CallObjc
	| CallC
	| CallBlock
	| CalBlockInline

class importsManager =
	object(this)
	val mutable all_frameworks : string list = []
	val mutable class_frameworks : string list = []
	val mutable class_imports : path list = []
	val mutable class_imports_custom : string list = []
	method add_class_path (class_path:path) = match class_path with
		| ([],"StdTypes")
		| ([],"Int")
		| ([],"Float")
		| ([],"Dynamic")
		| ([],"T")
		| ([],"Bool") -> ();
		| _ -> if not (List.mem class_path class_imports) then class_imports <- List.append class_imports [class_path];
	method add_class (class_def:tclass) = 
		if (Meta.has Meta.Framework class_def.cl_meta) then begin
			let name = getFirstMetaValue Meta.Framework class_def.cl_meta in
			this#add_framework name;
		end else begin
			this#add_class_path class_def.cl_module.m_path;
		end
	method add_abstract (a_def:tabstract) = 
		if (Meta.has Meta.Framework a_def.a_meta) then begin
			let name = getFirstMetaValue Meta.Framework a_def.a_meta in
			this#add_framework name;
		end else begin
			this#add_class_path a_def.a_module.m_path;
		end
	method add_framework (name:string) =
		if not (List.mem name all_frameworks) then all_frameworks <- List.append all_frameworks [name];
		if not (List.mem name class_frameworks) then class_frameworks <- List.append class_frameworks [name];
	method add_class_import_custom (class_path:string) = class_imports_custom <- List.append class_imports_custom ["\""^class_path^"\""];
	method add_class_include_custom (class_path:string) = class_imports_custom <- List.append class_imports_custom ["<"^class_path^">"];
	method remove_class_path (class_path:path) = ()(* List.remove class_imports [class_path] *)(* TODO: *)
	method get_all_frameworks = all_frameworks
	method get_class_frameworks = class_frameworks
	method get_imports = class_imports
	method get_imports_custom = class_imports_custom
	method reset = class_frameworks <- []; class_imports <- []; class_imports_custom <- []
end;;

class filesManager imports_manager app_name =
	object(this)
	val app_name = app_name
	val mutable prefix = ""
	val mutable imports = imports_manager
	val mutable all_frameworks : (string * string * string) list = [](* UUID * fileRef * f_name *)
	val mutable source_files : (string * string * path * string) list = [](* UUID * fileRef * filepath * ext *)
	val mutable source_folders : (string * string * path) list = [](* UUID * fileRef * filepath *)
	val mutable resource_files : (string * string * path * string) list = [](* UUID * fileRef * filepath * ext *)
	method generate_uuid =
		let id = String.make 24 'A' in
		let chars = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ" in
		for i = 0 to 23 do id.[i] <- chars.[Random.int 36] done;
		id
	method generate_uuid_for_file file_path =
		let app_name = app_name^prefix in
		let id = String.make 24 'A' in
		let md5 = Digest.to_hex (Digest.string (joinClassPath file_path "/")) in
		for i = 0 to 23 do
			id.[i] <- if String.length app_name > i then app_name.[i] else md5.[i];
		done;
		String.uppercase id
	method register_source_file file_path ext =
		prefix <- "SRC" ^ (if String.length ext > 1 then (String.sub ext 1 1) else "");
		let uuid = this#generate_uuid_for_file file_path in
		prefix <- "SRCREF" ^ (if String.length ext > 1 then (String.sub ext 1 1) else "");
		let uuid_ref = this#generate_uuid_for_file file_path in
		source_files <- List.append source_files [uuid, uuid_ref, file_path, ext];
	method register_source_folder file_path =
		prefix <- "SRCDIR";
		let uuid = this#generate_uuid_for_file file_path in
		prefix <- "SRCDIRREF";
		let uuid_ref = this#generate_uuid_for_file file_path in
		source_folders <- List.append source_folders [uuid, uuid_ref, file_path];
	method register_resource_file file_path ext =
		prefix <- "RES";
		let uuid = this#generate_uuid_for_file file_path in
		prefix <- "RESREF";
		let uuid_ref = this#generate_uuid_for_file file_path in
		resource_files <- List.append resource_files [uuid, uuid_ref, file_path, ext];
	method get_source_files = source_files
	method get_source_folders = source_folders
	method get_resource_files = resource_files
	method get_frameworks =
		if List.length all_frameworks = 0 then
			List.iter ( fun name ->
				let file_path_fmk = (["FMK"], name) in
				let file_path_ref = (["FMK";"REF"], name) in
				all_frameworks <- List.append all_frameworks [this#generate_uuid_for_file file_path_fmk, this#generate_uuid_for_file file_path_ref, name]
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
	
	method write_header_import (module_path:path) (class_path:path) = 
		let steps = ref "" in
		if List.length (fst module_path) > 0 then List.iter (fun (p) -> steps := !steps ^ "../") (fst module_path);
		this#write ("#import \"" ^ !steps ^ (joinClassPath class_path "/") ^ ".h\"\n")
	method write_headers_imports (module_path:path) class_paths =
		List.iter (fun class_path -> this#write_header_import module_path class_path ) class_paths
	method write_headers_imports_custom class_paths =
		List.iter (fun class_path -> this#write ("#import " ^ class_path ^ "\n")) class_paths
	method write_frameworks_imports f_list = 
		List.iter (fun name ->
			this#write ("#import <" ^ name ^ "/" ^ name ^ ".h>\n")
		) f_list
	method write_copy (module_path:path) (app_name:string) =
		this#write ("//
//  " ^ (snd module_path) ^ "
//  " ^ app_name ^ "
//
//  Source generated by Haxe Objective-C target
//
");
		this#new_line
	end
;;

let rec mkdir base dir_list =
	( match dir_list with
	| [] -> ()
	| dir :: remaining ->
		let path = match base with
		| "" ->  dir
		| "/" -> "/" ^ dir
		| _ -> base ^ "/" ^ dir  in
		if (not (path="" || (((String.length path)=2) && ((String.sub path 1 1)=":")))) then
		if not (Sys.file_exists path) then Unix.mkdir path 0o755;
		
		mkdir (if (path="") then "/" else path) remaining
	)
;;

let cachedSourceWriter filename =
	try
		let in_file = open_in filename in
		let old_contents = Std.input_all in_file in
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
	mutable function_arguments : (string,tconstant) Hashtbl.t;
	mutable class_def : tclass;
	mutable in_value : tvar option;
	mutable in_static : bool;
	mutable in_condition : bool;
	mutable is_protocol : bool;
	mutable is_category : bool;(* In categories @synthesize should be replaced with the getter and setter *)
	mutable handle_break : bool;
	mutable generating_header : bool;
	mutable generating_var : bool;
	mutable generating_objc_block : bool;
	mutable generating_objc_block_asign : bool;
	mutable generating_object_declaration : bool;
	mutable generating_constructor : bool;
	mutable generating_self_access : bool;
	mutable generating_property_access : bool;
	mutable generating_left_side_of_operator : bool;
	mutable generating_right_side_of_operator : bool;
	mutable generating_array_insert : bool;
	mutable generating_method_argument : bool;
	mutable generating_selector : bool;
	mutable generating_custom_selector : bool;
	mutable generating_c_call : bool;
	mutable generating_calls : int;(* How many calls are generated in a row *)
	mutable generating_fields : int;(* How many fields are generated in a row *)
	mutable generating_string_append : int;
	mutable require_pointer : bool;
	mutable return_needs_semicolon : bool;
	mutable gen_uid : int;
	mutable local_types : t list;
}
let newContext common_ctx writer imports_manager file_info = {
	com = common_ctx;
	ctx_file_info = file_info;
	writer = writer;
	imports_manager = imports_manager;
	get_sets = Hashtbl.create 0;
	function_arguments = Hashtbl.create 0;
	class_def = null_class;
	in_value = None;
	in_static = false;
	in_condition = false;
	is_protocol = false;
	is_category = false;
	handle_break = false;
	generating_header = false;
	generating_var = false;
	generating_objc_block = false;
	generating_objc_block_asign = false;
	generating_object_declaration = false;
	generating_constructor = false;
	generating_self_access = false;
	generating_property_access = false;
	generating_left_side_of_operator = false;
	generating_right_side_of_operator = false;
	generating_array_insert = false;
	generating_method_argument = false;
	generating_selector = false;
	generating_custom_selector = false;
	generating_c_call = false;
	generating_calls = 0;
	generating_fields = 0;
	generating_string_append = 0;
	require_pointer = false;
	return_needs_semicolon = false;
	gen_uid = 0;
	local_types = [];
}
type module_context = {
	mutable module_path_m : path;
	mutable module_path_h : path;
	mutable ctx_m : context;
	mutable ctx_h : context;
}
let newModuleContext ctx_m ctx_h = {
	module_path_m = ([],"");
	module_path_h = ([],"");
	ctx_m = ctx_m;
	ctx_h = ctx_h;
}

let debug ctx str =
	if d then ctx.writer#write str
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

let rec isString ctx e =
	(* TODO: left side of the binop is never discovered as being string *)
	(* ctx.writer#write ("\"-CHECK ISSTRING-\""); *)
	(match e.eexpr with
	| TBinop (op,e1,e2) -> (* ctx.writer#write ("\"-redirect check isString-\""); *) isString ctx e1 or isString ctx e2
	| TLocal v ->
		(* ctx.writer#write ("\"-check local-\""); *)
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
					
				| _ -> false
				)
			)
			
		(* | TConst c -> true *)
		| _ -> false
		)
	| TConst (TString s) -> true
	| TField (e,fa) ->
		(* e might be of type TThis and we need to check the fa *)
		let b1 = isString ctx e in 
		if b1 = false then begin
			(* If the expression is not string check the fa also *)
			(match fa with
				| FInstance (tc,tcf)
				| FStatic (tc,tcf) ->
					let ft = field_type tcf in
					(match ft with
						| TMono r ->
							(match !r with
							| None -> false
							| Some t ->
			
								(match t with
								| TInst (c,tl) ->
					
									(match c.cl_path with
									| ([], "String") -> true
									| _ -> false)
					
								| _ -> false
								)
							)
						| TEnum _ -> ctx.writer#write "CASTTenum";false;
						| TInst (tc, tp) -> (* ctx.writer#write (snd tc.cl_path);false; *)
							if (snd tc.cl_path) = "String" then true
							else false
						| TType _ -> ctx.writer#write "CASTTType";false;
						| TFun (_,t) -> (* ctx.writer#write "CASTTFun"; *)
							(* ctx.writer#write ("TFun"^(snd tc.cl_path)); *)
							(* Analize the return type of the function *)
							(match t with
								| TMono r ->
									(match !r with
									| None -> false
									| Some t ->
			
										(match t with
										| TInst (c,tl) ->
					
											(match c.cl_path with
											| ([], "String") -> true
											| _ -> false)
					
										| _ -> false
										)
									)
								| TEnum _ -> ctx.writer#write "CASTTenum";false;
								| TInst (tc, tp) -> (* ctx.writer#write (snd tc.cl_path); *)
									if (snd tc.cl_path) = "String" then true else false
								| TType _ -> ctx.writer#write "CASTTType";false;
								| TFun (_,t) -> ctx.writer#write "CASTTFun";
									(* ctx.writer#write ("TFun"^(snd tc.cl_path)); *)
									false;
								| TAnon _ -> ctx.writer#write "CASTTAnon";false;
								| TDynamic _ -> ctx.writer#write "isstringCASTTDynamic";false;
								| TLazy _ -> ctx.writer#write "CASTTLazy";false;
								| TAbstract (ta,tp) -> (* ctx.writer#write "CASTTAbstract"; *)
									if (snd ta.a_path) = "String" then true
									else false
							)
							
						| TAnon _ -> ctx.writer#write "CASTTAnon";false;
						| TDynamic _ -> ctx.writer#write "isstringCASTTDynamic";false;
						| TLazy _ -> ctx.writer#write "CASTTLazy";false;
						| TAbstract (ta,tp) -> (* ctx.writer#write "CASTTAbstract"; *)
							if (snd ta.a_path) = "String" then true
							else false
					)
				(* | FStatic _ -> ctx.writer#write "isstrFStatic";false; *)
				| FAnon tcf -> (* ctx.writer#write "isstrFAnon-"; *)
					(match tcf.cf_type with
						| TMono r -> ctx.writer#write "Mono";false;
						| TEnum _ -> ctx.writer#write "Tenum";false;
						| TInst (tc, tp) -> (* ctx.writer#write (snd tc.cl_path); *)
							if (snd tc.cl_path) = "String" then true else false
						| TType _ -> ctx.writer#write "Type";false;
						| TFun (_,t) -> ctx.writer#write "TFun";
							(* ctx.writer#write ("TFun"^(snd tc.cl_path)); *)
							false;
						| TAnon _ -> ctx.writer#write "TAnon";false;
						| TDynamic _ -> ctx.writer#write "isstringCASTTDynamic";false;
						| TLazy _ -> ctx.writer#write "TLazy";false;
						| TAbstract (ta,tp) -> (* ctx.writer#write "CASTTAbstract"; *)
							if (snd ta.a_path) = "String" then true
							else false
					)
				| FDynamic _ -> ctx.writer#write "isstrFDynamic";false;
				| FClosure _ -> ctx.writer#write "isstrFClosure";false;
				| FEnum _ -> ctx.writer#write "isstrFEnum";false;
			);
		end else b1
	| TCall (e,el) -> isString ctx e
	| TConst c ->
		(* ctx.writer#write ("\"-check const-\""); *)
		(match c with
			| TString s -> true;
			| TInt i -> false;
			| TFloat f -> false;
			| TBool b -> false;
			| TNull -> false;
			| TThis -> false;(* In this case the field_access will be checked for String as well *)
			| TSuper -> false;
		)
	| _ -> false)
;;
let rec isArray e =
	(match e.eexpr with
	| TArray (e1,e2) -> true
	| _ -> false)
;;

(* 'id' is a pointer but does not need to specify it *)
let isPointer t =
	match t with
	| "void" | "id" | "BOOL" | "int" | "uint" | "float" | "CGRect" | "CGPoint" | "CGSize" | "SEL" | "CGImageRef" -> false
	| _ -> true
	(* TODO: enum is not pointer *)
;;
let addPointerIfNeeded t =
	if (isPointer t) then "*" else ""
;;

(* Generating correct type *)
let remapHaxeTypeToObjc ctx is_static path pos =
	match path with
	| ([],name) ->
		(match name with
		| "Int" -> "int"
		| "Float" -> "float"
		| "Dynamic" -> "id"
		| "Bool" -> "BOOL"
		| "String" -> "NSMutableString"
		| "Date" -> "NSDate"
		| "Array" -> "NSMutableArray"
		| "Void" -> "void"
		| _ -> name)
	| (["haxe"],"Int32") when not is_static -> "int"
	| (pack,name) -> name
;;

(* Convert function names that can't be written in c++ ... *)
let remapKeyword name =
	match name with
	| "int" | "float" | "double" | "long" | "short" | "char" | "void" 
	| "self" | "super" | "id" | "____init" | "bycopy" | "inout" | "oneway" | "byref" 
	| "SEL" | "IMP" | "Protocol" | "BOOL" | "YES" | "NO"
	| "in" | "out" | "auto" | "const" | "delete"
	| "enum" | "extern" | "friend" | "goto" | "operator" | "protected" | "register" 
	| "sizeof" | "template" | "typedef" | "union"
	| "volatile" | "or" | "and" | "xor" | "or_eq" | "not"
	| "and_eq" | "xor_eq" | "typeof" | "stdin" | "stdout" | "stderr"
	| "BIG_ENDIAN" | "LITTLE_ENDIAN" | "assert" | "NULL" | "nil" | "wchar_t" | "EOF"
	| "const_cast" | "dynamic_cast" | "explicit" | "export" | "mutable" | "namespace"
 	| "reinterpret_cast" | "static_cast" | "typeid" | "typename" | "virtual"
	| "initWithFrame" | "initWithStyle"
	| "signed" | "unsigned" | "struct" -> "_" ^ name
	| "asm" -> "_asm_"
	| "__null" -> "null"
	| "__class" -> "class"
	| x -> x

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
	(* | TEnum (te,tp) -> "TEnumInBlock" *)
	| TEnum _ | TInst _ when List.memq t ctx.local_types ->
		"id"
	| TAbstract (a,_) ->(* ctx.writer#write "TAbstract?"; *)
		ctx.imports_manager#add_abstract a;
		remapHaxeTypeToObjc ctx true a.a_path p;
	| TEnum (e,_) ->(* ctx.writer#write "TEnum-"; *)
		if e.e_extern then
			(match e.e_path with
			| [], "Void" -> "void"
			| [], "Bool" -> "BOOL"
			| _, name -> name
			)
		else begin
			(* Import the module but use the type itself *)
			ctx.imports_manager#add_class_path e.e_module.m_path;
			remapHaxeTypeToObjc ctx true e.e_path p
		end
	| TInst (c,_) ->(* ctx.writer#write "TInst?"; *)
		(match c.cl_kind with
		| KNormal | KGeneric | KGenericInstance _ ->
			ctx.imports_manager#add_class c;
			remapHaxeTypeToObjc ctx false c.cl_path p
		| KTypeParameter _ | KExtension _ | KExpr _ | KMacroType | KAbstractImpl _ -> "id")
	| TFun (args, ret) ->
		let r = ref "" in
		let index = ref 0 in
		List.iter ( fun (name, b, t) ->
			(* print_endline name; *)
			(* ctx.generating_method_argument <- true; *)
			(* if Array.length sel_arr > 0 then
				r := !r ^ (" "^sel_arr.(!index)^":")
			else *)
				r := !r ^ name;(* (if !index = 0 then ":" else (" "^(remapKeyword name)^":")); *)
			(* generateValue ctx args_array_e.(!index); *)
			index := !index + 1;
		) args;
		(* Write the type of a function, the block definition *)
		(* !r *)
		"id"
	| TMono r -> (match !r with None -> "id" | Some t -> typeToString ctx t p)
	| TAnon anon -> "id"
	| TDynamic _ -> "id"
	| TType (t,args) ->
		(* ctx.writer#write "?TType?"; *)
		(match t.t_path with
		| [], "UInt" -> "uint"
		| [] , "Null" ->
			(match args with
			| [t] ->
				(* Saw it generated in the function optional arguments *)
				(match follow t with
				| TAbstract ({ a_path = [],"UInt" },_) -> "int"
				| TAbstract ({ a_path = [],"Int" },_) -> "int"
				| TAbstract ({ a_path = [],"Float" },_) -> "float"
				| TAbstract ({ a_path = [],"Bool" },_) -> "BOOL"
				| TInst ({ cl_path = [],"Int" },_) -> "int"
				| TInst ({ cl_path = [],"Float" },_) -> "float"
				| TEnum ({ e_path = [],"Bool" },_) -> "BOOL"
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

let this ctx = "self"(* if ctx.in_value <> None then "__self" else "self" *)
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
			ctx.writer#write (Printf.sprintf "@%ld" i) (* %ld = int32 = (Int32.to_string i) *)
		else
			ctx.writer#write (Printf.sprintf "%ld" i)
	| TFloat f ->
		if ctx.generating_string_append > 0 then
			ctx.writer#write (Printf.sprintf "@\"%s\"" f)
		else if ctx.require_pointer then
			ctx.writer#write (Printf.sprintf "@%s" f)
		else
			ctx.writer#write f
	| TString s -> ctx.writer#write (Printf.sprintf "[@\"%s\" mutableCopy]" (Ast.s_escape s))
	| TBool b -> ctx.writer#write (if b then "YES" else "NO")
	| TNull -> ctx.writer#write (if ctx.require_pointer then "[NSNull null]" else "nil")
	| TThis -> ctx.writer#write "self"; ctx.generating_self_access <- true
	| TSuper -> ctx.writer#write "super"
;;

let defaultValue s =
	match s with
	| "Bool" | "BOOL" -> "NO"
	| _ -> "nil"
;;

(* A function header in objc is a message *)
(* We need to follow some strict rules *)
let generateFunctionHeader ctx name (meta:metadata) (f:tfunc) params pos is_static kind =
	(* ctx.writer#write ("gen-func-"); *)
	let old = ctx.in_value in
	let locals = saveLocals ctx in
	let old_t = ctx.local_types in
	ctx.in_value <- None;
	ctx.local_types <- List.map snd params @ ctx.local_types;
	let sel = if Meta.has Meta.Selector meta then (getFirstMetaValue Meta.Selector meta) else "" in
	let first_arg = ref true in
	let sel_list = if (String.length sel > 0) then Str.split_delim (Str.regexp ":") sel else [] in
	let sel_arr = Array.of_list sel_list in
	let return_type = if ctx.generating_constructor then "id" else typeToString ctx f.tf_type pos in
	(* This part generates the name of the function, the first part of the objc message *)
	let func_name = if Array.length sel_arr > 1 then sel_arr.(0) else begin
		(match name with None -> "" | Some (n,meta) ->
		let rec loop = function
			| [] -> (* processFunctionName *) n
			| _ :: l -> loop l
		in
		"" ^ loop meta
		)
	end in
	
	(* Return type and function name *)
	(match kind with
		| HeaderObjc | HeaderObjcWithoutParams ->
			let method_kind = if is_static then "+" else "-" in
			ctx.writer#write (Printf.sprintf "%s (%s%s)" method_kind return_type (addPointerIfNeeded return_type));
			ctx.writer#write (Printf.sprintf " %s" (remapKeyword func_name));
			
		| HeaderBlock ->
			(* [^BOOL() { return p < [a count]; } copy] *)
			ctx.writer#write (Printf.sprintf "%s%s" return_type (addPointerIfNeeded return_type))
			
		| HeaderBlockInline ->
			ctx.writer#write "^"

		| HeaderDynamic ->
			(* void(^block3)(NSString); *)
			ctx.writer#write (Printf.sprintf "%s%s(^hx_dyn_%s)" return_type (addPointerIfNeeded return_type) func_name);
	);
	
	(* Function arguments and types *)
	Hashtbl.clear ctx.function_arguments;
	(* Generate the arguments of the function. Ignore the message name of the first arg *)
	(* TODO: add (void) if no argument is present. Not mandatory *)
	
	(match kind with
		| HeaderObjc ->
			let index = ref 0 in
			concat ctx " " (fun (v,c) ->
				let type_name = typeToString ctx v.v_type pos in
				let arg_name = (remapKeyword v.v_name) in
				let message_name = if !first_arg then "" else if Array.length sel_arr > 1 then sel_arr.(!index) else arg_name in
				ctx.writer#write (Printf.sprintf "%s:(%s%s)%s" (remapKeyword message_name) type_name (addPointerIfNeeded type_name) arg_name);
				first_arg := false;
				index := !index+1;
				if not ctx.generating_header then begin
					match c with
					| None -> ();(* Hashtbl.add ctx.function_arguments arg_name (defaultValue arg_name) *)
					| Some c -> Hashtbl.add ctx.function_arguments arg_name c
				end
			) f.tf_args;
			
		| HeaderObjcWithoutParams ->
			concat ctx " " (fun (v,c) ->
				let type_name = typeToString ctx v.v_type pos in
				let arg_name = (remapKeyword v.v_name) in
				ctx.writer#write (Printf.sprintf ":(%s%s)%s" type_name (addPointerIfNeeded type_name) arg_name);
				if not ctx.generating_header then begin
					match c with
					| None -> ();(* Hashtbl.add ctx.function_arguments arg_name (defaultValue arg_name) *)
					| Some c -> Hashtbl.add ctx.function_arguments arg_name c
				end
			) f.tf_args;
			
		| HeaderBlock ->
			ctx.writer#write "(";
			concat ctx ", " (fun (v,c) ->
				let type_name = typeToString ctx v.v_type pos in
				ctx.writer#write (Printf.sprintf "%s%s" type_name (addPointerIfNeeded type_name));
			) f.tf_args;
			ctx.writer#write ")";
			
		| HeaderBlockInline ->
			(* Inlined blocks require pointers? *)
			ctx.writer#write "(";
			concat ctx ", " (fun (v,c) ->
				let type_name = typeToString ctx v.v_type pos in
				let arg_name = (remapKeyword v.v_name) in
				let is_enum = (match v.v_type with | TEnum _ -> true | _ -> false) in
				ctx.writer#write (Printf.sprintf "%s %s%s" type_name (if is_enum then "" else (addPointerIfNeeded type_name)) arg_name);
				(* if not ctx.generating_header then begin
					match c with
					| None -> ();(* Hashtbl.add ctx.function_arguments arg_name (defaultValue arg_name) *)
					| Some c -> Hashtbl.add ctx.function_arguments arg_name c
				end *)
			) f.tf_args;
			ctx.writer#write ")";

		| HeaderDynamic ->
			(* Arguments types *)
			ctx.writer#write "(";
			concat ctx ", " (fun (v,c) ->
				let type_name = typeToString ctx v.v_type pos in
				(* let arg_name = (remapKeyword v.v_name) in *)
				ctx.writer#write (Printf.sprintf "%s%s" type_name (addPointerIfNeeded type_name));
			) f.tf_args;
			ctx.writer#write ")";
	);
	(* Generate the block version of the method. When we pass a reference to a function we pass to this block *)
	(* if not ctx.generating_header then begin
		(* void(^block_block2)(int i) = ^(int i){ [me login]; }; *)
		ctx.writer#write (Printf.sprintf "%s%s(^block_%s)" return_type (addPointerIfNeeded return_type) func_name);
		let gen_block_args = fun() -> (
			ctx.writer#write "(";
			concat ctx ", " (fun (v,c) ->
				let type_name = typeToString ctx v.v_type p in
				ctx.writer#write (Printf.sprintf "%s %s%s" type_name (addPointerIfNeeded type_name) (remapKeyword v.v_name));
			) f.tf_args;
			ctx.writer#write ")";
		) in
		gen_block_args();
		ctx.writer#write " = ^";
		gen_block_args();
		ctx.writer#write (Printf.sprintf " { %s[%s " (if return_type="void" then "" else "return ") (if is_static then "me" else "me"));
		ctx.writer#write func_name;
		let first_arg = ref true in
		concat ctx " " (fun (v,c) ->
			let type_name = typeToString ctx v.v_type p in
			let message_name = if !first_arg then "" else (remapKeyword v.v_name) in
			ctx.writer#write (Printf.sprintf "%s:%s" message_name (remapKeyword v.v_name));
			first_arg := false;
		) f.tf_args;
		ctx.writer#write "]; };\n"
	end; *)
	
	(fun () ->
		ctx.in_value <- old;
		locals();
		ctx.local_types <- old_t;
	)
;;

(* arg_list is of type Type.texpr list *)
let rec generateCall ctx (func:texpr) arg_list =
	debug ctx ("\"-CALL-"^(Type.s_expr_kind func)^">\"");
	
	(* Generate a C call. Used in some low level operations from cocoa frameworks: CoreGraphics *)
	if ctx.generating_c_call then begin
		debug ctx "-C-";
		match func.eexpr, arg_list with
		| TCall (x,_) , el ->
			ctx.writer#write "(";
			generateValue ctx func;
			ctx.writer#write ")";
			ctx.writer#write "(";
			concat ctx ", " (generateValue ctx) arg_list;
			ctx.writer#write ")";
		(* | TField(ee,v),args when isVarField ee v ->
			ctx.writer#write "TField(";
			generateValue ctx func;
			ctx.writer#write ")";
			ctx.writer#write "(";
			concat ctx ", " (generateValue ctx) arg_list;
			ctx.writer#write ")" *)
		| _ ->
			generateValue ctx func;
			ctx.writer#write "(";
			concat ctx ", " (generateValue ctx) arg_list;
			ctx.writer#write ")";
	
	(* Generate an Objective-C call with [] *)
	end else begin
		(* ctx.writer#write "-OBJC-"; *)
		(* A call should cancel the TField *)
		(* When we have a self followed by 2 TFields in a row we use dot notation for the first field *)
		if ctx.generating_fields > 0 then ctx.generating_fields <- ctx.generating_fields - 1;
		ctx.generating_calls <- ctx.generating_calls + 1;
		(* Cast the result *)
		(* ctx.writer#write "returning-"; *)
		(* (match func.etype with
			| TMono _ -> ctx.writer#write "TMono";
			| TEnum _ -> ctx.writer#write "Tenum";
			| TInst _ -> ctx.writer#write "TInst";
			| TType _ -> ctx.writer#write "TType";
			| TFun _ -> ctx.writer#write "TFun";
			| TAnon _ -> ctx.writer#write "TAnon";
			| TDynamic _ -> ctx.writer#write "TDynamic";
			| TLazy _ -> ctx.writer#write "TLazy";
			| TAbstract _ -> ctx.writer#write "TAbstract";
		); *)
		ctx.writer#write "[";
		
		(* Check if the called function has a custom selector defined *)
		let sel = (match func.eexpr with
			(* TODO: TStatic *)
			| TField (e, FInstance (c, cf)) ->
				if Meta.has Meta.Selector cf.cf_meta then (getFirstMetaValue Meta.Selector cf.cf_meta)
				else ""
			| _ -> "";
		) in
		ctx.generating_custom_selector <- (String.length sel > 0);
		generateValue ctx func;
		ctx.generating_calls <- ctx.generating_calls - 1;
		ctx.generating_custom_selector <- false;
		
		if List.length arg_list > 0 then begin
			let sel_list = if (String.length sel > 0) then Str.split_delim (Str.regexp ":") sel else [] in
			let sel_arr = Array.of_list sel_list in
			let args_array_e = Array.of_list arg_list in
			let index = ref 0 in
			let rec gen et =
			(match et with
				| TFun (args, ret) ->
					(* let args_array_e = Array.of_list args in *)
					if !index < (List.length args) then
					List.iter ( fun (name, b, t) ->
						(* print_endline (Printf.sprintf "%d %d %d" (!index) (List.length args) (List.length arg_list)); *)
						(* ctx.generating_method_argument <- true; *)
						if Array.length sel_arr > 0 then
							ctx.writer#write (" "^sel_arr.(!index)^":")
						else
							ctx.writer#write (if !index = 0 then ":" else (" "^(remapKeyword name)^":"));
						(* TODO: inspect the bug, why is there a different number of arguments. In StringBuf *)
						if !index >= (List.length arg_list) then
							ctx.writer#write "nil"
						else
							generateValue ctx args_array_e.(!index);
						index := !index + 1;
					) args;
					(* ctx.generating_method_argument <- false; *)
				(* Generated in Array *)
				| TMono r -> (match !r with 
					| None -> ctx.writer#write "-TMonoNone"
					| Some v -> gen v)
				| TEnum (e,tl) -> ctx.writer#write "-TEnum"
				| TInst (c,tl) -> ctx.writer#write "-TInst"
				| TType (t,tl) -> ctx.writer#write "-TType"
				| TAbstract (a,tl) -> ctx.writer#write "-TAbstract"
				| TAnon a -> ctx.writer#write "-TAnon-"
				| TDynamic t2 ->
					ctx.writer#write ":";
					concat ctx " :" (generateValue ctx) arg_list;
				| TLazy f -> ctx.writer#write "-TLazy call-"
			) in
			gen func.etype;
		end;
		ctx.writer#write "]";
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

and generateValueOpAsString ctx e = generateValueOp ctx e

and redefineCStatic ctx etype s =
	debug ctx "\"-FA-\"";
	(* ctx.writer#write (Printf.sprintf ">%s<" t); *)
	let field c = match c.cl_path with
		| [], "Math" ->
			(match s with
			| "PI" -> ctx.writer#write "M_PI"
			| "NaN" -> ctx.writer#write "NAN"
			| "NEGATIVE_INFINITY" -> ctx.writer#write "-DBL_MAX"
			| "POSITIVE_INFINITY" -> ctx.writer#write "DBL_MAX"
			| "random" -> ctx.writer#write "rand"
			| "isFinite" -> ctx.writer#write "isfinite"
			| "isNaN" -> ctx.writer#write "isnan"
			| "min" | "max" | "abs" -> ctx.writer#write ("f" ^ s ^ "f")
			| _ -> ctx.writer#write (s ^ "f"))
		
		(* | [], "String" ->
			(match s with
			| "length" -> ctx.writer#write ".length"
			| "toLowerCase" -> ctx.writer#write " lowercaseString"
			| "toUpperCase" -> ctx.writer#write " uppercaseString"
			| "toString" -> ctx.writer#write " description"
			(* | "indexOf" -> ctx.writer#write " rangeOfString" *)
			(* | "lastIndexOf" -> ctx.writer#write " rangeOfString options:NSBackwardsSearch" *)
			| "charAt" -> ctx.writer#write " characterAtIndex"
			| "charCodeAt" -> ctx.writer#write " characterAtIndex"
			| "split" -> ctx.writer#write " componentsSeparatedByString"
			(* | "substr" -> ctx.writer#write " substr" *)
			(* | "substring" -> ctx.writer#write " substring" *)
			(* | "fromCharCode" -> ctx.writer#write " fromCharCode" *)
			| _ -> ctx.writer#write (" "^s)) *)
		
		| [], "Date" ->
			(match s with
			| "now" -> ctx.writer#write s
			| "fromTime" -> ctx.writer#write s
			| _ ->
				let accesor = if ctx.generating_self_access then "."
				else if ctx.generating_calls > 0 then " " else "." in
				ctx.writer#write (Printf.sprintf "%s%s" accesor (remapKeyword s)));
		
		| _ -> ()
			(* ctx.writer#write "ooooooooo"; *)
			(* self.someMethod *)
			(* Generating dot notation for property and space for methods *)
			(* let accesor = (* if (not ctx.generating_self_access && ctx.generating_property_access) then "." *)
			(* if (ctx.generating_fields > 0 && not ctx.generating_self_access) then "." *)
			if (ctx.generating_self_access || ctx.generating_fields > 0) then "." else " " in
			(* else if ctx.generating_calls > 0 then " " else "." in *)
			ctx.writer#write (Printf.sprintf "%s%s" accesor (remapKeyword s)); *)
			
			(* if (ctx.generating_self_access && ctx.generating_method_argument) then ctx.generating_calls <- ctx.generating_calls - 1; *)
			(* if ctx.generating_self_access then ctx.generating_self_access <- false *)
	in
	match follow etype with
	(* untyped str.intValue(); *)
	| TInst (c,_) ->
		(* let accessor = if (ctx.generating_calls > 0 && not ctx.generating_self_access) then " " else "." in *)
		(* ctx.writer#write accessor; *)
		field c;
		(* ctx.generating_self_access <- false; *)
	| TAnon a ->
		(match !(a.a_status) with
			(* Generate a static field access *)
			| Statics c -> (* ctx.writer#write " "; *) field c
			(* Generate field access for an anonymous object, Dynamic *)
			| _ -> ctx.writer#write (Printf.sprintf " %s" (remapKeyword s)))
	| _ ->
		(* Method call on a Dynamic *)
		ctx.writer#write (Printf.sprintf " %s" (remapKeyword s))
	
and generateExpression ctx e =
	debug ctx ("\"-E-"^(Type.s_expr_kind e)^">\"");
	(* ctx.writer#write ("-E-"^(Type.s_expr_kind e)^">"); *)
	match e.eexpr with
	| TConst c ->
		if not ctx.generating_selector then generateConstant ctx e.epos c;
	| TLocal v ->
		(* ctx.writer#write "-TLocal-"; *)
		(* (match v.v_type with
		| TMono _ -> ctx.writer#write ">TMono<";
		| TEnum _ -> ctx.writer#write ">TEnum<";
		| TInst _ -> ctx.writer#write ">TInst<";
		| TType _ -> ctx.writer#write ">TType<";
		| TFun _ -> ctx.writer#write ">TFun<";
		| TAnon _ -> ctx.writer#write ">TAnon<";
		| TDynamic t -> 
			ctx.writer#write ">TDynamic<[";
			
			ctx.writer#write "]";
			
		| TLazy _ -> ctx.writer#write ">TLazy<";
		| TAbstract _ -> ctx.writer#write ">TAbstract<"); *)
		
		ctx.writer#write (remapKeyword v.v_name);
		
		(* ctx.writer#write "-e-"; *)
		
		(* ctx.generating_fields <- ctx.generating_fields - 1; *)
		
		
		
	(* | TEnumField (en,s) ->
		ctx.writer#write (Printf.sprintf "%s.%s" (remapHaxeTypeToObjc ctx true en.e_path e.epos) (s)) *)
	(* | TArray ({ eexpr = TLocal { v_name = "__global__" } },{ eexpr = TConst (TString s) }) ->
		let path = Ast.parse_path s in
		ctx.writer#write (remapHaxeTypeToObjc ctx false path e.epos) *)
	| TArray (e1,e2) ->
		(* Accesing an array element *)
		(* TODO: access pointers and primitives in a different way *)
		(* TODO: If the expected value is a Float or Int convert it from NSNumber *)
		(* "-E-Binop>""-gen_val_op-""-E-Array>"["-E-Array>"["-E-Field>""-E-Const>"self.tiles objectAtIndex:"-E-Local>"row] objectAtIndex:"-E-Local>"column] = "-gen_val_op-""-E-Const>"nil; *)
		if ctx.generating_array_insert then begin
			generateValue ctx e1;
			ctx.writer#write " hx_replaceObjectAtIndex:";
			generateValue ctx e2;
		end else begin
			(* Cast the result *)
			let pointer = ref true in
			ctx.writer#write "((";
			(match e1.etype with
				| TMono t  -> (* ctx.writer#write "CASTTMono"; *)
						(match !t with
							| Some tt ->(* ctx.writer#write "-TMonoSome-"; *)
								
								(match tt with
								| TMono t -> ctx.writer#write "CASTTMono";
								| TEnum _ -> ctx.writer#write "CASTTenum";
								| TInst (tc, tp) ->
									(* let t = (typeToString ctx e.etype e.epos) in *)
									ctx.writer#write (remapHaxeTypeToObjc ctx false tc.cl_path e.epos);
								| TType (td,tp) ->
									let n = snd td.t_path in
									ctx.writer#write n;
									pointer := isPointer n;
								| TFun _ -> ctx.writer#write "CASTTFun";
								| TAnon _ -> ctx.writer#write "CASTTAnon";
								| TDynamic _ -> ctx.writer#write "TArrayCASTTDynamic";
								| TLazy _ -> ctx.writer#write "CASTTLazyExpr";
								| TAbstract _ -> ctx.writer#write "CASTTAbstract";
								);
								(* let ttt = (typeToString ctx e.etype e.epos) in
								ctx.writer#write (remapHaxeTypeToObjc ctx false tt.cl_path e.epos);
								ctx.writer#write (typeToString ctx tt e.epos); *)
							| None -> ctx.writer#write "-TMonoNone-";()
						)
				| TEnum _ -> ctx.writer#write "CASTTenum";
				| TInst (tc, tp) ->
					List.iter (fun tt ->
						(match tt with
						| TMono t -> ctx.writer#write "CASTTMono";
							(match !t with
								| Some tt ->(* ctx.writer#write "-TMonoSome-"; *)
									(* let ttt = (typeToString ctx e.etype e.epos) in *)
									ctx.writer#write (remapHaxeTypeToObjc ctx false tc.cl_path e.epos);
									ctx.writer#write (typeToString ctx tt e.epos);
								| None -> ctx.writer#write "-TMonoNone-";
							)
						| TEnum _ -> ctx.writer#write "CASTTenum";
						| TInst (tc, tp) ->
							(* let t = (typeToString ctx e.etype e.epos) in *)
							ctx.writer#write (remapHaxeTypeToObjc ctx false tc.cl_path e.epos);
						| TType _ -> ctx.writer#write "CASTTType--";
						| TFun _ -> ctx.writer#write "CASTTFun";
						| TAnon _ -> ctx.writer#write "CASTTAnon";
						| TDynamic t -> (* ctx.writer#write "TArray2TDynamic"; *)
							let n = typeToString ctx e.etype e.epos in
							ctx.writer#write n;
							pointer := isPointer n;
						| TLazy _ -> ctx.writer#write "CASTTLazyExprInst";
						| TAbstract _ -> ctx.writer#write "CASTTAbstract";
						);
					)tp;
				| TType (td,tp) -> ctx.writer#write (snd td.t_path);
				(* | TFun (tc, tp) -> ctx.writer#write ("TFun"^(snd tc.cl_path)); *)
				| TAnon _ -> ctx.writer#write "CASTTAnon";
				| TDynamic _ -> ctx.writer#write "TArray3TDynamic";
				| TLazy _ -> ctx.writer#write "id"; pointer := false;
				| TAbstract _ -> ctx.writer#write "CASTTAbstract";
				| _ -> ctx.writer#write "CASTOther";
			);
			ctx.writer#write ((if !pointer then "*" else "")^")[");
			generateValue ctx e1;
			ctx.writer#write " hx_objectAtIndex:";
			generateValue ctx e2;
			ctx.writer#write "])";
		end
	| TBinop (Ast.OpEq,e1,e2) when (match isSpecialCompare e1 e2 with Some c -> true | None -> false) ->
		ctx.writer#write "binop";
		let c = match isSpecialCompare e1 e2 with Some c -> c | None -> assert false in
		generateExpression ctx (mk (TCall (mk (TField (mk (TTypeExpr (TClassDecl c)) t_dynamic e.epos,FDynamic "compare")) t_dynamic e.epos,[e1;e2])) ctx.com.basic.tbool e.epos);
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
		(* if isString ctx e1 then ctx.writer#write ("\"-isString1-\""); *)
		(* if isString ctx e2 then ctx.writer#write ("\"-isString2-\""); *)
		
		
		if (s_op="+" or s_op="+=") && (isString ctx e1 or isString ctx e2) then begin
			ctx.generating_string_append <- ctx.generating_string_append + 1;
			ctx.writer#write "[";
			generateValueOpAsString ctx e1;
			ctx.writer#write (match s_op with
				| "+" -> " stringByAppendingString:"
				| "+=" -> " appendString:"
				| _ -> "");
			generateValueOpAsString ctx e2;
			ctx.writer#write "]";
			ctx.generating_string_append <- ctx.generating_string_append - 1;
		end else if (s_op="=") && (isArray e1) then begin
			ctx.generating_array_insert <- true;
			ctx.writer#write "[";
			generateValueOp ctx e1;
			ctx.writer#write " withObject:";
			ctx.generating_array_insert <- false;
			ctx.require_pointer <- true;
			generateValueOp ctx e2;
			ctx.require_pointer <- false;
			ctx.writer#write "]";
		end else begin
			ctx.generating_left_side_of_operator <- true;
			generateValueOp ctx e1;
			ctx.generating_left_side_of_operator <- false;
			ctx.writer#write (Printf.sprintf " %s " s_op);
			ctx.generating_right_side_of_operator <- true;
			generateValueOp ctx e2;
			ctx.generating_right_side_of_operator <- false;
		end;
	(* variable fields on interfaces are generated as (class["field"] as class) *)
	(* | TField ({etype = TInst({cl_interface = true} as c,_)} as e,FInstance (_,{ cf_name = s })) ->
	(* | TClosure ({etype = TInst({cl_interface = true} as c,_)} as e,s) *)
		(* when (try (match (PMap.find s c.cl_fields).cf_kind with Var _ -> true | _ -> false) with Not_found -> false) -> *)
		ctx.writer#write "(";
		generateValue ctx e;
		ctx.writer#write (Printf.sprintf "[\"%s\"]" s);
		ctx.writer#write (Printf.sprintf " as %s)" (typeToString ctx e.etype e.epos)); *)
	| TField({eexpr = TArrayDecl _} as e1,s) ->
		ctx.writer#write "(";
		generateExpression ctx e1;
		ctx.writer#write ")";
		(* generateFieldAccess ctx e1.etype (field_name s); *)
		ctx.writer#write ("-fa8-"^(field_name s));
	| TField (e,fa) ->
		ctx.generating_fields <- ctx.generating_fields + 1;
		(match fa with
		| FInstance (tc,tcf) -> (* ctx.writer#write ("-FInstance-"); *)(* ^(remapKeyword (field_name fa))); *)
			(* if ctx.generating_calls = 0 then ctx.generating_property_access <- true; *)
			generateValue ctx e;
			let f_prefix = (match tcf.cf_type with
				| TFun _ -> if ctx.generating_left_side_of_operator && not ctx.in_condition then "hx_dyn_" else "";
				| _ -> "";
			) in
			let fan = if (ctx.generating_self_access && ctx.generating_calls>0 && ctx.generating_fields>=2) then "." 
			else if (not ctx.generating_self_access && ctx.generating_calls>0) then " "
			else if (ctx.generating_self_access && ctx.generating_calls>0) then " " else "." in
			ctx.writer#write (fan^(if ctx.generating_custom_selector then "" else f_prefix^(remapKeyword (field_name fa))));
			ctx.generating_property_access <- false;
			
		| FStatic (cls, cls_f) -> (* ctx.writer#write "-FStatic-"; *)
			(match cls_f.cf_type with
			| TMono t -> 
				ctx.writer#write cls_f.cf_name;
				(* (match !t with
					| Some tt -> ctx.writer#write "-TMonoSome-";
						ctx.writer#write (typeToString ctx tt e.epos);
						(* (match tt with
							| TMono t -> ctx.writer#write "-TMono-";
							| TInst (tclass,tparams) -> ctx.writer#write "-TInst-";
							| _ -> ctx.writer#write "-rest-";
						) *)
					| None -> ctx.writer#write "-TMonoNone-";
				) *)
			| TEnum _ -> debug ctx "-TEnum-";
			| TInst _ 
			| TAbstract _ ->
				(match cls.cl_path with
				| ([],"Math")
				| ([],"String")
				| ([],"Date") ->
					redefineCStatic ctx e.etype (field_name fa);
					(* generateValue ctx e; *)
					(* generateFieldAccess ctx e.etype (field_name fa); *)
					(* ctx.writer#write ("-fa3-"^(remapKeyword (field_name fa))); *)
				| _ ->
					generateValue ctx e;
					ctx.writer#write ("."^(remapKeyword (field_name fa)))
				);
			| TType (td,tp) ->
				ctx.writer#write "-FStaticTType-";
				ctx.writer#write (snd td.t_path);
			| TFun _ -> (* Generating static call *)
				generateValue ctx e;
				(match cls.cl_path with
					| ([],"Math")
					| ([],"String")
					| ([],"Date") -> redefineCStatic ctx e.etype (field_name fa);
					| _ -> ctx.writer#write (" "^(remapKeyword (field_name fa)));
				);
			
			| TAnon _ -> ctx.writer#write "-TAnon-";
			| TDynamic _ -> ctx.writer#write "--TDynamic--";
			| TLazy _ -> ctx.writer#write "-TLazy-"
			);
			
		| FAnon tclass_field -> debug ctx "-FAnon-";
			(* Accesing the field of an anonimous object with the modern notation obj[@key] *)
			(* generateValue ctx e;
			ctx.writer#write ("[@\"" ^ (field_name fa) ^ "\"]") *)
			(* Accesing the field of an anonimous object by calling it as a function *)
			(* TODO: distinguish this two kind of accesses *)
			generateValue ctx e;
			ctx.writer#write (" " ^ (field_name fa))
		| FDynamic name -> debug ctx "-FDynamic-";
			(* This is called by untyped *)
			if ctx.generating_selector then begin
				(* TODO: generate functions with arguments as selector. currently does not support arguments *)
				ctx.writer#write (remapKeyword name);
			end else begin
				if ctx.generating_calls = 0 then ctx.writer#write "[";
				generateValue ctx e;
				(* generateFieldAccess ctx e.etype name; *)
				ctx.writer#write (" "^(remapKeyword name));
				if ctx.generating_calls = 0 then ctx.writer#write "]";
			end
		| FClosure (_,fa2) -> (* ctx.writer#write "-FClosure-"; *)
			
			(* Generated when we redefine a property. We ned to generate a block with a call to the objc method *)
			if Meta.has Meta.Selector fa2.cf_meta then 
				ctx.writer#write (getFirstMetaValue Meta.Selector fa2.cf_meta)
			else if ctx.generating_selector then begin
				ctx.writer#write fa2.cf_name;
				(match fa2.cf_type with
					| TFun (args, ret) ->
						let first_arg = ref true in
						List.iter (
						fun (name, b, t) ->
							ctx.writer#write (if !first_arg then ":" else (name^":"));
							first_arg := false;
						) args;
					| TMono r -> (match !r with 
						| None -> ctx.writer#write "-TMonoNone"
						| Some v -> ())
					| TEnum (e,tl) -> ctx.writer#write "-TEnum"
					| TInst (c,tl) -> ctx.writer#write "-TInst"
					| TType (t,tl) -> ctx.writer#write "-TType"
					| TAbstract (a,tl) -> ctx.writer#write "-TAbstract"
					| TAnon a -> ctx.writer#write "-TAnon-"
					| TDynamic t2 -> ctx.writer#write "-TDynamic-"
					| TLazy f -> ctx.writer#write "-TLazy call-"
				);
			end else begin
				(match fa2.cf_expr, fa2.cf_kind with
					| Some { eexpr = TFunction fd }, Method (MethNormal | MethInline) ->
				
						(* let generateFunctionHeader ctx name f params p is_static = *)	
						(* let name = (Some (fa2.cf_name, fa2.cf_meta)) in *)
				
						ctx.writer#write "^";
						let gen_block_args = fun() -> (
							ctx.writer#write "(";
							concat ctx ", " (fun (v,c) ->
								let pos = ctx.class_def.cl_pos in
								let type_name = typeToString ctx v.v_type pos in
								ctx.writer#write (Printf.sprintf "%s %s%s" type_name (addPointerIfNeeded type_name) (remapKeyword v.v_name));
							) fd.tf_args;
							ctx.writer#write ")";
						) in
						gen_block_args();
						ctx.writer#write "{ [self ";
						ctx.writer#write fa2.cf_name;
						let first_arg = ref true in
						concat ctx " " (fun (v,c) ->
							(* let pos = ctx.class_def.cl_pos in *)
							(* let type_name = typeToString ctx v.v_type pos in *)
							let message_name = if !first_arg then "" else (remapKeyword v.v_name) in
							ctx.writer#write (Printf.sprintf "%s:%s" message_name (remapKeyword v.v_name));
							first_arg := false;
						) fd.tf_args;
						ctx.writer#write "]; }";
					| _ -> ()
				);
			end
			
		| FEnum (tenum,tenum_field) -> (* ctx.writer#write "-FEnum-"; *)
			generateValue ctx e;
			ctx.writer#write (field_name fa)
		);
		ctx.generating_fields <- ctx.generating_fields - 1;
		
	| TTypeExpr t ->
		(* ctx.writer#write (Printf.sprintf "%d" ctx.generating_calls); *)
		let p = t_path t in
		(* if ctx.generating_calls = 0 then begin *)
			(match t with
			| TClassDecl c -> (* ctx.writer#write "TClassDecl";  *)
				(* if ctx.generating_c_call then ctx.writer#write "-is-c-call-"
				else if not ctx.generating_c_call then ctx.writer#write "-not-c-call-"; *)
				if not ctx.generating_c_call then ctx.writer#write (remapHaxeTypeToObjc ctx true p e.epos);
				ctx.imports_manager#add_class c;
			| TEnumDecl e -> ();(* ctx.writer#write "TEnumDecl"; (* of tenum *) *)
			(* TODO: consider the fakeEnum *)
			| TTypeDecl d -> ctx.writer#write " TTypeDecl "; (* of tdef *)
			| TAbstractDecl a -> ctx.writer#write " TAbstractDecl "); (* of tabstract *)
		(* end; *)
		ctx.generating_c_call <- false;
		(* ctx.imports_manager#add_class_path p; *)
	| TParenthesis e ->
		ctx.writer#write " (";
		generateValue ctx e;
		ctx.writer#write ")";
	| TReturn eo ->
		(* TODO: what is supported and what not *)
		(* if ctx.in_value <> None then unsupported e.epos; *)
		(* let add_return ec = (match ec.eexpr with
			   | TBlock (el) -> (match List.rev el with e :: el -> {ec with eexpr = TBlock(List.rev ((mk (TReturn e) t_dynamic e.epos) :: el)) } | [] -> ec)
			   | TReturn _ -> ctx.writer#write "RETURN UHMM";
			   | _ -> mk (TReturn ec) t_dynamic e.epos
		) in
		let gen_return e = (match e.eexpr with
			| TSwitch (e1, el, edef) ->
			    let el = List.map (fun (ep, ec) -> ep,add_return ec) in
			    generateExpression { e with eexpr = TSwitch(e1,el,match edef with None -> None | Some e -> add_return e)}
			| _ -> ctx.writer#write "no switch";
		) in
		gen_return eo; *)
		
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
			generateValue ctx e;
			if ctx.return_needs_semicolon then ctx.writer#write ";";
		);
	| TBreak ->
		(* if ctx.in_value <> None then unsupported e.epos; *)
		if ctx.handle_break then ctx.writer#write "@throw \"__break__\"" else ctx.writer#write "break"
	| TContinue ->
		(* if ctx.in_value <> None then unsupported e.epos; *)
		ctx.writer#write "continue"
	| TBlock expr_list ->
		(* If we generate a dynamic method do not open the block because it was opened already *)
		if not ctx.generating_objc_block then begin
			ctx.writer#begin_block;
			ctx.writer#new_line;
		end;
		if ctx.generating_constructor then begin
			ctx.writer#write "self = [super init];";
			ctx.writer#new_line;
			(* ctx.writer#write "me = self;";
			ctx.writer#new_line *)
		end;
		if Hashtbl.length ctx.function_arguments > 0 then begin
			ctx.writer#write "// Optional arguments";
			ctx.writer#new_line;
			Hashtbl.iter ( fun name data ->
				ctx.writer#write ("if (!"^name^") "^name^" = ");
				generateConstant ctx e.epos data;
				ctx.writer#write ";";
				ctx.writer#new_line;
			) ctx.function_arguments;
			Hashtbl.clear ctx.function_arguments;
			ctx.writer#new_line;
		end;
		List.iter (fun e ->
			(* Ignore the call to super from the main method: super(); *)
			(match e.eexpr with
			| TCall (func, arg_list) ->
				(match func.eexpr with
					| TConst c -> ()
					| _ ->
						generateExpression ctx e;
						ctx.writer#terminate_line
				);
			| _ -> 
				generateExpression ctx e;
				ctx.writer#terminate_line;
			);
			(* After each new line reset the state of  *)
			ctx.generating_calls <- 0;
			ctx.generating_fields <- 0;
			(* ctx.generating_self_access <- false; *)
		) expr_list;
		if ctx.generating_constructor then begin
			ctx.writer#write "return self;";
			ctx.writer#new_line;
			ctx.generating_constructor <- false
		end;
		ctx.writer#end_block;
	| TFunction f ->
		if ctx.generating_var then
			ctx.generating_objc_block_asign <- true;
			
		let semicolon = ctx.generating_objc_block_asign in
		if ctx.generating_object_declaration then begin
			ctx.generating_objc_block <- true;
			let h = generateFunctionHeader ctx None [] f [] e.epos ctx.in_static HeaderBlockInline in
			ctx.generating_objc_block <- false;
			generateExpression ctx f.tf_expr;
			h();
		end else begin
			ctx.generating_objc_block <- true;
			let h = generateFunctionHeader ctx None [] f [] e.epos ctx.in_static HeaderBlockInline in
			let old = ctx.in_static in
			ctx.in_static <- true;
			ctx.generating_objc_block <- false;
			generateExpression ctx f.tf_expr;
			ctx.in_static <- old;
			h();
		end;
		(* if ctx.generating_var && ctx.generating_objc_block_asign then ctx.writer#write ";"; *)
		if semicolon then begin
			(* TODO: Weird fact. We check if the function was a block declaration becuse we need to add ; at the end
				If we print one ; it appears twice. The second one is not generated from here
				Quick fix: print nothing *)
			ctx.writer#write "";
			ctx.generating_objc_block_asign <- false;
		end
	| TCall (func, arg_list) when
		(match func.eexpr with
		| TLocal { v_name = "__objc__" } -> true
		| _ -> false) ->
		( match arg_list with
		| [{ eexpr = TConst (TString code) }] -> ctx.writer#write code;
		| _ -> error "__objc__ accepts only one string as an argument" func.epos)
	| TCall (func, arg_list) ->
		(match func.eexpr with
		| TField (e,fa) ->
			(match fa with
			| FStatic (cls,cf) -> ctx.generating_c_call <- (Meta.has Meta.C cf.cf_meta) || (cls.cl_path = ([], "Math"));
			| _ -> ());
		| _ -> ());
		generateCall ctx func arg_list;
	| TObjectDecl (
		("fileName" , { eexpr = (TConst (TString file)) }) ::
		("lineNumber" , { eexpr = (TConst (TInt line)) }) ::
		("className" , { eexpr = (TConst (TString class_name)) }) ::
		("methodName", { eexpr = (TConst (TString meth)) }) :: [] ) ->
			(* ctx.writer#write ("[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@\""^file^"\",@\""^(Printf.sprintf "%ld" line)^"\",@\""^class_name^"\",@\""^meth^"\",nil] forKeys:[NSArray arrayWithObjects:@\"fileName\",@\"lineNumber\",@\"className\",@\"methodName\",nil]]"); *)
			(* ctx.writer#write ("[NSDictionary dictionaryWithObjectsAndKeys:@\""^file^"\",@\"fileName\", @\""^(Printf.sprintf "%ld" line)^"\",@\"lineNumber\", @\""^class_name^"\",@\"className\", @\""^meth^"\",@\"methodName\", nil]"); *)
			ctx.writer#write ("@{@\"fileName\":@\""^file^"\", @\"lineNumber\":@\""^(Printf.sprintf "%ld" line)^"\", @\"className\":@\""^class_name^"\", @\"methodName\":@\""^meth^"\"}");
	| TObjectDecl fields ->
		ctx.generating_object_declaration <- true;
		ctx.require_pointer <- true;
		ctx.writer#write "[@{";
		ctx.writer#new_line;
		List.iter ( fun (key, expr) ->
			ctx.writer#write ("	@\""^key^"\":");
			ctx.writer#write ("[");
			generateValue ctx expr;(* Generate a block here *)
			ctx.writer#write (" copy],");
			ctx.writer#new_line;
		) fields;
		ctx.writer#write "} mutableCopy]";
		ctx.generating_object_declaration <- false;
		ctx.require_pointer <- false;
			
			(* return [NSMutableDictionary dictionaryWithObjectsAndKeys:
						[^BOOL() { return p < [a count]; } copy], @"hasNext",
						[^id() { id i = [a objectAtIndex:p]; p += 1; return i; } copy], @"next",
						nil]; *)
						
	| TArrayDecl el ->
		ctx.require_pointer <- true;
		ctx.writer#write "[@[";
		concat ctx ", " (generateValue ctx) el;
		ctx.writer#write "] mutableCopy]";
		ctx.require_pointer <- false;
	| TThrow e ->
		ctx.writer#write "@throw ";
		generateValue ctx e;
		(* ctx.writer#write ";"; *)
	| TVars [] ->
		()
	| TVars vl ->
		(* Local vars declaration *)
		ctx.generating_var <- true;
		concat ctx "; " (fun (v,eo) ->
			let t = (typeToString ctx v.v_type e.epos) in
			if isPointer t then ctx.writer#new_line;
			ctx.writer#write (Printf.sprintf "%s %s%s" t (addPointerIfNeeded t) (remapKeyword v.v_name));
			(* Check if this Type is a Class and if it's imported *)
			(match v.v_type with
			| TMono r -> (match !r with None -> () | Some t -> 
				match t with
				| TInst (c,_) ->
					(* ctx.imports_manager#add_class_path c.cl_path; *)
					ctx.imports_manager#add_class c
				| _ -> ())
			| _ -> ());
			match eo with
			| None -> ()
			| Some e ->
				ctx.writer#write " = ";
				(* Cast values in order for Xcode to ignore the warnings *)
				(* (match e.eexpr with
					| TArrayDecl _ -> ()
					| _ -> (match t with
						| "NSMutableArray" -> ctx.writer#write "(NSMutableArray*)";
						| "NSMutableString" -> ctx.writer#write "(NSMutableString*)";
						| _ -> ()
					)
				); *)
				generateValue ctx e
		) vl;
		(* if List.length vl == 1 then ctx.writer#write ";"; *)
		ctx.generating_var <- false;
	| TNew (c,params,el) ->
		(* | TNew of tclass * tparams * texpr list *)
		(* ctx.writer#write ("GEN_NEW>"^(snd c.cl_path)^(string_of_int (List.length params))); *)
		(*remapHaxeTypeToObjc ctx true c.cl_path e.epos) *)
		(* SPECIAL INSTANCES. Treat them differently *)
		(match c.cl_path with
			| (["objc";"graphics"],"CGRect")
			| (["objc";"graphics"],"CGPoint")
			| (["objc";"graphics"],"CGSize") ->
				ctx.writer#write ((snd c.cl_path)^"Make(");
				concat ctx "," (generateValue ctx) el;
				ctx.writer#write ")"
			| (["objc";"foundation"],"NSRange") ->
				ctx.writer#write ("NSMakeRange(");
				concat ctx "," (generateValue ctx) el;
				ctx.writer#write ")"
			| ([],"SEL") ->
				ctx.writer#write "@selector(";
				ctx.generating_selector <- true;
				List.iter ( fun e ->
					(* generateCall ctx func arg_list; *)
					(* (match e.etype with
						| TFun _ -> ctx.writer#write "TFun";
						| TMono _ -> ctx.writer#write "TMono";
						| TEnum _ -> ctx.writer#write "TEnum";
						| TInst _ -> ctx.writer#write "TInst";
						| TType _ -> ctx.writer#write "TType";
						| TAnon _ -> ctx.writer#write "TAnon";
						| TDynamic _ -> ctx.writer#write "TDynamic";
						| TLazy _ -> ctx.writer#write "TLazy";
						| TAbstract _ -> ctx.writer#write "TAbstract";
					); *)
					(* This will be generated in *)
					generateValue ctx e;
				) el;
				ctx.writer#write ")";
				ctx.generating_selector <- false;
			| _ ->
				(* ctx.imports_manager#add_class_path c.cl_module.m_path; *)
				ctx.imports_manager#add_class c;
				let inited = ref true in
				if ctx.generating_calls > 0 then begin
					inited := false;
					ctx.writer#write (Printf.sprintf "[%s alloc] " (remapHaxeTypeToObjc ctx false c.cl_path c.cl_pos))
				end else
					ctx.writer#write (Printf.sprintf "[[%s alloc] init" (remapHaxeTypeToObjc ctx false c.cl_path c.cl_pos));
				(* (match c.cl_path with
					| (["ios";"ui"],"UIImageView") -> ctx.writer#write (Printf.sprintf "[%s alloc]" (remapHaxeTypeToObjc ctx false c.cl_path c.cl_pos)); inited := false;
					| _ -> ctx.writer#write (Printf.sprintf "[[%s alloc] init" (remapHaxeTypeToObjc ctx false c.cl_path c.cl_pos));
				); *)
				if List.length el > 0 then begin
					ctx.generating_calls <- ctx.generating_calls + 1;
					(match c.cl_constructor with
					| None -> ();
					| Some cf ->
						let args_array_e = Array.of_list el in
						let index = ref 0 in
						(match cf.cf_type with
						| TFun(args, ret) ->
							(* Seems that the compiler is not adding nulls in the args and has different length than args_array_e, so we fill nil by default *)
							List.iter (
							fun (name, b, t) ->
								ctx.writer#write (if !index = 0 then ":" else (" "^name^":"));
								if !index >= Array.length args_array_e then
									ctx.writer#write "nil"
								else
									generateValue ctx args_array_e.(!index);
								index := !index + 1;
							) args;
						| _ -> ctx.writer#write " \"-dynamic_arguments_constructor-\" "));
						
					ctx.generating_calls <- ctx.generating_calls - 1;
				end;
				if !inited then ctx.writer#write "]";
		)
	| TIf (cond,e,eelse) ->
		ctx.in_condition <- true;
		ctx.writer#write "if";
		generateValue ctx (parent cond);
		ctx.writer#write " ";
		generateExpression ctx e;
		ctx.in_condition <- false;
		(match eelse with
			| None -> ()
			| Some e2 ->
				(match e.eexpr with
					| TBlock _ | TSwitch _ -> ()
					| _ -> ();ctx.writer#write ";"
				);
				ctx.writer#new_line;
				ctx.writer#write "else ";
				generateExpression ctx e2
		);
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
		(* Generated for Iterable *)
		ctx.writer#begin_block;
		let handleBreak = handleBreak ctx e in
		let tmp = genLocal ctx "_it" in
		ctx.writer#write (Printf.sprintf "id %s = " tmp);
		generateValue ctx it;
		ctx.writer#write ";";
		ctx.writer#new_line;
		ctx.writer#write (Printf.sprintf "while ( [%s hasNext] ) do " tmp);
		ctx.writer#begin_block;
		ctx.writer#write (Printf.sprintf "%s %s = [%s next];" (typeToString ctx v.v_type e.epos) (remapKeyword v.v_name) tmp);
		ctx.writer#new_line;
		generateExpression ctx e;
		ctx.writer#write ";";
		ctx.writer#new_line;
		ctx.writer#end_block;
		ctx.writer#new_line;
		ctx.writer#end_block;
		handleBreak();
	| TTry (e,catchs) ->
		(* TODO: objc has only one catch? *)
		ctx.writer#write "@try ";
		generateExpression ctx e;
		List.iter (fun (v,e) ->
			ctx.writer#new_line;
			ctx.writer#write (Printf.sprintf "@catch (NSException *%s) " (remapKeyword v.v_name));
			generateExpression ctx e;
		) catchs;
		(* (typeToString ctx v.v_type e.epos) *)
	| TMatch (e,_,cases,def) ->
		(* ctx.writer#begin_block; *)
		ctx.writer#new_line;
		let tmp = genLocal ctx "e" in
		ctx.writer#write (Printf.sprintf "enum s = %s" tmp);
		generateValue ctx e;
		ctx.writer#new_line;
		ctx.writer#write (Printf.sprintf "switch ( %s.index ) " tmp);
		ctx.writer#begin_block;
		List.iter (fun (cl,params,e) ->
			List.iter (fun c ->
				ctx.writer#new_line;
				ctx.writer#write (Printf.sprintf "case %d:" c);
				ctx.writer#new_line;
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
						ctx.writer#write (Printf.sprintf "MATCH %s : %s = %s.params[%d]" (remapKeyword v.v_name) (typeToString ctx v.v_type e.epos) tmp n);
					) l);
			generateCaseBlock ctx e;
			ctx.writer#write "break";
		) cases;
		(match def with
		| None -> ()
		| Some e ->
			ctx.writer#new_line;
			ctx.writer#write "default:";
			generateCaseBlock ctx e;
			ctx.writer#write "break";
		);
		ctx.writer#new_line;
		ctx.writer#end_block;
		(* ctx.writer#end_block; *)
	| TSwitch (e,cases,def) ->
		ctx.return_needs_semicolon <- true;
		ctx.writer#write "switch"; generateValue ctx (parent e); ctx.writer#begin_block;
		List.iter (fun (el,e2) ->
			List.iter (fun e ->
				ctx.writer#write "case "; generateValue ctx e; ctx.writer#write ":";
			) el;
			generateCaseBlock ctx e2;
			ctx.writer#new_line;
			ctx.writer#write "break;";
			ctx.writer#new_line;
		) cases;
		(match def with
		| None -> ()
		| Some e ->
			ctx.writer#write "default:";
			generateCaseBlock ctx e;
			ctx.writer#write "break;";
			ctx.writer#new_line;
		);
		(* ctx.writer#write "}" *)
		ctx.return_needs_semicolon <- false;
		ctx.writer#end_block
	| TCast (e1,None) ->
		ctx.writer#write "(";
		let t = (typeToString ctx e.etype e.epos) in
		ctx.writer#write t;
		ctx.writer#write (Printf.sprintf "%s*)" (remapHaxeTypeToObjc ctx false ([],t) e.epos));
		generateExpression ctx e1;
	| TCast (e1,Some t) -> 
		ctx.writer#write "-CASTSomeType-"
	| TMeta (_,e) -> 
		ctx.writer#write "-TMeta-";
		generateValue ctx e
		(* generateExpression ctx (Codegen.default_cast ctx.common_ctx e1 t e.etype e.epos) *)

and generateCaseBlock ctx e =
	(* ctx.writer#begin_block; *)
	generateExpression ctx e;
	match e.eexpr with
	| TBlock _ -> ()
	| _ -> ctx.writer#write ";"; 
	(* ctx.writer#end_block *)
	
and generateValue ctx e =
	(* debug ctx ("\"-V-"^(Type.s_expr_kind e)^">\""); *)
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
		let r = alloc_var (genLocal ctx "__r__") e.etype in
		ctx.in_value <- Some r;
		if ctx.in_static then
			ctx.writer#write (Printf.sprintf "^(%s%s)" t (addPointerIfNeeded t))
		else
			ctx.writer#write (Printf.sprintf "((%s)self.%s " t r.v_name);
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
	| TTypeExpr _
	| TConst _
	| TLocal _
	| TArray _
	| TBinop _
	| TField _
	| TParenthesis _
	| TObjectDecl _
	| TArrayDecl _
	| TCall _
	| TNew _
	| TUnop _
	| TMeta _
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
	| TFor _
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

let generateProperty ctx field pos is_static =
	let id = field.cf_name in
	let t = typeToString ctx field.cf_type pos in
	(* let class_name = (snd ctx.class_def.cl_path) in *)
	if ctx.generating_header then begin
		if is_static then begin
			ctx.writer#write ("+ ("^t^(addPointerIfNeeded t)^") "^id^";\n");
			ctx.writer#write ("+ (void) set"^(String.capitalize id)^":("^t^(addPointerIfNeeded t)^")val;")
		end
	else begin
		let getter = match field.cf_kind with
		| Var v -> (match v.v_read with
			| AccCall -> Printf.sprintf ", getter=get_%s" field.cf_name;
			| _ -> "")
		| _ -> "" in
		let setter = match field.cf_kind with
		| Var v -> (match v.v_write with
			| AccCall -> Printf.sprintf ", setter=set_%s" field.cf_name;
			| _ -> "")
		| _ -> "" in
		let is_enum = (match field.cf_type with
			| TEnum (e,_) -> true
			| _ -> false) in
		let strong = if Meta.has Meta.Weak field.cf_meta then ", weak" else if is_enum then "" else if (isPointer t) then ", strong" else "" in
		let readonly = if false then ", readonly" else "" in
		ctx.writer#write (Printf.sprintf "@property (nonatomic%s%s%s%s) %s %s%s;" strong readonly getter setter t (addPointerIfNeeded t) (remapKeyword id))
	end
	end
	else begin
		if is_static then begin
			let gen_init_value () = match field.cf_expr with
			| None -> ()
			| Some e -> generateValue ctx e in
			ctx.writer#write ("static "^t^(addPointerIfNeeded t)^" "^id^";
+ ("^t^(addPointerIfNeeded t)^") "^id^" {
	if ("^id^" == nil) "^id^" = ");
			gen_init_value();
			ctx.writer#write (";
	return "^id^";
}
+ (void) set"^(String.capitalize id)^":("^t^(addPointerIfNeeded t)^")hx_val {
	"^id^" = hx_val;
}")
		end
		else begin
			if ctx.is_category then begin
				(* A category can't use the @synthesize, so we create a getter and setter for the property *)
				(* http://ddeville.me/2011/03/add-variables-to-an-existing-class-in-objective-c/ *)
				(* let retain = String.length t == String.length (addPointerIfNeeded t) in *)
				(* Also, keeping a variable in the category affects all the instances *)
				(* So we use a metadata to place content in the methods *)
	
				if (Meta.has Meta.GetterBody field.cf_meta) then begin
					
					ctx.writer#write ("// Getters/setters for property: "^id^"\n");
					ctx.writer#write ("- ("^t^(addPointerIfNeeded t)^") "^id^" { "^(getFirstMetaValue Meta.GetterBody field.cf_meta)^" }\n");
					ctx.writer#write ("- (void) set"^(String.capitalize id)^":("^t^(addPointerIfNeeded t)^")val { nil; }\n");
				end else
					ctx.writer#write ("// Please provide a getterBody for the property: "^id^"\n");
			end else begin
				ctx.writer#write (Printf.sprintf "@synthesize %s;" (remapKeyword id))
			end
		end;
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
				| _ -> print_endline "objc_error: The main method should have a return: new UIApplicationMain()");
			) expr_list
		| _ -> print_endline "objc_error: The main method should have a return: new UIApplicationMain()"
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
	srand(time(NULL));
	@autoreleasepool {
		return " ^ !platform_class ^ "(argc, argv, nil, NSStringFromClass([" ^ !app_delegate_class ^ " class]));
	}
}
");
		m_file#close;
		| _ -> print_endline "objc_error: Supported returns in the main method are UIApplicationMain or NSApplicationMain"
	)
;;
let generateHXObject common_ctx =
	let h_file = newSourceFile (srcDir common_ctx) ([],"HXObject") ".h" in
	h_file#write ("//
//  HXObject
//
//  Source generated by Haxe Objective-C target
//

@interface HXObject : NSObject

+ (BOOL) __HasField;
+ (id) __GetType;
+ (NSArray*) __GetFields;
+ (id) __Field;
+ (Class) __GetClass;
+ (NSString*) __ToString;
+ (NSArray*) GetInstanceFields;

@end");
	h_file#close;
	let m_file = newSourceFile (srcDir common_ctx) ([],"HXObject") ".m" in
	m_file#write ("//
//  HXObject
//
//  Source generated by Haxe Objective-C target
//

#import \"HXObject.h\"

@interface HXObject : NSObject

+ (BOOL) __HasField { return true; }
+ (id) __GetType { return nil; }
+ (NSArray*) __GetFields { return nil; }
+ (id) __Field { return nil; }
+ (Class) __GetClass { return nil; }
+ (NSString*) __ToString { return nil; }
+ (NSArray*) GetInstanceFields { return nil; }

@end");
	m_file#close
;;

let generateField ctx is_static field =
	debug ctx ("\n-F-");
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
	| Some { eexpr = TFunction func }, Method (MethNormal | MethInline) ->
		if field.cf_name = "main" && is_static then begin
			if not ctx.generating_header then generateMain ctx func;
		end
		else begin
			(* Generate function header *)
			let h = generateFunctionHeader ctx (Some (field.cf_name, field.cf_meta)) field.cf_meta func field.cf_params pos is_static HeaderObjc in
			h();
			(* Generate function content if is not a header file *)
			if not ctx.generating_header then
				generateExpression ctx func.tf_expr
			else
				ctx.writer#write ";";
		end
	| Some { eexpr = TFunction func }, Method (MethDynamic) ->
		ctx.writer#write "// Dynamic method defined with an objc method and a block property\n";
		(* Generate function header *)
		let h = generateFunctionHeader ctx (Some (field.cf_name, field.cf_meta)) field.cf_meta func field.cf_params pos is_static HeaderObjc in
		h();
		ctx.generating_objc_block <- true;
		
		let func_name = (match (Some (field.cf_name, field.cf_meta)) with None -> "" | Some (n,meta) ->
			let rec loop = function
				| [] -> (* processFunctionName *) n
				| _ :: l -> loop l
			in
			"" ^ loop field.cf_meta
		) in
		if not ctx.generating_header then begin
			ctx.writer#begin_block;
			if not ctx.in_static then begin
				ctx.writer#write ("if ( hx_dyn_" ^ func_name ^ " ) { hx_dyn_" ^ func_name ^ "(");
				concat ctx ", " (fun (v,c) ->
					ctx.writer#write (remapKeyword v.v_name);
				) func.tf_args;
				ctx.writer#write ("); return; }");
				ctx.writer#new_line;
			end;
			generateExpression ctx func.tf_expr
		end else
			ctx.writer#write ";\n";
			
		if ctx.generating_header then begin
			ctx.writer#write (Printf.sprintf "@property (nonatomic,copy) ");
			let h = generateFunctionHeader ctx (Some (field.cf_name, field.cf_meta)) field.cf_meta func field.cf_params pos is_static HeaderDynamic in h();
			ctx.writer#write ";";
		end else begin
			ctx.writer#write (Printf.sprintf "\n@synthesize hx_dyn_%s;\n" func_name);
		end;
		ctx.generating_objc_block <- false;
	| _ ->
		let is_getset = (match field.cf_kind with Var { v_read = AccCall _ } | Var { v_write = AccCall _ } -> true | _ -> false) in
		match follow field.cf_type with
			| TFun (args,r) -> ()
			| _ when is_getset -> if ctx.generating_header then generateProperty ctx field pos is_static
			| _ -> generateProperty ctx field pos is_static
;;

let rec defineGetSet ctx is_static c =
	(* let def f name =
		Hashtbl.add ctx.get_sets (name,is_static) f.cf_name
	in *)
	(* let field f =
		match f.cf_kind with
		| Method _ -> ()
		| Var v ->
			(match v.v_read with AccCall m -> def f m | _ -> ());
			(match v.v_write with AccCall m -> def f m | _ -> ())
	in *)
	(* List.iter field (if is_static then c.cl_ordered_statics else c.cl_ordered_fields); *)
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
	let owner = "You" in
	let file = newSourceFile (src_dir^".xcodeproj") ([],"project") ".pbxproj" in
	file#write ("{
	archiveVersion = 1;
	classes = {
	};
	objectVersion = 46;
	objects = {");
	
	(* Begin PBXBuildFile section *)
	(* It holds .m files, resource files, and frameworks *)
	file#write ("\n\n/* Begin PBXBuildFile section */\n");
	
	List.iter ( fun (uuid, fileRef, name) -> 
		file#write ("		"^uuid^" /* "^name^".framework in Frameworks */ = {isa = PBXBuildFile; fileRef = "^fileRef^"; };\n");
	) files_manager#get_frameworks;
	(* Iterate over source files and add the root of each package to the Resources list *)
	let packages = ref [] in (* list of package paths *)
	let can_add_new_package = ref false in
	List.iter ( fun (uuid, fileRef, path, ext) -> 
		if List.length (fst path) > 0 then begin
			can_add_new_package := true;
			List.iter ( fun (existing_path) -> 
				if List.hd (fst existing_path) = List.hd (fst path) then can_add_new_package := false;
				(* print_endline ((joinClassPath existing_path "/")^" = "^(joinClassPath path "/")); *)
			) !packages;
			if (!can_add_new_package) then packages := List.append !packages [path];
		end;
		if ext=".m" then file#write ("		"^uuid^" /* "^(snd path)^ext^" in Sources */ = {isa = PBXBuildFile; fileRef = "^fileRef^"; };\n");
	) files_manager#get_source_files;
	
	(* Register haxe packages as source_folders *)
	List.iter ( fun (path) ->
		files_manager#register_source_folder (fst path, "")
	) !packages;
	
	(* Search the SupportingFiles folder *)
	let supporting_files = ref "" in
	(match common_ctx.objc_supporting_files with
	| None ->
		print_endline "No SupportingFiles linked by user, search in hxcocoa lib. Custom -Info.plist is ignored.";
		List.iter (fun dir ->
			if Sys.file_exists dir then begin
				let contents = Array.to_list (Sys.readdir dir) in
				List.iter (fun f ->
					if (f = "SupportingFiles" && !supporting_files = "") then
						supporting_files := (dir^f^"/");
				) contents;
			end
		) common_ctx.class_path;
	| Some p ->
		supporting_files := p;
	);
	print_endline ("SupportingFiles found at path: "^(!supporting_files));
	if (!supporting_files != "") then begin
		let contents = Array.to_list (Sys.readdir !supporting_files) in
		List.iter (fun f ->
			if String.sub f 0 1 <> "." && f <> (app_name ^ "-Info.plist") then begin
				let lst = Str.split (Str.regexp "/") f in
				let file = List.hd (List.rev lst) in
				let path = List.rev (List.tl (List.rev lst)) in
				let comps = Str.split (Str.regexp "\\.") file in
				let ext = List.hd (List.rev comps) in
				(* print_endline (f^" >> "^ext); *)
				files_manager#register_resource_file (path,file) ext;
			end
		) contents
	end;
	
	List.iter ( fun (uuid, fileRef, path, ext) -> 
		(* print_endline ("add resource "^(snd path)^" >> "^ext); *)
		let n = if List.length (fst path) > 0 then List.hd (fst path) else (snd path) in
		file#write ("		"^uuid^" /* "^n^ext^" in Resources */ = {isa = PBXBuildFile; fileRef = "^fileRef^"; };\n");
	) files_manager#get_resource_files;
	(* Add some hardcoded files *)
	let build_file_main = files_manager#generate_uuid_for_file ([],"build_file_main") in
	let build_file_main_fileref = files_manager#generate_uuid_for_file ([],"build_file_main_fileref") in
	let build_file_infoplist_strings = files_manager#generate_uuid_for_file ([],"build_file_infoplist_strings") in
	let build_file_infoplist_strings_tests = files_manager#generate_uuid_for_file ([],"build_file_infoplist_strings_tests") in
	let build_file_infoplist_strings_fileref = files_manager#generate_uuid_for_file ([],"build_file_infoplist_strings_fileref") in
	let build_file_infoplist_strings_tests_fileref = files_manager#generate_uuid_for_file ([],"build_file_infoplist_strings_tests_fileref") in
	
	file#write ("		"^build_file_infoplist_strings^" /* InfoPlist.strings in Resources */ = {isa = PBXBuildFile; fileRef = "^build_file_infoplist_strings_fileref^" /* InfoPlist.strings */; };\n");
	file#write ("		"^build_file_infoplist_strings_tests^" /* InfoPlist.strings in Resources */ = {isa = PBXBuildFile; fileRef = "^build_file_infoplist_strings_tests_fileref^" /* InfoPlist.strings */; };\n");
	file#write ("		"^build_file_main^" /* main.m in Sources */ = {isa = PBXBuildFile; fileRef = "^build_file_main_fileref^" /* main.m */; };\n");
	file#write ("/* End PBXBuildFile section */\n");
	
	(* Begin PBXContainerItemProxy section *)
	let container_item_proxy = files_manager#generate_uuid_for_file ([],"container_item_proxy") in
	let remote_global_id_string = files_manager#generate_uuid_for_file ([],"remote_global_id_string") in
	let root_object = files_manager#generate_uuid_for_file ([],"root_object") in
	
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
	(* {isa = PBXFileReference; fileEncoding = 4; lastKnownFileType = sourcecode.c.objc; name = Log.m; path = Playground/haxe/Log.m; sourceTree = SOURCE_ROOT; }; *)
	file#write ("\n\n/* Begin PBXFileReference section */\n");
	let fileref_en = files_manager#generate_uuid_for_file ([],"fileref_en") in
	let fileref_en_tests = files_manager#generate_uuid_for_file ([],"fileref_en_tests") in
	let fileref_plist = files_manager#generate_uuid_for_file ([],"fileref_plist") in
	let fileref_pch = files_manager#generate_uuid_for_file ([],"fileref_pch") in
	let fileref_app = files_manager#generate_uuid_for_file ([],"fileref_app") in
	let fileref_octest = files_manager#generate_uuid_for_file ([],"fileref_octest") in
	
	List.iter ( fun (uuid, fileRef, name) ->
		(* If the framework name matches any lib, add the path to the lib instead to the system frameworks *)
		let used = ref false in
		List.iter ( fun path ->
			if (isSubstringOf path name) then begin
				let prefix = ref "" in
				let comps = Str.split (Str.regexp "/") common_ctx.file in
				List.iter (fun p -> prefix := (!prefix) ^ "../") comps;
				file#write ("		"^fileRef^" /* "^name^".framework */ = {isa = PBXFileReference; lastKnownFileType = wrapper.framework; name = "^name^".framework; path = "^(!prefix)^path^"; sourceTree = \"<group>\"; };\n");
				used := true;
			end
		) common_ctx.objc_libs;
		if not !used then begin
			let path = "System/Library/Frameworks/"^name^".framework" in
			file#write ("		"^fileRef^" /* "^name^".framework */ = {isa = PBXFileReference; lastKnownFileType = wrapper.framework; name = "^name^".framework; path = "^path^"; sourceTree = SDKROOT; };\n");
		end
	) files_manager#get_frameworks;
	
	List.iter ( fun (uuid, fileRef, path, ext) -> 
		let full_path = (joinClassPath path "/") in
		let file_type = (if ext = ".h" then "h" else "objc") in
		if (fst path = []) then
			file#write ("		"^fileRef^" /* "^full_path^ext^" */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.c."^file_type^"; path = "^full_path^ext^"; sourceTree = \"<group>\"; };\n")
		else
			file#write ("		"^fileRef^" /* "^full_path^ext^" */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.c."^file_type^"; name = "^(snd path)^ext^"; path = "^app_name^"/"^full_path^ext^"; sourceTree = SOURCE_ROOT; };\n");
	) files_manager#get_source_files;
	
	List.iter ( fun (uuid, fileRef, path) -> 
		let n = if List.length (fst path) > 0 then List.hd (fst path) else (snd path) in
		file#write ("		"^fileRef^" /* "^(joinClassPath path "/")^" */ = {isa = PBXFileReference; lastKnownFileType = folder; path = "^n^"; sourceTree = \"<group>\"; };\n"); 
	) files_manager#get_source_folders;
	
	List.iter ( fun (uuid, fileRef, path, ext) -> 
		(* print_endline ("add resource "^(snd path)^" >> "^ext); *)
		let prefix = ref "" in
		let comps = Str.split (Str.regexp "/") common_ctx.file in
		List.iter (fun p -> prefix := (!prefix) ^ "../") comps;
		let n = (joinClassPath path "/") in
		let final_path = (match common_ctx.objc_supporting_files with
			| None -> (!supporting_files)^n
			| Some _ -> (!prefix)^(!supporting_files)^n
		) in
		let final_source_tree = (match common_ctx.objc_supporting_files with
			| None -> "\"<absolute>\""
			| Some _ -> "SOURCE_ROOT"
		) in
		(* if List.length (fst path) > 0 then List.hd (fst path) else (snd path) in *)
		file#write ("		"^fileRef^" /* "^(snd path)^" in Resources */ = {isa = PBXFileReference; lastKnownFileType = image."^ext^"; name = \""^(snd path)^"\"; path = \""^final_path^"\"; sourceTree = "^final_source_tree^"; };\n");
	) files_manager#get_resource_files;
	
	(* Add some hardcoded files *)
	file#write ("		"^fileref_en^" /* en */ = {isa = PBXFileReference; lastKnownFileType = text.plist.strings; name = en; path = en.lproj/InfoPlist.strings; sourceTree = \"<group>\"; };\n");
	file#write ("		"^fileref_en_tests^" /* en */ = {isa = PBXFileReference; lastKnownFileType = text.plist.strings; name = en; path = en.lproj/InfoPlist.strings; sourceTree = \"<group>\"; };\n");
	file#write ("		"^fileref_plist^" /* "^app_name^"-Info.plist */ = {isa = PBXFileReference; lastKnownFileType = text.plist.xml; path = \""^app_name^"-Info.plist\"; sourceTree = \"<group>\"; };\n");
	file#write ("		"^fileref_pch^" /* "^app_name^"-Prefix.pch */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.c.h; path = \""^app_name^"-Prefix.pch\"; sourceTree = \"<group>\"; };\n");
	file#write ("		"^build_file_main_fileref^" /* main.m */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.c.objc; path = main.m; sourceTree = \"<group>\"; };\n");
	file#write ("		"^fileref_app^" /* "^app_name^".app */ = {isa = PBXFileReference; explicitFileType = wrapper.application; includeInIndex = 0; path = "^app_name^".app; sourceTree = BUILT_PRODUCTS_DIR; };\n");
	file#write ("		"^fileref_octest^" /* "^app_name^"Tests.octest */ = {isa = PBXFileReference; explicitFileType = wrapper.cfbundle; includeInIndex = 0; path = "^app_name^"Tests.octest; sourceTree = BUILT_PRODUCTS_DIR; };\n");
	file#write ("/* End PBXFileReference section */\n");
	
	(* Begin PBXFrameworksBuildPhase section *)
	let frameworks_build_phase_app = files_manager#generate_uuid_for_file ([],"frameworks_build_phase_app") in
	let frameworks_build_phase_tests = files_manager#generate_uuid_for_file ([],"frameworks_build_phase_tests") in
	file#write ("\n\n/* Begin PBXFrameworksBuildPhase section */
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
	let main_group = files_manager#generate_uuid_for_file ([],"main_group") in
	let product_ref_group = files_manager#generate_uuid_for_file ([],"product_ref_group") in
	let frameworks_group = files_manager#generate_uuid_for_file ([],"frameworks_group") in
	let children_app = files_manager#generate_uuid_for_file ([],"children_app") in
	let children_tests = files_manager#generate_uuid_for_file ([],"children_tests") in
	let children_supporting_files = files_manager#generate_uuid_for_file ([],"children_supporting_files") in
	let children_supporting_files_tests = files_manager#generate_uuid_for_file ([],"children_supporting_files_tests") in
	
	file#write ("\n\n/* Begin PBXGroup section */
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
				"^fileref_app^" /* "^app_name^".app */,
				"^fileref_octest^" /* "^app_name^"Tests.octest */,
			);
			name = Products;
			sourceTree = \"<group>\";
		};
		"^frameworks_group^" /* Frameworks */ = {
			isa = PBXGroup;
			children = (\n");
	
	List.iter ( fun (uuid, fileRef, name) ->
		file#write ("				"^fileRef^" /* "^name^".framework in Frameworks */,\n");
	) files_manager#get_frameworks;
	
	file#write ("			);
			name = Frameworks;
			sourceTree = \"<group>\";
		};
		"^children_app^" /* "^app_name^" */ = {
			isa = PBXGroup;
			children = (\n");
	
	List.iter ( fun (uuid, fileRef, path, ext) -> 
		let full_path = (joinClassPath path "/") in
			if (fst path = []) then
				file#write ("				"^fileRef^" /* "^full_path^ext^" */,\n")
	) files_manager#get_source_files;
	
	List.iter ( fun (uuid, fileRef, path) ->
		file#write ("				"^fileRef^" /* "^(joinClassPath path "/")^" */,\n"); 
	) files_manager#get_source_folders;
	
	file#write ("				"^children_supporting_files^" /* Supporting Files */,
			);
			path = "^app_name^";
			sourceTree = \"<group>\";
		};
		"^children_supporting_files^" /* Supporting Files */ = {
			isa = PBXGroup;
			children = (
				"^fileref_plist^" /* "^app_name^"-Info.plist */,
				"^build_file_infoplist_strings_fileref^" /* InfoPlist.strings */,
				"^build_file_main_fileref^" /* main.m */,
				"^fileref_pch^" /* "^app_name^"-Prefix.pch */,\n");
	
	List.iter ( fun (uuid, fileRef, path, ext) ->
		file#write ("				"^fileRef^" /* "^(joinClassPath path "/")^" in Resoures */,\n"); 
	) files_manager#get_resource_files;
	
	file#write ("
			);
			name = \"Supporting Files\";
			sourceTree = \"<group>\";
		};
		"^children_tests^" /* "^app_name^"Tests */ = {
			isa = PBXGroup;
			children = (
				/* 28BFDA091628A95900882B34 "^app_name^"Tests.h ,*/
				/* 28BFDA0A1628A95900882B34 "^app_name^"Tests.m ,*/
				"^children_supporting_files_tests^" /* Supporting Files */,
			);
			path = "^app_name^"Tests;
			sourceTree = \"<group>\";
		};
		"^children_supporting_files_tests^" /* Supporting Files */ = {
			isa = PBXGroup;
			children = (
				/* 28BFDA051628A95900882B34 "^app_name^"Tests-Info.plist ,*/
				"^build_file_infoplist_strings_tests_fileref^" /* InfoPlist.strings */,
			);
			name = \"Supporting Files\";
			sourceTree = \"<group>\";
		};
/* End PBXGroup section */");

	(* Begin PBXNativeTarget section *)
	let sources_build_phase_app = files_manager#generate_uuid_for_file ([],"sources_build_phase_app") in
	let sources_build_phase_tests = files_manager#generate_uuid_for_file ([],"sources_build_phase_tests") in
	let resources_build_phase_app = files_manager#generate_uuid_for_file ([],"resources_build_phase_app") in
	let resources_build_phase_tests = files_manager#generate_uuid_for_file ([],"resources_build_phase_tests") in
	let remote_global_id_string_tests = files_manager#generate_uuid_for_file ([],"remote_global_id_string_tests") in
	let shell_build_phase_tests = files_manager#generate_uuid_for_file ([],"shell_build_phase_tests") in
	let target_dependency = files_manager#generate_uuid_for_file ([],"target_dependency") in
	let build_config_list_app = files_manager#generate_uuid_for_file ([],"build_config_list_app") in
	let build_config_list_tests = files_manager#generate_uuid_for_file ([],"build_config_list_tests") in
	let build_config_list_proj = files_manager#generate_uuid_for_file ([],"build_config_list_proj") in
	
	file#write ("\n\n/* Begin PBXNativeTarget section */
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
			productReference = "^fileref_app^" /* "^app_name^".app */;
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
			productReference = "^fileref_octest^" /* "^app_name^"Tests.octest */;
			productType = \"com.apple.product-type.bundle\";
		};
/* End PBXNativeTarget section */");

	(* Begin PBXProject section *)
	file#write ("\n\n/* Begin PBXProject section */
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
	file#write ("\n\n/* Begin PBXResourcesBuildPhase section */
		"^resources_build_phase_app^" /* Resources */ = {
			isa = PBXResourcesBuildPhase;
			buildActionMask = 2147483647;
			files = (
				"^build_file_infoplist_strings^" /* InfoPlist.strings in Resources */,\n");
	
	List.iter ( fun (uuid, fileRef, path) ->
		file#write ("				"^uuid^" /* "^(joinClassPath path "/")^" in Resoures */,\n"); 
	) files_manager#get_source_folders;
	List.iter ( fun (uuid, fileRef, path, ext) ->
		file#write ("				"^uuid^" /* "^(joinClassPath path "/")^" in Resoures */,\n"); 
	) files_manager#get_resource_files;
	
	file#write ("			);
			runOnlyForDeploymentPostprocessing = 0;
		};
		"^resources_build_phase_tests^" /* Resources */ = {
			isa = PBXResourcesBuildPhase;
			buildActionMask = 2147483647;
			files = (
				"^build_file_infoplist_strings_tests^" /* InfoPlist.strings in Resources */,
			);
			runOnlyForDeploymentPostprocessing = 0;
		};
/* End PBXResourcesBuildPhase section */");
	
	(* Begin PBXShellScriptBuildPhase section *)
	file#write ("\n\n/* Begin PBXShellScriptBuildPhase section */
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
	file#write ("\n\n/* Begin PBXSourcesBuildPhase section */
		"^sources_build_phase_app^" /* Sources */ = {
			isa = PBXSourcesBuildPhase;
			buildActionMask = 2147483647;
			files = (\n"^build_file_main^" /* main.m in Sources */,\n");
	
	List.iter ( fun (uuid, fileRef, path, ext) -> 
		if ext=".m" then file#write ("				"^uuid^" /* "^(joinClassPath path "/")^ext^" in Sources */,\n");
	) files_manager#get_source_files;
	
	file#write ("			);
			runOnlyForDeploymentPostprocessing = 0;
		};
		"^sources_build_phase_tests^" /* Sources */ = {
			isa = PBXSourcesBuildPhase;
			buildActionMask = 2147483647;
			files = (
				/* 28BFDA0B1628A95900882B34  "^app_name^"Tests.m in Sources ,*/
			);
			runOnlyForDeploymentPostprocessing = 0;
		};
/* End PBXSourcesBuildPhase section */");

	(* Begin PBXTargetDependency section *)
	file#write ("\n\n/* Begin PBXTargetDependency section */
		"^target_dependency^" /* PBXTargetDependency */ = {
			isa = PBXTargetDependency;
			target = "^remote_global_id_string^" /* "^app_name^" */;
			targetProxy = "^container_item_proxy^" /* PBXContainerItemProxy */;
		};
/* End PBXTargetDependency section */");

	(* Begin PBXVariantGroup section *)
	file#write ("\n\n/* Begin PBXVariantGroup section */
		"^build_file_infoplist_strings_fileref^" /* InfoPlist.strings */ = {
			isa = PBXVariantGroup;
			children = (
				"^fileref_en^" /* en */,
			);
			name = InfoPlist.strings;
			sourceTree = \"<group>\";
		};
		"^build_file_infoplist_strings_tests_fileref^" /* InfoPlist.strings */ = {
			isa = PBXVariantGroup;
			children = (
				"^fileref_en_tests^" /* en */,
			);
			name = InfoPlist.strings;
			sourceTree = \"<group>\";
		};
/* End PBXVariantGroup section */");

	(* Begin XCBuildConfiguration section *)
	let build_config_list_proj_debug = files_manager#generate_uuid_for_file ([],"build_config_list_proj_debug") in
	let build_config_list_proj_release = files_manager#generate_uuid_for_file ([],"build_config_list_proj_release") in
	let build_config_list_app_debug = files_manager#generate_uuid_for_file ([],"build_config_list_app_debug") in
	let build_config_list_app_release = files_manager#generate_uuid_for_file ([],"build_config_list_app_release") in
	let build_config_list_tests_debug = files_manager#generate_uuid_for_file ([],"build_config_list_tests_debug") in
	let build_config_list_tests_release = files_manager#generate_uuid_for_file ([],"build_config_list_tests_release") in
	let objc_deployment_target = Printf.sprintf "%.1f" common_ctx.objc_version in
	let objc_targeted_device_family =
		if (common_ctx.objc_platform = "ios" || common_ctx.objc_platform = "universal") then "1,2" 
		else if common_ctx.objc_platform = "iphone" then "1"
		else if common_ctx.objc_platform = "ipad" then "2" 
		else "0" in
	let prefix = ref "" in
	let comps = Str.split (Str.regexp "/") common_ctx.file in
	List.iter (fun p -> prefix := (!prefix) ^ "../") comps;
	
	(* TODO: what to do if the target is wrong *)
	
	file#write ("\n\n/* Begin XCBuildConfiguration section */
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
				IPHONEOS_DEPLOYMENT_TARGET = " ^ objc_deployment_target ^ ";
				ONLY_ACTIVE_ARCH = YES;
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
				\"CODE_SIGN_IDENTITY[sdk=iphoneos*]\" = \"iPhone Distribution\";
				COPY_PHASE_STRIP = YES;
				GCC_C_LANGUAGE_STANDARD = gnu99;
				GCC_WARN_ABOUT_RETURN_TYPE = YES;
				GCC_WARN_UNINITIALIZED_AUTOS = YES;
				GCC_WARN_UNUSED_VARIABLE = YES;
				IPHONEOS_DEPLOYMENT_TARGET = " ^ objc_deployment_target ^ ";
				OTHER_CFLAGS = \"-DNS_BLOCK_ASSERTIONS=1\";
				SDKROOT = iphoneos;
				VALIDATE_PRODUCT = YES;
			};
			name = Release;
		};
		"^build_config_list_app_debug^" /* Debug */ = {
			isa = XCBuildConfiguration;
			buildSettings = {
				CODE_SIGN_IDENTITY = \"iPhone Developer\";
				FRAMEWORK_SEARCH_PATHS = (
					\"$(inherited)\",");
	List.iter (fun path -> 
		let comps = Str.split (Str.regexp "/") path in
		let path2 = String.concat "/" (List.rev (List.tl (List.rev comps))) in
		file#write ("					\"\\\"$(SRCROOT)/"^(!prefix)^path2^"\\\"\",\n");
	) common_ctx.objc_libs;
	file#write ("				);
				GCC_PRECOMPILE_PREFIX_HEADER = YES;
				GCC_PREFIX_HEADER = \""^app_name^"/"^app_name^"-Prefix.pch\";
				GCC_VERSION = com.apple.compilers.llvm.clang.1_0;
				INFOPLIST_FILE = \""^app_name^"/"^app_name^"-Info.plist\";
				IPHONEOS_DEPLOYMENT_TARGET = " ^ objc_deployment_target ^ ";
				OTHER_LDFLAGS = (");
	List.iter (fun v ->
		file#write ("					\"-"^v^"\",\n");
	) common_ctx.objc_linker_flags;
	file#write ("				);
				PRODUCT_NAME = \"$(TARGET_NAME)\";
				PROVISIONING_PROFILE = \"\";
				TARGETED_DEVICE_FAMILY = \"" ^ objc_targeted_device_family ^ "\";
				WRAPPER_EXTENSION = app;
			};
			name = Debug;
		};
		"^build_config_list_app_release^" /* Release */ = {
			isa = XCBuildConfiguration;
			buildSettings = {
				CODE_SIGN_IDENTITY = \"iPhone Distribution\";
				FRAMEWORK_SEARCH_PATHS = (
					\"$(inherited)\",");
	List.iter (fun path -> 
		let comps = Str.split (Str.regexp "/") path in
		let path2 = String.concat "/" (List.rev (List.tl (List.rev comps))) in
		file#write ("					\"\\\"$(SRCROOT)/"^(!prefix)^path2^"\\\"\",\n");
	) common_ctx.objc_libs;
	file#write ("				);
				GCC_PRECOMPILE_PREFIX_HEADER = YES;
				GCC_PREFIX_HEADER = \""^app_name^"/"^app_name^"-Prefix.pch\";
				GCC_VERSION = com.apple.compilers.llvm.clang.1_0;
				INFOPLIST_FILE = \""^app_name^"/"^app_name^"-Info.plist\";
				IPHONEOS_DEPLOYMENT_TARGET = " ^ objc_deployment_target ^ ";
				OTHER_LDFLAGS = (");
	List.iter (fun v ->
		file#write ("					\"-"^v^"\",\n");
	) common_ctx.objc_linker_flags;
	file#write ("				);
				PRODUCT_NAME = \"$(TARGET_NAME)\";
				TARGETED_DEVICE_FAMILY = \"" ^ objc_targeted_device_family ^ "\";
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
	file#write ("\n\n/* Begin XCConfigurationList section */
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
/* End XCConfigurationList section */\n");

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

let read_file f =
  let ic = open_in f in
  let n = in_channel_length ic in
  let s = String.create n in
  really_input ic s 0 n;
  close_in ic;
  (s)
;;

let generatePlist common_ctx file_info  =
	(* TODO: Allows the application to specify what location will be used for in their app. 
	This will be displayed along with the standard Location permissions dialogs. 
	This property will need to be set prior to calling startUpdatingLocation.
	Set the purpose string in Info.plist using key NSLocationUsageDescription. *)
	
	(* Search the user defined -Info.plist in the custom SupportingFiles folder *)
	let app_name = appName common_ctx in
	let supporting_files = (match common_ctx.objc_supporting_files with
		| None -> ""
		| Some p -> p) in
	let plist_path = if (supporting_files != "") then (supporting_files ^ app_name ^ "-Info.plist") else "" in
	let src_dir = srcDir common_ctx in
	let file = newSourceFile src_dir ([],app_name^"-Info") ".plist" in
	if plist_path <> "" && Sys.file_exists plist_path then begin
		let file_contents = read_file plist_path in
		file#write file_contents;
	end else begin
		let identifier = match common_ctx.objc_identifier with 
			| Some id -> id
			| None -> "org.haxe.hxobjc" in
		let bundle_name = match common_ctx.objc_bundle_name with 
			| Some name -> name 
			| None -> "${PRODUCT_NAME}" in
		let executable_name = match common_ctx.objc_bundle_name with 
			| Some name -> name 
			| None -> "${EXECUTABLE_NAME}" in
		let bundle_version = Printf.sprintf "%.1f" common_ctx.objc_bundle_version in
		file#write ("<?xml version=\"1.0\" encoding=\"UTF-8\"?>
	<!DOCTYPE plist PUBLIC \"-//Apple//DTD PLIST 1.0//EN\" \"http://www.apple.com/DTDs/PropertyList-1.0.dtd\">
	<plist version=\"1.0\">
	<dict>
		<key>CFBundleDevelopmentRegion</key>
		<string>en</string>
		<key>CFBundleDisplayName</key>
		<string>" ^ bundle_name ^ "</string>
		<key>CFBundleExecutable</key>
		<string>" ^ executable_name ^ "</string>
		<key>CFBundleIdentifier</key>
		<string>" ^ identifier ^ "</string>
		<key>CFBundleInfoDictionaryVersion</key>
		<string>6.0</string>
		<key>CFBundleName</key>
		<string>" ^ bundle_name ^ "</string>
		<key>CFBundlePackageType</key>
		<string>APPL</string>
		<key>CFBundleShortVersionString</key>
		<string>" ^ bundle_version ^ "</string>
		<key>CFBundleSignature</key>
		<string>????</string>
		<key>CFBundleVersion</key>
		<string>" ^ bundle_version ^ "</string>
		<key>LSRequiresIPhoneOS</key>
		<true/>
		<key>UIRequiredDeviceCapabilities</key>
		<array>
			<string>armv7</string>
		</array>
		<key>UISupportedInterfaceOrientations</key>
		<array>");
		List.iter (fun v -> file#write ("		<string>" ^ v ^ "</string>");) common_ctx.ios_orientations;
		file#write ("	</array>
	</dict>
	</plist>");
	end;
	file#close
;;

(* Generate the enum. ctx should be the header file *)
let generateEnum ctx enum_def =
	(* print_endline ("> Generating enum : "^(snd enum_def.e_path)); *)
    ctx.writer#write "typedef enum";
	ctx.writer#begin_block;
	ctx.writer#write (String.concat ",\n\t" enum_def.e_names);
	ctx.writer#new_line;
	ctx.writer#end_block;
    ctx.writer#write (" " ^ (snd enum_def.e_path) ^ ";");
	ctx.writer#new_line
;;

(* Generate header + implementation in the provided file *)
let generateImplementation ctx files_manager imports_manager =
	(* print_endline ("> Generating implementation : "^(snd ctx.class_def.cl_path)); *)
	
	defineGetSet ctx true ctx.class_def;
	defineGetSet ctx false ctx.class_def;
	(* common_ctx.local_types <- List.map snd c.cl_types; *)
	
	ctx.writer#new_line;
	
	let class_path = ctx.class_def.cl_path in
	if ctx.is_category then begin
		let category_class = getFirstMetaValue Meta.Category ctx.class_def.cl_meta in
		ctx.writer#write ("@implementation " ^ category_class ^ " ( " ^ (snd class_path) ^ " )");
	end else
		ctx.writer#write ("@implementation " ^ (snd ctx.class_def.cl_path));
	
	ctx.writer#new_line;
	(* ctx.writer#write "id me;";
	ctx.writer#new_line; *)
	
	(* Generate functions and variables *)
	List.iter (generateField ctx true) ctx.class_def.cl_ordered_statics;
	List.iter (generateField ctx false) (List.rev ctx.class_def.cl_ordered_fields);
	
	(* Generate the constructor *)
	(match ctx.class_def.cl_constructor with
	| None -> ();
	| Some f ->
		let f = { f with
			cf_name = "init";
			cf_public = true;
			cf_kind = Method MethNormal;
		} in
		ctx.generating_constructor <- true;
		generateField ctx false f;
		ctx.generating_constructor <- false;
	);
	
	ctx.writer#write "\n\n@end\n"
;;	

let generateHeader ctx files_manager imports_manager =
	ctx.generating_header <- true;
	(* Import the super class *)
	(match ctx.class_def.cl_super with
		| None -> ()
		| Some (csup,_) -> ctx.imports_manager#add_class csup
	);
	
	(* Import custom classes *)
	if (Meta.has Meta.Import ctx.class_def.cl_meta) then begin
		let import_statements = getAllMetaValues Meta.Import ctx.class_def.cl_meta in
		List.iter ( fun name ->
			imports_manager#add_class_import_custom name;
		) import_statements;
	end;
	if (Meta.has Meta.Include ctx.class_def.cl_meta) then begin
		let include_statements = getAllMetaValues Meta.Include ctx.class_def.cl_meta in
		List.iter ( fun name ->
			imports_manager#add_class_include_custom name;
		) include_statements;
	end;
	
	(* Import frameworks *)
	ctx.writer#new_line;
	ctx.writer#write_frameworks_imports imports_manager#get_class_frameworks;
	ctx.writer#new_line;
	(* Import classes *)
	imports_manager#remove_class_path ctx.class_def.cl_path;
	ctx.writer#write_headers_imports ctx.class_def.cl_module.m_path imports_manager#get_imports;
	ctx.writer#write_headers_imports_custom imports_manager#get_imports_custom;
	ctx.writer#new_line;
	
	let class_path = ctx.class_def.cl_path in
	if ctx.is_category then begin
		let category_class = getFirstMetaValue Meta.Category ctx.class_def.cl_meta in
		ctx.writer#write ("@interface " ^ category_class ^ " ( " ^ (snd class_path) ^ " )");
	end
	else if ctx.is_protocol then begin
		ctx.writer#write ("@protocol " ^ (snd class_path) ^ "<NSObject>");
	end
	else begin
		
		ctx.writer#write ("@interface " ^ (snd class_path));
		(* Add the super class *)
		(match ctx.class_def.cl_super with
			| None -> ctx.writer#write " : NSObject"
			| Some (csup,_) -> ctx.writer#write (Printf.sprintf " : %s " (snd csup.cl_path)));
		(* ctx.writer#write (Printf.sprintf "\npublic %s%s%s %s " (final c.cl_meta) 
		(match c.cl_dynamic with None -> "" | Some _ -> if c.cl_interface then "" else "dynamic ") 
		(if c.cl_interface then "interface" else "class") (snd c.cl_path); *)
		if ctx.class_def.cl_implements != [] then begin
			(* Add implement classes *)
			ctx.writer#write "<";
			(match ctx.class_def.cl_implements with
			| [] -> ()
			| l -> concat ctx ", " (fun (i,_) -> ctx.writer#write (Printf.sprintf "%s" (snd i.cl_path))) l
			);
			ctx.writer#write ">";
		end
	end;
	
	ctx.writer#new_line;
	
	List.iter (generateField ctx true) ctx.class_def.cl_ordered_statics;
	List.iter (generateField ctx false) (List.rev ctx.class_def.cl_ordered_fields);
	
	(match ctx.class_def.cl_constructor with
	| None -> ();
	| Some f ->
		let f = { f with
			cf_name = "init";
			cf_public = true;
			cf_kind = Method MethNormal;
		} in
		ctx.generating_constructor <- true;
		generateField ctx false f;
		ctx.generating_constructor <- false;
	);
	
	ctx.writer#write "\n\n@end\n\n";
	ctx.generating_header <- false
;;

(* The main entry of the generator *)
let generate common_ctx =
	
	(* Generate XCode folders structure *)
	generateXcodeStructure common_ctx;
	
	let src_dir = srcDir common_ctx in
	let imports_manager = new importsManager in
	let files_manager = new filesManager imports_manager (appName common_ctx) in
	let file_info = ref PMap.empty in(* Not sure for what is used *)
	(* Generate the HXObject category *)
	let temp_file_path = ([],"HXObject") in
	let file_m = newSourceFile src_dir temp_file_path ".m" in
	let file_h = newSourceFile src_dir temp_file_path ".h" in
	let ctx_m = newContext common_ctx file_m imports_manager file_info in
	let ctx_h = newContext common_ctx file_h imports_manager file_info in
	let m = newModuleContext ctx_m ctx_h in
	(* Generate classes and enums in the coresponding module *)
	List.iter ( fun obj_def ->
		(* print_endline ("> Generating object : ? "); *)
		
		match obj_def with
		| TClassDecl class_def ->
			
			if not class_def.cl_extern then begin
				(* let gen = new_ctx common_ctx in
				init_ctx gen;
				Hashtbl.add gen.gspecial_vars "__objc__" true; (* add here all special __vars__ you need *)
				ExpressionUnwrap.configure gen (ExpressionUnwrap.traverse gen (fun e -> Some { eexpr = TVars([mk_temp gen "expr" e.etype, Some e]); etype = gen.gcon.basic.tvoid; epos = e.epos }));
				run_filters gen; *)
				
				let module_path = class_def.cl_module.m_path in
				let class_path = class_def.cl_path in
				let is_category = (Meta.has Meta.Category class_def.cl_meta) in
				let is_new_module_m = (m.module_path_m != module_path) in
				let is_new_module_h = (m.module_path_h != module_path) in
				(* When we create a new module reset the 'frameworks' and 'imports' that where stored for the previous module *)
				(* A copy of the frameworks are kept in a non-resetable variable for later usage in .pbxproj *)
				imports_manager#reset;
				print_endline ("> Generating class : "^(snd class_path)^" in module "^(joinClassPath module_path "/"));
				
				(* Generate implementation *)
				(* If it's a new module close the old files and create new ones *)
				if is_new_module_m then begin
					m.ctx_m.writer#close;
					m.module_path_m <- module_path;
					
					if not class_def.cl_interface then begin
						(* Create the implementation file only for classes, not protocols *)
						files_manager#register_source_file module_path ".m";
						let file_m = newSourceFile src_dir module_path ".m" in
						let ctx_m = newContext common_ctx file_m imports_manager file_info in
						m.ctx_m <- ctx_m;
						m.ctx_m.is_category <- is_category;
						
						(* Import header *)
						m.ctx_m.writer#write_copy module_path (appName common_ctx);
						m.ctx_m.writer#write_header_import module_path module_path;
					end;
				end;
				if not class_def.cl_interface then begin
					m.ctx_m.class_def <- class_def;
					generateImplementation m.ctx_m files_manager imports_manager;
				end;
				
				(* Generate header *)
				(* If it's a new module close the old files and create new ones *)
				if is_new_module_h then begin
					m.ctx_h.writer#close;
					m.module_path_h <- module_path;
					(* Create the header file *)
					files_manager#register_source_file module_path ".h";
					let file_h = newSourceFile src_dir module_path ".h" in
					let ctx_h = newContext common_ctx file_h imports_manager file_info in
					m.ctx_h <- ctx_h;
					m.ctx_h.is_category <- is_category;
					(* m.ctx_h.class_def <- class_def; *)
					m.ctx_h.writer#write_copy module_path (appName common_ctx);
				end;
				if class_def.cl_interface then m.ctx_h.is_protocol <- true;
				m.ctx_h.class_def <- class_def;
				generateHeader m.ctx_h files_manager imports_manager;
			end
		
		| TEnumDecl enum_def ->
			if not enum_def.e_extern then begin
				let module_path = enum_def.e_module.m_path in
				(* let class_path = enum_def.e_path in *)
				let is_new_module = (m.module_path_h != module_path) in
				print_endline ("> Generating enum : "^(snd enum_def.e_path)^" in module : "^(snd module_path));
				if is_new_module then begin
					(* print_endline ("> New module for enum : "^(snd module_path)); *)
					m.ctx_m.writer#close;
					m.ctx_h.writer#close;
					m.module_path_h <- module_path;
					
					let file_h = newSourceFile src_dir module_path ".h" in
					let ctx_h = newContext common_ctx file_h imports_manager file_info in
					m.ctx_h <- ctx_h;
					m.ctx_h.writer#write_copy module_path (appName common_ctx);
					m.ctx_h.generating_header <- true;
				end;
				generateEnum m.ctx_h enum_def;
			end;
		| TTypeDecl _ ->
			()
		| TAbstractDecl _ ->
			()
	) common_ctx.types;
	
	(* List.iter (fun p -> print_endline p ) common_ctx.objc_libs; *)
	List.iter (fun name ->
		imports_manager#add_framework name;
	) common_ctx.objc_frameworks;
	
	(* Register some default files that were not added by the compiler *)
	(* files_manager#register_source_file class_def.cl_path ".m"; *)
	(* files_manager#register_source_file ([],"main") ".m"; *)
	
	generateHXObject common_ctx;
	generatePch common_ctx file_info;
	generatePlist common_ctx file_info;
	generateResources common_ctx;
	localizations common_ctx;
	pbxproj common_ctx files_manager
;;
