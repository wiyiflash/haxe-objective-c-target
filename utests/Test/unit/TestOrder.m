//
//  TestOrder
//  Test
//
//  Source generated by Haxe Objective-C target
//

#import "../unit/TestOrder.h"

@implementation TestOrder

- (void) testUsing{
	[self eq:[Using3 usingTest:(NSMutableString*)@"foo"] v2:(NSMutableString*)@"3" pos:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"TestOrder.hx",@"17",@"unit.TestOrder",@"testUsing",nil] forKeys:[NSArray arrayWithObjects:@"fileName",@"lineNumber",@"className",@"methodName",nil]]];
	
	TestOrder *c =  C1;
	{
		Test.count++;
		[self eq:(NSMutableString*)@"TEnum(unit.E2,[])" v2:(NSMutableString*)@"TEnum(unit.E2,[])" pos:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"TestOrder.hx",@"21",@"unit.TestOrder",@"testUsing",nil] forKeys:[NSArray arrayWithObjects:@"fileName",@"lineNumber",@"className",@"methodName",nil]]];
	}
	[self eq:c v2: C1 pos:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"TestOrder.hx",@"22",@"unit.TestOrder",@"testUsing",nil] forKeys:[NSArray arrayWithObjects:@"fileName",@"lineNumber",@"className",@"methodName",nil]]];
}
- (id) init{
	self = [super init];
	[super];
	return self;
}

@end