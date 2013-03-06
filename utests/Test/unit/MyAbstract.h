//
//  MyAbstract
//  Test
//
//  Source generated by Haxe Objective-C target
//




@interface MyAbstractImpl : HXObject

+ (int) _new:(int)x;
+ (int) incr:(int)this1;
+ (int) toInt:(int)this1;

@end



#import "../haxe/Template.h"
#import "../String.h"
#import "../unit/MyAbstract.h"

@interface TemplateWrapImpl : HXObject

+ (Template*) _new:(NSMutableString*)x;
+ (Template*) get:(Template*)this1;
+ (TemplateWrap*) fromString:(NSMutableString*)s;
+ (NSMutableString*) toString:(Template*)this1;

@end



#import "../String.h"

@interface MeterImpl : HXObject

+ (float) _new:(float)f;
+ (float) get:(float)this1;
+ (NSMutableString*) toString:(float)this1;

@end



#import "../String.h"
#import "../unit/MyAbstract.h"

@interface KilometerImpl : HXObject

+ (float) _new:(float)f;
+ (NSMutableString*) toString:(float)this1;
+ (Kilometer*) fromMeter:(Meter*)m;

@end



#import "../haxe/ds/StringMap.h"
#import "../String.h"
#import "../unit/MyAbstract.h"
#import "../Array.h"
#import "../Std.h"

@interface MyHashImpl : HXObject

+ (StringMap*) _new;
+ (void) set:(StringMap*)this1 k:(NSMutableString*)k v:(id)v;
+ (id) get:(StringMap*)this1 k:(NSMutableString*)k;
+ (NSMutableString*) toString:(StringMap*)this1;
+ (MyHash*) fromStringArray:(NSMutableArray*)arr;
+ (MyHash*) fromArray:(NSMutableArray*)arr;

@end




@interface AbstractBase : HXObject

@property (nonatomic) id value;
- (id) init:(id)value;

@end



#import "../unit/MyAbstract.h"
#import "../String.h"

@interface AbstractZImpl : HXObject

+ (int) toFoo:(AbstractBase*)a;
+ (NSMutableString*) toString:(AbstractBase*)a;

@end




@interface MyPoint3 : HXObject

@property (nonatomic) float x;
@property (nonatomic) float y;
@property (nonatomic) float z;
- (id) init:(float)x y:(float)y z:(float)z;

@end



#import "../unit/MyAbstract.h"
#import "../String.h"

@interface MyVectorImpl : HXObject

+ (MyVector*) add:(MyVector*)lhs rhs:(MyVector*)rhs;
+ (MyVector*) scalarAssign:(MyVector*)lhs rhs:(float)rhs;
+ (MyVector*) scalar:(MyVector*)lhs rhs:(float)rhs;
+ (MyVector*) invert:(MyVector*)t;
+ (MyPoint3*) get:(MyPoint3*)this1;
+ (NSMutableString*) toString:(MyPoint3*)this1;

@end



#import "../String.h"
#import "../unit/MyAbstract.h"
#import "../StringBuf.h"
#import "../Std.h"

@interface MyIntImpl : HXObject


+ (NSMutableString*) repeat:(MyInt*)lhs rhs:(NSMutableString*)rhs;

@end



#import "../unit/MyAbstract.h"

@interface MyInt2Impl : HXObject

+ (int) _new:(int)v;
+ (int) get:(int)this1;
+ (MyInt2*) invert:(int)this1;
+ (void) incr:(int)this1;

@end




@interface MyStringImpl : HXObject






@end




@interface ClassWithHashCode : HXObject

@property (nonatomic) int i;
- (int) hashCode;
- (id) init:(int)i;

@end




@interface ClassWithoutHashCode : HXObject

@property (nonatomic) int i;
- (id) init:(int)i;

@end



#import "../String.h"
#import "../Reflect.h"

@interface MyReflectImpl : HXObject

+ (id) arrayAccess:(id)this1 key:(NSMutableString*)key;
+ (id) arrayWrite:(id)this1 key:(NSMutableString*)key value:(id)value;

@end



#import "../String.h"
#import "../Array.h"

@interface MyAbstractClosureImpl : HXObject

+ (NSMutableString*) _new:(NSMutableString*)value;
+ (SEL) test:(NSMutableString*)this1;
+ (void) setVal:(NSMutableString*)this1 v:(NSMutableString*)v;

@end
