//
//  MyClass
//  Test
//
//  Source generated by Haxe Objective-C target
//



#import "../unit/MyClass.h"
#import "../String.h"

@interface MyClass : NSObject

@property (nonatomic) int val;
@property (nonatomic, strong) MyClass *ref;
@property (nonatomic) int intValue;
@property (nonatomic, strong) NSMutableString *stringValue;
- (int) get;
- (void) set:(int)v;
- (int) add:(int)x y:(int)y;
- (id) init:(int)v;

@end




@interface MyParent : NSObject

- (int) a;
- (int) b;
- (id) init;

@end



#import "../unit/MyParent.h"

@interface MyChild1 : MyParent 

- (int) a;
- (int) b;
- (int) c;
- (id) init;

@end



#import "../unit/MyClass.h"
#import "../unit/MyParent.h"

@interface MyChild2 : MyParent 

- (int) test1:(MyChild1*)mc1;
- (id) init;

@end




@interface I1 : NSObject


@end



#import "../String.h"

@interface Base : NSObject

@property (nonatomic, strong) NSMutableString *s;
- (id) init;

@end



#import "../unit/Base.h"

@interface Child1 : Base 

- (id) init;

@end



#import "../unit/Base.h"

@interface Child2 : Base <I1>

- (id) init;

@end



#import "../unit/Child2.h"

@interface Child2_1 : Child2 

- (id) init;

@end



#import "../String.h"

@interface Unrelated : NSObject<I1>

@property (nonatomic, strong) NSMutableString *s;
@property (nonatomic) int t;
- (id) init;

@end




@interface I2 : NSObject<I1>


@end




@interface ClassI2 : NSObject<I2>

- (id) init;

@end



#import "../unit/Base.h"

@interface CI1 : Base <I1>

- (id) init;

@end



#import "../unit/Base.h"

@interface CI2 : Base <I1>

- (id) init;

@end



#import "../unit/CI1.h"

@interface CII1 : CI1 

- (id) init;

@end



#import "../unit/CI2.h"

@interface CII2 : CI2 

- (id) init;

@end




@interface PClassBase : NSObject

- (id) init;

@end



#import "../unit/PClassBase.h"

@interface PClass1 : PClassBase 

- (id) init;

@end



#import "../unit/PClassBase.h"

@interface PClass2 : PClassBase 

- (id) init:(id)t;

@end




@interface CovI : NSObject



@end




@interface CovI2 : NSObject<CovI>


@end



#import "../unit/MyClass.h"

@interface Cov1 : NSObject

- (Base*) covariant;
- (id) init;

@end



#import "../unit/MyClass.h"
#import "../unit/Cov1.h"

@interface Cov2 : Cov1 <CovI>

- (Base*) covariant;
- (id) init;

@end



#import "../unit/MyClass.h"

@interface Cov3 : NSObject<CovI2>

- (Base*) covariant;
- (id) init;

@end



#import "../unit/MyClass.h"

@interface Ctrv1 : NSObject

- (void) contravariant:(Child1*)arg;
- (id) init;

@end



#import "../unit/MyClass.h"
#import "../unit/Ctrv1.h"

@interface Ctrv2 : Ctrv1 

- (void) contravariant:(Child1*)_tmp_arg;
- (id) init;

@end



#import "../String.h"

@interface InitBase : NSObject

+ (int) si:(int)val;
+ (int) sop:(int)val;
+ (id) st:(id)val;
+ (int) sp:(int)val;
+ (float) sinline:(float)val;
@property (nonatomic) int i;
@property (nonatomic, strong) NSMutableString *s;
@property (nonatomic) BOOL b;
@property (nonatomic) id t;
- (id) init;

@end



#import "../unit/InitBase.h"

@interface InitChild : InitBase 

- (id) init;

@end



#import "../unit/InitBase.h"

@interface InitChildWithCtor : InitBase 

- (id) init:(id)_;

@end




@interface InitWithoutCtor : NSObject

@property (nonatomic) int i;
- (id) init;

@end




@interface InitProperties : NSObject

@property (nonatomic) int accNull;
@property (nonatomic) int accDefault;
@property (nonatomic, setter=set_accFunc) int accFunc;
@property (nonatomic) int accNever;
@property (nonatomic, setter=set_accDynamic) int accDynamic;
- (int) set_accFunc:(int)v;
- (id) set_accDynamic:(id)v;
- (id) init;

@end



#import "../String.h"

@interface ParamConstraintsClass : NSObject

+ (id) staticSingle:(id)a;
- (id) memberSingle:(id)a;
- (id) memberMultiple:(id)a;
- (id) memberComplex:(id)a b:(id)b;
- (id) memberBasic:(id)a b:(id)b;
- (float) memberAnon:(id)v;
- (void) memberOverload:(NSMutableString*)a b:(NSMutableString*)b;
- (id) init;

@end




@interface ParamConstraintsClass2 : NSObject

- (void) bind:(id)t;
- (void) check:(id)a;
- (id) init;

@end



#import "../String.h"

@interface UsingBase : NSObject

+ (NSMutableString*) privFunc:(NSMutableString*)s;
+ (NSMutableString*) pupFunc:(NSMutableString*)s;

@end



#import "../String.h"
#import "../unit/UsingBase.h"
#import "../unit/UsingChild2.h"

@interface UsingChild1 : UsingBase 

+ (NSMutableString*) test;
+ (NSMutableString*) siblingFunc:(NSMutableString*)s;

@end



#import "../String.h"
#import "../unit/UsingChild2.h"
#import "../unit/UsingBase.h"

@interface UsingChild2 : UsingBase 

+ (NSMutableString*) test;
+ (NSMutableString*) siblingFunc:(NSMutableString*)s;

@end



#import "../String.h"
#import "../unit/UsingBase.h"
#import "../unit/UsingChild2.h"

@interface UsingUnrelated : NSObject

+ (NSMutableString*) test;

@end



#import "../unit/VarProps.h"

@interface VarProps : NSObject

+ (int) SX:(int)val;
+ (int) SY:(int)val;
+ (int) get_SX;
+ (int) set_SX:(int)v;
+ (int) get_SY;
+ (int) set_SY:(int)v;
@property (nonatomic, getter=get_x, setter=set_x) int x;
@property (nonatomic, getter=get_y, setter=set_y) int y;
@property (nonatomic, setter=set_z) int z;
- (int) get_x;
- (int) set_x:(int)v;
- (int) get_y;
- (int) set_y:(int)v;
- (int) set_z:(int)v;
- (id) init;

@end



#import "../String.h"

@interface BaseSuperProp : NSObject

@property (nonatomic, getter=get_prop, setter=set_prop) int prop;

- (int) get_prop;
- (int) set_prop:(int)v;
- (SEL) get_fProp;
- (id) init;

@end



#import "../Array.h"
#import "../String.h"
#import "../unit/BaseSuperProp.h"

@interface ChildSuperProp : BaseSuperProp 

- (int) get_prop;
- (int) set_prop:(int)v;
- (SEL) get_fProp;
- (NSMutableString*) test;
- (id) init;

@end



#import "../unit/MyClass.h"

@interface InlineCastA : NSObject

- (InlineCastA*) self;

@end



#import "../unit/MyClass.h"
#import "../String.h"
#import "../unit/InlineCastA.h"

@interface InlineCastB : InlineCastA 

- (InlineCastB*) test;
- (NSMutableString*) quote;
- (id) init;

@end

