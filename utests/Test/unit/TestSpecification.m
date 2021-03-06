//
//  TestSpecification
//  Test
//
//  Source generated by Haxe Objective-C target
//

#import "../unit/TestSpecification.h"

@implementation C

+ (void) staticFunc{
	
}
static NSMutableString* staticVar;
+ (NSMutableString*) staticVar {
	if (staticVar == nil) staticVar = ;
	return staticVar;
}
+ (void) setStaticVar:(NSMutableString*)hx_val {
	staticVar = hx_val;
}
static NSMutableString* staticProp;
+ (NSMutableString*) staticProp {
	if (staticProp == nil) staticProp = ;
	return staticProp;
}
+ (void) setStaticProp:(NSMutableString*)hx_val {
	staticProp = hx_val;
}
- (void) func{
	
}
@synthesize v;
@synthesize prop;
- (id) init{
	
	self = [super init];
	self.v = [@"var" mutableCopy];
	self.prop = [@"prop" mutableCopy];
	C.staticVar = [@"staticVar" mutableCopy];
	C.staticProp = [@"staticProp" mutableCopy];
	return self;
}

@end

@implementation C2

- (NSMutableString*) func{
	
	return [@"foo" mutableCopy];
}
@synthesize v;
@synthesize prop;

- (NSMutableString*) get_propAcc{
	
	return [@"1" mutableCopy];
}
- (NSMutableString*) set_propAcc:(id)v{
	
	return self.propAcc = [v toUpperCase];
}
- (id) init{
	
	self = [super init];
	self.v = [@"var" mutableCopy];
	self.prop = [@"prop" mutableCopy];
	[self set_propAcc:[@"0" mutableCopy]];
	return self;
}

@end

@implementation CChild


@end

@implementation CDyn


@end

@implementation EmptyClass

- (id) init{
	
	self = [super init];
	return self;
}

@end

@implementation ReallyEmptyClass


@end

@implementation ClassWithToString

- (NSMutableString*) toString{
	
	return [@"ClassWithToString.toString()" mutableCopy];
}
- (id) init{
	
	self = [super init];
	return self;
}

@end

@implementation ClassWithToStringChild


@end

@implementation ClassWithToStringChild2

- (NSMutableString*) toString{
	
	return [@"ClassWithToStringChild2.toString()" mutableCopy];
}

@end

@implementation ClassWithCtorDefaultValues

@synthesize a;
@synthesize b;
- (id) init:(int)a b:(NSMutableString*)b{
	
	self = [super init];
	// Optional arguments
	if (!b) b = [@"foo" mutableCopy];
	if (!a) a = 1;
	
	self.a = a;
	self.b = b;
	return self;
}

@end

@implementation ClassWithCtorDefaultValuesChild


@end

@implementation IntWrap

+ (int) compare:(IntWrap*)a b:(IntWrap*)b{
	
	return ( (a.i == b.i) ? 0 : ( (a.i > b.i) ? 1 : -1));
}
@synthesize i;
- (id) init:(int)i{
	
	self = [super init];
	self.i = i;
	return self;
}

@end

@implementation TestSpecification


@end
