//
//  Input
//  Test
//
//  Source generated by Haxe Objective-C target
//

#import "../../haxe/io/Input.h"

@implementation Input


- (int) readByte{
	
	return ((int)($this:(snd ctx.path)) @throw [@"Not implemented" mutableCopy];
	return __r__{
		
		int* __r__}
	}(self));
}
- (int) readBytes:(Bytes*)s pos:(int)pos len:(int)len{
	
	int k = len;
	
	NSMutableArray *b = s.b;
	if (pos < 0 || len < 0 || pos + len > s.length) @throw OutsideBounds;;
	while (k > 0) {
		
		[b hx_replaceObjectAtIndex:pos withObject:(int)[self readByte]];
		pos++;
		k--;
	}
	return len;
}
- (BOOL) set_bigEndian:(BOOL)b{
	
	self.bigEndian = b;
	return b;
}
- (Bytes*) readAll:(int)bufsize{
	
	// Optional arguments
	if (!bufsize) bufsize = nil;
	
	if (bufsize == nil) bufsize = 16384;
	
	Bytes *buf = [Bytes alloc:bufsize];
	
	BytesBuffer *total = [[BytesBuffer alloc] init];
	@try {
		
		while (YES) {
			
			int len = [self readBytes:buf pos:0 len:bufsize];
			if (len == 0) @throw Blocked;;
			if (len < 0 || len > buf.length) @throw OutsideBounds;;
		}
	}
	@catch (NSException *e) {
		
	}
	return [total getBytes];
}
- (void) readFullBytes:(Bytes*)s pos:(int)pos len:(int)len{
	
	while (len > 0) {
		
		int k = [self readBytes:s pos:pos len:len];
		pos += k;
		len -= k;
	}
}
- (Bytes*) read:(int)nbytes{
	
	
	Bytes *s = [Bytes alloc:nbytes];
	int p = 0;
	while (nbytes > 0) {
		
		int k = [self readBytes:s pos:p len:nbytes];
		if (k == 0) @throw Blocked;;
		p += k;
		nbytes -= k;
	}
	return s;
}
- (float) readFloat{
	
	
	NSMutableArray *bytes = [@[] mutableCopy];
	[bytes push:(int)[self readByte]];
	[bytes push:(int)[self readByte]];
	[bytes push:(int)[self readByte]];
	[bytes push:(int)[self readByte]];
	if (self.bigEndian) [bytes reverse];
	int sign = 1 -  (((NSMutableArray*)[bytes hx_objectAtIndex:0]) >> 7 << 1);
	int exp =  ((((NSMutableArray*)[bytes hx_objectAtIndex:0]) << 1 & 255) | ((NSMutableArray*)[bytes hx_objectAtIndex:1]) >> 7) - 127;
	int sig = ( (((NSMutableArray*)[bytes hx_objectAtIndex:1]) & 127) << 16 | ((NSMutableArray*)[bytes hx_objectAtIndex:2]) << 8) | ((NSMutableArray*)[bytes hx_objectAtIndex:3]);
	if (sig == 0 && exp == -127) return 0.0;
	return sign *  (1 + powf(2, -23) * sig) * powf(2, exp);
}
- (float) readDouble{
	
	return ((float)($this:(snd ctx.path)) @throw [@"not implemented" mutableCopy];
	return __r__{
		
		float* __r__}
	}(self));
}
- (int) readInt8{
	
	int n = [self readByte];
	if (n >= 128) return n - 256;
	return n;
}
- (int) readInt16{
	
	int ch1 = [self readByte];
	int ch2 = [self readByte];
	int n = ( (self.bigEndian) ? ch2 | ch1 << 8 : ch1 | ch2 << 8);
	if ( (n & 32768) != 0) return n - 65536;
	return n;
}
- (int) readUInt16{
	
	int ch1 = [self readByte];
	int ch2 = [self readByte];
	return ( (self.bigEndian) ? ch2 | ch1 << 8 : ch1 | ch2 << 8);
}
- (int) readInt24{
	
	int ch1 = [self readByte];
	int ch2 = [self readByte];
	int ch3 = [self readByte];
	int n = ( (self.bigEndian) ? (ch3 | ch2 << 8) | ch1 << 16 : (ch1 | ch2 << 8) | ch3 << 16);
	if ( (n & 8388608) != 0) return n - 16777216;
	return n;
}
- (int) readUInt24{
	
	int ch1 = [self readByte];
	int ch2 = [self readByte];
	int ch3 = [self readByte];
	return ( (self.bigEndian) ? (ch3 | ch2 << 8) | ch1 << 16 : (ch1 | ch2 << 8) | ch3 << 16);
}
- (int) readInt32{
	
	int ch1 = [self readByte];
	int ch2 = [self readByte];
	int ch3 = [self readByte];
	int ch4 = [self readByte];
	return ( (self.bigEndian) ? ((ch4 | ch3 << 8) | ch2 << 16) | ch1 << 24 : ((ch1 | ch2 << 8) | ch3 << 16) | ch4 << 24);
}
- (NSMutableString*) readString:(int)len{
	
	
	Bytes *b = [Bytes alloc:len];
	[self readFullBytes:b pos:0 len:len];
	return [b toString];
}

@end
