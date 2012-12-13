//
//  main.m
//  app_delegate_class
//
//  Source generated by Haxe Objective-C target
//

#import "BytesBuffer.h"

@implementation BytesBuffer

@synthesize b;
- (void) addByte:(int)byte{
	[self b push:byte];
}
- (void) add:(Bytes*)src{
	
	NSMutableArray *b1 = self.b;
	
	NSMutableArray *b2 = src.b;
	{
		int _g1 = 0; int _g = src.length;
		while (_g1 < _g) {
			int i = _g1++;
			[self b push:[b2 objectAtIndex:i]];
		}
	}
}
- (void) addBytes:(Bytes*)src pos:(int)pos len:(int)len{
	if (pos < 0 || len < 0 || pos + len > src.length) throw Error.OutsideBounds;
	
	NSMutableArray *b1 = self.b;
	
	NSMutableArray *b2 = src.b;
	{
		int _g1 = pos; int _g = pos + len;
		while (_g1 < _g) {
			int i = _g1++;
			[self b push:[b2 objectAtIndex:i]];
		}
	}
}
- (Bytes*) getBytes{
	
	Bytes *bytes = [[Bytes alloc] new:self.b.length,self.b];
	self.b = nil;
	return bytes;
}
- (id) new{
	self = [super init];
	self.b = [[NSMutableArray alloc] new];
	return self;
}

@end
