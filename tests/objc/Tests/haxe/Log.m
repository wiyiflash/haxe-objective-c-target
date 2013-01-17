//
//  Log
//  Tests
//
//  Source generated by Haxe Objective-C target
//

#import "Log.h"

@implementation Log

// Defining a dynamic method
void(^block_trace)(id v, id infos) = ^(id v, id infos) { [me trace:v infos:infos]; };
+ (void) trace:(id)v infos:(id)infos{
	// Simulated optional arguments
	if (infos == nil) infos = nil;
	
	NSLog (@"%@:%@: %@", [infos objectForKey:@"fileName"], [infos objectForKey:@"lineNumber"], v);
}
@synthesize block_trace;

// Defining a dynamic method
void(^block_clear)() = ^() { [me clear]; };
+ (void) clear{
}
@synthesize block_clear;


@end
