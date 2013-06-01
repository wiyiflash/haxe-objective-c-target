//
//  Template
//  Test
//
//  Source generated by Haxe Objective-C target
//

#import "../haxe/Template.h"

@implementation Template

static EReg* splitter;
+ (EReg*) splitter {
	if (splitter == nil) splitter = [[EReg alloc] init:[@"(::[A-Za-z0-9_ ()&|!+=/><*.\"-]+::|\\$\\$([A-Za-z0-9_-]+)\\()" mutableCopy] opt:[@"" mutableCopy]];
	return splitter;
}
+ (void) setSplitter:(EReg*)hx_val {
	splitter = hx_val;
}
static EReg* expr_splitter;
+ (EReg*) expr_splitter {
	if (expr_splitter == nil) expr_splitter = [[EReg alloc] init:[@"(\\(|\\)|[ \r\n\t]*\"[^\"]*\"[ \r\n\t]*|[!+=/><*.&|-]+)" mutableCopy] opt:[@"" mutableCopy]];
	return expr_splitter;
}
+ (void) setExpr_splitter:(EReg*)hx_val {
	expr_splitter = hx_val;
}
static EReg* expr_trim;
+ (EReg*) expr_trim {
	if (expr_trim == nil) expr_trim = [[EReg alloc] init:[@"^[ ]*([^ ]+)[ ]*$" mutableCopy] opt:[@"" mutableCopy]];
	return expr_trim;
}
+ (void) setExpr_trim:(EReg*)hx_val {
	expr_trim = hx_val;
}
static EReg* expr_int;
+ (EReg*) expr_int {
	if (expr_int == nil) expr_int = [[EReg alloc] init:[@"^[0-9]+$" mutableCopy] opt:[@"" mutableCopy]];
	return expr_int;
}
+ (void) setExpr_int:(EReg*)hx_val {
	expr_int = hx_val;
}
static EReg* expr_float;
+ (EReg*) expr_float {
	if (expr_float == nil) expr_float = [[EReg alloc] init:[@"^([+-]?)(?=\\d|,\\d)\\d*(,\\d*)?([Ee]([+-]?\\d+))?$" mutableCopy] opt:[@"" mutableCopy]];
	return expr_float;
}
+ (void) setExpr_float:(EReg*)hx_val {
	expr_float = hx_val;
}
static id globals;
+ (id) globals {
	if (globals == nil) globals = [@{
} mutableCopy];
	return globals;
}
+ (void) setGlobals:(id)hx_val {
	globals = hx_val;
}
@synthesize expr;
@synthesize context;
@synthesize macros;
@synthesize stack;
@synthesize buf;
- (NSMutableString*) execute:(id)context macros:(id)macros{
	
	// Optional arguments
	if (!macros) macros = nil;
	
	self.macros = ( (macros == nil) ? [@{
	} mutableCopy] : macros);
	self.context = context;
	self.stack = [[List alloc] init];
	self.buf = [[StringBuf alloc] init];
	[self run:self.expr];
	return self.buf.b;
}
- (id) resolve:(NSMutableString*)v{
	
	if ([Reflect hasField:self.context field:v]) return [Reflect field:self.context field:v];
	{
		id _it = [self.stack iterator];
		while ( [_it hasNext] ) do {
			id ctx = [_it next];
			if ([Reflect hasField:ctx field:v]) return [Reflect field:ctx field:v];
		}
	}
	if (v == [@"__current__" mutableCopy]) return self.context;
	return [Reflect field:--TDynamic-- field:v];
}
- (List*) parseTokens:(NSMutableString*)data{
	
	
	List *tokens = [[List alloc] init];
	while ([splitter match:data]) {
		
		id p = [splitter matchedPos];
		if (p pos > 0) [tokens add:[@{
			@"p":[[data substr:@0 len:p pos] copy],
			@"s":[YES copy],
			@"l":[[NSNull null] copy],
		} mutableCopy]];
		if ([data charCodeAt:p pos] == 58) {
			
			[tokens add:[@{
				@"p":[[data substr:p pos + @2 len:p len - @4] copy],
				@"s":[NO copy],
				@"l":[[NSNull null] copy],
			} mutableCopy]];
			data = [splitter matchedRight];
			continue;
		}
		int parp = p pos + p len;
		int npar = 1;
		while (npar > 0) {
			
			int c = [data charCodeAt:parp];
			if (c == 40) npar++;
			else if (c == 41) npar--;
			else if (c == nil) @throw [@"Unclosed macro parenthesis" mutableCopy];
			parp++;
		}
		
		NSMutableArray *params = [[data substr:p pos + p len len:parp -  (p pos + p len) - 1] split:[@"," mutableCopy]];
		[tokens add:[@{
			@"p":[[splitter matched:@2] copy],
			@"s":[NO copy],
			@"l":[params copy],
		} mutableCopy]];
		data = [data substr:parp len:data.length - parp];
	}
	if (data.length > 0) [tokens add:[@{
		@"p":[data copy],
		@"s":[YES copy],
		@"l":[[NSNull null] copy],
	} mutableCopy]];
	return tokens;
}
- (TemplateExpr*) parseBlock:(List*)tokens{
	
	
	List *l = [[List alloc] init];
	while (YES) {
		
		id t = [tokens first];
		if (t == nil) break;
		if (!t s &&  (t p == [@"end" mutableCopy] || t p == [@"else" mutableCopy] || [t p substr:0 len:7] == [@"elseif " mutableCopy])) break;
		[l add:[self parse:tokens]];
	}
	if (l.length == 1) return [l first];
	return [OpBlock:l];
}
- (TemplateExpr*) parse:(List*)tokens{
	
	id t = [tokens pop];
	
	NSMutableString *p = t p;
	if (t s) return [OpStr:p];
	if (t l != nil) {
		
		
		List *pe = [[List alloc] init];
		{
			
			int _g = 0; 
			NSMutableArray *_g1 = t l;
			while (_g < _g1.length) {
				
				
				NSMutableString *p1 = ((NSMutableString*)[_g1 hx_objectAtIndex:_g]);
				++_g;
				[pe add:[self parseBlock:[self parseTokens:p1]]];
			}
		}
		return [OpMacro:p params:pe];
	}
	if ([p substr:0 len:3] == [@"if " mutableCopy]) {
		
		p = [p substr:3 len:p.length - 3];
		id e = [self parseExpr:p];
		
		TemplateExpr *eif = [self parseBlock:tokens];
		id t1 = [tokens first];
		
		TemplateExpr *eelse;
		if (t1 == nil) @throw [@"Unclosed 'if'" mutableCopy];
		if (t1 p == [@"end" mutableCopy]) {
			
			[tokens pop];
			eelse = nil;
		}
		else if (t1 p == [@"else" mutableCopy]) {
			
			[tokens pop];
			eelse = [self parseBlock:tokens];
			t1 = [tokens pop];
			if (t1 == nil || t1 p != [@"end" mutableCopy]) @throw [@"Unclosed 'else'" mutableCopy];
		}
		else {
			
			t1 p = [t1 p substr:4 len:t1 p.length - 4];
			eelse = [self parse:tokens];
		}
		return [OpIf:e eif:eif eelse:eelse];
	}
	if ([p substr:0 len:8] == [@"foreach " mutableCopy]) {
		
		p = [p substr:8 len:p.length - 8];
		id e = [self parseExpr:p];
		
		TemplateExpr *efor = [self parseBlock:tokens];
		id t1 = [tokens pop];
		if (t1 == nil || t1 p != [@"end" mutableCopy]) @throw [@"Unclosed 'foreach'" mutableCopy];
		return [OpForeach:e loop:efor];
	}
	if ([expr_splitter match:p]) return [OpExpr:[self parseExpr:p]];
	return [OpVar:p];
}
- (id) parseExpr:(NSMutableString*)data{
	
	
	List *l = [[List alloc] init];
	
	NSMutableString *expr = data;
	while ([expr_splitter match:data]) {
		
		id p = [expr_splitter matchedPos];
		int k = p pos + p len;
		if (p pos != 0) [l add:[@{
			@"p":[[data substr:@0 len:p pos] copy],
			@"s":[YES copy],
		} mutableCopy]];
		
		NSMutableString *p1 = [expr_splitter matched:0];
		[l add:[@{
			@"p":[p1 copy],
			@"s":[[p1 hx_dyn_indexOf:[@"\"" mutableCopy] startIndex:nil] >= @0 copy],
		} mutableCopy]];
		data = [expr_splitter matchedRight];
	}
	if (data.length != 0) [l add:[@{
		@"p":[data copy],
		@"s":[YES copy],
	} mutableCopy]];
	id e;
	@try {
		
		e = [self makeExpr:l];
		if (![l isEmpty]) @throw [l first] p;
	}
	@catch (NSException *s) {
		
		@throw [[[[@"Unexpected '" mutableCopy] stringByAppendingString:s] stringByAppendingString:[@"' in " mutableCopy]] stringByAppendingString:expr];
	}
	return ^(){
		
		@try {
			
			return [e];
		}
		@catch (NSException *exc) {
			
			@throw [[[[@"Error : " mutableCopy] stringByAppendingString:[Std string:exc]] stringByAppendingString:[@" in " mutableCopy]] stringByAppendingString:expr];
		}
		return 0;
	}
}
- (id) makeConst:(NSMutableString*)v{
	
	[expr_trim match:v];
	v = [expr_trim matched:1];
	if ([v charCodeAt:0] == 34) {
		
		
		NSMutableString *str = [v substr:1 len:v.length - 2];
		return ^(){
			
			return str;
		}
	}
	if ([expr_int match:v]) {
		
		int i = [Std parseInt:v];
		return ^(){
			
			return i;
		}
	}
	if ([expr_float match:v]) {
		
		float f = [Std parseFloat:v];
		return ^(){
			
			return f;
		}
	}
	
	Template *me = self;
	return ^(){
		
		return [me resolve:v];
	}
}
- (id) makePath:(id)e l:(List*)l{
	
	id p = [l first];
	if (p == nil || p p != [@"." mutableCopy]) return e;
	[l pop];
	id field = [l pop];
	if (field == nil || !field s) @throw field p;
	
	NSMutableString *f = field p;
	[expr_trim match:f];
	f = [expr_trim matched:1];
	return [self makePath:^(){
		
		return [Reflect field:[e] field:f];
	} l:l];
}
- (id) makeExpr:(List*)l{
	
	return [self makePath:[self makeExpr2:l] l:l];
}
- (id) makeExpr2:(List*)l{
	
	id p = [l pop];
	if (p == nil) @throw [@"<eof>" mutableCopy];
	if (p s) return [self makeConst:p p];
	switch (p p){
		case [@"(" mutableCopy]:{
			
			id e1 = [self makeExpr:l];
			id p1 = [l pop];
			if (p1 == nil || p1 s) @throw p1 p;
			if (p1 p == [@")" mutableCopy]) return e1;;
			id e2 = [self makeExpr:l];
			id p2 = [l pop];
			if (p2 == nil || p2 p != [@")" mutableCopy]) @throw p2 p;
			return ((id)self.__r__ switch (p1 p){
				case [@"+" mutableCopy]:__r__ = ^(){
					
					return (id)[e1] + [e2];;
				};
				break;
				case [@"-" mutableCopy]:__r__ = ^(){
					
					return (id)[e1] - [e2];;
				};
				break;
				case [@"*" mutableCopy]:__r__ = ^(){
					
					return (id)[e1] * [e2];;
				};
				break;
				case [@"/" mutableCopy]:__r__ = ^(){
					
					return (id)[e1] / [e2];;
				};
				break;
				case [@">" mutableCopy]:__r__ = ^(){
					
					return (id)[e1] > [e2];;
				};
				break;
				case [@"<" mutableCopy]:__r__ = ^(){
					
					return (id)[e1] < [e2];;
				};
				break;
				case [@">=" mutableCopy]:__r__ = ^(){
					
					return (id)[e1] >= [e2];;
				};
				break;
				case [@"<=" mutableCopy]:__r__ = ^(){
					
					return (id)[e1] <= [e2];;
				};
				break;
				case [@"==" mutableCopy]:__r__ = ^(){
					
					return (id)[e1] == [e2];;
				};
				break;
				case [@"!=" mutableCopy]:__r__ = ^(){
					
					return (id)[e1] != [e2];;
				};
				break;
				case [@"&&" mutableCopy]:__r__ = ^(){
					
					return (id)[e1] && [e2];;
				};
				break;
				case [@"||" mutableCopy]:__r__ = ^(){
					
					return (id)[e1] || [e2];;
				};
				break;
				default:__r__ = ((id)self.__r__2 @throw [[@"Unknown operation " mutableCopy] stringByAppendingString:p1 p]
				return __r__2{
					
					id* __r__2}
				}(self));break;
			}
			return __r__{
				
				id* __r__}
			}(self));
		}
		break;
		case [@"!" mutableCopy]:{
			
			id e = [self makeExpr:l];
			return ^(){
				
				id v = [e];
				return v == nil || v == NO;
			}
		}
		break;
		case [@"-" mutableCopy]:{
			
			id e = [self makeExpr:l];
			return ^(){
				
				return -[e];
			}
		}
		break;
	}
	@throw p p;
	return nil;
}
- (void) run:(TemplateExpr*)e{
	
	
	enum s = e (e)
	switch ( e.index ) {
		
		case 0:
		
		var MATCH v : NSMutableString = e.params[0][self.buf.b appendString:[Std string:[Std string:[self resolve:v]]]];break
		case 1:
		
		var MATCH e1 : id = e.params[0][self.buf.b appendString:[Std string:[Std string:[e1]]]];break
		case 2:
		
		var MATCH eelse : TemplateExpr = e.params[2], MATCH eif : TemplateExpr = e.params[1], MATCH e1 : id = e.params[0]{
			
			id v = [e1];
			if (v == nil || v == NO) {
				
				if (eelse != nil) [self run:eelse];
			}
			else [self run:eif];
		}break
		case 3:
		
		var MATCH str : NSMutableString = e.params[0][self.buf.b appendString:[Std string:str]];break
		case 4:
		
		var MATCH l : List = e.params[0]{
			
			{
				id _it2 = [l iterator];
				while ( [_it2 hasNext] ) do {
					TemplateExpr e1 = [_it2 next];
					[self run:e1];
				}
			}
		}break
		case 5:
		
		var MATCH loop : TemplateExpr = e.params[1], MATCH e1 : id = e.params[0]{
			
			id v = [e1];
			@try {
				
				id x = [v iterator];
				if ([x hasNext] == nil) @throw nil;
				v = x;
			}
			@catch (NSException *e2) {
				
				@try {
					
					if ([v hasNext] == nil) @throw nil;
				}
				@catch (NSException *e3) {
					
					@throw [[@"Cannot iter on " mutableCopy] stringByAppendingString:[Std string:v]];
				}
			}
			[self.stack push:self.context];
			id v1 = v;
			{
				id _it3 = v1;
				while ( [_it3 hasNext] ) do {
					id ctx = [_it3 next];
					{
						
						self.context = ctx;
						[self run:loop];
					};
				}
			}
			self.context = [self.stack pop];
		}break
		case 6:
		
		var MATCH params : List = e.params[1], MATCH m : NSMutableString = e.params[0]{
			
			id v = [Reflect field:self.macros field:m];
			
			NSMutableArray *pl = [[NSMutableArray alloc] init];
			
			StringBuf *old = self.buf;
			[pl push:^(NSMutableString *v){ [self resolve:v]; }];
			{
				id _it4 = [params iterator];
				while ( [_it4 hasNext] ) do {
					TemplateExpr p = [_it4 next];
					{
						
						
						enum s = e5 (p)
						switch ( e5.index ) {
							
							case 0:
							
							var MATCH v1 : NSMutableString = e5.params[0][pl push:[self resolve:v1]];break
							default:{
								
								self.buf = [[StringBuf alloc] init];
								[self run:p];
								[pl push:self.buf.b];
							}break
						}
					};
				}
			}
			self.buf = old;
			@try {
				
				[self.buf.b appendString:[Std string:[Std string:[Reflect callMethod:self.macros func:v args:pl]]]];
			}
			@catch (NSException *e1) {
				
				
				NSMutableString *plstr = ((NSMutableString)self.__r__6 @try {
					
					__r__6 = [pl join:[@"," mutableCopy]];
				}
				@catch (NSException *e2) {
					
					__r__6 = [@"???" mutableCopy];
				}
				return __r__6{
					
					NSMutableString* __r__6}
				}(self));
				
				NSMutableString *msg = [[[[[[[@"Macro call " mutableCopy] stringByAppendingString:m] stringByAppendingString:[@"(" mutableCopy]] stringByAppendingString:plstr] stringByAppendingString:[@") failed (" mutableCopy]] stringByAppendingString:[Std string:e1]] stringByAppendingString:[@")" mutableCopy]];
				@throw msg;
			}
		}break
	}
}
- (id) init:(NSMutableString*)str{
	
	self = [super init];
	
	List *tokens = [self parseTokens:str];
	self.expr = [self parseBlock:tokens];
	if (![tokens isEmpty]) @throw [[[@"Unexpected '" mutableCopy] stringByAppendingString:[Std string:[tokens first] s]] stringByAppendingString:[@"'" mutableCopy]];
	return self;
}

@end
