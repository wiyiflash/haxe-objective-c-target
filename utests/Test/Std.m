//
//  Std
//  Test
//
//  Source generated by Haxe Objective-C target
//

#import "Std.h"

@implementation Std

+ (BOOL) is:(id)v t:(id)t{
	
	return NO;
}
+ (NSMutableString*) string:(id)s{
	
	return [s description];
}
+ (int) _int:(float)x{
	
	return (int)x;
}
+ (int) parseInt:(NSMutableString*)x{
	
	return [x intValue];
}
+ (float) parseFloat:(NSMutableString*)x{
	
	return [x floatValue];
}

@end
