//
//  EReg
//  Test
//
//  Source generated by Haxe Objective-C target
//

#import "EReg.h"

@implementation NSRegularExpression ( EReg )

// Please provide a getterBody for the property: r

// Please provide a getterBody for the property: last

// Please provide a getterBody for the property: global

- (BOOL) match:(NSMutableString*)s{
	
	BOOL p = YES;
	if (p) self.last = s;
	else self.last = nil;
	return p;
}
- (NSMutableString*) matched:(int)n{
	
	
	NSMutableString *m = nil;
	return m;
}
- (NSMutableString*) matchedLeft{
	
	id p = nil;
	return [self.last substr:0 len:p pos];
}
- (NSMutableString*) matchedRight{
	
	id p = nil;
	int sz = MonoMonop pos + p len;
	return [self.last substr:sz len:self.last.length - sz];
}
- (id) matchedPos{
	
	return nil;
}
- (BOOL) matchSub:(NSMutableString*)s pos:(int)pos len:(int)len{
	
	// Optional arguments
	if (!len) len = 0;
	
	return NO;
}
- (NSMutableArray*) split:(NSMutableString*)s{
	
	int pos = 0;
	int len = s.length;
	
	NSMutableArray *a = [[NSMutableArray alloc] init];
	BOOL first = YES;
	do {
		
		id p = nil;
		if (p len == 0 && !first) {
			
			if (p pos == s.length) break;
			Monop pos += 1;
		}
		[a push:[s substr:pos len:p pos - pos]];
		int tot = MonoMonop pos + p len - pos;
		pos += tot;
		len -= tot;
		first = NO;
	}while (self.global);
	[a push:[s substr:pos len:len]];
	return a;
}
- (NSMutableString*) replace:(NSMutableString*)s by:(NSMutableString*)by{
	
	
	StringBuf *b = [[StringBuf alloc] init];
	int pos = 0;
	int len = s.length;
	
	NSMutableArray *a = [by split:[@"$" mutableCopy]];
	BOOL first = YES;
	do {
		
		id p = nil;
		if (p len == 0 && !first) {
			
			if (p pos == s.length) break;
			Monop pos += 1;
		}
		{
			
			int len1 = p pos - pos;
			[b.b appendString:( (len1 == nil) ? [s substr:pos len:nil] : [s substr:pos len:len1])];
		}
		if (a.length > 0) [b.b appendString:[Std string:((NSMutableArray*)[a hx_objectAtIndex:@"0"])]];
		int i = 1;
		while (i < a.length) {
			
			
			NSMutableString *k = ((NSMutableArray*)[a hx_objectAtIndex:i]);
			int c = [k charCodeAt:0];
			if (c >= 49 && c <= 57) {
				
				id p1 = nil;
				if (p1 == nil) {
					
					[b.b appendString:[@"$" mutableCopy]];
					[b.b appendString:[Std string:k]];
				}
				else {
					
					{
						
						int pos1 = p1 pos; int len1 = p1 len;
						[b.b appendString:( (len1 == nil) ? [s substr:pos1 len:nil] : [s substr:pos1 len:len1])];
					}
					{
						
						int len1 = k.length - 1;
						[b.b appendString:( (len1 == nil) ? [k substr:@"1" len:nil] : [k substr:@"1" len:len1])];
					}
				}
			}
			else if (c == nil) {
				
				[b.b appendString:[@"$" mutableCopy]];
				i++;
				
				NSMutableString *k2 = ((NSMutableArray*)[a hx_objectAtIndex:i]);
				if (k2 != nil && k2.length > 0) [b.b appendString:[Std string:k2]];
			}
			else [b.b appendString:[Std string:[[@"$" mutableCopy] stringByAppendingString:k]]];
			i++;
		}
		int tot = MonoMonop pos + p len - pos;
		pos += tot;
		len -= tot;
		first = NO;
	}while (self.global);
	[b.b appendString:( (len == nil) ? [s substr:pos len:nil] : [s substr:pos len:len])];
	return b.b;
}
- (NSMutableString*) map:(NSMutableString*)s f:(id)f{
	
	
	StringBuf *buf = [[StringBuf alloc] init];
	while (YES) {
		
		if (![self match:s]) break;
		[buf.b appendString:[Std string:[self matchedLeft]]];
		[buf.b appendString:[Std string:[f:self]]];
		s = [self matchedRight];
	}
	[buf.b appendString:[Std string:s]];
	return buf.b;
}
- (id) init:(NSMutableString*)r opt:(NSMutableString*)opt{
	
	self = [super init];
	
	NSMutableArray *a = [opt split:[@"g" mutableCopy]];
	self.global = a.length > 1;
	if (self.global) opt = [a join:[@"" mutableCopy]];
	self.r = nil;
	return self;
}

@end
