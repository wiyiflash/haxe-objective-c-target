//
//  TestOrder
//  Test
//
//  Source generated by Haxe Objective-C target
//

#import "../unit/TestOrder.h"

@implementation TestOrder

- (void) testUsing{
	
	[self eq:[Using3 usingTest:[@"foo" mutableCopy]] v2:[@"3" mutableCopy] pos:@{@"fileName":@"TestOrder.hx", @"lineNumber":@"17", @"className":@"unit.TestOrder", @"methodName":@"testUsing"}];
	
	E2 *c = C1;
	{
		
		count++;
		[self eq:[@"TEnum(unit.E2,[])" mutableCopy] v2:[@"TEnum(unit.E2,[])" mutableCopy] pos:@{@"fileName":@"TestOrder.hx", @"lineNumber":@"21", @"className":@"unit.TestOrder", @"methodName":@"testUsing"}];
	}
	[self eq:c v2:C1 pos:@{@"fileName":@"TestOrder.hx", @"lineNumber":@"22", @"className":@"unit.TestOrder", @"methodName":@"testUsing"}];
}

@end

@implementation ClassWithProp


+ (int) set_STAT_X:(int)v{
	
	ClassWithProp.STAT_X = v * 2;
	return v;
}

@synthesize _x;
- (int) get_x{
	
	return self._x;
}
- (int) set_x:(int)v{
	
	self._x = v;
	return v;
}
- (id) init{
	
	self = [super init];
	self._x = 5;
	return self;
}

@end

@implementation SubClassWithProp


- (int) get_x{
	
	return self._x + 1;
}
- (int) get_y{
	
	return self.y;
}
- (int) set_y:(int)v{
	
	self.y = v;
	return v;
}
- (id) init{
	
	self = [super init];
	[self set_y:10];
	return self;
}

@end

@implementation TestReflect

static NSMutableArray* TYPES;
+ (NSMutableArray*) TYPES {
	if (TYPES == nil) TYPES = [@[[NSNull null],  TAbstractDecl , NSMutableString,  TAbstractDecl ,  TAbstractDecl , NSMutableArray, StringMap, List, NSDate, Xml, Math, , MyClass, MySubClass,  TAbstractDecl ,  TAbstractDecl ,  TAbstractDecl , MyInterface] mutableCopy];
	return TYPES;
}
+ (void) setTYPES:(NSMutableArray*)hx_val {
	TYPES = hx_val;
}
+ (NSMutableString*) u:(NSMutableString*)s{
	
	return s;
}
+ (NSMutableString*) u2:(NSMutableString*)s s2:(NSMutableString*)s2{
	
	return [[s stringByAppendingString:[@"." mutableCopy]] stringByAppendingString:s2];
}
static NSMutableArray* TNAMES;
+ (NSMutableArray*) TNAMES {
	if (TNAMES == nil) TNAMES = [@[[@"null" mutableCopy], [@"Int" mutableCopy], [@"String" mutableCopy], [@"Bool" mutableCopy], [@"Float" mutableCopy], [@"Array" mutableCopy], [@"haxe.ds.StringMap" mutableCopy], [@"List" mutableCopy], [@"Date" mutableCopy], [@"Xml" mutableCopy], [@"Math" mutableCopy], [[[@"unit" mutableCopy] stringByAppendingString:[@"." mutableCopy]] stringByAppendingString:[@"MyEnum" mutableCopy]], [[[@"unit" mutableCopy] stringByAppendingString:[@"." mutableCopy]] stringByAppendingString:[@"MyClass" mutableCopy]], [[[@"unit" mutableCopy] stringByAppendingString:[@"." mutableCopy]] stringByAppendingString:[@"MySubClass" mutableCopy]], [@"Class" mutableCopy], [@"Enum" mutableCopy], [@"Dynamic" mutableCopy], [[[@"unit" mutableCopy] stringByAppendingString:[@"." mutableCopy]] stringByAppendingString:[@"MyInterface" mutableCopy]]] mutableCopy];
	return TNAMES;
}
+ (void) setTNAMES:(NSMutableArray*)hx_val {
	TNAMES = hx_val;
}
- (void) testTypes{
	
	{
		
		int _g1 = 1; int _g = TestReflect.TYPES.length;
		while (_g1 < _g) {
			
			int i = _g1++;
			id t = ((id)[TestReflect.TYPES hx_objectAtIndex:i]);
			
			NSMutableString *name = ((NSMutableArray*)[TNAMES hx_objectAtIndex:i]);
			[self infos:[[@"type " mutableCopy] stringByAppendingString:name]];
			[self f:t == nil pos:@{@"fileName":@"TestReflect.hx", @"lineNumber":@"99", @"className":@"unit.TestReflect", @"methodName":@"testTypes"}];
			if (name == [@"Enum" mutableCopy]) {
				
			}
			else if (t ==  || t ==  TAbstractDecl ) {
				
				[self eq:[Type getEnumName:t] v2:name pos:@{@"fileName":@"TestReflect.hx", @"lineNumber":@"103", @"className":@"unit.TestReflect", @"methodName":@"testTypes"}];
				[self eq:[Type resolveEnum:name] v2:t pos:@{@"fileName":@"TestReflect.hx", @"lineNumber":@"104", @"className":@"unit.TestReflect", @"methodName":@"testTypes"}];
			}
			else {
				
				[self eq:[Type getClassName:t] v2:name pos:@{@"fileName":@"TestReflect.hx", @"lineNumber":@"106", @"className":@"unit.TestReflect", @"methodName":@"testTypes"}];
				[self eq:[Type resolveClass:name] v2:t pos:@{@"fileName":@"TestReflect.hx", @"lineNumber":@"107", @"className":@"unit.TestReflect", @"methodName":@"testTypes"}];
			}
		}
	}
	[self infos:nil];
}
- (void) testIs{
	
	[self is:nil t1:nil t2:nil pos:@{@"fileName":@"TestReflect.hx", @"lineNumber":@"114", @"className":@"unit.TestReflect", @"methodName":@"testIs"}];
	[self is:0 t1: TAbstractDecl  t2: TAbstractDecl  pos:@{@"fileName":@"TestReflect.hx", @"lineNumber":@"115", @"className":@"unit.TestReflect", @"methodName":@"testIs"}];
	[self is:1 t1: TAbstractDecl  t2: TAbstractDecl  pos:@{@"fileName":@"TestReflect.hx", @"lineNumber":@"116", @"className":@"unit.TestReflect", @"methodName":@"testIs"}];
	[self is:-1 t1: TAbstractDecl  t2: TAbstractDecl  pos:@{@"fileName":@"TestReflect.hx", @"lineNumber":@"117", @"className":@"unit.TestReflect", @"methodName":@"testIs"}];
	[self is:2.0 t1: TAbstractDecl  t2: TAbstractDecl  pos:@{@"fileName":@"TestReflect.hx", @"lineNumber":@"118", @"className":@"unit.TestReflect", @"methodName":@"testIs"}];
	[self is:1.2 t1: TAbstractDecl  t2:nil pos:@{@"fileName":@"TestReflect.hx", @"lineNumber":@"119", @"className":@"unit.TestReflect", @"methodName":@"testIs"}];
	[self is:1e10 t1: TAbstractDecl  t2:nil pos:@{@"fileName":@"TestReflect.hx", @"lineNumber":@"120", @"className":@"unit.TestReflect", @"methodName":@"testIs"}];
	[self is:-1e10 t1: TAbstractDecl  t2:nil pos:@{@"fileName":@"TestReflect.hx", @"lineNumber":@"121", @"className":@"unit.TestReflect", @"methodName":@"testIs"}];
	[self is:NAN t1: TAbstractDecl  t2:nil pos:@{@"fileName":@"TestReflect.hx", @"lineNumber":@"122", @"className":@"unit.TestReflect", @"methodName":@"testIs"}];
	[self is:DBL_MAX t1: TAbstractDecl  t2:nil pos:@{@"fileName":@"TestReflect.hx", @"lineNumber":@"123", @"className":@"unit.TestReflect", @"methodName":@"testIs"}];
	[self is:-DBL_MAX t1: TAbstractDecl  t2:nil pos:@{@"fileName":@"TestReflect.hx", @"lineNumber":@"124", @"className":@"unit.TestReflect", @"methodName":@"testIs"}];
	[self is:YES t1: TAbstractDecl  t2:nil pos:@{@"fileName":@"TestReflect.hx", @"lineNumber":@"125", @"className":@"unit.TestReflect", @"methodName":@"testIs"}];
	[self is:NO t1: TAbstractDecl  t2:nil pos:@{@"fileName":@"TestReflect.hx", @"lineNumber":@"126", @"className":@"unit.TestReflect", @"methodName":@"testIs"}];
	[self is:[@"Hello" mutableCopy] t1:NSMutableString t2:nil pos:@{@"fileName":@"TestReflect.hx", @"lineNumber":@"127", @"className":@"unit.TestReflect", @"methodName":@"testIs"}];
	[self is:[@"123" mutableCopy] t1:NSMutableString t2:nil pos:@{@"fileName":@"TestReflect.hx", @"lineNumber":@"128", @"className":@"unit.TestReflect", @"methodName":@"testIs"}];
	[self is:[@"false" mutableCopy] t1:NSMutableString t2:nil pos:@{@"fileName":@"TestReflect.hx", @"lineNumber":@"129", @"className":@"unit.TestReflect", @"methodName":@"testIs"}];
	[self is:[@"" mutableCopy] t1:NSMutableString t2:nil pos:@{@"fileName":@"TestReflect.hx", @"lineNumber":@"130", @"className":@"unit.TestReflect", @"methodName":@"testIs"}];
	[self is:[@[] mutableCopy] t1:NSMutableArray t2:nil pos:@{@"fileName":@"TestReflect.hx", @"lineNumber":@"131", @"className":@"unit.TestReflect", @"methodName":@"testIs"}];
	[self is:[[List alloc] init] t1:List t2:nil pos:@{@"fileName":@"TestReflect.hx", @"lineNumber":@"132", @"className":@"unit.TestReflect", @"methodName":@"testIs"}];
	[self is:[[StringMap alloc] init] t1:StringMap t2:nil pos:@{@"fileName":@"TestReflect.hx", @"lineNumber":@"133", @"className":@"unit.TestReflect", @"methodName":@"testIs"}];
	[self is:[[MyClass alloc] init:0] t1:MyClass t2:nil pos:@{@"fileName":@"TestReflect.hx", @"lineNumber":@"134", @"className":@"unit.TestReflect", @"methodName":@"testIs"}];
	[self is:[[MySubClass alloc] init] t1:MyClass t2:MySubClass pos:@{@"fileName":@"TestReflect.hx", @"lineNumber":@"135", @"className":@"unit.TestReflect", @"methodName":@"testIs"}];
	[self is:A t1: t2:nil pos:@{@"fileName":@"TestReflect.hx", @"lineNumber":@"136", @"className":@"unit.TestReflect", @"methodName":@"testIs"}];
	[self is:[C:0 b:[@"" mutableCopy]] t1: t2:nil pos:@{@"fileName":@"TestReflect.hx", @"lineNumber":@"137", @"className":@"unit.TestReflect", @"methodName":@"testIs"}];
	[self is:[NSDatenow] t1:NSDate t2:nil pos:@{@"fileName":@"TestReflect.hx", @"lineNumber":@"138", @"className":@"unit.TestReflect", @"methodName":@"testIs"}];
	[self is:[@{
		@"x":[@0 copy],
	} mutableCopy] t1:nil t2:nil pos:@{@"fileName":@"TestReflect.hx", @"lineNumber":@"139", @"className":@"unit.TestReflect", @"methodName":@"testIs"}];
	[self is:^(){
		
	} t1:nil t2:nil pos:@{@"fileName":@"TestReflect.hx", @"lineNumber":@"140", @"className":@"unit.TestReflect", @"methodName":@"testIs"}];
	[self is:MyClass t1: TAbstractDecl  t2:nil pos:@{@"fileName":@"TestReflect.hx", @"lineNumber":@"141", @"className":@"unit.TestReflect", @"methodName":@"testIs"}];
	[self is: t1: TAbstractDecl  t2:nil pos:@{@"fileName":@"TestReflect.hx", @"lineNumber":@"142", @"className":@"unit.TestReflect", @"methodName":@"testIs"}];
	[self is: TAbstractDecl  t1: TAbstractDecl  t2:nil pos:@{@"fileName":@"TestReflect.hx", @"lineNumber":@"143", @"className":@"unit.TestReflect", @"methodName":@"testIs"}];
}
- (void) is:(id)v t1:(id)t1 t2:(id)t2 pos:(id)pos{
	
	// Optional arguments
	if (!pos) pos = nil;
	if (!t2) t2 = nil;
	
	{
		
		int _g1 = 0; int _g = TestReflect.TYPES.length;
		while (_g1 < _g) {
			
			int i = _g1++;
			id c = ((id)[TestReflect.TYPES hx_objectAtIndex:i]);
			[self infos:[[[Std string:v] stringByAppendingString:[@" is " mutableCopy]] stringByAppendingString:((NSMutableArray*)[TNAMES hx_objectAtIndex:i])]];
			[self eq:[Std is:v t:c] v2:c != nil &&  (c == t1 || c == t2) || c ==  TAbstractDecl  pos:pos];
		}
	}
	[self infos:nil];
	[self t:[Std is:v t: TAbstractDecl ] pos:pos];
}
- (void) testTypeof{
	
	[self _typeof:nil rt:TNull pos:@{@"fileName":@"TestReflect.hx", @"lineNumber":@"157", @"className":@"unit.TestReflect", @"methodName":@"testTypeof"}];
	[self _typeof:0 rt:TInt pos:@{@"fileName":@"TestReflect.hx", @"lineNumber":@"158", @"className":@"unit.TestReflect", @"methodName":@"testTypeof"}];
	[self _typeof:1 rt:TInt pos:@{@"fileName":@"TestReflect.hx", @"lineNumber":@"159", @"className":@"unit.TestReflect", @"methodName":@"testTypeof"}];
	[self _typeof:-1 rt:TInt pos:@{@"fileName":@"TestReflect.hx", @"lineNumber":@"160", @"className":@"unit.TestReflect", @"methodName":@"testTypeof"}];
	[self _typeof:1.2 rt:TFloat pos:@{@"fileName":@"TestReflect.hx", @"lineNumber":@"161", @"className":@"unit.TestReflect", @"methodName":@"testTypeof"}];
	[self _typeof:1e10 rt:TFloat pos:@{@"fileName":@"TestReflect.hx", @"lineNumber":@"162", @"className":@"unit.TestReflect", @"methodName":@"testTypeof"}];
	[self _typeof:-1e10 rt:TFloat pos:@{@"fileName":@"TestReflect.hx", @"lineNumber":@"163", @"className":@"unit.TestReflect", @"methodName":@"testTypeof"}];
	[self _typeof:NAN rt:TFloat pos:@{@"fileName":@"TestReflect.hx", @"lineNumber":@"164", @"className":@"unit.TestReflect", @"methodName":@"testTypeof"}];
	[self _typeof:DBL_MAX rt:TFloat pos:@{@"fileName":@"TestReflect.hx", @"lineNumber":@"165", @"className":@"unit.TestReflect", @"methodName":@"testTypeof"}];
	[self _typeof:-DBL_MAX rt:TFloat pos:@{@"fileName":@"TestReflect.hx", @"lineNumber":@"166", @"className":@"unit.TestReflect", @"methodName":@"testTypeof"}];
	[self _typeof:YES rt:TBool pos:@{@"fileName":@"TestReflect.hx", @"lineNumber":@"167", @"className":@"unit.TestReflect", @"methodName":@"testTypeof"}];
	[self _typeof:NO rt:TBool pos:@{@"fileName":@"TestReflect.hx", @"lineNumber":@"168", @"className":@"unit.TestReflect", @"methodName":@"testTypeof"}];
	[self _typeof:[@"Hello" mutableCopy] rt:[TClass:NSMutableString] pos:@{@"fileName":@"TestReflect.hx", @"lineNumber":@"169", @"className":@"unit.TestReflect", @"methodName":@"testTypeof"}];
	[self _typeof:[@"" mutableCopy] rt:[TClass:NSMutableString] pos:@{@"fileName":@"TestReflect.hx", @"lineNumber":@"170", @"className":@"unit.TestReflect", @"methodName":@"testTypeof"}];
	[self _typeof:[@[] mutableCopy] rt:[TClass:NSMutableArray] pos:@{@"fileName":@"TestReflect.hx", @"lineNumber":@"171", @"className":@"unit.TestReflect", @"methodName":@"testTypeof"}];
	[self _typeof:[[List alloc] init] rt:[TClass:List] pos:@{@"fileName":@"TestReflect.hx", @"lineNumber":@"172", @"className":@"unit.TestReflect", @"methodName":@"testTypeof"}];
	[self _typeof:[[StringMap alloc] init] rt:[TClass:StringMap] pos:@{@"fileName":@"TestReflect.hx", @"lineNumber":@"173", @"className":@"unit.TestReflect", @"methodName":@"testTypeof"}];
	[self _typeof:[[MyClass alloc] init:0] rt:[TClass:MyClass] pos:@{@"fileName":@"TestReflect.hx", @"lineNumber":@"174", @"className":@"unit.TestReflect", @"methodName":@"testTypeof"}];
	[self _typeof:[[MySubClass alloc] init] rt:[TClass:MySubClass] pos:@{@"fileName":@"TestReflect.hx", @"lineNumber":@"175", @"className":@"unit.TestReflect", @"methodName":@"testTypeof"}];
	[self _typeof:A rt:[TEnum:] pos:@{@"fileName":@"TestReflect.hx", @"lineNumber":@"176", @"className":@"unit.TestReflect", @"methodName":@"testTypeof"}];
	[self _typeof:[C:0 b:[@"" mutableCopy]] rt:[TEnum:] pos:@{@"fileName":@"TestReflect.hx", @"lineNumber":@"177", @"className":@"unit.TestReflect", @"methodName":@"testTypeof"}];
	[self _typeof:[NSDatenow] rt:[TClass:NSDate] pos:@{@"fileName":@"TestReflect.hx", @"lineNumber":@"178", @"className":@"unit.TestReflect", @"methodName":@"testTypeof"}];
	[self _typeof:[@{
		@"x":[@0 copy],
	} mutableCopy] rt:TObject pos:@{@"fileName":@"TestReflect.hx", @"lineNumber":@"179", @"className":@"unit.TestReflect", @"methodName":@"testTypeof"}];
	[self _typeof:^(){
		
	} rt:TFunction pos:@{@"fileName":@"TestReflect.hx", @"lineNumber":@"180", @"className":@"unit.TestReflect", @"methodName":@"testTypeof"}];
	[self _typeof:MyClass rt:TObject pos:@{@"fileName":@"TestReflect.hx", @"lineNumber":@"181", @"className":@"unit.TestReflect", @"methodName":@"testTypeof"}];
	[self _typeof: rt:TObject pos:@{@"fileName":@"TestReflect.hx", @"lineNumber":@"182", @"className":@"unit.TestReflect", @"methodName":@"testTypeof"}];
	[self _typeof: TAbstractDecl  rt:TObject pos:@{@"fileName":@"TestReflect.hx", @"lineNumber":@"185", @"className":@"unit.TestReflect", @"methodName":@"testTypeof"}];
	[self _typeof: TAbstractDecl  rt:TObject pos:@{@"fileName":@"TestReflect.hx", @"lineNumber":@"186", @"className":@"unit.TestReflect", @"methodName":@"testTypeof"}];
}
- (void) _typeof:(id)v rt:(ValueType*)rt pos:(id)pos{
	
	// Optional arguments
	if (!pos) pos = nil;
	
	
	ValueType *vt = [Type _typeof:v];
	[self infos:[[[[@"typeof(" mutableCopy] stringByAppendingString:[Std string:v]] stringByAppendingString:[@") = " mutableCopy]] stringByAppendingString:[Std string:vt]]];
	[self t:[Type enumEq:vt b:rt] pos:pos];
}
- (void) testConv{
	
	[self eq:[@"A" mutableCopy] v2:[@"A" mutableCopy] pos:@{@"fileName":@"TestReflect.hx", @"lineNumber":@"197", @"className":@"unit.TestReflect", @"methodName":@"testConv"}];
	[self unspec:^(){
		
		[NSMutableString:1024];
	} pos:nil];
	[self eq:[[@"A" mutableCopy] charCodeAt:0] v2:65 pos:@{@"fileName":@"TestReflect.hx", @"lineNumber":@"199", @"className":@"unit.TestReflect", @"methodName":@"testConv"}];
	[self eq:[[@"" mutableCopy] charCodeAt:0] v2:nil pos:@{@"fileName":@"TestReflect.hx", @"lineNumber":@"200", @"className":@"unit.TestReflect", @"methodName":@"testConv"}];
	[self eq:65 v2:65 pos:@{@"fileName":@"TestReflect.hx", @"lineNumber":@"201", @"className":@"unit.TestReflect", @"methodName":@"testConv"}];
	[self eq:65 v2:65 pos:@{@"fileName":@"TestReflect.hx", @"lineNumber":@"202", @"className":@"unit.TestReflect", @"methodName":@"testConv"}];
	[self eq:-65 v2:-65 pos:@{@"fileName":@"TestReflect.hx", @"lineNumber":@"203", @"className":@"unit.TestReflect", @"methodName":@"testConv"}];
	[self eq:1 v2:1 pos:@{@"fileName":@"TestReflect.hx", @"lineNumber":@"204", @"className":@"unit.TestReflect", @"methodName":@"testConv"}];
	[self eq:-1 v2:-1 pos:@{@"fileName":@"TestReflect.hx", @"lineNumber":@"205", @"className":@"unit.TestReflect", @"methodName":@"testConv"}];
	[self eq:1 v2:1 pos:@{@"fileName":@"TestReflect.hx", @"lineNumber":@"206", @"className":@"unit.TestReflect", @"methodName":@"testConv"}];
	[self eq:-1 v2:-1 pos:@{@"fileName":@"TestReflect.hx", @"lineNumber":@"207", @"className":@"unit.TestReflect", @"methodName":@"testConv"}];
	[self eq:[Std parseInt:[@"65" mutableCopy]] v2:65 pos:@{@"fileName":@"TestReflect.hx", @"lineNumber":@"208", @"className":@"unit.TestReflect", @"methodName":@"testConv"}];
	[self eq:[Std parseInt:[@"65.3" mutableCopy]] v2:65 pos:@{@"fileName":@"TestReflect.hx", @"lineNumber":@"209", @"className":@"unit.TestReflect", @"methodName":@"testConv"}];
	[self eq:[Std parseFloat:[@"65" mutableCopy]] v2:65.0 pos:@{@"fileName":@"TestReflect.hx", @"lineNumber":@"210", @"className":@"unit.TestReflect", @"methodName":@"testConv"}];
	[self eq:[Std parseFloat:[@"65.3" mutableCopy]] v2:65.3 pos:@{@"fileName":@"TestReflect.hx", @"lineNumber":@"211", @"className":@"unit.TestReflect", @"methodName":@"testConv"}];
	[self eq:[Std parseFloat:[@"-1e10" mutableCopy]] v2:-1e10 pos:@{@"fileName":@"TestReflect.hx", @"lineNumber":@"212", @"className":@"unit.TestReflect", @"methodName":@"testConv"}];
	[self eq:[Std parseInt:[@"0xFF" mutableCopy]] v2:255 pos:@{@"fileName":@"TestReflect.hx", @"lineNumber":@"213", @"className":@"unit.TestReflect", @"methodName":@"testConv"}];
}
- (void) testCreate{
	
	
	MyClass *i = [Type createInstance:MyClass args:[@[@33] mutableCopy]];
	[self t:[Std is:i t:MyClass] pos:@{@"fileName":@"TestReflect.hx", @"lineNumber":@"218", @"className":@"unit.TestReflect", @"methodName":@"testCreate"}];
	[self eq:[i get] v2:33 pos:@{@"fileName":@"TestReflect.hx", @"lineNumber":@"219", @"className":@"unit.TestReflect", @"methodName":@"testCreate"}];
	[self eq:i.intValue v2:55 pos:@{@"fileName":@"TestReflect.hx", @"lineNumber":@"220", @"className":@"unit.TestReflect", @"methodName":@"testCreate"}];
	
	MyClass *i1 = [Type createEmptyInstance:MyClass];
	[self t:[Std is:i1 t:MyClass] pos:@{@"fileName":@"TestReflect.hx", @"lineNumber":@"222", @"className":@"unit.TestReflect", @"methodName":@"testCreate"}];
	[self eq:[i1 get] v2:nil pos:@{@"fileName":@"TestReflect.hx", @"lineNumber":@"223", @"className":@"unit.TestReflect", @"methodName":@"testCreate"}];
	[self eq:i1.intValue v2:nil pos:@{@"fileName":@"TestReflect.hx", @"lineNumber":@"224", @"className":@"unit.TestReflect", @"methodName":@"testCreate"}];
	
	MyEnum *e = [Type createEnum: constr:[@"A" mutableCopy] params:nil];
	[self eq:e v2:A pos:@{@"fileName":@"TestReflect.hx", @"lineNumber":@"226", @"className":@"unit.TestReflect", @"methodName":@"testCreate"}];
	
	MyEnum *e1 = [Type createEnum: constr:[@"C" mutableCopy] params:[@[@55, [@"hello" mutableCopy]] mutableCopy]];
	
	enum s = e (e1)
	switch ( e.index ) {
		
		case 2:
		
		var MATCH s : NSMutableString = e.params[1], MATCH i2 : int = e.params[0]{
			
			[self eq:i2 v2:55 pos:@{@"fileName":@"TestReflect.hx", @"lineNumber":@"229", @"className":@"unit.TestReflect", @"methodName":@"testCreate"}];
			[self eq:s v2:[@"hello" mutableCopy] pos:@{@"fileName":@"TestReflect.hx", @"lineNumber":@"229", @"className":@"unit.TestReflect", @"methodName":@"testCreate"}];
		}break
		default:[self _assert:@{@"fileName":@"TestReflect.hx", @"lineNumber":@"230", @"className":@"unit.TestReflect", @"methodName":@"testCreate"}];break
	}
	[self exc:^(){
		
		[Type createEnum: constr:[@"A" mutableCopy] params:[@[@0] mutableCopy]];
	} pos:@{@"fileName":@"TestReflect.hx", @"lineNumber":@"232", @"className":@"unit.TestReflect", @"methodName":@"testCreate"}];
	[self exc:^(){
		
		[Type createEnum: constr:[@"C" mutableCopy] params:nil];
	} pos:@{@"fileName":@"TestReflect.hx", @"lineNumber":@"233", @"className":@"unit.TestReflect", @"methodName":@"testCreate"}];
	[self exc:^(){
		
		[Type createEnum: constr:[@"Z" mutableCopy] params:[@[] mutableCopy]];
	} pos:@{@"fileName":@"TestReflect.hx", @"lineNumber":@"234", @"className":@"unit.TestReflect", @"methodName":@"testCreate"}];
}
- (void) testCompare{
	
	
	MyClass *a = [[MyClass alloc] init:0];
	
	MyClass *b = [[MyClass alloc] init:1];
	[self t:[Reflect compareMethods:^(int x, int y){ [self add:x y:y]; } f2:^(int x, int y){ [self add:x y:y]; }] pos:@{@"fileName":@"TestReflect.hx", @"lineNumber":@"240", @"className":@"unit.TestReflect", @"methodName":@"testCompare"}];
	[self f:[Reflect compareMethods:^(int x, int y){ [self add:x y:y]; } f2:^(int x, int y){ [self add:x y:y]; }] pos:@{@"fileName":@"TestReflect.hx", @"lineNumber":@"241", @"className":@"unit.TestReflect", @"methodName":@"testCompare"}];
	[self f:[Reflect compareMethods:^(int x, int y){ [self add:x y:y]; } f2:^(){ [self get]; }] pos:@{@"fileName":@"TestReflect.hx", @"lineNumber":@"242", @"className":@"unit.TestReflect", @"methodName":@"testCompare"}];
	[self f:[Reflect compareMethods:^(int x, int y){ [self add:x y:y]; } f2:nil] pos:@{@"fileName":@"TestReflect.hx", @"lineNumber":@"243", @"className":@"unit.TestReflect", @"methodName":@"testCompare"}];
	[self f:[Reflect compareMethods:nil f2:^(int x, int y){ [self add:x y:y]; }] pos:@{@"fileName":@"TestReflect.hx", @"lineNumber":@"244", @"className":@"unit.TestReflect", @"methodName":@"testCompare"}];
}
- (void) testGetProp{
	
	
	ClassWithProp *c = [[ClassWithProp alloc] init];
	[self eq:[c get_x] v2:5 pos:@{@"fileName":@"TestReflect.hx", @"lineNumber":@"263", @"className":@"unit.TestReflect", @"methodName":@"testGetProp"}];
	[self eq:(id)( (c == nil) ? nil : [c hx_field:[@"x" mutableCopy] :YES]) v2:5 pos:@{@"fileName":@"TestReflect.hx", @"lineNumber":@"265", @"className":@"unit.TestReflect", @"methodName":@"testGetProp"}];
	[c set_x:0];
	if (c != nil) [c hx_set_field:[@"x" mutableCopy] :10 :YES];
	[self eq:[c get_x] v2:10 pos:@{@"fileName":@"TestReflect.hx", @"lineNumber":@"271", @"className":@"unit.TestReflect", @"methodName":@"testGetProp"}];
	[self eq:(id)( (c == nil) ? nil : [c hx_field:[@"x" mutableCopy] :YES]) v2:10 pos:@{@"fileName":@"TestReflect.hx", @"lineNumber":@"272", @"className":@"unit.TestReflect", @"methodName":@"testGetProp"}];
	
	InterfWithProp *c1 = [[ClassWithProp alloc] init];
	[self eq:[c1 get_x] v2:5 pos:@{@"fileName":@"TestReflect.hx", @"lineNumber":@"275", @"className":@"unit.TestReflect", @"methodName":@"testGetProp"}];
	[self eq:(id)( (c1 == nil) ? nil : [c1 hx_field:[@"x" mutableCopy] :YES]) v2:5 pos:@{@"fileName":@"TestReflect.hx", @"lineNumber":@"277", @"className":@"unit.TestReflect", @"methodName":@"testGetProp"}];
	if (c1 != nil) [c1 hx_set_field:[@"x" mutableCopy] :10 :YES];
	[self eq:[c1 get_x] v2:10 pos:@{@"fileName":@"TestReflect.hx", @"lineNumber":@"279", @"className":@"unit.TestReflect", @"methodName":@"testGetProp"}];
	[self eq:(id)( (c1 == nil) ? nil : [c1 hx_field:[@"x" mutableCopy] :YES]) v2:10 pos:@{@"fileName":@"TestReflect.hx", @"lineNumber":@"280", @"className":@"unit.TestReflect", @"methodName":@"testGetProp"}];
	
	SubClassWithProp *c2 = [[SubClassWithProp alloc] init];
	[self eq:[c2 get_x] v2:6 pos:@{@"fileName":@"TestReflect.hx", @"lineNumber":@"283", @"className":@"unit.TestReflect", @"methodName":@"testGetProp"}];
	[self eq:(id)( (c2 == nil) ? nil : [c2 hx_field:[@"x" mutableCopy] :YES]) v2:6 pos:@{@"fileName":@"TestReflect.hx", @"lineNumber":@"284", @"className":@"unit.TestReflect", @"methodName":@"testGetProp"}];
	[self eq:c2.y v2:10 pos:@{@"fileName":@"TestReflect.hx", @"lineNumber":@"285", @"className":@"unit.TestReflect", @"methodName":@"testGetProp"}];
	[self eq:(id)( (c2 == nil) ? nil : [c2 hx_field:[@"y" mutableCopy] :YES]) v2:10 pos:@{@"fileName":@"TestReflect.hx", @"lineNumber":@"286", @"className":@"unit.TestReflect", @"methodName":@"testGetProp"}];
	if (c2 != nil) [c2 hx_set_field:[@"x" mutableCopy] :10 :YES];
	if (c2 != nil) [c2 hx_set_field:[@"y" mutableCopy] :20 :YES];
	[self eq:[c2 get_x] v2:11 pos:@{@"fileName":@"TestReflect.hx", @"lineNumber":@"291", @"className":@"unit.TestReflect", @"methodName":@"testGetProp"}];
	[self eq:(id)( (c2 == nil) ? nil : [c2 hx_field:[@"x" mutableCopy] :YES]) v2:11 pos:@{@"fileName":@"TestReflect.hx", @"lineNumber":@"292", @"className":@"unit.TestReflect", @"methodName":@"testGetProp"}];
	[self eq:c2.y v2:20 pos:@{@"fileName":@"TestReflect.hx", @"lineNumber":@"293", @"className":@"unit.TestReflect", @"methodName":@"testGetProp"}];
	[self eq:(id)( (c2 == nil) ? nil : [c2 hx_field:[@"y" mutableCopy] :YES]) v2:20 pos:@{@"fileName":@"TestReflect.hx", @"lineNumber":@"294", @"className":@"unit.TestReflect", @"methodName":@"testGetProp"}];
	[self eq:ClassWithProp.STAT_X v2:6 pos:@{@"fileName":@"TestReflect.hx", @"lineNumber":@"296", @"className":@"unit.TestReflect", @"methodName":@"testGetProp"}];
	[self eq:((id)($this:(snd ctx.path)) id o = ClassWithProp
	__r__ = ( (o == nil) ? nil : [o hx_field:[@"STAT_X" mutableCopy] :YES])
	return __r__{
		
		id* __r__}
	}(self)) v2:6 pos:@{@"fileName":@"TestReflect.hx", @"lineNumber":@"297", @"className":@"unit.TestReflect", @"methodName":@"testGetProp"}];
	{
		
		id o = ClassWithProp;
		if (o != nil) [o hx_set_field:[@"STAT_X" mutableCopy] :8 :YES];
	}
	[self eq:ClassWithProp.STAT_X v2:16 pos:@{@"fileName":@"TestReflect.hx", @"lineNumber":@"301", @"className":@"unit.TestReflect", @"methodName":@"testGetProp"}];
	[self eq:((id)($this:(snd ctx.path)) id o = ClassWithProp
	__r__2 = ( (o == nil) ? nil : [o hx_field:[@"STAT_X" mutableCopy] :YES])
	return __r__2{
		
		id* __r__2}
	}(self)) v2:16 pos:@{@"fileName":@"TestReflect.hx", @"lineNumber":@"302", @"className":@"unit.TestReflect", @"methodName":@"testGetProp"}];
}

@end
