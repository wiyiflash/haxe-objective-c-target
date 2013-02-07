//
//  Log
//  Tests
//
//  Source generated by Haxe Objective-C target
//

#import "Log.h"

@implementation Log

// Defining a dynamic method
+ (void) trace:(id)v infos:(id)infos{
	// Simulated optional arguments
	if (infos == nil) infos = nil;
	
	NSLog (@"%@:%@: %@", [infos objectForKey:@"fileName"], [infos objectForKey:@"lineNumber"], v);
}
@synthesize property_trace;


@end