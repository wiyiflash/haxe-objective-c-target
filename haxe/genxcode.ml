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
open Genobjc


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
	
	(* Register packages root folder as source_folders *)
	List.iter ( fun (path) ->
		files_manager#register_source_folder (fst path, "")
	) !packages;
	
	(* Search the SupportingFiles folder *)
	let supporting_files = ref "" in
	(match common_ctx.objc_supporting_files with
	| None ->
		print_endline "No SupportingFiles defined. Search in hxcocoa lib";
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
		print_endline p;
		supporting_files := p;
	);
	print_endline ("SupportingFiles found at path: "^(!supporting_files));
	if (!supporting_files != "") then begin
		let contents = Array.to_list (Sys.readdir !supporting_files) in
		List.iter (fun f ->
			if f <> ".DS_Store" then begin
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
		(* if List.length (fst path) > 0 then List.hd (fst path) else (snd path) in *)
		file#write ("		"^fileRef^" /* "^(snd path)^" in Resources */ = {isa = PBXFileReference; lastKnownFileType = image."^ext^"; name = \""^(snd path)^"\"; path = \""^(!prefix)^(!supporting_files)^n^"\"; sourceTree = SOURCE_ROOT; };\n");
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

let generatePlist common_ctx file_info  =
	(* TODO: Allows the application to specify what location will be used for in their app. 
	This will be displayed along with the standard Location permissions dialogs. 
	This property will need to be set prior to calling startUpdatingLocation.
	Set the purpose string in Info.plist using key NSLocationUsageDescription. *)
	(* let main_class_def = common_ctx.main_class in *)
	let app_name = appName common_ctx in
	let src_dir = srcDir common_ctx in
	let identifier = match common_ctx.objc_identifier with 
		| Some id -> id
		| None -> "org.haxe.ObjC" in
	let bundle_name = match common_ctx.objc_bundle_name with 
		| Some name -> name 
		| None -> "${PRODUCT_NAME}" in
	let executable_name = match common_ctx.objc_bundle_name with 
		| Some name -> name 
		| None -> "${EXECUTABLE_NAME}" in
	let bundle_version = Printf.sprintf "%.1f" common_ctx.objc_bundle_version in
	let file = newSourceFile src_dir ([],app_name^"-Info") ".plist" in
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
	file#close
;;

(* The main entry of the generator *)
let generate common_ctx file_info files_manager =
	
	generatePch common_ctx file_info;
	generatePlist common_ctx file_info;
	localizations common_ctx;
	pbxproj common_ctx files_manager
;;
