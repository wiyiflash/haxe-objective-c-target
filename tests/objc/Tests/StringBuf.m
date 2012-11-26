#import "StringBuf.h"

@implementation StringBuf

@synthesize b;
- (void) add:(id)x{
	self.b += [Std string:x];
}
- (void) addChar:(int)c{
	self.b += [NSMutableStringfromCharCode:c];
}
- (void) addSub:(NSMutableString*)s pos:(int)pos len:(id)len{
	self.b += [s substringWithRange:pos len:len];
}
- (NSMutableString*) toString{
	return self.b;
}
- (id) new{
	self = [super init];
	self.b = @"";
	return self;
}

@end
