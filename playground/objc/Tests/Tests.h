//
//  Tests
//  Tests
//
//  Source generated by Haxe Objective-C target
//

typedef enum{
	Red,
	Green,
	Blue,
	Grey,
	Rgb,
	Alpha
} Color;

#import <Foundation/Foundation.h>

#import "String.h"
#import "Array.h"
#import "objc/Lib.h"
#import "haxe/Log.h"
#import "DateTools.h"
#import "Tests.h"
#import "Lambda.h"
#import "List.h"
#import "haxe/ds/GenericStack.h"
#import "Reflect.h"
#import "Std.h"
#import "StringBuf.h"
#import "StringTools.h"
#import "Sys.h"
#import "haxe/io/Output.h"
#import "haxe/io/Input.h"
#import "Class.h"
#import "Type.h"
#import "TestC.h"
#import "TestHaxePack.h"

@interface Tests : NSObject

+ (NSMutableString*) staticVar1;
+ (void) setStaticVar1:(NSMutableString*)val;
+ (int) staticVar2;
+ (void) setStaticVar2:(int)val;
+ (int) staticVar3;
+ (void) setStaticVar3:(int)val;

@property (nonatomic) int interfaceVar1;
@property (nonatomic) float interfaceVar2;
@property (nonatomic) int d1;
@property (nonatomic) float d2;
@property (nonatomic, strong) NSMutableString *s;
- (void) testVariables;
- (void) testingFor;
- (void) testWhile;
- (void) testTry;
- (void) testSwitch;
- (void) testArray;
- (void) testDate;
- (int) enumToInt:(Color*)c;
- (void) testEnum:(TestsEnumExtern*)v;
- (void) testEReg;
- (void) testMap;
- (void) testLambda;
- (void) testGenericStack;
- (void) testReflect;
- (void) testStd;
- (void) testString;
- (void) testSys;
- (void) testType;
- (void) testXml;
- (void) foo;
- (void) testOverload;
- (void) testFrameworksImport;
- (int) get_width;
- (int) set_width:(int)v;
- (int) add:(int)a b:(int)b;
- (int) minus:(int)a b:(int)b;
- (void) callLotsOfArguments:(int)arg1 arg2:(int)arg2 arg3:(int)arg3 arg4:(int)arg4;
- (void) optionalArguments:(int)arg1 arg2:(int)arg2 arg3:(int)arg3 arg4:(int)arg4;
- (void) optionalArguments1:(int)arg1 arg2:(int)arg2 arg3:(int)arg3 arg4:(int)arg4;
- (void) optionalArguments2:(int)arg1 arg2:(int)arg2 arg3:(int)arg3 arg4:(int)arg4;
- (void) optionalArguments3:(int)arg1 arg2:(int)arg2 arg3:(BOOL)arg3 arg4:(BOOL)arg4;
- (void) init;
- (void) printHello;
- (void) functionToRedefine;
- (void) functionToRedefine2:(int)param1 param2:(NSMutableString*)param2;
- (id) init;

@end



#import "haxe/Log.h"
#import "String.h"
#import "Array.h"

@interface Tests2 : NSObject

@property (nonatomic) int d1;
- (void) methodInTests2;
// Dynamic method defined with an objc method and a block property
- (void) functionToRedefine;
@property (nonatomic,copy) void(^hx_dyn_functionToRedefine)();
// Dynamic method defined with an objc method and a block property
- (void) functionToRedefine2:(int)param1 param2:(NSMutableString*)param2;
@property (nonatomic,copy) void(^hx_dyn_functionToRedefine2)(int, NSMutableString*);
- (id) init;

@end

typedef enum{
	Red2,
	Green2,
	Blue2
} Color2;
