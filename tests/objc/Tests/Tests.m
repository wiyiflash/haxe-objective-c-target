//
//  Tests
//  Tests
//
//  Source generated by Haxe Objective-C target
//

#import "Tests.h"

@implementation Tests

+ (NSMutableString*) staticVar1:(NSMutableString*)val {
	static NSMutableString *_val;
	if (val == nil) { if (_val == nil) _val = [NSMutableString stringWithString:@"abcd"]; }
	else { if (_val != nil) _val = val; }
	return _val;
}
+ (int) staticVar2:(int)val {
	static int _val;
	if (val == nil) { if (_val == nil) _val = 5; }
	else { if (_val != nil) _val = val; }
	return _val;
}
+ (int) staticVar3:(int)val {
	static int _val;
	if (val == nil) { if (_val == nil) _val = 5; }
	else { if (_val != nil) _val = val; }
	return _val;
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
	
	NSMutableString *d = [NSMutableString stringWithString:@"xyz"];
	BOOL e = YES;
	int f;
	int g = (int)5.3;
	id g1 = (id)6.3;
	id g2 = (id)a;
	int xy = a.length;
	[a.push:[NSMutableString stringWithString:@"6"]];
	if (a.length > 3) f = 3;
	else f = a.length;
	f = ( (a.length > 3) ? 3 : a.length);
	[Lib print:[NSMutableString stringWithString:@"print print and print again"]];
	[Lib println:[NSMutableString stringWithString:@"print print and print again"]];
}
- (void) testingFor{
	
	NSMutableArray *aa = [[NSMutableArray alloc] initWithObjects:[NSNumber numberWithInt:1], [NSNumber numberWithInt:2], [NSNumber numberWithInt:3], [NSNumber numberWithInt:4], [NSNumber numberWithInt:5], nil];
	{
		int _g = 0;
		while (_g < 5) {
			int i = _g++;
			[aa.push:i];
		}
	}
	{
		int _g1 = 0; int _g = aa.length;
		while (_g1 < _g) {
			int i = _g1++;
			[aa.push:i];
		}
	}
	{
		int _g = 0;
		while (_g < aa.length) {
			int i = [aa objectAtIndex:_g];
			++_g;
			[aa.push:i];
		}
	}
}
- (void) testWhile{
	int aa = 5;
	do {
		[Log trace:[NSMutableString stringWithString:@"do something"] infos:[NSDictionary dictionaryWithObjectsAndKeys:@"Tests.hx",@"fileName", @"84",@"lineNumber", @"Tests",@"className", @"testWhile",@"methodName", nil]];
		aa++;
	}while (aa < 10);
	while (aa > 0) aa--;
}
- (void) testTry{
	@try {
		int a = 3;
	}
	@catch (NSException *e) {
		[Log trace:[NSMutableString stringWithString:@"error"] infos:[NSDictionary dictionaryWithObjectsAndKeys:@"Tests.hx",@"fileName", @"101",@"lineNumber", @"Tests",@"className", @"testTry",@"methodName", nil]];
	}
}
- (void) testSwitch{
	BOOL _g = YES;
	switch (_g){
		case YES:{
			{
				int x = 0;
			}}break;
		case NO:{
			{
				int y = 0;
			}}break;
	}
}
- (void) testArray{
	
	NSMutableArray *as = [[NSMutableArray alloc] init];
	
	NSMutableArray *aa = [[NSMutableArray alloc] initWithObjects:[NSNumber numberWithFloat:1.0], [NSNumber numberWithInt:2], [NSNumber numberWithInt:3], [NSNumber numberWithInt:4], [NSNumber numberWithInt:5], nil];
	float aaa = [aa objectAtIndex:2];
	[aa objectAtIndex:3];
	
	NSMutableArray *concatArray = [as.concat:[[NSMutableArray alloc] initWithObjects:[NSMutableString stringWithString:@"5"], [NSMutableString stringWithString:@"6"], [NSMutableString stringWithString:@"7"], nil]];
	concatArray = [as.copy];
	[concatArray.insert:2 x:[NSMutableString stringWithString:@"2"]];
	id iter = [as.iterator];
	
	NSMutableString *s = [concatArray.join:[NSMutableString stringWithString:@", "]];
	
	NSMutableString *item = [as.pop];
	[as.push:[NSMutableString stringWithString:@"454"]];
	BOOL bool = [as.remove:[NSMutableString stringWithString:@"5"]];
	[as.reverse];
	item = [as.shift];
	
	NSMutableArray *sliceArray = [as.slice:1 end:3];
	[as.sort:^- (int) :(NSMutableString*)a b:(NSMutableString*)b{
		return 0;
	}];
	sliceArray = [as.splice:2 len:2];
	s = [as.toString];
	[as.unshift:[NSMutableString stringWithString:@"44"]];
	
	NSMutableArray *a_comprehention = ((NSMutableArray)($this:(snd ctx.path)) 
	NSMutableArray *_g = [[NSMutableArray alloc] initWithObjects:, nil]
	{
		int _g1 = 0;
		while (_g1 < 10) {
			int x = _g1++;
			[_g.push:x];
		}
	}
	__r__ = _g
	return __r__{
		
		NSMutableArray* __r__}
	}(self));
	
	NSMutableArray *b_comprehention = ((NSMutableArray)($this:(snd ctx.path)) 
	NSMutableArray *_g1 = [[NSMutableArray alloc] initWithObjects:, nil]
	{
		int _g2 = 0;
		while (_g2 < a_comprehention.length) {
			int x = [a_comprehention objectAtIndex:_g2];
			++_g2;
			if (x % 2 == 0) [_g1.push:x];
		}
	}
	__r__2 = _g1
	return __r__2{
		
		NSMutableArray* __r__2}
	}(self));
	
	NSMutableArray *c_comprehention = ((NSMutableArray)($this:(snd ctx.path)) 
	NSMutableArray *_g2 = [[NSMutableArray alloc] initWithObjects:, nil]
	{
		int _g3 = 0;
		while (_g3 < 4) {
			int x = _g3++;
			int _g5 = 0; int _g4 = x + 1;
			while (_g5 < _g4) {
				int i = _g5++;
				[_g2.push:i];
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
			
			NSMutableString *val = [concatArray objectAtIndex:_g3];
			++_g3;
			[Log trace:val infos:[NSDictionary dictionaryWithObjectsAndKeys:@"Tests.hx",@"fileName", @"147",@"lineNumber", @"Tests",@"className", @"testArray",@"methodName", nil]];
		}
	}
}
- (void) testDate{
	
	NSDate *d = [[NSDate alloc] init:2012 month:11 day:13 hour:19 min:30 sec:0];
	int _int = [d.getDate];
	_int = [d.getDay];
	_int = [d.getFullYear];
	_int = [d.getHours];
	_int = [d.getMinutes];
	_int = [d.getMonth];
	_int = [d.getSeconds];
	float _float = [d.getTime];
	
	NSMutableString *str = [d.toString];
	
	NSDate *d2 = [NSDate fromString:[NSMutableString stringWithString:@"2012-12-12 06:40:00"]];
	d2 = [NSDatefromTime:120000];
	d2 = [NSDatenow];
	int x = [DateTools getMonthDays:d2];
	_float = 432000000.;
	
	NSDate *d3 = [NSDatefromTime:[d.getTime] + 1000.0];
	str = [DateTools format:d f:[NSMutableString stringWithString:@"HH:mm"]];
	_int = [DateTools getMonthDays:d];
	_float = 3600000000.;
	_float = [DateTools make:[NSMutableDictionary dictionaryWithObjectsAndKeys:
	[0 copy], @"seconds",
	[110 copy], @"ms",
	[6 copy], @"minutes",
	[8 copy], @"hours",
	[5 copy], @"days",
	nil]];
	_float = 3360000.;
	id obj = [DateTools parse:45546];
	_float = 1000000.;
}
- (int) enumToInt:(Tests*)c{
	[self testEnum: ExternEnumValue1];
	return ((int)($this:(snd ctx.path)) 
	var $e2 : enum =  (c)
	switch ( $e2.index ) {
		
		case 0:
		{
			__r__ = 16711680}break
		case 1:
		{
			__r__ = 65280}break
		case 2:
		{
			__r__ = 255}break
		case 3:
		
		var MATCH c_eGrey_0 : int = $e2.params[0]{
			__r__ = ((c_eGrey_0 << 16 | c_eGrey_0 << 8) | c_eGrey_0)}break
		case 4:
		
		var MATCH c_eRgb_2 : int = $e2.params[2], MATCH c_eRgb_1 : int = $e2.params[1], MATCH c_eRgb_0 : int = $e2.params[0]{
			__r__ = ((c_eRgb_0 << 16 | c_eRgb_1 << 8) | c_eRgb_2)}break
		case 5:
		
		var MATCH c_eAlpha_1 : Tests = $e2.params[1], MATCH c_eAlpha_0 : int = $e2.params[0]{
			__r__ = (c_eAlpha_0 << 24 | ([self enumToInt:c_eAlpha_1] & 16777215))}break
	}
	return __r__{
		
		int* __r__}
	}(self));
}
- (void) testEnum:(id)v{
	int i = ((int)($this:(snd ctx.path)) 
	var $e2 : enum =  (v)
	switch ( $e2.index ) {
		
		case 0:
		{
			__r__ = 5}break
		case 1:
		{
			__r__ = 6}break
		case 2:
		{
			__r__ = 7}break
	}
	return __r__{
		
		int* __r__}
	}(self));
	
	Tests *red =  Red2;
	int j = ((int)($this:(snd ctx.path)) 
	var $e4 : enum =  (red)
	switch ( $e4.index ) {
		
		case 0:
		{
			__r__3 = 5}break
		case 1:
		{
			__r__3 = 6}break
		case 2:
		{
			__r__3 = 7}break
	}
	return __r__3{
		
		int* __r__3}
	}(self));
}
- (void) testEReg{
	
	EReg *ereg = [[EReg alloc] init:[NSMutableString stringWithString:@"ytrytrevev76"] opt:[NSMutableString stringWithString:@"099"]];
	
	NSMutableString *s = [ereg map:[NSMutableString stringWithString:@"s"] f:^- (NSMutableString*) :(EReg*)e{
		return [NSMutableString stringWithString:@"ss"];
	}];
	BOOL b = [ereg match:[NSMutableString stringWithString:@"s"]];
	s = [ereg matched:5];
	s = [ereg matchedLeft];
	id o = [ereg matchedPos];
	s = [ereg matchedRight];
	s = [ereg replace:[NSMutableString stringWithString:@"s"] by:[NSMutableString stringWithString:@"by"]];
	
	NSMutableArray *arr = [ereg split:[NSMutableString stringWithString:@","]];
}
- (void) testMap{
	
	StringMap *h = [[StringMap alloc] init];
	[h set-TAbstract];
	[h get-TAbstract];
	[h remove-TAbstract];
	BOOL b = [h exists-TAbstract];
	id arr = [h keys];
	id iter = [h iterator];
	
	NSMutableString *str = [h toString];
}
- (void) testLambda{
	
	NSMutableArray *a = [Lambda array:[[NSMutableArray alloc] initWithObjects:[NSNumber numberWithInt:0], [NSNumber numberWithInt:1], [NSNumber numberWithInt:2], [NSNumber numberWithInt:3], nil]];
	
	List *l = [Lambda concat:[[NSMutableArray alloc] initWithObjects:[NSNumber numberWithInt:0], [NSNumber numberWithInt:1], [NSNumber numberWithInt:2], [NSNumber numberWithInt:3], nil] b:[[NSMutableArray alloc] initWithObjects:[NSNumber numberWithInt:4], [NSNumber numberWithInt:5], nil]];
}
- (void) testList{
	
	List *l = [[List alloc] init];
	[l add:2];
	[l push:18];
	
	List *l2 = [l filter:^- (BOOL) :(int)i{
		return i > 5;
	}];
	int item = [l first];
	BOOL empty = [l isEmpty];
	id iter = [l iterator];
	
	NSMutableString *s = [l join:[NSMutableString stringWithString:@", "]];
	s = [l toString];
	item = [l last];
	item = [l pop];
	BOOL r = [l remove:5];
	[Log trace:l.length infos:[NSDictionary dictionaryWithObjectsAndKeys:@"Tests.hx",@"fileName", @"280",@"lineNumber", @"Tests",@"className", @"testList",@"methodName", nil]];
	[l clear];
	[Log trace:l.length infos:[NSDictionary dictionaryWithObjectsAndKeys:@"Tests.hx",@"fileName", @"282",@"lineNumber", @"Tests",@"className", @"testList",@"methodName", nil]];
	
	List *newList = [l map:^- (NSMutableString*) :(int)i{
		return [Std string:i];
	}];
	
	FastList *fl = [[FastList alloc] init];
	fl.head = [[FastCell alloc] init:8 next:fl head];
}
- (void) testReflect{
	id obj = [NSMutableDictionary dictionaryWithObjectsAndKeys:
	[[NSMutableString stringWithString:@"aaaaa"] copy], @"a",
	nil];
	BOOL b = [Reflect hasField:obj field:[NSMutableString stringWithString:@"a"]];
	id f = [Reflect field:obj field:[NSMutableString stringWithString:@"a"]];
	if (obj != nil) [obj __SetField-TDynamic-];
	[self __SetField-TDynamic-];
	id p = (id)[self __Field-TDynamic-];
	[Reflect callMethod:self func:self testStd args:[[NSMutableArray alloc] initWithObjects:, nil]];
	[Reflect callMethod:self func:self callLotsOfArguments args:[[NSMutableArray alloc] initWithObjects:[NSNumber numberWithInt:1], [NSNumber numberWithInt:2], [NSNumber numberWithInt:3], [NSNumber numberWithInt:4], nil]];
	
	NSMutableArray *fs = [Reflect fields:obj];
	BOOL isf = [Reflect isFunction:self testStd];
	int i = [Reflect compare:1 b:2];
	BOOL cm = [Reflect compareMethods:self testStd f2:self testString];
	BOOL isobj = [Reflect isObject:obj];
	isobj = [Reflect isObject:self testStd];
	[Reflect deleteField:obj f:[NSMutableString stringWithString:@"a"]];
	id obj2 = [Reflect copy:obj];
}
- (void) testStd{
	int _int = 3;
	BOOL _BOOL = [Std is:self.d1 t: TAbstractDecl ];
	float _float = [Std parseFloat:[NSMutableString stringWithString:@"55454.65"]];
	_int = [Std parseInt:[NSMutableString stringWithString:@"435345.23"]];
	_int = [Std random:543];
	
	NSMutableString *string = [Std string:_int];
}
- (void) testString{
	
	NSMutableString *string = [[NSMutableString alloc] init:[NSMutableString stringWithString:@"abcdefghijklmnopqrstuvwxyz"]];
	int len = string.length;
	
	NSMutableString *s = [string charAt:5];
	int ch = [string charCodeAt:5];
	int i = [string indexOf:[NSMutableString stringWithString:@"abc"] startIndex:nil];
	int i1 = [string indexOf:[NSMutableString stringWithString:@"abc"] startIndex:2];
	int li = [string lastIndexOf:[NSMutableString stringWithString:@"abc"] startIndex:nil];
	
	NSMutableArray *components = [string split:[NSMutableString stringWithString:@"-"]];
	
	NSMutableString *s2 = [string substr:5 len:nil];
	s2 = [string substr:5 len:len];
	s2 = [string substring:5 endIndex:nil];
	s2 = [string substring:1 endIndex:len];
	s2 = [string toLowerCase];
	s2 = [string toUpperCase];
	s2 = [string toString];
	
	NSMutableString *s3 = [NSMutableString stringWithString:@"\t"];
	
	StringBuf *buf = [[StringBuf alloc] init];
	[buf.b appendString:[NSMutableString stringWithString:@"abc"]];
	[buf.b appendString:[NSMutableString stringWithString:@""]];
	[buf.b appendString:[[NSMutableString stringWithString:@"abcdefghijklmnopqerstuvwxyz"] substr:@"5" len:nil]];
	[buf.b appendString:[[NSMutableString stringWithString:@"abcdefghijklmnopqerstuvwxyz"] substr:@"5" len:@"10"]];
	
	NSMutableString *strbuf = buf.b;
	
	NSMutableString *st = [StringTools urlEncode:[NSMutableString stringWithString:@"http://imagin.ro/Gorgeous Elena/2"]];
	st = [StringTools urlDecode:[NSMutableString stringWithString:@"http://imagin.ro/Gorgeous Elena/2"]];
	st = [StringTools htmlEscape:[NSMutableString stringWithString:@"<a href= &>"] quotes:nil];
	st = [StringTools htmlUnescape:[NSMutableString stringWithString:@"<a href= &>"]];
	st = [StringTools ltrim:[NSMutableString stringWithString:@" abcdefgh"]];
	st = [StringTools rtrim:[NSMutableString stringWithString:@"abcdefgh "]];
	st = [StringTools trim:[NSMutableString stringWithString:@" abcdefgh "]];
	st = [StringTools rpad:[NSMutableString stringWithString:@"abcdefgh"] c:[NSMutableString stringWithString:@"0"] l:10];
	st = [StringTools lpad:[NSMutableString stringWithString:@"abcdefgh"] c:[NSMutableString stringWithString:@"0"] l:10];
	st = [StringTools replace:[NSMutableString stringWithString:@"abcdefgh"] sub:[NSMutableString stringWithString:@"abc"] by:[NSMutableString stringWithString:@"_abc"]];
	BOOL b = [StringTools startsWith:[NSMutableString stringWithString:@"abcdefg"] start:[NSMutableString stringWithString:@"abc"]];
	b = [StringTools endsWith:[NSMutableString stringWithString:@"abcdefg"] end:[NSMutableString stringWithString:@"efg"]];
	b = [StringTools isSpace:[NSMutableString stringWithString:@"abcdefg"] pos:3];
	
	NSMutableString *i2 = [StringTools hex:345345 digits:10];
	
	NSMutableString *sfin = [strbuf stringByAppendingString:st];
	sfin = [[strbuf stringByAppendingString:st] stringByAppendingString:s2];
	[sfin appendString:[NSMutableString stringWithString:@"abc"]];
	sfin = [[st stringByAppendingString:[NSMutableString stringWithString:@"abc"]] stringByAppendingString:@"5"];
	sfin = [@"55" stringByAppendingString:[NSMutableString stringWithString:@"abc"]];
}
- (void) testSys{
	[Sys print:[NSMutableString stringWithString:@"hello world"]];
	[Sys println:[NSMutableString stringWithString:@"hello world"]];
	
	NSMutableArray *arr = [Sys args];
	int _int = [Sys command:[NSMutableString stringWithString:@"cd"] args:[[NSMutableArray alloc] initWithObject:[NSMutableString stringWithString:@"~"]]];
	_int = [Sys command:[NSMutableString stringWithString:@"ls"] args:[[NSMutableArray alloc] initWithObjects:, nil]];
	float _float = [Sys cpuTime];
	
	Hash *hash = [Sys environment];
	
	NSMutableString *string = [Sys executablePath];
	[Sys exit:0];
	_int = [Sys getChar:YES];
	string = [Sys getCwd];
	string = [Sys getEnv:[NSMutableString stringWithString:@"VAR1"]];
	[Sys putEnv:[NSMutableString stringWithString:@"VAR1"] v:[NSMutableString stringWithString:@"val 1"]];
	[Sys setCwd:[NSMutableString stringWithString:@"thisdir"]];
	BOOL bool = [Sys setTimeLocale:[NSMutableString stringWithString:@"loc"]];
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
	
	Class *cl = [Type resolveClass:[NSMutableString stringWithString:@"ios.map.MKMapView"]];
	
	NSString *inst = [Type createEmptyInstance:NSString];
}
- (void) testXml{
}
- (void) foo{
}
- (void) testOverload{
	[self foo];
	[self foo:[NSMutableString stringWithString:@"bar"]];
	[self foo:[NSMutableString stringWithString:@"str"] arr:[[NSMutableArray alloc] initWithObjects:[NSMutableString stringWithString:@"bar1"], [NSMutableString stringWithString:@"bar2"], nil]];
	[self foo:[[NSMutableArray alloc] initWithObjects:[[NSMutableArray alloc] initWithObjects:[NSMutableString stringWithString:@"bar"], [NSMutableString stringWithString:@"1"], nil], [[NSMutableArray alloc] initWithObjects:[NSMutableString stringWithString:@"bar"], [NSMutableString stringWithString:@"2"], nil], nil]];
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
	self.s = [NSMutableString stringWithString:@"init"];
}
- (void) printHello{
	[Log trace:[NSMutableString stringWithString:@"Hello from Haxe Objective-C"] infos:[NSDictionary dictionaryWithObjectsAndKeys:@"Tests.hx",@"fileName", @"537",@"lineNumber", @"Tests",@"className", @"printHello",@"methodName", nil]];
}
- (void) functionToRedefine{
	[Log trace:[NSMutableString stringWithString:@"do something else"] infos:[NSDictionary dictionaryWithObjectsAndKeys:@"Tests.hx",@"fileName", @"552",@"lineNumber", @"Tests",@"className", @"functionToRedefine",@"methodName", nil]];
}
- (void) functionToRedefine2:(int)param1 param2:(NSMutableString*)param2{
	int i = param1;
}
- (id) init{
	self = [super init];
	self.s = [NSMutableString stringWithString:@"str"];
	self.d2 = 4.5;
	self.d1 = 34;
	
	Tests2 *test2 = [[Tests2 alloc] init];
	test2.functionToRedefine = self functionToRedefine;
	test2.functionToRedefine2 = self functionToRedefine2;
	[[TestC alloc] init];
	[[TestHaxePack alloc] init];
	return self;
}

@end

@implementation Tests2

@synthesize d1;
- (void) methodInTests2{
	[self functionToRedefine];
	[self functionToRedefine2:0 param2:[NSMutableString stringWithString:@"00"]];
}
// Defining a dynamic method
- (void) functionToRedefine{
	[Log trace:[NSMutableString stringWithString:@"originally do something"] infos:[NSDictionary dictionaryWithObjectsAndKeys:@"Tests.hx",@"fileName", @"575",@"lineNumber", @"Tests2",@"className", @"functionToRedefine",@"methodName", nil]];
}
@synthesize property_functionToRedefine;

// Defining a dynamic method
- (void) functionToRedefine2:(int)param1 param2:(NSMutableString*)param2{
}
@synthesize property_functionToRedefine2;

- (id) init{
	self = [super init];
	self.d1 = 34;
	
	NSMutableArray *arr = [[NSMutableArray alloc] initWithObjects:self.d1, self.d1, [NSNumber numberWithInt:50], nil];
	return self;
}

@end
