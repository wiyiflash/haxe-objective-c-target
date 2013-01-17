//
//  Output
//  Tests
//
//  Source generated by Haxe Objective-C target
//

#import "Output.h"

@implementation Output
id me;

+ (float) LN2:(float)val {
	static float _val;
	if (val == nil) { if (_val == nil) _val = logf(2); }
	else { if (_val != nil) _val = val; }
	return _val;
}

void(^block_writeByte)(int c) = ^(int c) { [me writeByte:c]; };
- (void) writeByte:(int)c{
	@throw (NSMutableString*)@"Not implemented";;
}
int(^block_writeBytes)(Bytes *s, int pos, int len) = ^(Bytes *s, int pos, int len) { return [me writeBytes:s pos:pos len:len]; };
- (int) writeBytes:(Bytes*)s pos:(int)pos len:(int)len{
	int k = len;
	
	NSMutableArray *b = (NSMutableArray*)s.b;
	if (pos < 0 || len < 0 || pos + len > block_length) @throw Error OutsideBounds;;
	while (k > 0) {
		[self writeByte:[b objectAtIndex:pos]];
		pos++;
		k--;
	}
	return len;
}
void(^block_flush)() = ^() { [me flush]; };
- (void) flush{
}
void(^block_close)() = ^() { [me close]; };
- (void) close{
}
BOOL(^block_set_bigEndian)(BOOL b) = ^(BOOL b) { return [me set_bigEndian:b]; };
- (BOOL) set_bigEndian:(BOOL)b{
	self.bigEndian = b;
	return b;
}
void(^block_write)(Bytes *s) = ^(Bytes *s) { [me write:s]; };
- (void) write:(Bytes*)s{
	int l = s.length;
	int p = 0;
	while (l > 0) {
		int k = [self writeBytes:s pos:p len:l];
		if (k == 0) @throw Error Blocked;;
		p += k;
		l -= k;
	}
}
void(^block_writeFullBytes)(Bytes *s, int pos, int len) = ^(Bytes *s, int pos, int len) { [me writeFullBytes:s pos:pos len:len]; };
- (void) writeFullBytes:(Bytes*)s pos:(int)pos len:(int)len{
	while (len > 0) {
		int k = [self writeBytes:s pos:pos len:len];
		pos += k;
		len -= k;
	}
}
void(^block_writeFloat)(float x) = ^(float x) { [me writeFloat:x]; };
- (void) writeFloat:(float)x{
	if (x == 0.0) {
		[self writeByte:0];
		[self writeByte:0];
		[self writeByte:0];
		[self writeByte:0];
		return;
	}
	int exp = floorf(logf(fabsf(x))] / block_LN2)];
	int sig = floorf(fabsf(x) / block_pow(2, exp) * 8388608)] & 8388607;
	int b1 = exp + 127 >> 1 |  (( (exp > 0) ? ( (x < 0) ? 128 : 64) : ( (x < 0) ? 128 : 0))); int b2 = (exp + 127 << 7 & 255) | (sig >> 16 & 127); int b3 = sig >> 8 & 255; int b4 = sig & 255;
	if (self.bigEndian) {
		[self writeByte:b4];
		[self writeByte:b3];
		[self writeByte:b2];
		[self writeByte:b1];
	}
	else {
		[self writeByte:b1];
		[self writeByte:b2];
		[self writeByte:b3];
		[self writeByte:b4];
	}
}
void(^block_writeDouble)(float x) = ^(float x) { [me writeDouble:x]; };
- (void) writeDouble:(float)x{
	if (x == 0.0) {
		[self writeByte:0];
		[self writeByte:0];
		[self writeByte:0];
		[self writeByte:0];
		[self writeByte:0];
		[self writeByte:0];
		[self writeByte:0];
		[self writeByte:0];
		return;
	}
	int exp = floorf(logf(fabsf(x))] / block_LN2)];
	int sig = floorf(fabsf(x) / block_pow(2, exp) * block_pow(2, 52))];
	int sig_h = sig & (int)34359738367;
	int sig_l = floorf(sig / block_pow(2, 32))];
	int b1 = exp + 1023 >> 4 |  (( (exp > 0) ? ( (x < 0) ? 128 : 64) : ( (x < 0) ? 128 : 0))); int b2 = (exp + 1023 << 4 & 255) | (sig_l >> 16 & 15); int b3 = sig_l >> 8 & 255; int b4 = sig_l & 255; int b5 = sig_h >> 24 & 255; int b6 = sig_h >> 16 & 255; int b7 = sig_h >> 8 & 255; int b8 = sig_h & 255;
	if (self.bigEndian) {
		[self writeByte:b8];
		[self writeByte:b7];
		[self writeByte:b6];
		[self writeByte:b5];
		[self writeByte:b4];
		[self writeByte:b3];
		[self writeByte:b2];
		[self writeByte:b1];
	}
	else {
		[self writeByte:b1];
		[self writeByte:b2];
		[self writeByte:b3];
		[self writeByte:b4];
		[self writeByte:b5];
		[self writeByte:b6];
		[self writeByte:b7];
		[self writeByte:b8];
	}
}
void(^block_writeInt8)(int x) = ^(int x) { [me writeInt8:x]; };
- (void) writeInt8:(int)x{
	if (x < -128 || x >= 128) @throw Error Overflow;;
	[self writeByte:x & 255];
}
void(^block_writeInt16)(int x) = ^(int x) { [me writeInt16:x]; };
- (void) writeInt16:(int)x{
	if (x < -32768 || x >= 32768) @throw Error Overflow;;
	[self writeUInt16:x & 65535];
}
void(^block_writeUInt16)(int x) = ^(int x) { [me writeUInt16:x]; };
- (void) writeUInt16:(int)x{
	if (x < 0 || x >= 65536) @throw Error Overflow;;
	if (self.bigEndian) {
		[self writeByte:x >> 8];
		[self writeByte:x & 255];
	}
	else {
		[self writeByte:x & 255];
		[self writeByte:x >> 8];
	}
}
void(^block_writeInt24)(int x) = ^(int x) { [me writeInt24:x]; };
- (void) writeInt24:(int)x{
	if (x < -8388608 || x >= 8388608) @throw Error Overflow;;
	[self writeUInt24:x & 16777215];
}
void(^block_writeUInt24)(int x) = ^(int x) { [me writeUInt24:x]; };
- (void) writeUInt24:(int)x{
	if (x < 0 || x >= 16777216) @throw Error Overflow;;
	if (self.bigEndian) {
		[self writeByte:x >> 16];
		[self writeByte:x >> 8 & 255];
		[self writeByte:x & 255];
	}
	else {
		[self writeByte:x & 255];
		[self writeByte:x >> 8 & 255];
		[self writeByte:x >> 16];
	}
}
void(^block_writeInt31)(int x) = ^(int x) { [me writeInt31:x]; };
- (void) writeInt31:(int)x{
	if (x < -1073741824 || x >= 1073741824) @throw Error Overflow;;
	if (self.bigEndian) {
		[self writeByte:x >>> 24];
		[self writeByte:x >> 16 & 255];
		[self writeByte:x >> 8 & 255];
		[self writeByte:x & 255];
	}
	else {
		[self writeByte:x & 255];
		[self writeByte:x >> 8 & 255];
		[self writeByte:x >> 16 & 255];
		[self writeByte:x >>> 24];
	}
}
void(^block_writeUInt30)(int x) = ^(int x) { [me writeUInt30:x]; };
- (void) writeUInt30:(int)x{
	if (x < 0 || x >= 1073741824) @throw Error Overflow;;
	if (self.bigEndian) {
		[self writeByte:x >>> 24];
		[self writeByte:x >> 16 & 255];
		[self writeByte:x >> 8 & 255];
		[self writeByte:x & 255];
	}
	else {
		[self writeByte:x & 255];
		[self writeByte:x >> 8 & 255];
		[self writeByte:x >> 16 & 255];
		[self writeByte:x >>> 24];
	}
}
void(^block_writeInt32)(CppInt32__ *x) = ^(CppInt32__ *x) { [me writeInt32:x]; };
- (void) writeInt32:(CppInt32__*)x{
	if (self.bigEndian) {
		[self writeByte:[CppInt32__ toInt:[CppInt32__ ushr:x b:24]]];
		[self writeByte:[CppInt32__ toInt:[CppInt32__ ushr:x b:16]] & 255];
		[self writeByte:[CppInt32__ toInt:[CppInt32__ ushr:x b:8]] & 255];
		[self writeByte:[CppInt32__ toInt:[CppInt32__ _and:x b:[CppInt32__ ofInt:255]]]];
	}
	else {
		[self writeByte:[CppInt32__ toInt:[CppInt32__ _and:x b:[CppInt32__ ofInt:255]]]];
		[self writeByte:[CppInt32__ toInt:[CppInt32__ ushr:x b:8]] & 255];
		[self writeByte:[CppInt32__ toInt:[CppInt32__ ushr:x b:16]] & 255];
		[self writeByte:[CppInt32__ toInt:[CppInt32__ ushr:x b:24]]];
	}
}
void(^block_prepare)(int nbytes) = ^(int nbytes) { [me prepare:nbytes]; };
- (void) prepare:(int)nbytes{
}
void(^block_writeInput)(Input *i, int bufsize) = ^(Input *i, int bufsize) { [me writeInput:i bufsize:bufsize]; };
- (void) writeInput:(Input*)i bufsize:(int)bufsize{
	// Simulated optional arguments
	if (bufsize == nil) bufsize = nil;
	
	if (bufsize == nil) bufsize = 4096;
	
	Bytes *buf = [Bytes alloc:bufsize];
	@try {
		while (YES) {
			int len = [i readBytes:buf pos:0 len:bufsize];
			if (len == 0) @throw Error Blocked;;
			int p = 0;
			while (len > 0) {
				int k = [self writeBytes:buf pos:p len:len];
				if (k == 0) @throw Error Blocked;;
				p += k;
				len -= k;
			}
		}
	}
	@catch (NSException *e) {
	}
}
void(^block_writeString)(NSMutableString *s) = ^(NSMutableString *s) { [me writeString:s]; };
- (void) writeString:(NSMutableString*)s{
	
	Bytes *b = [Bytes ofString:s];
	[self writeFullBytes:b pos:0 len:b length];
}

@end
