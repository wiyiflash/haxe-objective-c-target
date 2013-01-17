//
//  StringTools
//  Tests
//
//  Source generated by Haxe Objective-C target
//

#import "StringTools.h"

@implementation StringTools
id me;

NSMutableString*(^block_urlEncode)(NSMutableString *s) = ^(NSMutableString *s) { return [me urlEncode:s]; };
+ (NSMutableString*) urlEncode:(NSMutableString*)s{
	return [s stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding];
}
NSMutableString*(^block_urlDecode)(NSMutableString *s) = ^(NSMutableString *s) { return [me urlDecode:s]; };
+ (NSMutableString*) urlDecode:(NSMutableString*)s{
	return [s stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}
NSMutableString*(^block_htmlEscape)(NSMutableString *s, BOOL quotes) = ^(NSMutableString *s, BOOL quotes) { return [me htmlEscape:s quotes:quotes]; };
+ (NSMutableString*) htmlEscape:(NSMutableString*)s quotes:(BOOL)quotes{
	// Simulated optional arguments
	if (quotes == nil) quotes = nil;
	
	s = [block_join:(NSMutableString*)@"&gt;"];
	return ( (quotes) ? [[[[s componentsSeparatedByString:(NSMutableString*)@"\""] join:(NSMutableString*)@"&quot;"] componentsSeparatedByString:(NSMutableString*)@"'"] join:(NSMutableString*)@"&#039;"] : s);
}
NSMutableString*(^block_htmlUnescape)(NSMutableString *s) = ^(NSMutableString *s) { return [me htmlUnescape:s]; };
+ (NSMutableString*) htmlUnescape:(NSMutableString*)s{
	return [[[[[[[[[[s componentsSeparatedByString:(NSMutableString*)@"&gt;"] join:(NSMutableString*)@">"] componentsSeparatedByString:(NSMutableString*)@"&lt;"] join:(NSMutableString*)@"<"] componentsSeparatedByString:(NSMutableString*)@"&quot;"] join:(NSMutableString*)@"\""] componentsSeparatedByString:(NSMutableString*)@"&#039;"] join:(NSMutableString*)@"'"] componentsSeparatedByString:(NSMutableString*)@"&amp;"] join:(NSMutableString*)@"&"];
}
BOOL(^block_startsWith)(NSMutableString *s, NSMutableString *start) = ^(NSMutableString *s, NSMutableString *start) { return [me startsWith:s start:start]; };
+ (BOOL) startsWith:(NSMutableString*)s start:(NSMutableString*)start{
	return s.length >= block_length && [block_substr:0 len:block_length] == start;
}
BOOL(^block_endsWith)(NSMutableString *s, NSMutableString *end) = ^(NSMutableString *s, NSMutableString *end) { return [me endsWith:s end:end]; };
+ (BOOL) endsWith:(NSMutableString*)s end:(NSMutableString*)end{
	int elen = end.length;
	int slen = s.length;
	return slen >= elen && [block_substr:slen - elen len:elen] == end;
}
BOOL(^block_isSpace)(NSMutableString *s, int pos) = ^(NSMutableString *s, int pos) { return [me isSpace:s pos:pos]; };
+ (BOOL) isSpace:(NSMutableString*)s pos:(int)pos{
	int c = [s characterAtIndex:pos];
	return c >= 9 && c <= 13 || c == 32;
}
NSMutableString*(^block_ltrim)(NSMutableString *s) = ^(NSMutableString *s) { return [me ltrim:s]; };
+ (NSMutableString*) ltrim:(NSMutableString*)s{
	int l = s.length;
	int r = 0;
	while (r < l && [block_isSpace:s pos:r]) r++;
	if (r > 0) return [s substr:r len:l - r];
	else return s;
	return nil;
}
NSMutableString*(^block_rtrim)(NSMutableString *s) = ^(NSMutableString *s) { return [me rtrim:s]; };
+ (NSMutableString*) rtrim:(NSMutableString*)s{
	int l = s.length;
	int r = 0;
	while (r < l && [block_isSpace:s pos:l - r - 1]) r++;
	if (r > 0) return [s substr:0 len:l - r];
	else return s;
	return nil;
}
NSMutableString*(^block_trim)(NSMutableString *s) = ^(NSMutableString *s) { return [me trim:s]; };
+ (NSMutableString*) trim:(NSMutableString*)s{
	return [StringTools ltrim:[StringTools rtrim:s]];
}
NSMutableString*(^block_lpad)(NSMutableString *s, NSMutableString *c, int l) = ^(NSMutableString *s, NSMutableString *c, int l) { return [me lpad:s c:c l:l]; };
+ (NSMutableString*) lpad:(NSMutableString*)s c:(NSMutableString*)c l:(int)l{
	if (c.length <= 0) return s;
	while (s.length < l) s = c + s;
	return s;
}
NSMutableString*(^block_rpad)(NSMutableString *s, NSMutableString *c, int l) = ^(NSMutableString *s, NSMutableString *c, int l) { return [me rpad:s c:c l:l]; };
+ (NSMutableString*) rpad:(NSMutableString*)s c:(NSMutableString*)c l:(int)l{
	if (c.length <= 0) return s;
	while (s.length < l) s = s + c;
	return s;
}
NSMutableString*(^block_replace)(NSMutableString *s, NSMutableString *sub, NSMutableString *by) = ^(NSMutableString *s, NSMutableString *sub, NSMutableString *by) { return [me replace:s sub:sub by:by]; };
+ (NSMutableString*) replace:(NSMutableString*)s sub:(NSMutableString*)sub by:(NSMutableString*)by{
	return [s replaceOccurrencesOfString:sub withString:by options:nil range:nil];
}
NSMutableString*(^block_hex)(int n, int digits) = ^(int n, int digits) { return [me hex:n digits:digits]; };
+ (NSMutableString*) hex:(int)n digits:(int)digits{
	// Simulated optional arguments
	if (digits == nil) digits = nil;
	
	
	NSMutableString *s = (NSMutableString*)@"";
	
	NSMutableString *hexChars = (NSMutableString*)@"0123456789ABCDEF";
	do {
		s = [[block_charAt:n & @"15"] stringByAppendingString:s];
		n >>>= 4;
	}while (n > 0);
	if (digits != nil) while (s.length < digits) s = [(NSMutableString*)@"0" stringByAppendingString:s];
	return s;
}
int(^block_fastCodeAt)(NSMutableString *s, int index) = ^(NSMutableString *s, int index) { return [me fastCodeAt:s index:index]; };
+ (int) fastCodeAt:(NSMutableString*)s index:(int)index{
	return [s characterAtIndex:index];
}
BOOL(^block_isEof)(int c) = ^(int c) { return [me isEof:c]; };
+ (BOOL) isEof:(int)c{
	return c == -1;
}

@end
