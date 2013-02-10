//
//  Hash
//  Tests
//
//  Source generated by Haxe Objective-C target
//

#import "Hash.h"

@implementation NSMutableDictionary ( Hash )

- (void) set:(NSMutableString*)key value:(id)value{
	[self setObject:value forKey:key];
}
- (id) get:(NSMutableString*)key{
	return [self objectForKey:key];
}
- (BOOL) exists:(NSMutableString*)key{
	return [self objectForKey:key] != nil;
}
- (BOOL) remove:(NSMutableString*)key{
	if ([self exists:key]) {
		[self removeObjectForKey:key];
		return YES;
	}
	return NO;
}
- (id) keys{
	
	NSMutableArray *a = (NSMutableArray*)[self allKeys];
	return [a iterator];
}
- (id) iterator{
	
	NSMutableArray *a = (NSMutableArray*)[self allValues];
	
	NSMutableArray *it = [[NSMutableArray alloc] initWithObjects:[a iterator], nil];
	
	NSMutableArray *me = [[NSMutableArray alloc] initWithObjects:self, nil];
	return struct {
	hasNext:^- (BOOL) {
		return [[it objectAtIndex:0] hasNext];
	}; next:^- (id) {
		return [[me objectAtIndex:0].__Internal __Field:[[it objectAtIndex:0] next] :YES];
	}
	} structName;
}
- (NSMutableString*) toString{
	return [self description];
}
- (id) init{
	self = [super init];
	return self;
}

@end
