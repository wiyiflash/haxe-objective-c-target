//
//  Expr
//  Test
//
//  Source generated by Haxe Objective-C target
//

#import "../../haxe/macro/Expr.h"

@implementation Error

@synthesize message;
@synthesize pos;
- (NSMutableString*) toString{
	
	return self.message;
}
- (id) init:(NSMutableString*)m p:(id)p{
	
	self = [super init];
	self.message = m;
	self.pos = p;
	return self;
}

@end
