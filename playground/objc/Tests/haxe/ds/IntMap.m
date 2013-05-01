//
//  IntMap
//  Tests
//
//  Source generated by Haxe Objective-C target
//

#import "../../haxe/ds/IntMap.h"

@implementation NSMutableDictionary ( IntMap )

- (void) set:(id)_tmp_key _tmp_value:(id)_tmp_value{
	int key = (int)_tmp_key; id value = (id)_tmp_value;
	[self setObject:value forKey:[NSString stringWithFormat:@"%i",key]];
}
- (id) get:(id)_tmp_key{
	int key = (int)_tmp_key;
	return [self objectForKey:[NSString stringWithFormat:@"%i",key]];
}
- (BOOL) exists:(id)_tmp_key{
	int key = (int)_tmp_key;
	return [self objectForKey:[NSString stringWithFormat:@"%i",key]] != nil;
}
- (BOOL) remove:(id)_tmp_key{
	int key = (int)_tmp_key;
	if ([self exists:key]) {
		[self removeObjectForKey:[NSString stringWithFormat:@"%i",key]];
		return YES;
	}
	return NO;
}
- (id) keys{
	
	NSMutableArray *a = [-FDynamic-self allKeys];
	return [a iterator];
}
- (id) iterator{
	
	NSMutableArray *a = [-FDynamic-self allValues];
	return [a iterator];
}
- (NSMutableString*) toString{
	return [-FDynamic-self description];
}
- (id) init{
	self = [super init];
	return self;
}

@end
