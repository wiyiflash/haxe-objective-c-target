//
//  TestMeta
//  Test
//
//  Source generated by Haxe Objective-C target
//

#import "../unit/TestMeta.h"

@implementation TestMeta

+ (id) __meta__:(id)val {
	static id _val;
	if (val == nil) { if (_val == nil) _val = struct {
obj:struct {
classMeta:[[NSMutableArray alloc] initWithObjects:(NSMutableString*)@"x", nil]
} structName; statics:struct {
foo:struct {
empty:nil; _int:[[NSMutableArray alloc] initWithObjects:[NSNumber numberWithInt:-45], nil]; complex:[[NSMutableArray alloc] initWithObjects:[[NSMutableArray alloc] initWithObjects:struct {
x:[NSNumber numberWithInt:0]; y:(NSMutableString*)@"hello"; z:[NSNumber numberWithFloat:-1.48]; b:YES; k:[NSNull null]
} structName, nil], nil]
} structName
} structName; fields:struct {
_:struct {
new:nil
} structName
} structName
} structName; }
	else { if (_val != nil) _val = val; }
	return _val;
}
+ (int) foo:(int)val {
	static int _val;
	if (val == nil) { if (_val == nil) _val = ; }
	else { if (_val != nil) _val = val; }
	return _val;
}
- (NSMutableString*) fields:(id)o{
	if (o == nil) return nil;
	
	NSMutableArray *fl = (NSMutableArray*)[Reflect fields:o];
	[fl sort:Reflect compare];
	return [fl join:(NSMutableString*)@"#"];
}
- (void) testMeta{
	id m = [Meta getType:];
	[self eq:[self.fields:m] v2:(NSMutableString*)@"enumMeta" pos:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"TestMeta.hx",@"25",@"unit.TestMeta",@"testMeta",nil] forKeys:[NSArray arrayWithObjects:@"fileName",@"lineNumber",@"className",@"methodName",nil]]];
	[self eq:m enumMeta v2:nil pos:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"TestMeta.hx",@"26",@"unit.TestMeta",@"testMeta",nil] forKeys:[NSArray arrayWithObjects:@"fileName",@"lineNumber",@"className",@"methodName",nil]]];
	id m1 = [Meta getType:TestMeta];
	[self eq:[self.fields:m1] v2:(NSMutableString*)@"classMeta" pos:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"TestMeta.hx",@"29",@"unit.TestMeta",@"testMeta",nil] forKeys:[NSArray arrayWithObjects:@"fileName",@"lineNumber",@"className",@"methodName",nil]]];
	[self eq:[Std string:m1 classMeta] v2:(NSMutableString*)@"[x]" pos:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"TestMeta.hx",@"30",@"unit.TestMeta",@"testMeta",nil] forKeys:[NSArray arrayWithObjects:@"fileName",@"lineNumber",@"className",@"methodName",nil]]];
	id m2 = [Meta getFields:];
	[self eq:[self.fields:m2] v2:(NSMutableString*)@"A#B" pos:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"TestMeta.hx",@"33",@"unit.TestMeta",@"testMeta",nil] forKeys:[NSArray arrayWithObjects:@"fileName",@"lineNumber",@"className",@"methodName",nil]]];
	[self eq:[self.fields:m2 A] v2:(NSMutableString*)@"a" pos:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"TestMeta.hx",@"34",@"unit.TestMeta",@"testMeta",nil] forKeys:[NSArray arrayWithObjects:@"fileName",@"lineNumber",@"className",@"methodName",nil]]];
	[self eq:m2 A a v2:nil pos:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"TestMeta.hx",@"35",@"unit.TestMeta",@"testMeta",nil] forKeys:[NSArray arrayWithObjects:@"fileName",@"lineNumber",@"className",@"methodName",nil]]];
	[self eq:[self.fields:m2 B] v2:(NSMutableString*)@"b" pos:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"TestMeta.hx",@"36",@"unit.TestMeta",@"testMeta",nil] forKeys:[NSArray arrayWithObjects:@"fileName",@"lineNumber",@"className",@"methodName",nil]]];
	[self eq:[Std string:m2 B b] v2:(NSMutableString*)@"[0]" pos:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"TestMeta.hx",@"37",@"unit.TestMeta",@"testMeta",nil] forKeys:[NSArray arrayWithObjects:@"fileName",@"lineNumber",@"className",@"methodName",nil]]];
	id m3 = [Meta getFields:TestMeta];
	[self eq:[self.fields:m3] v2:(NSMutableString*)@"_" pos:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"TestMeta.hx",@"40",@"unit.TestMeta",@"testMeta",nil] forKeys:[NSArray arrayWithObjects:@"fileName",@"lineNumber",@"className",@"methodName",nil]]];
	[self eq:[self.fields:m3 _] v2:(NSMutableString*)@"new" pos:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"TestMeta.hx",@"41",@"unit.TestMeta",@"testMeta",nil] forKeys:[NSArray arrayWithObjects:@"fileName",@"lineNumber",@"className",@"methodName",nil]]];
	id m4 = [Meta getStatics:TestMeta];
	[self eq:[self.fields:m4] v2:(NSMutableString*)@"foo" pos:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"TestMeta.hx",@"44",@"unit.TestMeta",@"testMeta",nil] forKeys:[NSArray arrayWithObjects:@"fileName",@"lineNumber",@"className",@"methodName",nil]]];
	[self eq:[self.fields:m4 foo] v2:(NSMutableString*)@"_int#complex#empty" pos:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"TestMeta.hx",@"45",@"unit.TestMeta",@"testMeta",nil] forKeys:[NSArray arrayWithObjects:@"fileName",@"lineNumber",@"className",@"methodName",nil]]];
	[self eq:m4 foo empty v2:nil pos:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"TestMeta.hx",@"46",@"unit.TestMeta",@"testMeta",nil] forKeys:[NSArray arrayWithObjects:@"fileName",@"lineNumber",@"className",@"methodName",nil]]];
	[self eq:[Std string:m4 foo _int] v2:(NSMutableString*)@"[-45]" pos:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"TestMeta.hx",@"47",@"unit.TestMeta",@"testMeta",nil] forKeys:[NSArray arrayWithObjects:@"fileName",@"lineNumber",@"className",@"methodName",nil]]];
	id c = [[m4 foo complex objectAtIndex:0] objectAtIndex:0];
	[self eq:[self.fields:c] v2:(NSMutableString*)@"b#k#x#y#z" pos:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"TestMeta.hx",@"49",@"unit.TestMeta",@"testMeta",nil] forKeys:[NSArray arrayWithObjects:@"fileName",@"lineNumber",@"className",@"methodName",nil]]];
	[self eq:c x v2:0 pos:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"TestMeta.hx",@"50",@"unit.TestMeta",@"testMeta",nil] forKeys:[NSArray arrayWithObjects:@"fileName",@"lineNumber",@"className",@"methodName",nil]]];
	[self eq:c y v2:(NSMutableString*)@"hello" pos:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"TestMeta.hx",@"51",@"unit.TestMeta",@"testMeta",nil] forKeys:[NSArray arrayWithObjects:@"fileName",@"lineNumber",@"className",@"methodName",nil]]];
	[self eq:c z v2:-1.48 pos:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"TestMeta.hx",@"52",@"unit.TestMeta",@"testMeta",nil] forKeys:[NSArray arrayWithObjects:@"fileName",@"lineNumber",@"className",@"methodName",nil]]];
	[self eq:c b v2:YES pos:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"TestMeta.hx",@"53",@"unit.TestMeta",@"testMeta",nil] forKeys:[NSArray arrayWithObjects:@"fileName",@"lineNumber",@"className",@"methodName",nil]]];
	[self eq:c k v2:nil pos:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"TestMeta.hx",@"54",@"unit.TestMeta",@"testMeta",nil] forKeys:[NSArray arrayWithObjects:@"fileName",@"lineNumber",@"className",@"methodName",nil]]];
}
- (void) testExprMeta{
	[self eq:struct {
	name:(NSMutableString*)@"foo"; args:[[NSMutableArray alloc] initWithObjects:, nil]
	} structName name v2:(NSMutableString*)@"foo" pos:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"TestMeta.hx",@"58",@"unit.TestMeta",@"testExprMeta",nil] forKeys:[NSArray arrayWithObjects:@"fileName",@"lineNumber",@"className",@"methodName",nil]]];
	[self eq:struct {
	name:(NSMutableString*)@"foo"; args:[[NSMutableArray alloc] initWithObjects:(NSMutableString*)@"a", nil]
	} structName name v2:(NSMutableString*)@"foo" pos:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"TestMeta.hx",@"59",@"unit.TestMeta",@"testExprMeta",nil] forKeys:[NSArray arrayWithObjects:@"fileName",@"lineNumber",@"className",@"methodName",nil]]];
	[self eq:struct {
	name:(NSMutableString*)@"foo"; args:[[NSMutableArray alloc] initWithObjects:, nil]
	} structName name v2:(NSMutableString*)@"foo" pos:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"TestMeta.hx",@"60",@"unit.TestMeta",@"testExprMeta",nil] forKeys:[NSArray arrayWithObjects:@"fileName",@"lineNumber",@"className",@"methodName",nil]]];
	id m = struct {
	name:(NSMutableString*)@"bar"; args:[[NSMutableArray alloc] initWithObjects:(NSMutableString*)@"1", (NSMutableString*)@"foo", nil]
	} structName;
	[self eq:m name v2:(NSMutableString*)@"bar" pos:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"TestMeta.hx",@"63",@"unit.TestMeta",@"testExprMeta",nil] forKeys:[NSArray arrayWithObjects:@"fileName",@"lineNumber",@"className",@"methodName",nil]]];
	[self eq:[m args objectAtIndex:0] v2:(NSMutableString*)@"1" pos:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"TestMeta.hx",@"64",@"unit.TestMeta",@"testExprMeta",nil] forKeys:[NSArray arrayWithObjects:@"fileName",@"lineNumber",@"className",@"methodName",nil]]];
	[self eq:[m args objectAtIndex:1] v2:(NSMutableString*)@"foo" pos:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"TestMeta.hx",@"65",@"unit.TestMeta",@"testExprMeta",nil] forKeys:[NSArray arrayWithObjects:@"fileName",@"lineNumber",@"className",@"methodName",nil]]];
	[self eq:struct {
	name:(NSMutableString*)@"foo"; args:[[NSMutableArray alloc] initWithObjects:, nil]
	} structName args.length v2:0 pos:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"TestMeta.hx",@"67",@"unit.TestMeta",@"testExprMeta",nil] forKeys:[NSArray arrayWithObjects:@"fileName",@"lineNumber",@"className",@"methodName",nil]]];
	[self eq:struct {
	name:(NSMutableString*)@"foo"; args:[[NSMutableArray alloc] initWithObjects:(NSMutableString*)@"1", nil]
	} structName args.length v2:1 pos:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"TestMeta.hx",@"68",@"unit.TestMeta",@"testExprMeta",nil] forKeys:[NSArray arrayWithObjects:@"fileName",@"lineNumber",@"className",@"methodName",nil]]];
}
- (id) init{
	self = [super init];
	[super];
	return self;
}

@end
