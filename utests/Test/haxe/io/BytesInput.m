//
//  BytesInput
//  Test
//
//  Source generated by Haxe Objective-C target
//

#import "../../haxe/io/BytesInput.h"

@implementation BytesInput

@synthesize b;
@synthesize pos;
@synthesize len;
- (int) readByte{
	
	if (self.len == 0) @throw [[Eof alloc] init];;
	self.len--;
	return ((CASTTType*)[self.b hx_objectAtIndex:self.pos++]);
}
- (int) readBytes:(Bytes*)buf pos:(int)pos len:(int)len{
	
	if (pos < 0 || len < 0 || pos + len > buf.length) @throw OutsideBounds;;
	if (self.len == 0 && len > 0) @throw [[Eof alloc] init];;
	if (self.len < len) len = self.len;
	
	NSMutableArray *b1 = self.b;
	
	NSMutableArray *b2 = buf.b;
	{
		
		int _g = 0;
		while (_g < (int)len) {
			
			int i = _g++;
			[b2 hx_replaceObjectAtIndex:pos + i withObject:b1 hx_replaceObjectAtIndex:self.pos + i];
		}
	}
	self.pos += len;
	self.len -= len;
	return len;
}
- (id) init:(Bytes*)b pos:(int)pos len:(int)len{
	
	self = [super init];
	// Optional arguments
	if (!len) len = nil;
	if (!pos) pos = nil;
	
	if (pos == nil) pos = 0;
	if (len == nil) len = b.length - pos;
	if (pos < 0 || len < 0 || pos + len > b.length) @throw OutsideBounds;;
	self.b = b.b;
	self.pos = pos;
	self.len = len;
	return self;
}

@end
