//
//  Md5
//  Tests
//
//  Source generated by Haxe Objective-C target
//

#import "../../haxe/crypto/Md5.h"

@implementation Md5

+ (NSMutableString*) encode:(NSMutableString*)s{
	
	const char *cStr = [input UTF8String];
	unsigned char digest[16];
	CC_MD5( cStr, strlen(cStr), digest ); // This is the md5 call
	NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
	for (int i = 0; i < CC_MD5_DIGEST_LENGTH; i++) [output appendFormat:@"%02x", digest[i]];;
	return output;
}
+ (Bytes*) make:(Bytes*)b{
	
	
	NSMutableArray *h = [[Md5 alloc]  doEncode:[Md5 bytes2blks:b]];
	
	Bytes *_out = [Bytes alloc:16];
	int p = 0;
	{
		
		int _g = 0;
		while (_g < 4) {
			
			int i = _g++;
			[_out.b hx_replaceObjectAtIndex:p++ withObject:((h hx_replaceObjectAtIndex:i & @255) & @255)];
			[_out.b hx_replaceObjectAtIndex:p++ withObject:((h hx_replaceObjectAtIndex:i >> @8 & @255) & @255)];
			[_out.b hx_replaceObjectAtIndex:p++ withObject:((h hx_replaceObjectAtIndex:i >> @16 & @255) & @255)];
			[_out.b hx_replaceObjectAtIndex:p++ withObject:(h hx_replaceObjectAtIndex:i >>> @24 & @255)];
		}
	}
	return _out;
}
+ (NSMutableArray*) bytes2blks:(Bytes*)b{
	
	int nblk =  (b.length + 8 >> 6) + 1;
	
	NSMutableArray *blks = [[NSMutableArray alloc] init];
	int blksSize = nblk * 16;
	{
		
		int _g = 0;
		while (_g < (int)blksSize) {
			
			int i = _g++;
			[blks hx_replaceObjectAtIndex:i withObject:@0];
		}
	}
	int i = 0;
	while (i < b.length) {
		
		((NSMutableArray*)[blks hx_objectAtIndex:i >> 2]) |= ((CASTTType*)[b.b hx_objectAtIndex:i]) <<  ( ( (b.length << 3) + i & 3) << 3);
		i++;
	}
	((NSMutableArray*)[blks hx_objectAtIndex:i >> 2]) |= 128 <<  (b.length * 8 + i) % 4 * 8;
	int l = b.length * 8;
	int k = nblk * 16 - 2;
	[blks hx_replaceObjectAtIndex:k withObject:(l & @255)];
	((NSMutableArray*)[blks hx_objectAtIndex:k]) |=  (l >>> 8 & 255) << 8;
	((NSMutableArray*)[blks hx_objectAtIndex:k]) |=  (l >>> 16 & 255) << 16;
	((NSMutableArray*)[blks hx_objectAtIndex:k]) |=  (l >>> 24 & 255) << 24;
	return blks;
}
+ (NSMutableArray*) str2blks:(NSMutableString*)str{
	
	int nblk =  (str.length + 8 >> 6) + 1;
	
	NSMutableArray *blks = [[NSMutableArray alloc] init];
	int blksSize = nblk * 16;
	{
		
		int _g = 0;
		while (_g < (int)blksSize) {
			
			int i = _g++;
			[blks hx_replaceObjectAtIndex:i withObject:@0];
		}
	}
	int i = 0;
	while (i < str.length) {
		
		((NSMutableArray*)[blks hx_objectAtIndex:i >> 2]) |= [str hx_dyn_charCodeAt:i] <<  (str.length * 8 + i) % 4 * 8;
		i++;
	}
	((NSMutableArray*)[blks hx_objectAtIndex:i >> 2]) |= 128 <<  (str.length * 8 + i) % 4 * 8;
	int l = str.length * 8;
	int k = nblk * 16 - 2;
	[blks hx_replaceObjectAtIndex:k withObject:(l & @255)];
	((NSMutableArray*)[blks hx_objectAtIndex:k]) |=  (l >>> 8 & 255) << 8;
	((NSMutableArray*)[blks hx_objectAtIndex:k]) |=  (l >>> 16 & 255) << 16;
	((NSMutableArray*)[blks hx_objectAtIndex:k]) |=  (l >>> 24 & 255) << 24;
	return blks;
}
- (int) bitOR:(int)a b:(int)b{
	
	int lsb = (a & 1) | (b & 1);
	int msb31 = a >>> 1 | b >>> 1;
	return msb31 << 1 | lsb;
}
- (int) bitXOR:(int)a b:(int)b{
	
	int lsb = (a & 1) ^ (b & 1);
	int msb31 = a >>> 1 ^ b >>> 1;
	return msb31 << 1 | lsb;
}
- (int) bitAND:(int)a b:(int)b{
	
	int lsb = (a & 1) &  (b & 1);
	int msb31 = a >>> 1 & b >>> 1;
	return msb31 << 1 | lsb;
}
- (int) addme:(int)x y:(int)y{
	
	int lsw =  (x & 65535) +  (y & 65535);
	int msw =  (x >> 16) +  (y >> 16) +  (lsw >> 16);
	return msw << 16 | (lsw & 65535);
}
- (NSMutableString*) hex:(NSMutableArray*)a{
	
	
	NSMutableString *str = [@"" mutableCopy];
	
	NSMutableString *hex_chr = [@"0123456789abcdef" mutableCopy];
	{
		
		int _g = 0;
		while (_g < a.length) {
			
			int num = ((CASTTAbstract*)[a hx_objectAtIndex:_g]);
			++_g;
			int _g1 = 0;
			while (_g1 < 4) {
				
				int j = _g1++;
				[str appendString:[[hex_chr charAt:num >> j * @"8" + @"4" & @"15"] stringByAppendingString:[hex_chr charAt:num >> j * @"8" & @"15"]]];
			}
		}
	}
	return str;
}
- (int) rol:(int)num cnt:(int)cnt{
	
	return num << cnt | num >>> 32 - cnt;
}
- (int) cmn:(int)q a:(int)a b:(int)b x:(int)x s:(int)s t:(int)t{
	
	return [self addme:[self rol:[self addme:[self addme:a y:q] y:[self addme:x y:t]] cnt:s] y:b];
}
- (int) ff:(int)a b:(int)b c:(int)c d:(int)d x:(int)x s:(int)s t:(int)t{
	
	return [self cmn:[self bitOR:[self bitAND:b b:c] b:[self bitAND:~b b:d]] a:a b:b x:x s:s t:t];
}
- (int) gg:(int)a b:(int)b c:(int)c d:(int)d x:(int)x s:(int)s t:(int)t{
	
	return [self cmn:[self bitOR:[self bitAND:b b:d] b:[self bitAND:c b:~d]] a:a b:b x:x s:s t:t];
}
- (int) hh:(int)a b:(int)b c:(int)c d:(int)d x:(int)x s:(int)s t:(int)t{
	
	return [self cmn:[self bitXOR:[self bitXOR:b b:c] b:d] a:a b:b x:x s:s t:t];
}
- (int) ii:(int)a b:(int)b c:(int)c d:(int)d x:(int)x s:(int)s t:(int)t{
	
	return [self cmn:[self bitXOR:c b:[self bitOR:b b:~d]] a:a b:b x:x s:s t:t];
}
- (NSMutableArray*) doEncode:(NSMutableArray*)x{
	
	int a = 1732584193;
	int b = -271733879;
	int c = -1732584194;
	int d = 271733878;
	int step;
	int i = 0;
	while (i < x.length) {
		
		int olda = a;
		int oldb = b;
		int oldc = c;
		int oldd = d;
		step = 0;
		a = [self ff:a b:b c:c d:d x:((CASTTAbstract*)[x hx_objectAtIndex:i]) s:7 t:-680876936];
		d = [self ff:d b:a c:b d:c x:((CASTTAbstract*)[x hx_objectAtIndex:i + 1]) s:12 t:-389564586];
		c = [self ff:c b:d c:a d:b x:((CASTTAbstract*)[x hx_objectAtIndex:i + 2]) s:17 t:606105819];
		b = [self ff:b b:c c:d d:a x:((CASTTAbstract*)[x hx_objectAtIndex:i + 3]) s:22 t:-1044525330];
		a = [self ff:a b:b c:c d:d x:((CASTTAbstract*)[x hx_objectAtIndex:i + 4]) s:7 t:-176418897];
		d = [self ff:d b:a c:b d:c x:((CASTTAbstract*)[x hx_objectAtIndex:i + 5]) s:12 t:1200080426];
		c = [self ff:c b:d c:a d:b x:((CASTTAbstract*)[x hx_objectAtIndex:i + 6]) s:17 t:-1473231341];
		b = [self ff:b b:c c:d d:a x:((CASTTAbstract*)[x hx_objectAtIndex:i + 7]) s:22 t:-45705983];
		a = [self ff:a b:b c:c d:d x:((CASTTAbstract*)[x hx_objectAtIndex:i + 8]) s:7 t:1770035416];
		d = [self ff:d b:a c:b d:c x:((CASTTAbstract*)[x hx_objectAtIndex:i + 9]) s:12 t:-1958414417];
		c = [self ff:c b:d c:a d:b x:((CASTTAbstract*)[x hx_objectAtIndex:i + 10]) s:17 t:-42063];
		b = [self ff:b b:c c:d d:a x:((CASTTAbstract*)[x hx_objectAtIndex:i + 11]) s:22 t:-1990404162];
		a = [self ff:a b:b c:c d:d x:((CASTTAbstract*)[x hx_objectAtIndex:i + 12]) s:7 t:1804603682];
		d = [self ff:d b:a c:b d:c x:((CASTTAbstract*)[x hx_objectAtIndex:i + 13]) s:12 t:-40341101];
		c = [self ff:c b:d c:a d:b x:((CASTTAbstract*)[x hx_objectAtIndex:i + 14]) s:17 t:-1502002290];
		b = [self ff:b b:c c:d d:a x:((CASTTAbstract*)[x hx_objectAtIndex:i + 15]) s:22 t:1236535329];
		a = [self gg:a b:b c:c d:d x:((CASTTAbstract*)[x hx_objectAtIndex:i + 1]) s:5 t:-165796510];
		d = [self gg:d b:a c:b d:c x:((CASTTAbstract*)[x hx_objectAtIndex:i + 6]) s:9 t:-1069501632];
		c = [self gg:c b:d c:a d:b x:((CASTTAbstract*)[x hx_objectAtIndex:i + 11]) s:14 t:643717713];
		b = [self gg:b b:c c:d d:a x:((CASTTAbstract*)[x hx_objectAtIndex:i]) s:20 t:-373897302];
		a = [self gg:a b:b c:c d:d x:((CASTTAbstract*)[x hx_objectAtIndex:i + 5]) s:5 t:-701558691];
		d = [self gg:d b:a c:b d:c x:((CASTTAbstract*)[x hx_objectAtIndex:i + 10]) s:9 t:38016083];
		c = [self gg:c b:d c:a d:b x:((CASTTAbstract*)[x hx_objectAtIndex:i + 15]) s:14 t:-660478335];
		b = [self gg:b b:c c:d d:a x:((CASTTAbstract*)[x hx_objectAtIndex:i + 4]) s:20 t:-405537848];
		a = [self gg:a b:b c:c d:d x:((CASTTAbstract*)[x hx_objectAtIndex:i + 9]) s:5 t:568446438];
		d = [self gg:d b:a c:b d:c x:((CASTTAbstract*)[x hx_objectAtIndex:i + 14]) s:9 t:-1019803690];
		c = [self gg:c b:d c:a d:b x:((CASTTAbstract*)[x hx_objectAtIndex:i + 3]) s:14 t:-187363961];
		b = [self gg:b b:c c:d d:a x:((CASTTAbstract*)[x hx_objectAtIndex:i + 8]) s:20 t:1163531501];
		a = [self gg:a b:b c:c d:d x:((CASTTAbstract*)[x hx_objectAtIndex:i + 13]) s:5 t:-1444681467];
		d = [self gg:d b:a c:b d:c x:((CASTTAbstract*)[x hx_objectAtIndex:i + 2]) s:9 t:-51403784];
		c = [self gg:c b:d c:a d:b x:((CASTTAbstract*)[x hx_objectAtIndex:i + 7]) s:14 t:1735328473];
		b = [self gg:b b:c c:d d:a x:((CASTTAbstract*)[x hx_objectAtIndex:i + 12]) s:20 t:-1926607734];
		a = [self hh:a b:b c:c d:d x:((CASTTAbstract*)[x hx_objectAtIndex:i + 5]) s:4 t:-378558];
		d = [self hh:d b:a c:b d:c x:((CASTTAbstract*)[x hx_objectAtIndex:i + 8]) s:11 t:-2022574463];
		c = [self hh:c b:d c:a d:b x:((CASTTAbstract*)[x hx_objectAtIndex:i + 11]) s:16 t:1839030562];
		b = [self hh:b b:c c:d d:a x:((CASTTAbstract*)[x hx_objectAtIndex:i + 14]) s:23 t:-35309556];
		a = [self hh:a b:b c:c d:d x:((CASTTAbstract*)[x hx_objectAtIndex:i + 1]) s:4 t:-1530992060];
		d = [self hh:d b:a c:b d:c x:((CASTTAbstract*)[x hx_objectAtIndex:i + 4]) s:11 t:1272893353];
		c = [self hh:c b:d c:a d:b x:((CASTTAbstract*)[x hx_objectAtIndex:i + 7]) s:16 t:-155497632];
		b = [self hh:b b:c c:d d:a x:((CASTTAbstract*)[x hx_objectAtIndex:i + 10]) s:23 t:-1094730640];
		a = [self hh:a b:b c:c d:d x:((CASTTAbstract*)[x hx_objectAtIndex:i + 13]) s:4 t:681279174];
		d = [self hh:d b:a c:b d:c x:((CASTTAbstract*)[x hx_objectAtIndex:i]) s:11 t:-358537222];
		c = [self hh:c b:d c:a d:b x:((CASTTAbstract*)[x hx_objectAtIndex:i + 3]) s:16 t:-722521979];
		b = [self hh:b b:c c:d d:a x:((CASTTAbstract*)[x hx_objectAtIndex:i + 6]) s:23 t:76029189];
		a = [self hh:a b:b c:c d:d x:((CASTTAbstract*)[x hx_objectAtIndex:i + 9]) s:4 t:-640364487];
		d = [self hh:d b:a c:b d:c x:((CASTTAbstract*)[x hx_objectAtIndex:i + 12]) s:11 t:-421815835];
		c = [self hh:c b:d c:a d:b x:((CASTTAbstract*)[x hx_objectAtIndex:i + 15]) s:16 t:530742520];
		b = [self hh:b b:c c:d d:a x:((CASTTAbstract*)[x hx_objectAtIndex:i + 2]) s:23 t:-995338651];
		a = [self ii:a b:b c:c d:d x:((CASTTAbstract*)[x hx_objectAtIndex:i]) s:6 t:-198630844];
		d = [self ii:d b:a c:b d:c x:((CASTTAbstract*)[x hx_objectAtIndex:i + 7]) s:10 t:1126891415];
		c = [self ii:c b:d c:a d:b x:((CASTTAbstract*)[x hx_objectAtIndex:i + 14]) s:15 t:-1416354905];
		b = [self ii:b b:c c:d d:a x:((CASTTAbstract*)[x hx_objectAtIndex:i + 5]) s:21 t:-57434055];
		a = [self ii:a b:b c:c d:d x:((CASTTAbstract*)[x hx_objectAtIndex:i + 12]) s:6 t:1700485571];
		d = [self ii:d b:a c:b d:c x:((CASTTAbstract*)[x hx_objectAtIndex:i + 3]) s:10 t:-1894986606];
		c = [self ii:c b:d c:a d:b x:((CASTTAbstract*)[x hx_objectAtIndex:i + 10]) s:15 t:-1051523];
		b = [self ii:b b:c c:d d:a x:((CASTTAbstract*)[x hx_objectAtIndex:i + 1]) s:21 t:-2054922799];
		a = [self ii:a b:b c:c d:d x:((CASTTAbstract*)[x hx_objectAtIndex:i + 8]) s:6 t:1873313359];
		d = [self ii:d b:a c:b d:c x:((CASTTAbstract*)[x hx_objectAtIndex:i + 15]) s:10 t:-30611744];
		c = [self ii:c b:d c:a d:b x:((CASTTAbstract*)[x hx_objectAtIndex:i + 6]) s:15 t:-1560198380];
		b = [self ii:b b:c c:d d:a x:((CASTTAbstract*)[x hx_objectAtIndex:i + 13]) s:21 t:1309151649];
		a = [self ii:a b:b c:c d:d x:((CASTTAbstract*)[x hx_objectAtIndex:i + 4]) s:6 t:-145523070];
		d = [self ii:d b:a c:b d:c x:((CASTTAbstract*)[x hx_objectAtIndex:i + 11]) s:10 t:-1120210379];
		c = [self ii:c b:d c:a d:b x:((CASTTAbstract*)[x hx_objectAtIndex:i + 2]) s:15 t:718787259];
		b = [self ii:b b:c c:d d:a x:((CASTTAbstract*)[x hx_objectAtIndex:i + 9]) s:21 t:-343485551];
		a = [self addme:a y:olda];
		b = [self addme:b y:oldb];
		c = [self addme:c y:oldc];
		d = [self addme:d y:oldd];
		i += 16;
	}
	return [@[a, b, c, d] mutableCopy];
}
- (id) init{
	
	self = [super init];
	return self;
}

@end
