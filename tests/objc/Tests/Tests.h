//
//  main.m
//  app_delegate_class
//
//  Source generated by Haxe Objective-C target
//


#import <Foundation/Foundation.h>

#import "Array.h"
#import "Tests.h"
#import "Lib.h"
#import "Log.h"
#import "Date.h"
#import "DateTools.h"
#import "TestsEnum.h"
#import "Hash.h"
#import "IntHash.h"
#import "List.h"
#import "Std.h"
#import "FastList.h"
#import "FastCell.h"
#import "Reflect.h"
#import "StringBuf.h"
#import "StringTools.h"
#import "Sys.h"
#import "Class.h"
#import "Type.h"
#import "Timer.h"

@interface Tests : NSObject<Interface2, Interface1>

+ (NSMutableString*) staticVar1:(NSMutableString*)val;
+ (int) staticVar2:(int)val;
+ (int) staticVar3:(int)val;

@property (nonatomic) int interfaceVar1;
@property (nonatomic) float interfaceVar2;
@property (nonatomic, getter=getWidth, setter=setWidth) int width;
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
- (void) testEnum;
- (void) testEReg;
- (void) testHash;
- (void) testLambda;
- (void) testList;
- (void) testMath;
- (void) testReflect;
- (void) testStd;
- (void) testString;
- (void) testSys;
- (void) testType;
- (void) testXml;
- (void) testTimer;
- (void) testFrameworksImport;
- (int) getWidth;
- (int) setWidth:(int)v;
- (int) add:(int)a b:(int)b;
- (int) minus:(int)a b:(int)b;
- (void) callLotsOfArguments:(int)arg1 arg2:(int)arg2 arg3:(int)arg3 arg4:(int)arg4;
- (void) optionalArguments:(int)arg1 arg2:(int)arg2 arg3:(int)arg3 arg4:(id)arg4;
- (void) optionalArguments1:(int)arg1 arg2:(int)arg2 arg3:(int)arg3 arg4:(int)arg4;
- (void) optionalArguments2:(int)arg1 arg2:(id)arg2 arg3:(id)arg3 arg4:(int)arg4;
- (void) optionalArguments3:(int)arg1 arg2:(int)arg2 arg3:(id)arg3 arg4:(int)arg4;
- (void) init;
- (void) printHello;
- (id) new;

@end
