//
//  ObjectMap
//  Test
//
//  Source generated by Haxe Objective-C target
//

#import "../../haxe/ds/ObjectMap.h"

@implementation NSMutableDictionary ( ObjectMap )

- (id) get:(id)_tmp_key{
	
	id key = (id)_tmp_key;
	return [self objectForKey:[NSString stringWithFormat:@"%@",key]];
}
- (void) set:(id)_tmp_key _tmp_value:(id)_tmp_value{
	
	id key = (id)_tmp_key; id value = (id)_tmp_value;
	[self setObject:value forKey:[NSString stringWithFormat:@"%@",key]];
}
- (BOOL) exists:(id)_tmp_key{
	
	id key = (id)_tmp_key;
	return [self objectForKey:[NSString stringWithFormat:@"%@",key]] != nil;
}
- (BOOL) remove:(id)_tmp_key{
	
	id key = (id)_tmp_key;
	if ([self exists:key]) {
		
		[self removeObjectForKey:[NSString stringWithFormat:@"%@",key]];
		return YES;
	}
	return NO;
}
- (id) keys{
	
	
	NSMutableArray *a = [self allKeys];
	return [a iterator];
}
- (id) iterator{
	
	
	NSMutableArray *a = [self allValues];
	return [a iterator];
}
- (NSMutableString*) toString{
	
	
	NSMutableString *s = [@"" mutableCopy];
	id it = [self keys];
	{
		id _it = it;
		while ( [_it hasNext] ) do {
			id i = [_it next];
			{
				
				[s appendString:[ (( (s == [@"" mutableCopy]) ? [@"" mutableCopy] : [@"," mutableCopy])) stringByAppendingString:[Std string:i]]];
				[s appendString:[@" => " mutableCopy]];
				[s appendString:[Std string:[self get:i]]];
			};
		}
	}
	return [s stringByAppendingString:[@"}" mutableCopy]];
}
- (id) init{
	
	self = [super init];
	return self;
}

@end
