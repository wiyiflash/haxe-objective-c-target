//
//  Std
//  Tests
//
//  Source generated by Haxe Objective-C target
//

#import "Std.h"

@implementation Std

+ (BOOL) is:(id)v t:(id)t{
	return NO;
}
+ (NSMutableString*) string:(id)s{
	return [-FDynamic-s description];
}
+ (int) _int:(float)x{
	return (int)x;
}
+ (int) parseInt:(NSMutableString*)x{
	return [-FDynamic-x intValue];
}
+ (float) parseFloat:(NSMutableString*)x{
	return [-FDynamic-x floatValue];
}
+ (int) random:(int)x{
	if (x <= 0) return 0;
	return rand() % x;
}

@end
