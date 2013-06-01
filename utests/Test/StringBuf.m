//
//  StringBuf
//  Test
//
//  Source generated by Haxe Objective-C target
//

#import "StringBuf.h"

@implementation StringBuf

@synthesize b;

- (int) get_length{
	
	return self.b.length;
}
- (void) add:(id)x{
	
	[self.b appendString:[Std string:x]];
}
- (void) addChar:(int)c{
	
	[self.b appendString:[NSMutableString:c]];
}
- (void) addSub:(NSMutableString*)s pos:(int)pos len:(int)len{
	
	// Optional arguments
	if (!len) len = nil;
	
	[self.b appendString:( (len == nil) ? [s substr:pos len:nil] : [s substr:pos len:len])];
}
- (NSMutableString*) toString{
	
	return self.b;
}
- (id) init{
	
	self = [super init];
	self.b = [@"" mutableCopy];
	return self;
}

@end
