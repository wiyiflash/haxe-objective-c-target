//
//  Template
//  Test
//
//  Source generated by Haxe Objective-C target
//

#import "../haxe/Template.h"

@implementation Template

+ (EReg*) splitter:(EReg*)val {
	static EReg *_val;
	if (val == nil) { if (_val == nil) _val = [[EReg alloc] init:(NSMutableString*)@"(::[A-Za-z0-9_ ()&|!+=/><*.\"-]+::|\\$\\$([A-Za-z0-9_-]+)\\()" opt:(NSMutableString*)@""]; }
	else { if (_val != nil) _val = val; }
	return _val;
}
+ (EReg*) expr_splitter:(EReg*)val {
	static EReg *_val;
	if (val == nil) { if (_val == nil) _val = [[EReg alloc] init:(NSMutableString*)@"(\\(|\\)|[ \r\n\t]*\"[^\"]*\"[ \r\n\t]*|[!+=/><*.&|-]+)" opt:(NSMutableString*)@""]; }
	else { if (_val != nil) _val = val; }
	return _val;
}
+ (EReg*) expr_trim:(EReg*)val {
	static EReg *_val;
	if (val == nil) { if (_val == nil) _val = [[EReg alloc] init:(NSMutableString*)@"^[ ]*([^ ]+)[ ]*$" opt:(NSMutableString*)@""]; }
	else { if (_val != nil) _val = val; }
	return _val;
}
+ (EReg*) expr_int:(EReg*)val {
	static EReg *_val;
	if (val == nil) { if (_val == nil) _val = [[EReg alloc] init:(NSMutableString*)@"^[0-9]+$" opt:(NSMutableString*)@""]; }
	else { if (_val != nil) _val = val; }
	return _val;
}
+ (EReg*) expr_float:(EReg*)val {
	static EReg *_val;
	if (val == nil) { if (_val == nil) _val = [[EReg alloc] init:(NSMutableString*)@"^([+-]?)(?=\\d|,\\d)\\d*(,\\d*)?([Ee]([+-]?\\d+))?$" opt:(NSMutableString*)@""]; }
	else { if (_val != nil) _val = val; }
	return _val;
}
+ (id) globals:(id)val {
	static id _val;
	if (val == nil) { if (_val == nil) _val = struct {

} structName; }
	else { if (_val != nil) _val = val; }
	return _val;
}
@synthesize expr;
@synthesize context;
@synthesize macros;
@synthesize stack;
@synthesize buf;
- (NSMutableString*) execute:(id)context macros:(id)macros{
	// Simulated optional arguments
	if (macros == nil) macros = nil;
	
	self.macros = ( (macros == nil) ? struct {
	
	} structName : macros);
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
	if (v == (NSMutableString*)@"__current__") return self.context;
	return [Reflect field:Template globals field:v];
}
- (List*) parseTokens:(NSMutableString*)data{
	
	List *tokens = [[List alloc] init];
	while ([Template.splitter match:data]) {
		id p = [Template.splitter matchedPos];
		if (p pos > 0) [tokens add:struct {
		p:[data substr:0 len:p pos]; s:YES; l:nil
		} structName];
		if ([data characterAtIndex:p pos] == 58) {
			[tokens add:struct {
			p:[data substr:p pos + 2 len:p len - 4]; s:NO; l:nil
			} structName];
			data = [Template splitter matchedRight];
			continue;
		}
		int parp = p pos + p len;
		int npar = 1;
		while (npar > 0) {
			int c = [data characterAtIndex:parp];
			if (c == 40) npar++;
			else if (c == 41) npar--;
			else if (c == nil) @throw (NSMutableString*)@"Unclosed macro parenthesis";;
			parp++;
		}
		
		NSMutableArray *params = (NSMutableArray*)[[data substr:p pos + p len len:parp -  (p pos + p len) - 1] componentsSeparatedByString:(NSMutableString*)@","];
		[tokens add:struct {
		p:[Template.splitter matched:2]; s:NO; l:params
		} structName];
		data = [data substr:parp len:data.length - parp];
	}
	if (data.length > 0) [tokens add:struct {
	p:data; s:YES; l:nil
	} structName];
	return tokens;
}
- (Template*) parseBlock:(List*)tokens{
	
	List *l = [[List alloc] init];
	while (YES) {
		id t = [tokens first];
		if (t == nil) break;
		if (!t s &&  (t p == (NSMutableString*)@"end" || t p == (NSMutableString*)@"else" || [t p substr:0 len:7] == (NSMutableString*)@"elseif ")) break;
		[l add:[self.parse:tokens]];
	}
	if (l.length == 1) return [l first];
	return FEnum[ OpBlock:l];
}
- (Template*) parse:(List*)tokens{
	id t = [tokens pop];
	
	NSMutableString *p = t p;
	if (t s) return FEnum[ OpStr:p];
	if (t l != nil) {
		
		List *pe = [[List alloc] init];
		{
			int _g = 0; 
			NSMutableArray *_g1 = (NSMutableArray*)t l;
			while (_g < _g1.length) {
				
				NSMutableString *p1 = [_g1 objectAtIndex:_g];
				++_g;
				[pe add:[self.parseBlock:[self.parseTokens:p1]]];
			}
		}
		return FEnum[ OpMacro:p params:pe];
	}
	if ([p substr:0 len:3] == (NSMutableString*)@"if ") {
		p = [p substr:3 len:p.length - 3];
		SEL e = [self parseExpr:p];
		
		Template *eif = [self parseBlock:tokens];
		id t1 = [tokens first];
		
		Template *eelse;
		if (t1 == nil) @throw (NSMutableString*)@"Unclosed 'if'";;
		if (t1 p == (NSMutableString*)@"end") {
			[tokens pop];
			eelse = nil;
		}
		else if (t1 p == (NSMutableString*)@"else") {
			[tokens pop];
			eelse = [self parseBlock:tokens];
			t1 = [tokens pop];
			if (t1 == nil || t1 p != (NSMutableString*)@"end") @throw (NSMutableString*)@"Unclosed 'else'";;
		}
		else {
			t1 p = [t1 p substr:4 len:t1 p.length - 4];
			eelse = [self parse:tokens];
		}
		return FEnum[ OpIf:e eif:eif eelse:eelse];
	}
	if ([p substr:0 len:8] == (NSMutableString*)@"foreach ") {
		p = [p substr:8 len:p.length - 8];
		SEL e = [self parseExpr:p];
		
		Template *efor = [self parseBlock:tokens];
		id t1 = [tokens pop];
		if (t1 == nil || t1 p != (NSMutableString*)@"end") @throw (NSMutableString*)@"Unclosed 'foreach'";;
		return FEnum[ OpForeach:e loop:efor];
	}
	if ([Template.expr_splitter match:p]) return FEnum[ OpExpr:[self.parseExpr:p]];
	return FEnum[ OpVar:p];
}
- (SEL) parseExpr:(NSMutableString*)data{
	
	List *l = [[List alloc] init];
	
	NSMutableArray *expr = [[NSMutableArray alloc] initWithObjects:data, nil];
	while ([Template.expr_splitter match:data]) {
		id p = [Template.expr_splitter matchedPos];
		int k = p pos + p len;
		if (p pos != 0) [l add:struct {
		p:[data substr:0 len:p pos]; s:YES
		} structName];
		
		NSMutableString *p1 = [Template.expr_splitter matched:0];
		[l add:struct {
		p:p1; s:[p1 indexOf:(NSMutableString*)@"\"" startIndex:nil] >= 0
		} structName];
		data = [Template expr_splitter matchedRight];
	}
	if (data.length != 0) [l add:struct {
	p:data; s:YES
	} structName];
	
	NSMutableArray *e = [[NSMutableArray alloc] initWithObjects:, nil];
	@try {
		[e objectAtIndex:0] = [self makeExpr:l];
		if (![l isEmpty]) @throw [l first] p;;
	}
	@catch (NSException *s) {
		@throw [[[(NSMutableString*)@"Unexpected '" stringByAppendingString:s] stringByAppendingString:(NSMutableString*)@"' in "] stringByAppendingString:[expr objectAtIndex:@"0"]];;
	}
	return ^- (int) {
		@try {
			return [[e objectAtIndex:0]];
		}
		@catch (NSException *exc) {
			@throw [[[(NSMutableString*)@"Error : " stringByAppendingString:[Std string:exc]] stringByAppendingString:(NSMutableString*)@" in "] stringByAppendingString:[expr objectAtIndex:@"0"]];;
		}
		return 0;
	}
}
- (SEL) makeConst:(NSMutableString*)v{
	
	NSMutableArray *v1 = [[NSMutableArray alloc] initWithObjects:v, nil];
	[Template.expr_trim match:[v1 objectAtIndex:0]];
	[v1 objectAtIndex:0] = [Template expr_trim matched:1];
	if ([[v1 objectAtIndex:0] characterAtIndex:0] == 34) {
		
		NSMutableArray *str = [[NSMutableArray alloc] initWithObjects:[[v1 objectAtIndex:[NSNumber numberWithInt:0]] substr:[NSNumber numberWithInt:1] len:[v1 objectAtIndex:[NSNumber numberWithInt:0]].length - [NSNumber numberWithInt:2]], nil];
		return ^- (NSMutableString*) {
			return [str objectAtIndex:0];
		}
	}
	if ([Template.expr_int match:[v1 objectAtIndex:0]]) {
		
		NSMutableArray *i = [[NSMutableArray alloc] initWithObjects:[Std parseInt:[v1 objectAtIndex:[NSNumber numberWithInt:0]]], nil];
		return ^- (int) {
			return [i objectAtIndex:0];
		}
	}
	if ([Template.expr_float match:[v1 objectAtIndex:0]]) {
		
		NSMutableArray *f = [[NSMutableArray alloc] initWithObjects:[Std parseFloat:[v1 objectAtIndex:[NSNumber numberWithInt:0]]], nil];
		return ^- (float) {
			return [f objectAtIndex:0];
		}
	}
	
	NSMutableArray *me = [[NSMutableArray alloc] initWithObjects:self, nil];
	return ^- (id) {
		return [[me objectAtIndex:0] resolve:[v1 objectAtIndex:0]];
	}
}
- (SEL) makePath:(SEL)e l:(List*)l{
	
	NSMutableArray *e1 = [[NSMutableArray alloc] initWithObjects:e, nil];
	id p = [l first];
	if (p == nil || p p != (NSMutableString*)@".") return [e1 objectAtIndex:0];
	[l pop];
	id field = [l pop];
	if (field == nil || !field s) @throw field p;;
	
	NSMutableArray *f = [[NSMutableArray alloc] initWithObjects:field p, nil];
	[Template.expr_trim match:[f objectAtIndex:0]];
	[f objectAtIndex:0] = [Template expr_trim matched:1];
	return [self makePath:^- (id) {
		return [Reflect field:[[e1 objectAtIndex:0]] field:[f objectAtIndex:0]];
	} l:l];
}
- (SEL) makeExpr:(List*)l{
	return [self makePath:[self.makeExpr2:l] l:l];
}
- (SEL) makeExpr2:(List*)l{
	id p = [l pop];
	if (p == nil) @throw (NSMutableString*)@"<eof>";;
	if (p s) return [self makeConst:p p];
	switch (p p){
		case (NSMutableString*)@"(":{
			{
				
				NSMutableArray *e1 = [[NSMutableArray alloc] initWithObjects:[self makeExpr:l], nil];
				id p1 = [l pop];
				if (p1 == nil || p1 s) @throw p1 p;;
				if (p1 p == (NSMutableString*)@")") return [e1 objectAtIndex:0];
				
				NSMutableArray *e2 = [[NSMutableArray alloc] initWithObjects:[self makeExpr:l], nil];
				id p2 = [l pop];
				if (p2 == nil || p2 p != (NSMutableString*)@")") @throw p2 p;;
				return ((SEL)($this:(snd ctx.path)) switch (p1 p){
					case (NSMutableString*)@"+":{
						__r__ = ^- (id) {
							return (id)[[e1 objectAtIndex:0]] + [[e2 objectAtIndex:0]];
						}}break;
					case (NSMutableString*)@"-":{
						__r__ = ^- (id) {
							return (id)[[e1 objectAtIndex:0]] - [[e2 objectAtIndex:0]];
						}}break;
					case (NSMutableString*)@"*":{
						__r__ = ^- (id) {
							return (id)[[e1 objectAtIndex:0]] * [[e2 objectAtIndex:0]];
						}}break;
					case (NSMutableString*)@"/":{
						__r__ = ^- (id) {
							return (id)[[e1 objectAtIndex:0]] / [[e2 objectAtIndex:0]];
						}}break;
					case (NSMutableString*)@">":{
						__r__ = ^- (id) {
							return (id)[[e1 objectAtIndex:0]] > [[e2 objectAtIndex:0]];
						}}break;
					case (NSMutableString*)@"<":{
						__r__ = ^- (id) {
							return (id)[[e1 objectAtIndex:0]] < [[e2 objectAtIndex:0]];
						}}break;
					case (NSMutableString*)@">=":{
						__r__ = ^- (id) {
							return (id)[[e1 objectAtIndex:0]] >= [[e2 objectAtIndex:0]];
						}}break;
					case (NSMutableString*)@"<=":{
						__r__ = ^- (id) {
							return (id)[[e1 objectAtIndex:0]] <= [[e2 objectAtIndex:0]];
						}}break;
					case (NSMutableString*)@"==":{
						__r__ = ^- (id) {
							return (id)[[e1 objectAtIndex:0]] == [[e2 objectAtIndex:0]];
						}}break;
					case (NSMutableString*)@"!=":{
						__r__ = ^- (id) {
							return (id)[[e1 objectAtIndex:0]] != [[e2 objectAtIndex:0]];
						}}break;
					case (NSMutableString*)@"&&":{
						__r__ = ^- (id) {
							return (id)[[e1 objectAtIndex:0]] && [[e2 objectAtIndex:0]];
						}}break;
					case (NSMutableString*)@"||":{
						__r__ = ^- (id) {
							return (id)[[e1 objectAtIndex:0]] || [[e2 objectAtIndex:0]];
						}}break;
					default:{
						__r__ = ((SEL)($this:(snd ctx.path)) @throw [(NSMutableString*)@"Unknown operation " stringByAppendingString:p1 p];
						return __r__2{
							
							SEL* __r__2}
						}($this))}break;
				}
				return __r__{
					
					SEL* __r__}
				}(self));
			}}break;
		case (NSMutableString*)@"!":{
			{
				
				NSMutableArray *e = [[NSMutableArray alloc] initWithObjects:[self makeExpr:l], nil];
				return ^- (BOOL) {
					id v = [[e objectAtIndex:0]];
					return v == nil || v == NO;
				}
			}}break;
		case (NSMutableString*)@"-":{
			{
				
				NSMutableArray *e = [[NSMutableArray alloc] initWithObjects:[self makeExpr:l], nil];
				return ^- (int) {
					return -[[e objectAtIndex:0]];
				}
			}}break;
	}
	@throw p p;;
	return nil;
}
- (void) run:(Template*)e{
	
	var $e : enum =  (e)
	switch ( $e.index ) {
		
		case 0:
		
		var MATCH e_eOpVar_0 : NSMutableString = $e.params[0]{
			self.buf.b += [Std string:[Std string:[self.resolve:e_eOpVar_0]]]}break
		case 1:
		
		var MATCH e_eOpExpr_0 : SEL = $e.params[0]{
			self.buf.b += [Std string:[Std string:[e_eOpExpr_0]]]}break
		case 2:
		
		var MATCH e_eOpIf_2 : Template = $e.params[2], MATCH e_eOpIf_1 : Template = $e.params[1], MATCH e_eOpIf_0 : SEL = $e.params[0]{
			{
				id v = [e_eOpIf_0];
				if (v == nil || v == NO) {
					if (e_eOpIf_2 != nil) [self run:e_eOpIf_2];
				}
				else [self run:e_eOpIf_1];
			}}break
		case 3:
		
		var MATCH e_eOpStr_0 : NSMutableString = $e.params[0]{
			self.buf.b += [Std string:e_eOpStr_0]}break
		case 4:
		
		var MATCH e_eOpBlock_0 : List = $e.params[0]{
			{
				{
					id _it2 = [e_eOpBlock_0 iterator];
					while ( [_it2 hasNext] ) do {
						Template e1 = [_it2 next];
						[self run:e1];
					}
				}
			}}break
		case 5:
		
		var MATCH e_eOpForeach_1 : Template = $e.params[1], MATCH e_eOpForeach_0 : SEL = $e.params[0]{
			{
				id v = [e_eOpForeach_0];
				@try {
					id x = [v iterator];
					if (x hasNext == nil) @throw nil;;
					v = x;
				}
				@catch (NSException *e1) {
					@try {
						if (v hasNext == nil) @throw nil;;
					}
					@catch (NSException *e2) {
						@throw [(NSMutableString*)@"Cannot iter on " stringByAppendingString:[Std string:v]];;
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
							[self run:e_eOpForeach_1];
						};
					}
				}
				self.context = [self stack pop];
			}}break
		case 6:
		
		var MATCH e_eOpMacro_1 : List = $e.params[1], MATCH e_eOpMacro_0 : NSMutableString = $e.params[0]{
			{
				id v = [Reflect field:self.macros field:e_eOpMacro_0];
				
				NSMutableArray *pl = (NSMutableArray*)[[NSMutableArray alloc] init];
				
				StringBuf *old = self.buf;
				[pl push:self.resolve];
				{
					id _it4 = [e_eOpMacro_1 iterator];
					while ( [_it4 hasNext] ) do {
						Template p = [_it4 next];
						{
							
							var $e5 : enum =  (p)
							switch ( $e5.index ) {
								
								case 0:
								
								var MATCH p_eOpVar_0 : NSMutableString = $e5.params[0]{
									[pl push:[self.resolve:p_eOpVar_0]]}break
								default:{
									{
										self.buf = [[StringBuf alloc] init];
										[self run:p];
										[pl push:self.buf b];
									}}break
							}
						};
					}
				}
				self.buf = old;
				@try {
					self.buf.b += [Std string:[Std string:[Reflect callMethod:self.macros func:v args:pl]]];
				}
				@catch (NSException *e1) {
					
					NSMutableString *plstr = ((NSMutableString)($this:(snd ctx.path)) @try {
						__r__6 = [pl join:(NSMutableString*)@","];
					}
					@catch (NSException *e2) {
						__r__6 = (NSMutableString*)@"???";
					}
					return __r__6{
						
						NSMutableString* __r__6}
					}(self));
					
					NSMutableString *msg = [[[[[[(NSMutableString*)@"Macro call " stringByAppendingString:e_eOpMacro_0] stringByAppendingString:(NSMutableString*)@"("] stringByAppendingString:plstr] stringByAppendingString:(NSMutableString*)@") failed ("] stringByAppendingString:[Std string:e1]] stringByAppendingString:(NSMutableString*)@")"];
					@throw msg;;
				}
			}}break
	}
}
- (id) init:(NSMutableString*)str{
	self = [super init];
	
	List *tokens = [self parseTokens:str];
	self.expr = [self parseBlock:tokens];
	if (![tokens isEmpty]) @throw [[(NSMutableString*)@"Unexpected '" stringByAppendingString:[Std string:[tokens first] s]] stringByAppendingString:(NSMutableString*)@"'"];;
	return self;
}

@end
