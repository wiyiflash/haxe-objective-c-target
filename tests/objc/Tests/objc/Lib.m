//
//  Lib
//  Tests
//
//  Source generated by Haxe Objective-C target
//

#import "../objc/Lib.h"

@implementation Lib

+ (void) log:(id)v{
	NSLog (@"%@", v);
}
+ (void) print:(id)v{
	printf ( [[v description] cStringUsingEncoding:NSStringEncodingConversionAllowLossy] );
}
+ (void) println:(id)v{
	[Lib print:v];
	printf ( "\n" );
}
+ (CLLocation*) location{
	return nil;
}

@end
