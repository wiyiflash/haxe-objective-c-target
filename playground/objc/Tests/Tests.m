//
//  Tests
//  Tests
//
//  Source generated by Haxe Objective-C target
//

#import "Tests.h"

@implementation Tests

static NSMutableString* staticVar1;
+ (NSMutableString*) staticVar1 {
	if (staticVar1 == nil) staticVar1 = [@"abcd" mutableCopy];
	return staticVar1;
}
+ (void) setStaticVar1:(NSMutableString*)hx_val {
	staticVar1 = hx_val;
}
static int staticVar2;
+ (int) staticVar2 {
	if (staticVar2 == nil) staticVar2 = 5;
	return staticVar2;
}
+ (void) setStaticVar2:(int)hx_val {
	staticVar2 = hx_val;
}
static int staticVar3;
+ (int) staticVar3 {
	if (staticVar3 == nil) staticVar3 = 5;
	return staticVar3;
}
+ (void) setStaticVar3:(int)hx_val {
	staticVar3 = hx_val;
}

@synthesize interfaceVar1;
@synthesize interfaceVar2;
@synthesize d1;
@synthesize d2;
@synthesize s;
- (void) testVariables{
	
	
	NSMutableArray *a = [[NSMutableArray alloc] init];
	int b = 5;
	float c = 5.0;
	
	NSMutableString *d = [@"xyz" mutableCopy];
	BOOL e = YES;
	int f;
	int g = (int)5.3;
	id g1 = (id)6.3;
	id g2 = (id)a;
	int xy = a.length;
	[a push:[@"6" mutableCopy]];
	if (a.length > 3) f = 3;
	else f = a.length;
	f = ( (a.length > 3) ? 3 : a.length);
	[Lib print:[@"print print and print again" mutableCopy]];
	[Lib println:[@"print print and print again" mutableCopy]];
}
- (void) testingFor{
	
	
	NSMutableArray *aa = [@[@1, @2, @3, @4, @5] mutableCopy];
	{
		
		int _g = 0;
		while (_g < 5) {
			
			int i = _g++;
			[aa push:i];
		}
	}
	{
		
		int _g1 = 0; int _g = aa.length;
		while (_g1 < _g) {
			
			int i = _g1++;
			[aa push:i];
		}
	}
	{
		
		int _g = 0;
		while (_g < aa.length) {
			
			int i = ((NSMutableArray*)[aa hx_objectAtIndex:_g]);
			++_g;
			[aa push:i];
		}
	}
}
- (void) testWhile{
	
	int aa = 5;
	do {
		
		[Log trace:[@"do something" mutableCopy] infos:@{@"fileName":@"Tests.hx", @"lineNumber":@"84", @"className":@"Tests", @"methodName":@"testWhile"}];
		aa++;
	}while (aa < 10);
	while (aa > 0) aa--;
}
- (void) testTry{
	
	@try {
		
		int a = 3;
	}
	@catch (NSException *e) {
		
		[Log trace:[@"error" mutableCopy] infos:@{@"fileName":@"Tests.hx", @"lineNumber":@"101", @"className":@"Tests", @"methodName":@"testTry"}];
	}
}
- (void) testSwitch{
	
	BOOL _g = YES;
	switch (_g){
		case YES:{
			
			int x = 0;
		}
		break;
		case NO:{
			
			int y = 0;
		}
		break;
	}
}
- (void) testArray{
	
	
	NSMutableArray *as = [[NSMutableArray alloc] init];
	
	NSMutableArray *aa = [@[@1.0, @2, @3, @4, @5] mutableCopy];
	float aaa = ((NSMutableArray*)[aa hx_objectAtIndex:2]);
	((NSMutableArray*)[aa hx_objectAtIndex:3]);
	
	NSMutableArray *concatArray = [as concat:[@[[@"5" mutableCopy], [@"6" mutableCopy], [@"7" mutableCopy]] mutableCopy]];
	concatArray = [as copy];
	[concatArray insert:2 x:[@"2" mutableCopy]];
	id iter = [as iterator];
	
	NSMutableString *s = [concatArray join:[@", " mutableCopy]];
	
	NSMutableString *item = [as pop];
	[as push:[@"454" mutableCopy]];
	BOOL bool = [as remove:[@"5" mutableCopy]];
	[as reverse];
	item = [as shift];
	
	NSMutableArray *sliceArray = [as slice:1 end:3];
	[as sort:^(NSMutableString *a, NSMutableString *b){
		
		return 0;
	}];
	sliceArray = [as splice:2 len:2];
	s = [as toString];
	[as unshift:[@"44" mutableCopy]];
	
	NSMutableArray *a_comprehention = ((NSMutableArray)self.__r__ 
	NSMutableArray *_g = [@[] mutableCopy]
	{
		
		int _g1 = 0;
		while (_g1 < 10) {
			
			int x = _g1++;
			[_g push:x];
		}
	}
	__r__ = _g
	return __r__{
		
		NSMutableArray* __r__}
	}(self));
	
	NSMutableArray *b_comprehention = ((NSMutableArray)self.__r__2 
	NSMutableArray *_g1 = [@[] mutableCopy]
	{
		
		int _g2 = 0;
		while (_g2 < a_comprehention.length) {
			
			int x = ((NSMutableArray*)[a_comprehention hx_objectAtIndex:_g2]);
			++_g2;
			if (x % 2 == 0) [_g1 push:x];
		}
	}
	__r__2 = _g1
	return __r__2{
		
		NSMutableArray* __r__2}
	}(self));
	
	NSMutableArray *c_comprehention = ((NSMutableArray)self.__r__3 
	NSMutableArray *_g2 = [@[] mutableCopy]
	{
		
		int _g3 = 0;
		while (_g3 < 4) {
			
			int x = _g3++;
			int _g5 = 0; int _g4 = x + 1;
			while (_g5 < _g4) {
				
				int i = _g5++;
				[_g2 push:i];
			}
		}
	}
	__r__3 = _g2
	return __r__3{
		
		NSMutableArray* __r__3}
	}(self));
	{
		
		int _g3 = 0;
		while (_g3 < concatArray.length) {
			
			
			NSMutableString *val = ((NSMutableArray*)[concatArray hx_objectAtIndex:_g3]);
			++_g3;
			[Log trace:val infos:@{@"fileName":@"Tests.hx", @"lineNumber":@"148", @"className":@"Tests", @"methodName":@"testArray"}];
		}
	}
}
- (void) testDate{
	
	
	NSDate *d = [[NSDate alloc] init:2012 month:11 day:13 hour:19 min:30 sec:0];
	int _int = [d getDate];
	_int = [d getDay];
	_int = [d getFullYear];
	_int = [d getHours];
	_int = [d getMinutes];
	_int = [d getMonth];
	_int = [d getSeconds];
	float _float = [d getTime];
	
	NSMutableString *str = [d toString];
	
	NSDate *d2 = [NSDate fromString:[@"2012-12-12 06:40:00" mutableCopy]];
	d2 = [NSDatefromTime:120000];
	d2 = [NSDatenow];
	int x = [DateTools getMonthDays:d2];
}
- (int) enumToInt:(Color*)c{
	
	[self testEnum:ExternEnumValue1];
	return ((int)self.__r__ 
	enum s = e2 (c)
	switch ( e2.index ) {
		
		case 0:
		__r__ = 16711680;break
		case 1:
		__r__ = 65280;break
		case 2:
		__r__ = 255;break
		case 3:
		
		var MATCH v : int = e2.params[0]__r__ = ((v << 16 | v << 8) | v);break
		case 4:
		
		var MATCH b : int = e2.params[2], MATCH g : int = e2.params[1], MATCH r : int = e2.params[0]__r__ = ((r << 16 | g << 8) | b);break
		case 5:
		
		var MATCH c1 : Color = e2.params[1], MATCH a : int = e2.params[0]__r__ = (a << 24 | ([self hx_dyn_enumToInt:c1] & 16777215));break
	}
	return __r__{
		
		int* __r__}
	}(self));
}
- (void) testEnum:(TestsEnumExtern*)v{
	
	int i = ((int)self.__r__ 
	enum s = e2 (v)
	switch ( e2.index ) {
		
		case 0:
		__r__ = 5;break
		case 1:
		__r__ = 6;break
		case 2:
		__r__ = 7;break
	}
	return __r__{
		
		int* __r__}
	}(self));
	
	Color2 *red = Red2;
	int j = ((int)self.__r__3 
	enum s = e4 (red)
	switch ( e4.index ) {
		
		case 0:
		__r__3 = 5;break
		case 1:
		__r__3 = 6;break
		case 2:
		__r__3 = 7;break
	}
	return __r__3{
		
		int* __r__3}
	}(self));
}
- (void) testEReg{
	
}
- (void) testMap{
	
	
	StringMap *h = [[StringMap alloc] init];
	[h set:[@"key" mutableCopy] v:[@"value" mutableCopy]];
	[h get:[@"key" mutableCopy]];
	[h remove:[@"key" mutableCopy]];
	BOOL b = [h exists:[@"key" mutableCopy]];
	id arr = [h keys];
	id iter = [h iterator];
	
	NSMutableString *str = [h toString];
}
- (void) testLambda{
	
	
	NSMutableArray *a = [Lambda array:[@[@0, @1, @2, @3] mutableCopy]];
	
	List *l = [Lambda concat:[@[@0, @1, @2, @3] mutableCopy] b:[@[@4, @5] mutableCopy]];
}
- (void) testGenericStack{
	
	
	GenericStack *l = [[GenericStack alloc] init];
	l.head = [[GenericCell alloc] init:2 next:l head];
	int item = ( (l.head == nil) ? nil : l.head.elt);
	BOOL empty = l.head == nil;
	id iter = [l iterator];
	item = ( (l.head == nil) ? nil : l.head.elt);
	item = ((int)self.__r__ 
	GenericCell *k = l.head
	__r__ = ( (k == nil) ? nil : ((int)self.__r__2 l.head = k.next
	__r__2 = k.elt
	return __r__2{
		
		int* __r__2}
	}(self)))
	return __r__{
		
		int* __r__}
	}(self));
	BOOL r = [l remove:5];
}
- (void) testReflect{
	
	id obj = [@{
		@"a":[[@"aaaaa" mutableCopy] copy],
	} mutableCopy];
	BOOL b = [Reflect hasField:obj field:[@"a" mutableCopy]];
	id f = [Reflect field:obj field:[@"a" mutableCopy]];
	if (obj != nil) [obj hx_set_field:[@"a" mutableCopy] :[@"bbbbb" mutableCopy] :NO];
	[self hx_set_field:[@"interfaceVar1" mutableCopy] :[@"bbbbb" mutableCopy] :YES];
	id p = (id)[self hx_field:[@"interfaceVar1" mutableCopy] :YES];
	[Reflect callMethod:self func:^(){ [self testStd]; } args:[@[] mutableCopy]];
	[Reflect callMethod:self func:^(int arg1, int arg2, int arg3, int arg4){ [self callLotsOfArguments:arg1 arg2:arg2 arg3:arg3 arg4:arg4]; } args:[@[@1, @2, @3, @4] mutableCopy]];
	
	NSMutableArray *fs = [Reflect fields:obj];
	BOOL isf = [Reflect isFunction:^(){ [self testStd]; }];
	int i = [Reflect compare:1 b:2];
	BOOL cm = [Reflect compareMethods:^(){ [self testStd]; } f2:^(){ [self testString]; }];
	BOOL isobj = [Reflect isObject:obj];
	isobj = [Reflect isObject:^(){ [self testStd]; }];
	[Reflect deleteField:obj field:[@"a" mutableCopy]];
	id obj2 = [Reflect copy:obj];
}
- (void) testStd{
	
	int _int = 3;
	BOOL _BOOL = [Std is:self.d1 t: TAbstractDecl ];
	float _float = [Std parseFloat:[@"55454.65" mutableCopy]];
	_int = [Std parseInt:[@"435345.23" mutableCopy]];
	_int = [Std random:543];
	
	NSMutableString *string = [Std string:_int];
}
- (void) testString{
	
	
	NSMutableString *string = [[NSMutableString alloc] init:[@"abcdefghijklmnopqrstuvwxyz" mutableCopy]];
	int len = string.length;
	
	NSMutableString *s = [string charAt:5];
	int ch = [string charCodeAt:5];
	int i = [string indexOf:[@"abc" mutableCopy] startIndex:nil];
	int i1 = [string indexOf:[@"abc" mutableCopy] startIndex:2];
	int li = [string lastIndexOf:[@"abc" mutableCopy] startIndex:nil];
	
	NSMutableArray *components = [string split:[@"-" mutableCopy]];
	
	NSMutableString *s2 = [string substr:5 len:nil];
	s2 = [string substr:5 len:len];
	s2 = [string substring:5 endIndex:nil];
	s2 = [string substring:1 endIndex:len];
	s2 = [string toLowerCase];
	s2 = [string toUpperCase];
	s2 = [string toString];
	
	NSMutableString *s3 = [@"\t" mutableCopy];
	
	StringBuf *buf = [[StringBuf alloc] init];
	[buf.b appendString:[@"abc" mutableCopy]];
	[buf.b appendString:[@"" mutableCopy]];
	[buf.b appendString:[[@"abcdefghijklmnopqerstuvwxyz" mutableCopy] substr:@"5" len:nil]];
	[buf.b appendString:[[@"abcdefghijklmnopqerstuvwxyz" mutableCopy] substr:@"5" len:@"10"]];
	
	NSMutableString *strbuf = buf.b;
	
	NSMutableString *st = [StringTools urlEncode:[@"http://imagin.ro/Gorgeous Elena/2" mutableCopy]];
	st = [StringTools urlDecode:[@"http://imagin.ro/Gorgeous Elena/2" mutableCopy]];
	st = [StringTools htmlEscape:[@"<a href= &>" mutableCopy] quotes:nil];
	st = [StringTools htmlUnescape:[@"<a href= &>" mutableCopy]];
	st = [StringTools ltrim:[@" abcdefgh" mutableCopy]];
	st = [StringTools rtrim:[@"abcdefgh " mutableCopy]];
	st = [StringTools trim:[@" abcdefgh " mutableCopy]];
	st = [StringTools rpad:[@"abcdefgh" mutableCopy] c:[@"0" mutableCopy] l:10];
	st = [StringTools lpad:[@"abcdefgh" mutableCopy] c:[@"0" mutableCopy] l:10];
	st = [StringTools replace:[@"abcdefgh" mutableCopy] sub:[@"abc" mutableCopy] by:[@"_abc" mutableCopy]];
	BOOL b = [StringTools startsWith:[@"abcdefg" mutableCopy] start:[@"abc" mutableCopy]];
	b = [StringTools endsWith:[@"abcdefg" mutableCopy] end:[@"efg" mutableCopy]];
	b = [StringTools isSpace:[@"abcdefg" mutableCopy] pos:3];
	
	NSMutableString *i2 = [StringTools hex:345345 digits:10];
	
	NSMutableString *sfin = [strbuf stringByAppendingString:st];
	sfin = [[strbuf stringByAppendingString:st] stringByAppendingString:s2];
	[sfin appendString:[@"abc" mutableCopy]];
	sfin = [[st stringByAppendingString:[@"abc" mutableCopy]] stringByAppendingString:@"5"];
	sfin = [@"55" stringByAppendingString:[@"abc" mutableCopy]];
}
- (void) testSys{
	
	[Sys print:[@"hello world" mutableCopy]];
	[Sys println:[@"hello world" mutableCopy]];
	
	NSMutableArray *arr = [Sys args];
	int _int = [Sys command:[@"cd" mutableCopy] args:[@[[@"~" mutableCopy]] mutableCopy]];
	_int = [Sys command:[@"ls" mutableCopy] args:[@[] mutableCopy]];
	float _float = [Sys cpuTime];
	
	StringMap *hash = [Sys environment];
	
	NSMutableString *string = [Sys executablePath];
	[Sys exit:0];
	_int = [Sys getChar:YES];
	string = [Sys getCwd];
	string = [Sys getEnv:[@"VAR1" mutableCopy]];
	[Sys putEnv:[@"VAR1" mutableCopy] v:[@"val 1" mutableCopy]];
	[Sys setCwd:[@"thisdir" mutableCopy]];
	BOOL bool = [Sys setTimeLocale:[@"loc" mutableCopy]];
	[Sys sleep:5.5];
	
	Output *_out = [Sys _stderr];
	
	Input *_in = [Sys _stdin];
	_out = [Sys _stdout];
	string = [Sys systemName];
	_float = [Sys time];
}
- (void) testType{
	
	
	Class *sup = [Type getSuperClass:NSString];
	
	NSMutableString *sups = [Type getClassName:NSString];
	
	Class *cl = [Type resolveClass:[@"ios.map.MKMapView" mutableCopy]];
	
	NSString *inst = [Type createEmptyInstance:NSString];
}
- (void) testXml{
	
}
- (void) foo{
	
}
- (void) testOverload{
	
	[self foo];
	[self foo:[@"bar" mutableCopy]];
	[self foo:[@"str" mutableCopy] arr:[@[[@"bar1" mutableCopy], [@"bar2" mutableCopy]] mutableCopy]];
	[self foo:[@[[@[[@"bar" mutableCopy], [@"1" mutableCopy]] mutableCopy], [@[[@"bar" mutableCopy], [@"2" mutableCopy]] mutableCopy]] mutableCopy]];
}
- (void) testFrameworksImport{
	
}
- (int) get_width{
	
	return 0;
}
- (int) set_width:(int)v{
	
	return 0;
}
- (int) add:(int)a b:(int)b{
	
	return a + b;
}
- (int) minus:(int)a b:(int)b{
	
	return a - b;
}
- (void) callLotsOfArguments:(int)arg1 arg2:(int)arg2 arg3:(int)arg3 arg4:(int)arg4{
	
	[self optionalArguments:0 arg2:1 arg3:2 arg4:nil];
	[self optionalArguments1:0 arg2:1 arg3:2 arg4:nil];
	[self optionalArguments2:0 arg2:nil arg3:nil arg4:3];
	[self optionalArguments3:0 arg2:1 arg3:nil arg4:nil];
}
- (void) optionalArguments:(int)arg1 arg2:(int)arg2 arg3:(int)arg3 arg4:(int)arg4{
	
	// Optional arguments
	if (!arg4) arg4 = nil;
	
	int x = arg4 + 5;
}
- (void) optionalArguments1:(int)arg1 arg2:(int)arg2 arg3:(int)arg3 arg4:(int)arg4{
	
	// Optional arguments
	if (!arg4) arg4 = 5;
	
}
- (void) optionalArguments2:(int)arg1 arg2:(int)arg2 arg3:(int)arg3 arg4:(int)arg4{
	
	// Optional arguments
	if (!arg3) arg3 = nil;
	if (!arg2) arg2 = nil;
	
}
- (void) optionalArguments3:(int)arg1 arg2:(int)arg2 arg3:(BOOL)arg3 arg4:(BOOL)arg4{
	
	// Optional arguments
	if (!arg4) arg4 = nil;
	if (!arg2) arg2 = 6;
	if (!arg3) arg3 = YES;
	
}
- (void) init{
	
	int x = 6;
	self.s = [@"init" mutableCopy];
}
- (void) printHello{
	
	[Log trace:[@"Hello from Haxe Objective-C" mutableCopy] infos:@{@"fileName":@"Tests.hx", @"lineNumber":@"535", @"className":@"Tests", @"methodName":@"printHello"}];
}
- (void) functionToRedefine{
	
	[Log trace:[@"do something else" mutableCopy] infos:@{@"fileName":@"Tests.hx", @"lineNumber":@"550", @"className":@"Tests", @"methodName":@"functionToRedefine"}];
}
- (void) functionToRedefine2:(int)param1 param2:(NSMutableString*)param2{
	
	int i = param1;
}
- (id) init{
	
	self = [super init];
	self.s = [@"str" mutableCopy];
	self.d2 = 4.5;
	self.d1 = 34;
	
	Tests2 *test2 = [[Tests2 alloc] init];
	test2.hx_dyn_functionToRedefine = ^(){ [self functionToRedefine]; };
	test2.hx_dyn_functionToRedefine2 = ^(int param1, NSMutableString *param2){ [self functionToRedefine2:param1 param2:param2]; };
	[[TestC alloc] init];
	[[TestHaxePack alloc] init];
	return self;
}

@end

@implementation Tests2

@synthesize d1;
- (void) methodInTests2{
	
	[self functionToRedefine];
	[self functionToRedefine2:0 param2:[@"00" mutableCopy]];
}
// Dynamic method defined with an objc method and a block property
- (void) functionToRedefine{
	if ( hx_dyn_functionToRedefine ) { hx_dyn_functionToRedefine(); return; }
	[Log trace:[@"originally do something" mutableCopy] infos:@{@"fileName":@"Tests.hx", @"lineNumber":@"573", @"className":@"Tests2", @"methodName":@"functionToRedefine"}];
}
@synthesize hx_dyn_functionToRedefine;

// Dynamic method defined with an objc method and a block property
- (void) functionToRedefine2:(int)param1 param2:(NSMutableString*)param2{
	if ( hx_dyn_functionToRedefine2 ) { hx_dyn_functionToRedefine2(param1, param2); return; }
}
@synthesize hx_dyn_functionToRedefine2;

- (id) init{
	
	self = [super init];
	self.d1 = 34;
	
	NSMutableArray *arr = [@[self.d1, self.d1, @50] mutableCopy];
	return self;
}

@end
