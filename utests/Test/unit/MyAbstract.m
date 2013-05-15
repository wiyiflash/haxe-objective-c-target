//
//  MyAbstract
//  Test
//
//  Source generated by Haxe Objective-C target
//

#import "../unit/MyAbstract.h"

@implementation MyAbstract_Impl_

+ (int) _new:(int)x{
	
	return x;
}
+ (int) incr:(int)this1{
	
	return ++this1;
}
+ (int) toInt:(int)this1{
	
	return this1;
}

@end

@implementation TemplateWrap_Impl_

+ (Template*) _new:(NSMutableString*)x{
	
	return [[Template alloc] init:x];
}
+ (Template*) get:(Template*)this1{
	
	return this1;
}
+ (TemplateWrap*) fromString:(NSMutableString*)s{
	
	return (TemplateWrap*)[[Template alloc] init:s];
}
+ (NSMutableString*) toString:(Template*)this1{
	
	return [this1 execute:[@{
		@"t":[[@"really works!" mutableCopy] copy],
	} mutableCopy] macros:nil];
}

@end

@implementation Meter_Impl_

+ (float) _new:(float)f{
	
	return f;
}
+ (float) get:(float)this1{
	
	return this1;
}
+ (NSMutableString*) toString:(float)this1{
	
	return [this1 stringByAppendingString:[@"m" mutableCopy]];
}

@end

@implementation Kilometer_Impl_

+ (float) _new:(float)f{
	
	return f;
}
+ (NSMutableString*) toString:(float)this1{
	
	return [this1 stringByAppendingString:[@"km" mutableCopy]];
}
+ (Kilometer*) fromMeter:(Meter*)m{
	
	return (Kilometer*)(float)m / 1000.;
}

@end

@implementation MyClassWithAbstractArgCtor

@synthesize km;
- (id) init:(Kilometer*)km{
	
	self = [super init];
	self.km = km;
	return self;
}

@end

@implementation MyHash_Impl_

+ (StringMap*) _new{
	
	return [[StringMap alloc] init];
}
+ (void) set:(StringMap*)this1 k:(NSMutableString*)k v:(id)v{
	
	[this1 set:k value:v];
}
+ (id) get:(StringMap*)this1 k:(NSMutableString*)k{
	
	return [this1 get:k];
}
+ (NSMutableString*) toString:(StringMap*)this1{
	
	return [this1 toString];
}
+ (MyHash*) fromStringArray:(NSMutableArray*)arr{
	
	
	MyHash *hash = (MyHash*)[[StringMap alloc] init];
	int i = 0;
	while (i < arr.length) {
		
		
		NSMutableString *k = ((NSMutableString*)[arr hx_objectAtIndex:i++]);
		
		NSMutableString *v = ((NSMutableString*)[arr hx_objectAtIndex:i++]);
		[hash set:k value:v];
	}
	return hash;
}
+ (MyHash*) fromArray:(NSMutableArray*)arr{
	
	
	MyHash *hash = (MyHash*)[[StringMap alloc] init];
	int i = 0;
	while (i < arr.length) {
		
		id k = ((K*)[arr hx_objectAtIndex:i++]);
		id v = ((K*)[arr hx_objectAtIndex:i++]);
		[hash set:[Std string:[[@"_s" mutableCopy] stringByAppendingString:[Std string:k]]] value:v];
	}
	return hash;
}

@end

@implementation AbstractBase

@synthesize value;
- (id) init:(id)value{
	
	self = [super init];
	self.value = value;
	return self;
}

@end

@implementation AbstractZ_Impl_

+ (int) toFoo:(AbstractBase*)a{
	
	return a.value;
}
+ (NSMutableString*) toString:(AbstractBase*)a{
	
	return a.value;
}

@end

@implementation MyPoint3

@synthesize x;
@synthesize y;
@synthesize z;
- (id) init:(float)x y:(float)y z:(float)z{
	
	self = [super init];
	self.x = x;
	self.y = y;
	self.z = z;
	return self;
}

@end

@implementation MyVector_Impl_




+ (float) get_x:(MyPoint3*)this1{
	
	return this1.x;
}
+ (float) get_y:(MyPoint3*)this1{
	
	return this1.y;
}
+ (float) get_z:(MyPoint3*)this1{
	
	return this1.z;
}
+ (float) set_x:(MyPoint3*)this1 x:(float)x{
	
	return this1.x = x;
}
+ (float) set_y:(MyPoint3*)this1 y:(float)y{
	
	return this1.y = y;
}
+ (float) set_z:(MyPoint3*)this1 z:(float)z{
	
	return this1.z = z;
}
+ (MyVector*) add:(MyVector*)lhs rhs:(MyVector*)rhs{
	
	return [[MyPoint3 alloc] init:CASTTMonoCASTTMono[MyVector_Impl_ get_x:lhs] + [MyVector_Impl_ get_x:rhs] y:CASTTMonoCASTTMono[MyVector_Impl_ get_y:lhs] + [MyVector_Impl_ get_y:rhs] z:CASTTMonoCASTTMono[MyVector_Impl_ get_z:lhs] + [MyVector_Impl_ get_z:rhs]];
}
+ (MyVector*) scalarAssign:(MyVector*)lhs rhs:(float)rhs{
	
	{
		
		
		MyVector *_g = lhs;
		[MyVector_Impl_ set_x:_g x:[MyVector_Impl_ get_x:_g] * rhs];
	}
	{
		
		
		MyVector *_g = lhs;
		[MyVector_Impl_ set_y:_g y:[MyVector_Impl_ get_y:_g] * rhs];
	}
	{
		
		
		MyVector *_g = lhs;
		[MyVector_Impl_ set_z:_g z:[MyVector_Impl_ get_z:_g] * rhs];
	}
	return lhs;
}
+ (MyVector*) scalar:(MyVector*)lhs rhs:(float)rhs{
	
	return [[MyPoint3 alloc] init:[MyVector_Impl_ get_x:lhs] * rhs y:[MyVector_Impl_ get_y:lhs] * rhs z:[MyVector_Impl_ get_z:lhs] * rhs];
}
+ (MyVector*) invert:(MyVector*)t{
	
	return [[MyPoint3 alloc] init:-[MyVector_Impl_ get_x:t] y:-[MyVector_Impl_ get_y:t] z:-[MyVector_Impl_ get_z:t]];
}
+ (MyPoint3*) get:(MyPoint3*)this1{
	
	return this1;
}
+ (NSMutableString*) toString:(MyPoint3*)this1{
	
	return [[[[[[[@"(" mutableCopy] stringByAppendingString:this1.x] stringByAppendingString:[@"," mutableCopy]] stringByAppendingString:this1.y] stringByAppendingString:[@"," mutableCopy]] stringByAppendingString:this1.z] stringByAppendingString:[@")" mutableCopy]];
}

@end

@implementation MyInt_Impl_


+ (NSMutableString*) repeat:(MyInt*)lhs rhs:(NSMutableString*)rhs{
	
	
	StringBuf *s = [[StringBuf alloc] init];
	{
		
		int _g = 0;
		while (_g < (int)lhs) {
			
			int i = _g++;
			[s.b appendString:[Std string:rhs]];
		}
	}
	return s.b;
}
+ (NSMutableString*) cut:(NSMutableString*)lhs rhs:(MyInt*)rhs{
	
	return [lhs substr:0 len:rhs];
}

@end

@implementation MyInt2_Impl_

+ (int) _new:(int)v{
	
	return v;
}
+ (int) get:(int)this1{
	
	return this1;
}
+ (MyInt2*) invert:(int)this1{
	
	return (MyInt2*)-this1;
}
+ (void) incr:(int)this1{
	
	++this1;
}

@end

@implementation MyString_Impl_






@end

@implementation ClassWithHashCode

@synthesize i;
- (int) hashCode{
	
	return self.i;
}
- (id) init:(int)i{
	
	self = [super init];
	self.i = i;
	return self;
}

@end

@implementation ClassWithoutHashCode

@synthesize i;
- (id) init:(int)i{
	
	self = [super init];
	self.i = i;
	return self;
}

@end

@implementation MyReflect_Impl_

+ (id) arrayAccess:(id)this1 key:(NSMutableString*)key{
	
	return [Reflect field:this1 field:key];
}
+ (id) arrayWrite:(id)this1 key:(NSMutableString*)key value:(id)value{
	
	if (this1 != nil) [this1 hx_set_field:key :value :NO];
	return value;
}

@end

@implementation MyAbstractClosure_Impl_

+ (NSMutableString*) _new:(NSMutableString*)value{
	
	return value;
}
+ (id) test:(NSMutableString*)this1{
	
	id fn = ^(){
		
		return this1;
	};
	return fn;
}
+ (void) setVal:(NSMutableString*)this1 v:(NSMutableString*)v{
	
	this1 = v;
}

@end

@implementation MyAbstractSetter_Impl_


+ (id) _new{
	
	return [@{
	} mutableCopy];
}
+ (NSMutableString*) get_value:(id)this1{
	
	return [this1 value];
}
+ (NSMutableString*) set_value:(id)this1 s:(NSMutableString*)s{
	
	[this1 value] = s;
	return s;
}

@end

@implementation MyAbstractCounter_Impl_

static int counter;
+ (int) counter {
	if (counter == nil) counter = 0;
	return counter;
}
+ (void) setCounter:(int)hx_val {
	counter = hx_val;
}
+ (int) _new:(int)v{
	
	int this1;
	this1 = v;
	counter++;
	return this1;
}
+ (MyAbstractCounter*) fromInt:(int)v{
	
	return (MyAbstractCounter*)^(int)int this1
	this1 = v
	counter++
	__r__ = this1
	return __r__{
		
		int* __r__}
	}();
}
+ (int) getValue:(int)this1{
	
	return this1 + 1;
}

@end

@implementation MyAbstractThatCallsAMember_Impl_

+ (int) _new:(int)i{
	
	int this1;
	this1 = i;
	this1++;
	return this1;
}
+ (void) bar:(int)this1{
	
	this1++;
}

@end
