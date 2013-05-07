//
//  List
//  Test
//
//  Source generated by Haxe Objective-C target
//

#import "List.h"

@implementation List

@synthesize h;
@synthesize q;
@synthesize length;
- (void) add:(id)item{
	
	NSMutableArray *x = [@[item] mutableCopy];
	if (self.h == nil) self.h = x;
	else [self.q hx_replaceObjectAtIndex:1 withObject:x];
	self.q = x;
	self.length++;
}
- (void) push:(id)item{
	
	NSMutableArray *x = [@[item, self.h] mutableCopy];
	self.h = x;
	if (self.q == nil) self.q = x;
	self.length++;
}
- (id) first{
	return ( (self.h == nil) ? nil : [self.h hx_objectAtIndex:0]);
}
- (id) pop{
	if (self.h == nil) return nil;
	id x = [self.h hx_objectAtIndex:0];
	self.h = [self.h hx_objectAtIndex:1];
	if (self.h == nil) self.q = nil;
	self.length--;
	return x;
}
- (BOOL) isEmpty{
	return self.h == nil;
}
- (id) iterator{
	return (id)[@{
		@"h":[self.h copy],
		@"hasNext":[^(){
		return self.h != [NSNull null];
	} copy],
		@"next":[^(){
		if (self.h == [NSNull null]) return [NSNull null];
		id x = [self.h hx_objectAtIndex:@0];
		self.h = [self.h hx_objectAtIndex:@1];
		return x;
	} copy],
	} mutableCopy];
}
- (id) init{
	self = [super init];
	self.length = 0;
	return self;
}

@end
