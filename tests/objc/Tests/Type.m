//
//  main.m
//  app_delegate_class
//
//  Source generated by Haxe Objective-C target
//

#import "Type.h"

@implementation Type

+ (Class*) getClass:(id)o{
	if (o == nil || ![Reflect isObject:o]) return nil;
	id c = [o __GetClass];
	switch ([c GFA2 .toString]){
		case @"__Anon":{
			return nil}break;
		case @"Class":{
			return nil}break;
	}
	return c;
}
+ (Enum*) getEnum:(EnumValue*)o{
	if (o == nil) return nil;
	return [o __GetClass];
}
+ (Class*) getSuperClass:(Class*)c{
	return [c GetSuper];
}
+ (NSMutableString*) getClassName:(Class*)c{
	if (c == nil) return nil;
	return c.mName;
}
+ (NSMutableString*) getEnumName:(Enum*)e{
	return [e __ToString];
}
+ (Class*) resolveClass:(NSMutableString*)name{
	
	Class *result = [Class Resolve "-dynamic_param-" ];
	if (result != nil && [result __IsEnum]) return nil;
	return result;
}
+ (Enum*) resolveEnum:(NSMutableString*)name{
	
	Class *result = [Class Resolve "-dynamic_param-" ];
	if (result != nil && ![result __IsEnum]) return nil;
	return result;
}
+ (id) createInstance:(Class*)cl args:(NSMutabeArray*)args{
	if (cl != nil) return [cl mConstructArgs "-dynamic_param-" ];
	return nil;
}
+ (id) createEmptyInstance:(Class*)cl{
	return [cl mConstructEmpty];
}
+ (id) createEnum:(Enum*)e constr:(NSMutableString*)constr params:(NSMutabeArray*)params{
	if (e.mConstructEnum != nil) return [e mConstructEnum "-dynamic_param-" ];
	return nil;
}
+ (id) createEnumIndex:(Enum*)e index:(int)index params:(NSMutabeArray*)params{
	
	NSMutableString *c = [[Type getEnumConstructs:e] objectAtIndex:index];
	if (c == nil) throw [index stringByAppendingString:@" is not a valid enum constructor index"];
	return [Type createEnum:e constr:c params:params];
}
+ (NSMutabeArray*) getInstanceFields:(Class*)c{
	return [c GetInstanceFields];
}
+ (NSMutabeArray*) getClassFields:(Class*)c{
	return [c GetClassFields];
}
+ (NSMutabeArray*) getEnumConstructs:(Enum*)e{
	return [e GetClassFields];
}
+ (ValueType*) typeof:(id)v{
	if (v == nil) return ValueType.TNull;
	int t = [v __GetType];
	switch (t){
		case __global__ GFA2 .vtBool:{
			return ValueType.TBool}break;
		case __global__ GFA2 .vtInt:{
			return ValueType.TInt}break;
		case __global__ GFA2 .vtFloat:{
			return ValueType.TFloat}break;
		case __global__ GFA2 .vtFunction:{
			return ValueType.TFunction}break;
		case __global__ GFA2 .vtObject:{
			return ValueType.TObject}break;
		case __global__ GFA2 .vtEnum:{
			return [ValueType.TEnum:[v __GetClass]]}break;
		default:{
			return [ValueType.TClass:[v __GetClass]]}break
	}
	return nil;
}
+ (BOOL) enumEq:(id)a b:(id)b{
	return a == b;
}
+ (NSMutableString*) enumConstructor:(EnumValue*)e{
	return [e __Tag];
}
+ (NSMutabeArray*) enumParameters:(EnumValue*)e{
	
	NSMutabeArray *result = [e __EnumParams];
	return ( (result == nil) ? [[NSMutableArray alloc] initWithObjects:, nil]] : result);
}
+ (int) enumIndex:(EnumValue*)e{
	return [e __Index];
}
+ (NSMutabeArray*) allEnums:(Enum*)e{
	
	NSMutabeArray *names = [e GetClassFields];
	
	NSMutabeArray *enums = [[NSMutabeArray alloc] new];
	{
		int _g = 0;
		while (_g < names.length) {
			
			NSMutableString *name = [names objectAtIndex:_g];
			++_g;
			@try {
				id result = [e mConstructEnum "-dynamic_param-" ];
				[enums push:result];
			}
			@catch (NSException *invalidArgCount) {
			}
		}
	}
	return enums;
}

@end
