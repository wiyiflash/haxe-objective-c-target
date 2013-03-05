//
//  Type
//  Tests
//
//  Source generated by Haxe Objective-C target
//

typedef enum{
	TNull,
	TInt,
	TFloat,
	TBool,
	TObject,
	TFunction,
	TClass,
	TEnum,
	TUnknown
} ValueType;

#import <Foundation/Foundation.h>

#import <objc/runtime.h>

@interface Type : HXObject

+ (Class*) getClass:(id)o;
+ (Enum*) getEnum:(EnumValue*)o;
+ (Class*) getSuperClass:(Class*)c;
+ (NSMutableString*) getClassName:(Class*)c;
+ (NSMutableString*) getEnumName:(Enum*)e;
+ (Class*) resolveClass:(NSMutableString*)name;
+ (Enum*) resolveEnum:(NSMutableString*)name;
+ (id) createInstance:(Class*)cl args:(NSMutableArray*)args;
+ (id) createEmptyInstance:(Class*)cl;
+ (id) createEnum:(Enum*)e constr:(NSMutableString*)constr params:(NSMutableArray*)params;
+ (id) createEnumIndex:(Enum*)e index:(int)index params:(NSMutableArray*)params;
+ (NSMutableArray*) getInstanceFields:(Class*)c;
+ (NSMutableArray*) getClassFields:(Class*)c;
+ (NSMutableArray*) getEnumConstructs:(Enum*)e;
+ (Type*) _typeof:(id)v;
+ (BOOL) enumEq:(id)a b:(id)b;
+ (NSMutableString*) enumConstructor:(EnumValue*)e;
+ (NSMutableArray*) enumParameters:(EnumValue*)e;
+ (int) enumIndex:(EnumValue*)e;
+ (NSMutableArray*) allEnums:(Enum*)e;

@end

