//
//  FileInput
//  Tests
//
//  Source generated by Haxe Objective-C target
//

#import "FileInput.h"

@implementation FileInput

@synthesize __f;
- (int) readByte{
	return 0;
}
- (int) readBytes:(Bytes*)s p:(int)p l:(int)l{
	return 0;
}
- (void) close{
	[super close];
}
- (void) seek:(int)p pos:(FileSeek*)pos{
}
- (int) tell{
	return 0;
}
- (BOOL) eof{
	return NO;
}
- (id) init:(id)f{
	self = [super init];
	self.__f = f;
	return self;
}

@end
