//
//  EReg
//  Tests
//
//  Source generated by Haxe Objective-C target
//

#import "EReg.h"

@implementation NSRegularExpression ( EReg )
id me;

// Getters/setters for property r
static id r__;
- (id) r { return r__; }
- (void) setR:(id)val { r__ = val; }

// Getters/setters for property last
static NSMutableString* last__;
- (NSMutableString*) last { return last__; }
- (void) setLast:(NSMutableString*)val { last__ = val; }

// Getters/setters for property global
static BOOL global__;
- (BOOL) global { return global__; }
- (void) setGlobal:(BOOL)val { global__ = val; }

BOOL(^block_match)(NSMutableString *s) = ^(NSMutableString *s) { return [me match:s]; };
- (BOOL) match:(NSMutableString*)s{
	BOOL p = YES;
	if (p) self.last = s;
	else self.last = nil;
	return p;
}
NSMutableString*(^block_matched)(int n) = ^(int n) { return [me matched:n]; };
- (NSMutableString*) matched:(int)n{
	
	NSMutableString *m = nil;
	return m;
}
NSMutableString*(^block_matchedLeft)() = ^() { return [me matchedLeft]; };
- (NSMutableString*) matchedLeft{
	id p = nil;
	return [self last substr:0 len:p pos];
}
NSMutableString*(^block_matchedRight)() = ^() { return [me matchedRight]; };
- (NSMutableString*) matchedRight{
	id p = nil;
	int sz = p pos + block_len;
	return [self last substr:sz len:self last.length - sz];
}
id(^block_matchedPos)() = ^() { return [me matchedPos]; };
- (id) matchedPos{
	return nil;
}
NSMutableArray*(^block_split)(NSMutableString *s) = ^(NSMutableString *s) { return [me split:s]; };
- (NSMutableArray*) split:(NSMutableString*)s{
	int pos = 0;
	int len = s.length;
	
	NSMutableArray *a = (NSMutableArray*)[[NSMutableArray alloc] init];
	BOOL first = YES;
	do {
		id p = nil;
		if (p len == 0 && !first) {
			if (p pos == block_length) break;
			p pos += 1;
		}
		[a push:[s substr:pos len:p pos - pos]];
		int tot = p pos + block_len - pos;
		pos += tot;
		len -= tot;
		first = NO;
	}while (self.global);
	[a push:[s substr:pos len:len]];
	return a;
}
NSMutableString*(^block_replace)(NSMutableString *s, NSMutableString *by) = ^(NSMutableString *s, NSMutableString *by) { return [me replace:s by:by]; };
- (NSMutableString*) replace:(NSMutableString*)s by:(NSMutableString*)by{
	
	StringBuf *b = [[StringBuf alloc] init];
	int pos = 0;
	int len = s.length;
	
	NSMutableArray *a = (NSMutableArray*)[by componentsSeparatedByString:(NSMutableString*)@"$"];
	BOOL first = YES;
	do {
		id p = nil;
		if (p len == 0 && !first) {
			if (p pos == block_length) break;
			p pos += 1;
		}
		b.b += [block_substr:pos len:block_pos - pos];
		if (a.length > 0) b.b += [block_string:[a objectAtIndex:0]];
		int i = 1;
		while (i < block_length) {
			
			NSMutableString *k = [a objectAtIndex:i];
			int c = [k characterAtIndex:0];
			if (c >= 49 && c <= 57) {
				id p1 = nil;
				if (p1 == nil) {
					[b.b appendString:(NSMutableString*)@"$"];
					b.b += [block_string:k];
				}
				else {
					b.b += [block_substr:block_pos len:block_len];
					[b.b appendString:[k substr:@"1" len:k.length - @"1"]];
				}
			}
			else if (c == nil) {
				[b.b appendString:(NSMutableString*)@"$"];
				i++;
				
				NSMutableString *k2 = [a objectAtIndex:i];
				if (k2 != nil && block_length > 0) b.b += [block_string:k2];
			}
			else b.b += [block_string:[(NSMutableString*)@"$" stringByAppendingString:k]];
			i++;
		}
		int tot = p pos + block_len - pos;
		pos += tot;
		len -= tot;
		first = NO;
	}while (self.global);
	b.b += [block_substr:pos len:len];
	return b.b;
}
NSMutableString*(^block_customReplace)(NSMutableString *s, SEL f) = ^(NSMutableString *s, SEL f) { return [me customReplace:s f:f]; };
- (NSMutableString*) customReplace:(NSMutableString*)s f:(SEL)f{
	
	StringBuf *buf = [[StringBuf alloc] init];
	while (YES) {
		if (![self match:s]) break;
		buf.b += [block_string:[block_matchedLeft]];
		buf.b += [block_string:[f:self]];
		s = [block_matchedRight];
	}
	buf.b += [block_string:s];
	return buf.b;
}
id(^block_init)(NSMutableString *r, NSMutableString *opt) = ^(NSMutableString *r, NSMutableString *opt) { return [me init:r opt:opt]; };
- (id) init:(NSMutableString*)r opt:(NSMutableString*)opt{
	self = [super init];
	me = self;
	
	NSMutableArray *a = (NSMutableArray*)[opt componentsSeparatedByString:(NSMutableString*)@"g"];
	self.global = block_length > 1;
	if (self.global) opt = [block_join:(NSMutableString*)@""];
	self.r = nil;
	return self;
}

@end
