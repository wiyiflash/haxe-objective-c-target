//
//  Bytes
//  Test
//
//  Source generated by Haxe Objective-C target
//

#import "../../haxe/io/Bytes.h"

@implementation Bytes

+ (Bytes*) alloc:(int)length{
	
	
	NSMutableArray *a = [[NSMutableArray alloc] init];
	{
		
		int _g = 0;
		while (_g < length) {
			
			int i = _g++;
			[a push:0];
		}
	}
	return [[Bytes alloc] init:length b:a];
}
+ (Bytes*) ofString:(NSMutableString*)s{
	
	
	NSMutableArray *a = [[NSMutableArray alloc] init];
	{
		
		int _g1 = 0; int _g = s.length;
		while (_g1 < _g) {
			
			int i = _g1++;
			int c = [s characterAtIndex:i];
			if (c <= 127) [a push:c];
			else if (c <= 2047) {
				
				[a push:192 | c >> 6];
				[a push:128 | (c & 63)];
			}
			else if (c <= 65535) {
				
				[a push:224 | c >> 12];
				[a push:128 | (c >> 6 & 63)];
				[a push:128 | (c & 63)];
			}
			else {
				
				[a push:240 | c >> 18];
				[a push:128 | (c >> 12 & 63)];
				[a push:128 | (c >> 6 & 63)];
				[a push:128 | (c & 63)];
			}
		}
	}
	return [[Bytes alloc] init:a length b:a];
}
+ (Bytes*) ofData:(NSMutableArray*)b{
	
	return [[Bytes alloc] init:b length b:b];
}
@synthesize length;
@synthesize b;
- (void) blit:(int)pos src:(Bytes*)src srcpos:(int)srcpos len:(int)len{
	
	if (pos < 0 || srcpos < 0 || len < 0 || pos + len > self.length || srcpos + len > src.length) @throw OutsideBounds;;
	
	NSMutableArray *b1 = self.b;
	
	NSMutableArray *b2 = src.b;
	if (b1 == b2 && pos > srcpos) {
		
		int i = len;
		while (i > 0) {
			
			i--;
			[b1 hx_replaceObjectAtIndex:i + pos withObject:b2 hx_replaceObjectAtIndex:i + srcpos];
		}
		return;
	}
	{
		
		int _g = 0;
		while (_g < len) {
			
			int i = _g++;
			[b1 hx_replaceObjectAtIndex:i + pos withObject:b2 hx_replaceObjectAtIndex:i + srcpos];
		}
	}
}
- (Bytes*) sub:(int)pos len:(int)len{
	
	if (pos < 0 || len < 0 || pos + len > self.length) @throw OutsideBounds;;
	return [[Bytes alloc] init:len b:[self.b slice:pos end:pos + len]];
}
- (int) compare:(Bytes*)other{
	
	
	NSMutableArray *b1 = self.b;
	
	NSMutableArray *b2 = other.b;
	int len = ( (self.length < other.length) ? self.length : other.length);
	{
		
		int _g = 0;
		while (_g < (int)len) {
			
			int i = _g++;
			if (((CASTTType*)[b1 hx_objectAtIndex:i]) != ((CASTTType*)[b2 hx_objectAtIndex:i])) return ((CASTTType*)[b1 hx_objectAtIndex:i]) - ((CASTTType*)[b2 hx_objectAtIndex:i]);
		}
	}
	return self.length - other.length;
}
- (NSMutableString*) readString:(int)pos len:(int)len{
	
	if (pos < 0 || len < 0 || pos + len > self.length) @throw OutsideBounds;;
	
	NSMutableString *s = [@"" mutableCopy];
	
	NSMutableArray *b = self.b;
	id fcc = NSMutableString;
	int i = pos;
	int max = pos + len;
	while (i < max) {
		
		int c = ((CASTTType*)[b hx_objectAtIndex:i++]);
		if (c < 128) {
			
			if (c == 0) break;
			[s appendString:[fcc:c]];
		}
		else if (c < 224) [s appendString:[fcc: (c & @"63") << @"6" | (((CASTTType*)[b hx_objectAtIndex:i++]) & @"127")]];
		else if (c < 240) {
			
			int c2 = ((CASTTType*)[b hx_objectAtIndex:i++]);
			[s appendString:[fcc:( (c & @"31") << @"12" |  (c2 & @"127") << @"6") | (((CASTTType*)[b hx_objectAtIndex:i++]) & @"127")]];
		}
		else {
			
			int c2 = ((CASTTType*)[b hx_objectAtIndex:i++]);
			int c3 = ((CASTTType*)[b hx_objectAtIndex:i++]);
			[s appendString:[fcc:(( (c & @"15") << @"18" |  (c2 & @"127") << @"12") | (c3 << @"6" & @"127")) | (((CASTTType*)[b hx_objectAtIndex:i++]) & @"127")]];
		}
	}
	return s;
}
- (NSMutableString*) toString{
	
	return [self readString:0 len:self.length];
}
- (NSMutableString*) toHex{
	
	
	StringBuf *s = [[StringBuf alloc] init];
	
	NSMutableArray *chars = [@[] mutableCopy];
	
	NSMutableString *str = [@"0123456789abcdef" mutableCopy];
	{
		
		int _g1 = 0; int _g = str.length;
		while (_g1 < _g) {
			
			int i = _g1++;
			[chars push:[str charCodeAt:i]];
		}
	}
	{
		
		int _g1 = 0; int _g = self.length;
		while (_g1 < _g) {
			
			int i = _g1++;
			int c = ((CASTTType*)[self.b hx_objectAtIndex:i]);
			[s.b appendString:[NSMutableString:((NSMutableArray*)[chars hx_objectAtIndex:c >> @"4"])]];
			[s.b appendString:[NSMutableString:((NSMutableArray*)[chars hx_objectAtIndex:c & @"15"])]];
		}
	}
	return s.b;
}
- (id) init:(int)length b:(NSMutableArray*)b{
	
	self = [super init];
	self.length = length;
	self.b = b;
	return self;
}

@end
