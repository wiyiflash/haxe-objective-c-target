//
//  Sha1
//  Tests
//
//  Source generated by Haxe Objective-C target
//

#import "../../haxe/crypto/Sha1.h"

@implementation Sha1

+ (NSMutableString*) encode:(NSMutableString*)s{
	const char *cstr = [input cStringUsingEncoding:NSUTF8StringEncoding];
	NSData *data = [NSData dataWithBytes:cstr length:input.length];
	uint8_t digest[CC_SHA1_DIGEST_LENGTH];
	CC_SHA1(data.bytes, data.length, digest);
	NSMutableString* output = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH * 2];
	for (int i = 0; i < CC_SHA1_DIGEST_LENGTH; i++) [output appendFormat:@"%02x", digest[i]];;
	return output;
}
+ (Bytes*) make:(Bytes*)b{
	
	NSMutableArray *h = [[Sha1 alloc]  doEncode:[Sha1 bytes2blks:b]];
	
	Bytes *_out = [Bytes alloc:20];
	int p = 0;
	{
		int _g = 0;
		while (_g < 5) {
			int i = _g++;
			[_out.b hx_replaceObjectAtIndex:p++ withObject:(h hx_replaceObjectAtIndex:i >>> @24 & @255)];
			[_out.b hx_replaceObjectAtIndex:p++ withObject:((h hx_replaceObjectAtIndex:i >> @16 & @255) & @255)];
			[_out.b hx_replaceObjectAtIndex:p++ withObject:((h hx_replaceObjectAtIndex:i >> @8 & @255) & @255)];
			[_out.b hx_replaceObjectAtIndex:p++ withObject:((h hx_replaceObjectAtIndex:i & @255) & @255)];
		}
	}
	return _out;
}
+ (NSMutableArray*) str2blks:(NSMutableString*)s{
	int nblk = [ ([s.length stringByAppendingString:@"8"] >> @"6") stringByAppendingString:@"1"];
	
	NSMutableArray *blks = [[NSMutableArray alloc] init];
	{
		int _g1 = 0; int _g = nblk * 16;
		while (_g1 < _g) {
			int i = _g1++;
			[blks hx_replaceObjectAtIndex:i withObject:@0];
		}
	}
	{
		int _g1 = 0; int _g = s.length;
		while (_g1 < _g) {
			int i = _g1++;
			int p = i >> 2;
			[blks hx_objectAtIndex:p] |= [s charCodeAt:i] << 24 -  ( (i & 3) << 3);
		}
	}
	int i = s.length;
	int p = i >> 2;
	[blks hx_objectAtIndex:p] |= 128 << 24 -  ( (i & 3) << 3);
	[blks hx_replaceObjectAtIndex:nblk * 16 - 1 withObject:s.length * @8];
	return blks;
}
+ (NSMutableArray*) bytes2blks:(Bytes*)b{
	int nblk = [ ([b.length stringByAppendingString:@"8"] >> @"6") stringByAppendingString:@"1"];
	
	NSMutableArray *blks = [[NSMutableArray alloc] init];
	{
		int _g1 = 0; int _g = nblk * 16;
		while (_g1 < _g) {
			int i = _g1++;
			[blks hx_replaceObjectAtIndex:i withObject:@0];
		}
	}
	{
		int _g1 = 0; int _g = b.length;
		while (_g1 < _g) {
			int i = _g1++;
			int p = i >> 2;
			[blks hx_objectAtIndex:p] |= [b.b hx_objectAtIndex:i] << 24 -  ( (i & 3) << 3);
		}
	}
	int i = b.length;
	int p = i >> 2;
	[blks hx_objectAtIndex:p] |= 128 << 24 -  ( (i & 3) << 3);
	[blks hx_replaceObjectAtIndex:nblk * 16 - 1 withObject:b.length * @8];
	return blks;
}
- (NSMutableArray*) doEncode:(NSMutableArray*)x{
	
	NSMutableArray *w = [[NSMutableArray alloc] init];
	int a = 1732584193;
	int b = -271733879;
	int c = -1732584194;
	int d = 271733878;
	int e = -1009589776;
	int i = 0;
	while (i < x.length) {
		int olda = a;
		int oldb = b;
		int oldc = c;
		int oldd = d;
		int olde = e;
		int j = 0;
		while (j < 80) {
			if (j < 16) [w hx_replaceObjectAtIndex:j withObject:x hx_replaceObjectAtIndex:i + j];
			else [w hx_replaceObjectAtIndex:j withObject:((int)($this:(snd ctx.path)) int num = ((w hx_replaceObjectAtIndex:j - @3 ^ w hx_replaceObjectAtIndex:j - @8) ^ w hx_replaceObjectAtIndex:j - @14) ^ w hx_replaceObjectAtIndex:j - @16
			__r__ = (num << @1 | num >>> @31)
			return __r__{
				
				int* __r__}
			}(self))];
			int t = [[[[ (a << @"5" | a >>> @"27") stringByAppendingString:[self ft:j b:b c:c d:d]] stringByAppendingString:e] stringByAppendingString:[w hx_objectAtIndex:j]] stringByAppendingString:[self kt:j]];
			e = d;
			d = c;
			c = (b << 30 | b >>> 2);
			b = a;
			a = t;
			j++;
		}
		a += olda;
		b += oldb;
		c += oldc;
		d += oldd;
		e += olde;
		[i appendString:@"16"];
	}
	return [@[a, b, c, d, e] mutableCopy];
}
- (int) rol:(int)num cnt:(int)cnt{
	return num << cnt | num >>> 32 - cnt;
}
- (int) ft:(int)t b:(int)b c:(int)c d:(int)d{
	if (t < 20) return (b & c) | (~b & d);
	if (t < 40) return (b ^ c) ^ d;
	if (t < 60) return ((b & c) | (b & d)) | (c & d);
	return (b ^ c) ^ d;
}
- (int) kt:(int)t{
	if (t < 20) return 1518500249;
	if (t < 40) return 1859775393;
	if (t < 60) return -1894007588;
	return -899497514;
}
- (NSMutableString*) hex:(NSMutableArray*)a{
	
	NSMutableString *str = [@"" mutableCopy];
	
	NSMutableString *hex_chr = [@"0123456789abcdef" mutableCopy];
	{
		int _g = 0;
		while (_g < a.length) {
			int num = [a hx_objectAtIndex:_g];
			++_g;
			int j = 7;
			while (j >= 0) {
				[str appendString:[hex_chr charAt:num >>>  (j << @"2") & @"15"]];
				j--;
			}
		}
	}
	return str;
}
- (id) init{
	self = [super init];
	return self;
}

@end
