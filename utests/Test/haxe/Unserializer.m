//
//  Unserializer
//  Test
//
//  Source generated by Haxe Objective-C target
//

#import "../haxe/Unserializer.h"

@implementation Unserializer

static id DEFAULT_RESOLVER;
+ (id) DEFAULT_RESOLVER {
	if (DEFAULT_RESOLVER == nil) DEFAULT_RESOLVER = Type;
	return DEFAULT_RESOLVER;
}
+ (void) setDEFAULT_RESOLVER:(id)hx_val {
	DEFAULT_RESOLVER = hx_val;
}
static NSMutableString* BASE64;
+ (NSMutableString*) BASE64 {
	if (BASE64 == nil) BASE64 = [@"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789%:" mutableCopy];
	return BASE64;
}
+ (void) setBASE64:(NSMutableString*)hx_val {
	BASE64 = hx_val;
}
static NSMutableArray* CODES;
+ (NSMutableArray*) CODES {
	if (CODES == nil) CODES = nil;
	return CODES;
}
+ (void) setCODES:(NSMutableArray*)hx_val {
	CODES = hx_val;
}
+ (NSMutableArray*) initCodes{
	
	
	NSMutableArray *codes = [[NSMutableArray alloc] init];
	{
		
		int _g1 = 0; int _g = BASE64.length;
		while (_g1 < _g) {
			
			int i = _g1++;
			[codes hx_replaceObjectAtIndex:[BASE64 characterAtIndex:i] withObject:i];
		}
	}
	return codes;
}
+ (id) run:(NSMutableString*)v{
	
	return [[Unserializer alloc] :v unserialize];
}
@synthesize buf;
@synthesize pos;
@synthesize length;
@synthesize cache;
@synthesize scache;
@synthesize resolver;
- (void) setResolver:(id)r{
	
	if (r == nil) self.resolver = [@{
		@"resolveClass":[^(NSMutableString *_){
		
		return [NSNull null];
	} copy],
		@"resolveEnum":[^(NSMutableString *_){
		
		return [NSNull null];
	} copy],
	} mutableCopy];
	else self.resolver = r;
}
- (id) getResolver{
	
	return self.resolver;
}
- (int) get:(int)p{
	
	return [self.buf characterAtIndex:p];
}
- (int) readDigits{
	
	int k = 0;
	BOOL s = NO;
	int fpos = self.pos;
	while (YES) {
		
		int c = [self.buf characterAtIndex:self.pos];
		if (c == -1) break;
		if (c == 45) {
			
			if (self.pos != fpos) break;
			s = YES;
			self.pos++;
			continue;
		}
		if (c < 48 || c > 57) break;
		k = k * 10 +  (c - 48);
		self.pos++;
	}
	if (s) k *= -1;
	return k;
}
- (void) unserializeObject:(id)o{
	
	while (YES) {
		
		if (self.pos >= self.length) @throw [@"Invalid object" mutableCopy];;
		if ([self.buf characterAtIndex:self.pos] == 103) break;
		
		NSMutableString *k = [self unserialize];
		if (![Std is:k t:NSMutableString]) @throw [@"Invalid object key" mutableCopy];;
		id v = [self unserialize];
		if (o != nil) [o hx_set_field:k :v :NO];
	}
	self.pos++;
}
- (id) unserializeEnum:(Enum*)edecl tag:(NSMutableString*)tag{
	
	if ([self.buf characterAtIndex:self.pos++] != 58) @throw [@"Invalid enum format" mutableCopy];;
	int nargs = [self readDigits];
	if (nargs == 0) return [Type createEnum:edecl constr:tag params:nil];
	
	NSMutableArray *args = [[NSMutableArray alloc] init];
	while (nargs-- > 0) [args push:[self unserialize]];
	return [Type createEnum:edecl constr:tag params:args];
}
- (id) unserialize{
	
	{
		
		int _g = [self.buf characterAtIndex:self.pos++];
		switch (_g){
			case 110:return nil;;
			break;
			case 116:return YES;;
			break;
			case 102:return NO;;
			break;
			case 122:return 0;;
			break;
			case 105:return [self readDigits];;
			break;
			case 100:{
				
				int p1 = self.pos;
				while (YES) {
					
					int c = [self.buf characterAtIndex:self.pos];
					if (c >= 43 && c < 58 || c == 101 || c == 69) self.pos++;
					else break;
				}
				return [Std parseFloat:[self.buf substr:p1 len:self.pos - p1]];;
			}
			break;
			case 121:{
				
				int len = [self readDigits];
				if ([self.buf characterAtIndex:self.pos++] != 58 || self.length - self.pos < len) @throw [@"Invalid string length" mutableCopy];;
				
				NSMutableString *s = [self.buf substr:self.pos len:len];
				self.pos += len;
				s = [StringTools urlDecode:s];
				[self.scache push:s];
				return s;;
			}
			break;
			case 107:return NAN;;
			break;
			case 109:return -DBL_MAX;;
			break;
			case 112:return DBL_MAX;;
			break;
			case 97:{
				
				
				NSMutableString *buf = self.buf;
				
				NSMutableArray *a = [[NSMutableArray alloc] init];
				[self.cache push:a];
				while (YES) {
					
					int c = [self.buf characterAtIndex:self.pos];
					if (c == 104) {
						
						self.pos++;
						break;
					}
					if (c == 117) {
						
						self.pos++;
						int n = [self readDigits];
						[a hx_replaceObjectAtIndex:a.length + n - 1 withObject:[NSNull null]];
					}
					else [a push:[self unserialize]];
				}
				return a;;
			}
			break;
			case 111:{
				
				id o = [@{
				} mutableCopy];
				[self.cache push:o];
				[self unserializeObject:o];
				return o;;
			}
			break;
			case 114:{
				
				int n = [self readDigits];
				if (n < 0 || n >= self.cache.length) @throw [@"Invalid reference" mutableCopy];;
				return ((id)[self.cache hx_objectAtIndex:n]);;
			}
			break;
			case 82:{
				
				int n = [self readDigits];
				if (n < 0 || n >= self.scache.length) @throw [@"Invalid string reference" mutableCopy];;
				return ((NSMutableString*)[self.scache hx_objectAtIndex:n]);;
			}
			break;
			case 120:@throw [self unserialize];;
			break;
			case 99:{
				
				
				NSMutableString *name = [self unserialize];
				
				Class *cl = [self.resolver resolveClass:name];
				if (cl == nil) @throw [[@"Class not found " mutableCopy] stringByAppendingString:name];;
				id o = [Type createEmptyInstance:cl];
				[self.cache push:o];
				[self unserializeObject:o];
				return o;;
			}
			break;
			case 119:{
				
				
				NSMutableString *name = [self unserialize];
				
				Enum *edecl = [self.resolver resolveEnum:name];
				if (edecl == nil) @throw [[@"Enum not found " mutableCopy] stringByAppendingString:name];;
				id e = [self unserializeEnum:edecl tag:[self unserialize]];
				[self.cache push:e];
				return e;;
			}
			break;
			case 106:{
				
				
				NSMutableString *name = [self unserialize];
				
				Enum *edecl = [self.resolver resolveEnum:name];
				if (edecl == nil) @throw [[@"Enum not found " mutableCopy] stringByAppendingString:name];;
				self.pos++;
				int index = [self readDigits];
				
				NSMutableString *tag = ((NSMutableString*)[[Type getEnumConstructs:edecl] hx_objectAtIndex:index]);
				if (tag == nil) @throw [[[[@"Unknown enum index " mutableCopy] stringByAppendingString:name] stringByAppendingString:[@"@" mutableCopy]] stringByAppendingString:index];;
				id e = [self unserializeEnum:edecl tag:tag];
				[self.cache push:e];
				return e;;
			}
			break;
			case 108:{
				
				
				List *l = [[List alloc] init];
				[self.cache push:l];
				
				NSMutableString *buf = self.buf;
				while ([self.buf characterAtIndex:self.pos] != 104) [l add:[self unserialize]];
				self.pos++;
				return l;;
			}
			break;
			case 98:{
				
				
				StringMap *h = [[StringMap alloc] init];
				[self.cache push:h];
				
				NSMutableString *buf = self.buf;
				while ([self.buf characterAtIndex:self.pos] != 104) {
					
					
					NSMutableString *s = [self unserialize];
					[h set:s value:[self unserialize]];
				}
				self.pos++;
				return h;;
			}
			break;
			case 113:{
				
				
				IntMap *h = [[IntMap alloc] init];
				[self.cache push:h];
				
				NSMutableString *buf = self.buf;
				int c = [self.buf characterAtIndex:self.pos++];
				while (c == 58) {
					
					int i = [self readDigits];
					[h set:i value:[self unserialize]];
					c = [self.buf characterAtIndex:self.pos++];
				}
				if (c != 104) @throw [@"Invalid IntMap format" mutableCopy];;
				return h;;
			}
			break;
			case 77:{
				
				
				ObjectMap *h = [[ObjectMap alloc] init];
				[self.cache push:h];
				
				NSMutableString *buf = self.buf;
				while ([self.buf characterAtIndex:self.pos] != 104) {
					
					id s = [self unserialize];
					[h set:s value:[self unserialize]];
				}
				self.pos++;
				return h;;
			}
			break;
			case 118:{
				
				
				NSDate *d = [NSDate.fromString:[self.buf substr:self.pos len:19]];
				[self.cache push:d];
				self.pos += 19;
				return d;;
			}
			break;
			case 115:{
				
				int len = [self readDigits];
				
				NSMutableString *buf = self.buf;
				if ([self.buf characterAtIndex:self.pos++] != 58 || self.length - self.pos < len) @throw [@"Invalid bytes length" mutableCopy];;
				
				NSMutableArray *codes = CODES;
				if (codes == nil) {
					
					codes = [Unserializer initCodes];
					CODES = codes;
				}
				int i = self.pos;
				int rest = len & 3;
				int size =  (len >> 2) * 3 +  (( (rest >= 2) ? rest - 1 : 0));
				int max = i +  (len - rest);
				
				Bytes *bytes = [Bytes alloc:size];
				int bpos = 0;
				while (i < max) {
					
					int c1 = ((CASTTMono*)[codes hx_objectAtIndex:[buf characterAtIndex:i++]]);
					int c2 = ((CASTTMono*)[codes hx_objectAtIndex:[buf characterAtIndex:i++]]);
					[bytes.b hx_replaceObjectAtIndex:bpos++ withObject:( (c1 << @2 | c2 >> @4) & @255)];
					int c3 = ((CASTTMono*)[codes hx_objectAtIndex:[buf characterAtIndex:i++]]);
					[bytes.b hx_replaceObjectAtIndex:bpos++ withObject:( (c2 << @4 | c3 >> @2) & @255)];
					int c4 = ((CASTTMono*)[codes hx_objectAtIndex:[buf characterAtIndex:i++]]);
					[bytes.b hx_replaceObjectAtIndex:bpos++ withObject:( (c3 << @6 | c4) & @255)];
				}
				if (rest >= 2) {
					
					int c1 = ((CASTTMono*)[codes hx_objectAtIndex:[buf characterAtIndex:i++]]);
					int c2 = ((CASTTMono*)[codes hx_objectAtIndex:[buf characterAtIndex:i++]]);
					[bytes.b hx_replaceObjectAtIndex:bpos++ withObject:( (c1 << @2 | c2 >> @4) & @255)];
					if (rest == 3) {
						
						int c3 = ((CASTTMono*)[codes hx_objectAtIndex:[buf characterAtIndex:i++]]);
						[bytes.b hx_replaceObjectAtIndex:bpos++ withObject:( (c2 << @4 | c3 >> @2) & @255)];
					}
				}
				self.pos += len;
				[self.cache push:bytes];
				return bytes;;
			}
			break;
			case 67:{
				
				
				NSMutableString *name = [self unserialize];
				
				Class *cl = [self.resolver resolveClass:name];
				if (cl == nil) @throw [[@"Class not found " mutableCopy] stringByAppendingString:name];;
				id o = [Type createEmptyInstance:cl];
				[self.cache push:o];
				[o hxUnserialize:self];
				if ([self.buf characterAtIndex:self.pos++] != 103) @throw [@"Invalid custom data" mutableCopy];;
				return o;;
			}
			break;
			default:{
				
			}break;
		}
	}
	self.pos--;
	@throw [[[[@"Invalid char " mutableCopy] stringByAppendingString:[self.buf charAt:self.pos]] stringByAppendingString:[@" at position " mutableCopy]] stringByAppendingString:self.pos];;
	return nil;
}
- (id) init:(NSMutableString*)buf{
	
	self = [super init];
	self.buf = buf;
	self.length = buf.length;
	self.pos = 0;
	self.scache = [[NSMutableArray alloc] init];
	self.cache = [[NSMutableArray alloc] init];
	id r = -FStaticTType-TypeResolver;
	if (r == nil) {
		
		self = [super init];
		r = Type;
		-FStaticTType-TypeResolver = r;
		return self;
	}
	[self setResolver:r];
}

@end
