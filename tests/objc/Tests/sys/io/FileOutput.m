//
//  FileOutput
//  Tests
//
//  Source generated by Haxe Objective-C target
//

#import "../../sys/io/FileOutput.h"

@implementation FileOutput

@synthesize __f;
- (void) writeByte:(int)c{
}
- (int) writeBytes:(Bytes*)s p:(int)p l:(int)l{
	return 0;
}
- (void) flush{
}
- (void) close{
	[super close];
}
- (void) seek:(int)p pos:(FileSeek*)pos{
}
- (int) tell{
	return 0;
}
- (id) init:(id)f{
	self = [super init];
	self.__f = f;
	return self;
}

@end
