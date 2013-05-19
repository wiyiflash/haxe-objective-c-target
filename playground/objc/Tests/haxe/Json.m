//
//  Json
//  Tests
//
//  Source generated by Haxe Objective-C target
//

#import "../haxe/Json.h"

@implementation Json

+ (id) parse:(NSMutableString*)text{
	
	return [[Json alloc]  doParse:text];
}
+ (NSMutableString*) stringify:(id)value replacer:(id)replacer{
	
	// Optional arguments
	if (!replacer) replacer = nil;
	
	return [[Json alloc]  toString:value replacer:replacer];
}
@synthesize buf;
@synthesize str;
@synthesize pos;

- (NSMutableString*) toString:(id)v replacer:(id)replacer{
	
	// Optional arguments
	if (!replacer) replacer = nil;
	
	self.buf = [[StringBuf alloc] init];
	self.hx_dyn_replacer = replacer;
	[self toStringRec:[@"" mutableCopy] v:v];
	return self.buf.b;
}
- (void) fieldsString:(id)v fields:(NSMutableArray*)fields{
	
	BOOL first = YES;
	[self.buf.b appendString:[@"{" mutableCopy]];
	{
		
		int _g = 0;
		while (_g < fields.length) {
			
			
			NSMutableString *f = ((NSMutableString*)[fields hx_objectAtIndex:_g]);
			++_g;
			id value = [Reflect field:v field:f];
			if ([Reflect isFunction:value]) continue;
			if (first) first = NO;
			else [self.buf.b appendString:[@"," mutableCopy]];
			[self quote:f];
			[self.buf.b appendString:[@":" mutableCopy]];
			[self toStringRec:f v:value];
		}
	}
	[self.buf.b appendString:[@"}" mutableCopy]];
}
- (void) objString:(id)v{
	
	[self fieldsString:v fields:[Reflect fields:v]];
}
- (void) toStringRec:(id)k v:(id)v{
	
	if (self.replacer != nil) v = [self replacer:k :v];
	{
		
		
		ValueType *_g = [Type _typeof:v];
		
		enum s = e (_g)
		switch ( e.index ) {
			
			case 8:
			[self.buf.b appendString:[@"\"???\"" mutableCopy]];break
			case 4:
			[self objString:v];break
			case 1:
			{
				
				
				NSMutableString *v1 = v;
				[self.buf.b appendString:[Std string:v1]];
			}break
			case 2:
			[self.buf.b appendString:[Std string:( (isfinite(v)) ? v : [@"null" mutableCopy])]];break
			case 5:
			[self.buf.b appendString:[@"\"<fun>\"" mutableCopy]];break
			case 6:
			
			var MATCH c : Class = e.params[0]if (c == NSMutableString) [self quote:v];
			else if (c == NSMutableArray) {
				
				
				NSMutableArray *v1 = v;
				[self.buf.b appendString:[@"[" mutableCopy]];
				int len = v1.length;
				if (len > 0) {
					
					[self toStringRec:0 v:((id)[v1 hx_objectAtIndex:0])];
					int i = 1;
					while (i < len) {
						
						[self.buf.b appendString:[@"," mutableCopy]];
						[self toStringRec:i v:((id)[v1 hx_objectAtIndex:i++])];
					}
				}
				[self.buf.b appendString:[@"]" mutableCopy]];
			}
			else if (c == StringMap) {
				
				
				StringMap *v1 = v;
				id o = [@{
				} mutableCopy];
				{
					id _it2 = [v1 keys];
					while ( [_it2 hasNext] ) do {
						NSMutableString k1 = [_it2 next];
						if (o != nil) [o hx_set_field:k1 :[v1 get:k1] :NO];
					}
				}
				[self objString:o];
			}
			else [self objString:v];break
			case 7:
			{
				
				id i = ((int)self.__r__3 
				EnumValue *e = v
				__r__3 = [e __Index]
				return __r__3{
					
					int* __r__3}
				}(self));
				{
					
					
					NSMutableString *v1 = i;
					[self.buf.b appendString:[Std string:v1]];
				}
			}break
			case 3:
			{
				
				
				NSMutableString *v1 = v;
				[self.buf.b appendString:[Std string:v1]];
			}break
			case 0:
			[self.buf.b appendString:[@"null" mutableCopy]];break
		}
	}
}
- (void) quote:(NSMutableString*)s{
	
	[self.buf.b appendString:[@"\"" mutableCopy]];
	int i = 0;
	while (YES) {
		
		int c = [s characterAtIndex:i++];
		if (c == -1) break;
		switch (c){
			case 34:[self.buf.b appendString:[@"\\\"" mutableCopy]];
			break;
			case 92:[self.buf.b appendString:[@"\\\\" mutableCopy]];
			break;
			case 10:[self.buf.b appendString:[@"\\n" mutableCopy]];
			break;
			case 13:[self.buf.b appendString:[@"\\r" mutableCopy]];
			break;
			case 9:[self.buf.b appendString:[@"\\t" mutableCopy]];
			break;
			case 8:[self.buf.b appendString:[@"\\b" mutableCopy]];
			break;
			case 12:[self.buf.b appendString:[@"\\f" mutableCopy]];
			break;
			default:[self.buf.b appendString:[NSMutableString:c]];break;
		}
	}
	[self.buf.b appendString:[@"\"" mutableCopy]];
}
- (id) doParse:(NSMutableString*)str{
	
	self.str = str;
	self.pos = 0;
	return [self parseRec];
}
- (void) invalidChar{
	
	self.pos--;
	@throw [[[[@"Invalid char " mutableCopy] stringByAppendingString:[self.str characterAtIndex:self.pos]] stringByAppendingString:[@" at position " mutableCopy]] stringByAppendingString:self.pos];
}
- (int) nextChar{
	
	return [self.str characterAtIndex:self.pos++];
}
- (id) parseRec{
	
	while (YES) {
		
		int c = [self.str characterAtIndex:self.pos++];
		switch (c){
			case 32:case 13:case 10:case 9:{
				
			}
			break;
			case 123:{
				
				id obj = [@{
				} mutableCopy]; 
				NSMutableString *field = nil; BOOL comma = nil;
				while (YES) {
					
					int c1 = [self.str characterAtIndex:self.pos++];
					switch (c1){
						case 32:case 13:case 10:case 9:{
							
						}
						break;
						case 125:{
							
							if (field != nil || comma == NO) [self invalidChar];
							return obj;;
						}
						break;
						case 58:{
							
							if (field == nil) [self invalidChar];
							if (obj != nil) [obj hx_set_field:field :[self parseRec] :NO];
							field = nil;
							comma = YES;
						}
						break;
						case 44:if (comma) comma = NO;
						else [self invalidChar];
						break;
						case 34:{
							
							if (comma) [self invalidChar];
							field = [self parseString];
						}
						break;
						default:[self invalidChar];break;
					}
				}
			}
			break;
			case 91:{
				
				
				NSMutableArray *arr = [@[] mutableCopy]; BOOL comma = nil;
				while (YES) {
					
					int c1 = [self.str characterAtIndex:self.pos++];
					switch (c1){
						case 32:case 13:case 10:case 9:{
							
						}
						break;
						case 93:{
							
							if (comma == NO) [self invalidChar];
							return arr;;
						}
						break;
						case 44:if (comma) comma = NO;
						else [self invalidChar];
						break;
						default:{
							
							if (comma) [self invalidChar];
							self.pos--;
							[arr push:[self parseRec]];
							comma = YES;
						}break;
					}
				}
			}
			break;
			case 116:{
				
				int save = self.pos;
				if ([self.str characterAtIndex:self.pos++] != 114 || [self.str characterAtIndex:self.pos++] != 117 || [self.str characterAtIndex:self.pos++] != 101) {
					
					self.pos = save;
					[self invalidChar];
				}
				return YES;
			}
			break;
			case 102:{
				
				int save = self.pos;
				if ([self.str characterAtIndex:self.pos++] != 97 || [self.str characterAtIndex:self.pos++] != 108 || [self.str characterAtIndex:self.pos++] != 115 || [self.str characterAtIndex:self.pos++] != 101) {
					
					self.pos = save;
					[self invalidChar];
				}
				return NO;
			}
			break;
			case 110:{
				
				int save = self.pos;
				if ([self.str characterAtIndex:self.pos++] != 117 || [self.str characterAtIndex:self.pos++] != 108 || [self.str characterAtIndex:self.pos++] != 108) {
					
					self.pos = save;
					[self invalidChar];
				}
				return nil;
			}
			break;
			case 34:return [self parseString];
			break;
			case 48:case 49:case 50:case 51:case 52:case 53:case 54:case 55:case 56:case 57:case 45:return ((float)self.__r__ int c1 = c
			int start = self.pos - 1
			BOOL minus = c1 == 45; BOOL digit = !minus; BOOL zero = c1 == 48
			BOOL point = NO; BOOL e = NO; BOOL pm = NO; BOOL end = NO
			while (YES) {
				
				c1 = [self.str characterAtIndex:self.pos++];
				switch (c1){
					case 48:{
						
						if (zero && !point) [self invalidNumber:start];
						if (minus) {
							
							minus = NO;
							zero = YES;
						}
						digit = YES;
					}
					break;
					case 49:case 50:case 51:case 52:case 53:case 54:case 55:case 56:case 57:{
						
						if (zero && !point) [self invalidNumber:start];
						if (minus) minus = NO;
						digit = YES;
						zero = NO;
					}
					break;
					case 46:{
						
						if (minus || point) [self invalidNumber:start];
						digit = NO;
						point = YES;
					}
					break;
					case 101:case 69:{
						
						if (minus || zero || e) [self invalidNumber:start];
						digit = NO;
						e = YES;
					}
					break;
					case 43:case 45:{
						
						if (!e || pm) [self invalidNumber:start];
						digit = NO;
						pm = YES;
					}
					break;
					default:{
						
						if (!digit) [self invalidNumber:start];
						self.pos--;
						end = YES;
					}break;
				}
				if (end) break;
			}
			float f = [Std parseFloat:[self.str substr:start len:self.pos - start]]
			int i = [Std _int:f]
			__r__ = ( (i == f) ? i : f)
			return __r__{
				
				float* __r__}
			}(self));
			break;
			default:[self invalidChar];break;
		}
	}
	return nil;
}
- (NSMutableString*) parseString{
	
	int start = self.pos;
	
	StringBuf *buf = [[StringBuf alloc] init];
	while (YES) {
		
		int c = [self.str characterAtIndex:self.pos++];
		if (c == 34) break;
		if (c == 92) {
			
			{
				
				
				NSMutableString *s = self.str; int len = self.pos - start - 1;
				[buf.b appendString:( (len == nil) ? [s substr:start len:nil] : [s substr:start len:len])];
			}
			c = [self.str characterAtIndex:self.pos++];
			switch (c){
				case 114:[buf.b appendString:[@"\r" mutableCopy]];
				break;
				case 110:[buf.b appendString:[@"\n" mutableCopy]];
				break;
				case 116:[buf.b appendString:[@"\t" mutableCopy]];
				break;
				case 98:[buf.b appendString:[@"" mutableCopy]];
				break;
				case 102:[buf.b appendString:[@"" mutableCopy]];
				break;
				case 47:case 92:case 34:[buf.b appendString:[NSMutableString:c]];
				break;
				case 117:{
					
					int uc = [Std parseInt:[[@"0x" mutableCopy] stringByAppendingString:[self.str substr:self.pos len:@"4"]]];
					self.pos += 4;
					[buf.b appendString:[NSMutableString:uc]];
				}
				break;
				default:@throw [[[[@"Invalid escape sequence \\" mutableCopy] stringByAppendingString:[NSMutableString:c]] stringByAppendingString:[@" at position " mutableCopy]] stringByAppendingString: (self.pos - @"1")];break;
			}
			start = self.pos;
		}
		else if (c == -1) @throw [@"Unclosed string" mutableCopy];
	}
	{
		
		
		NSMutableString *s = self.str; int len = self.pos - start - 1;
		[buf.b appendString:( (len == nil) ? [s substr:start len:nil] : [s substr:start len:len])];
	}
	return buf.b;
}
- (void) invalidNumber:(int)start{
	
	@throw [[[[@"Invalid number at position " mutableCopy] stringByAppendingString:start] stringByAppendingString:[@": " mutableCopy]] stringByAppendingString:[self.str substr:start len:self.pos - start]];
}
- (float) parseNumber:(int)c{
	
	int start = self.pos - 1;
	BOOL minus = c == 45; BOOL digit = !minus; BOOL zero = c == 48;
	BOOL point = NO; BOOL e = NO; BOOL pm = NO; BOOL end = NO;
	while (YES) {
		
		c = [self.str characterAtIndex:self.pos++];
		switch (c){
			case 48:{
				
				if (zero && !point) [self invalidNumber:start];
				if (minus) {
					
					minus = NO;
					zero = YES;
				}
				digit = YES;
			}
			break;
			case 49:case 50:case 51:case 52:case 53:case 54:case 55:case 56:case 57:{
				
				if (zero && !point) [self invalidNumber:start];
				if (minus) minus = NO;
				digit = YES;
				zero = NO;
			}
			break;
			case 46:{
				
				if (minus || point) [self invalidNumber:start];
				digit = NO;
				point = YES;
			}
			break;
			case 101:case 69:{
				
				if (minus || zero || e) [self invalidNumber:start];
				digit = NO;
				e = YES;
			}
			break;
			case 43:case 45:{
				
				if (!e || pm) [self invalidNumber:start];
				digit = NO;
				pm = YES;
			}
			break;
			default:{
				
				if (!digit) [self invalidNumber:start];
				self.pos--;
				end = YES;
			}break;
		}
		if (end) break;
	}
	float f = [Std parseFloat:[self.str substr:start len:self.pos - start]];
	int i = [Std _int:f];
	return ( (i == f) ? i : f);
}
- (id) init{
	
	self = [super init];
	return self;
}

@end
