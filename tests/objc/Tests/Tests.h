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


@interface Tests : HXObject

+ (NSMutableString*) staticVar1:(NSMutableString*)val;
+ (int) staticVar2:(int)val;
+ (int) staticVar3:(int)val;

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
- (int) enumToInt:(Tests*)c;
- (void) testEnum:(id)v;
- (void) testEReg;
- (void) testHash;
- (void) testLambda;
- (void) testList;
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


#import <Foundation/Foundation.h>


@interface Tests2 : HXObject

@property (nonatomic) int d1;
- (void) methodInTests2;
// Defining a dynamic method
- (void) functionToRedefine;
@property (nonatomic,copy) void(^property_functionToRedefine)();
// Defining a dynamic method
- (void) functionToRedefine2:(int)param1 param2:(NSMutableString*)param2;
@property (nonatomic,copy) void(^property_functionToRedefine2)(int, NSMutableString*);
- (id) init;

@end

typedef enum{
	Red2,
	Green2,
	Blue2
} Color2;
