//
//  TestOps
//  Test
//
//  Source generated by Haxe Objective-C target
//

#import "../unit/TestOps.h"

@implementation TestOps

- (void) testOps{
	
	[self eq:[@"3" stringByAppendingString:[@"" mutableCopy]] v2:[@"3" mutableCopy] pos:@{@"fileName":@"TestOps.hx", @"lineNumber":@"7", @"className":@"unit.TestOps", @"methodName":@"testOps"}];
	[self eq:[@"3" stringByAppendingString:[@"" mutableCopy]] v2:[@"3" mutableCopy] pos:@{@"fileName":@"TestOps.hx", @"lineNumber":@"8", @"className":@"unit.TestOps", @"methodName":@"testOps"}];
	[self eq:1 +  ([@"2" stringByAppendingString:[@"" mutableCopy]]) v2:[@"12" mutableCopy] pos:@{@"fileName":@"TestOps.hx", @"lineNumber":@"9", @"className":@"unit.TestOps", @"methodName":@"testOps"}];
	[self eq:[@"1" stringByAppendingString:[@"" mutableCopy]] v2:[@"1" mutableCopy] pos:@{@"fileName":@"TestOps.hx", @"lineNumber":@"11", @"className":@"unit.TestOps", @"methodName":@"testOps"}];
	[self eq:[@"1" stringByAppendingString:[@"" mutableCopy]] v2:[@"1" mutableCopy] pos:@{@"fileName":@"TestOps.hx", @"lineNumber":@"12", @"className":@"unit.TestOps", @"methodName":@"testOps"}];
	[self eq:1 v2:1 pos:@{@"fileName":@"TestOps.hx", @"lineNumber":@"15", @"className":@"unit.TestOps", @"methodName":@"testOps"}];
	[self eq:1 v2:1 pos:@{@"fileName":@"TestOps.hx", @"lineNumber":@"16", @"className":@"unit.TestOps", @"methodName":@"testOps"}];
	[self eq:5 v2:5 pos:@{@"fileName":@"TestOps.hx", @"lineNumber":@"17", @"className":@"unit.TestOps", @"methodName":@"testOps"}];
	[self eq:1 v2:1 pos:@{@"fileName":@"TestOps.hx", @"lineNumber":@"19", @"className":@"unit.TestOps", @"methodName":@"testOps"}];
	[self eq:1 v2:1 pos:@{@"fileName":@"TestOps.hx", @"lineNumber":@"20", @"className":@"unit.TestOps", @"methodName":@"testOps"}];
	[self eq:0 v2:0 pos:@{@"fileName":@"TestOps.hx", @"lineNumber":@"21", @"className":@"unit.TestOps", @"methodName":@"testOps"}];
	[self eq:-4 v2:-4 pos:@{@"fileName":@"TestOps.hx", @"lineNumber":@"23", @"className":@"unit.TestOps", @"methodName":@"testOps"}];
	[self eq:-6 v2:-6 pos:@{@"fileName":@"TestOps.hx", @"lineNumber":@"24", @"className":@"unit.TestOps", @"methodName":@"testOps"}];
	[self t:YES pos:@{@"fileName":@"TestOps.hx", @"lineNumber":@"26", @"className":@"unit.TestOps", @"methodName":@"testOps"}];
	[self t:YES pos:@{@"fileName":@"TestOps.hx", @"lineNumber":@"27", @"className":@"unit.TestOps", @"methodName":@"testOps"}];
	[self t:YES pos:@{@"fileName":@"TestOps.hx", @"lineNumber":@"28", @"className":@"unit.TestOps", @"methodName":@"testOps"}];
	[self t:YES pos:@{@"fileName":@"TestOps.hx", @"lineNumber":@"29", @"className":@"unit.TestOps", @"methodName":@"testOps"}];
	[self eq:5 % 3 * 4 v2:8 pos:@{@"fileName":@"TestOps.hx", @"lineNumber":@"31", @"className":@"unit.TestOps", @"methodName":@"testOps"}];
	[self eq:5 % 3 * 4 v2:8 pos:@{@"fileName":@"TestOps.hx", @"lineNumber":@"32", @"className":@"unit.TestOps", @"methodName":@"testOps"}];
	[self eq:5 % 12 v2:5 pos:@{@"fileName":@"TestOps.hx", @"lineNumber":@"33", @"className":@"unit.TestOps", @"methodName":@"testOps"}];
	[self eq:5. v2:5 pos:@{@"fileName":@"TestOps.hx", @"lineNumber":@"35", @"className":@"unit.TestOps", @"methodName":@"testOps"}];
	[self eq:5. v2:5 pos:@{@"fileName":@"TestOps.hx", @"lineNumber":@"36", @"className":@"unit.TestOps", @"methodName":@"testOps"}];
	[self eq:20. v2:20 pos:@{@"fileName":@"TestOps.hx", @"lineNumber":@"37", @"className":@"unit.TestOps", @"methodName":@"testOps"}];
	[self eq:8 v2:8 pos:@{@"fileName":@"TestOps.hx", @"lineNumber":@"39", @"className":@"unit.TestOps", @"methodName":@"testOps"}];
	[self eq:8 v2:8 pos:@{@"fileName":@"TestOps.hx", @"lineNumber":@"40", @"className":@"unit.TestOps", @"methodName":@"testOps"}];
	[self eq:4 v2:4 pos:@{@"fileName":@"TestOps.hx", @"lineNumber":@"41", @"className":@"unit.TestOps", @"methodName":@"testOps"}];
	[self f:NO pos:@{@"fileName":@"TestOps.hx", @"lineNumber":@"43", @"className":@"unit.TestOps", @"methodName":@"testOps"}];
	[self f:NO pos:@{@"fileName":@"TestOps.hx", @"lineNumber":@"44", @"className":@"unit.TestOps", @"methodName":@"testOps"}];
	[self f:NO pos:@{@"fileName":@"TestOps.hx", @"lineNumber":@"45", @"className":@"unit.TestOps", @"methodName":@"testOps"}];
	[self f:NO pos:@{@"fileName":@"TestOps.hx", @"lineNumber":@"46", @"className":@"unit.TestOps", @"methodName":@"testOps"}];
	[self eq:5 *  (10 % 3) v2:5 pos:@{@"fileName":@"TestOps.hx", @"lineNumber":@"48", @"className":@"unit.TestOps", @"methodName":@"testOps"}];
	[self eq:5 *  (10 % 3) v2:5 pos:@{@"fileName":@"TestOps.hx", @"lineNumber":@"49", @"className":@"unit.TestOps", @"methodName":@"testOps"}];
	[self eq:50 % 3 v2:2 pos:@{@"fileName":@"TestOps.hx", @"lineNumber":@"50", @"className":@"unit.TestOps", @"methodName":@"testOps"}];
	[self eq:10 % 3 * 5 v2:5 pos:@{@"fileName":@"TestOps.hx", @"lineNumber":@"52", @"className":@"unit.TestOps", @"methodName":@"testOps"}];
	[self eq:10 % 3 * 5 v2:5 pos:@{@"fileName":@"TestOps.hx", @"lineNumber":@"53", @"className":@"unit.TestOps", @"methodName":@"testOps"}];
	[self eq:10 % 15 v2:10 pos:@{@"fileName":@"TestOps.hx", @"lineNumber":@"54", @"className":@"unit.TestOps", @"methodName":@"testOps"}];
	[self eq:100 % 100 v2:0 pos:@{@"fileName":@"TestOps.hx", @"lineNumber":@"55", @"className":@"unit.TestOps", @"methodName":@"testOps"}];
	[self eq:-100 % 100 v2:0 pos:@{@"fileName":@"TestOps.hx", @"lineNumber":@"56", @"className":@"unit.TestOps", @"methodName":@"testOps"}];
	[self eq:101.5 % 100 v2:1.5 pos:@{@"fileName":@"TestOps.hx", @"lineNumber":@"57", @"className":@"unit.TestOps", @"methodName":@"testOps"}];
	[self eq:-101.5 % 100 v2:-1.5 pos:@{@"fileName":@"TestOps.hx", @"lineNumber":@"58", @"className":@"unit.TestOps", @"methodName":@"testOps"}];
	float x = 101.5;
	x %= 100;
	[self eq:x v2:1.5 pos:@{@"fileName":@"TestOps.hx", @"lineNumber":@"61", @"className":@"unit.TestOps", @"methodName":@"testOps"}];
	[self t:isnan(5.0 % 0.0) pos:@{@"fileName":@"TestOps.hx", @"lineNumber":@"62", @"className":@"unit.TestOps", @"methodName":@"testOps"}];
	[self t:isnan(x %= 0.0) pos:@{@"fileName":@"TestOps.hx", @"lineNumber":@"63", @"className":@"unit.TestOps", @"methodName":@"testOps"}];
	id x1 = [@[@-101.5] mutableCopy];
	((TArray3TDynamic*)[x1 hx_objectAtIndex:0]) %= 100;
	[self eq:((TArray3TDynamic*)[x1 hx_objectAtIndex:0]) v2:-1.5 pos:@{@"fileName":@"TestOps.hx", @"lineNumber":@"71", @"className":@"unit.TestOps", @"methodName":@"testOps"}];
	[self eq:1 v2:1 pos:@{@"fileName":@"TestOps.hx", @"lineNumber":@"72", @"className":@"unit.TestOps", @"methodName":@"testOps"}];
	[self eq:30 v2:30 pos:@{@"fileName":@"TestOps.hx", @"lineNumber":@"73", @"className":@"unit.TestOps", @"methodName":@"testOps"}];
	[self eq:5 v2:5 pos:@{@"fileName":@"TestOps.hx", @"lineNumber":@"74", @"className":@"unit.TestOps", @"methodName":@"testOps"}];
	[self eq:30 v2:30 pos:@{@"fileName":@"TestOps.hx", @"lineNumber":@"75", @"className":@"unit.TestOps", @"methodName":@"testOps"}];
	[self eq:2 v2:2 pos:@{@"fileName":@"TestOps.hx", @"lineNumber":@"77", @"className":@"unit.TestOps", @"methodName":@"testOps"}];
	[self eq:5 v2:5 pos:@{@"fileName":@"TestOps.hx", @"lineNumber":@"78", @"className":@"unit.TestOps", @"methodName":@"testOps"}];
	[self eq:1 v2:1 pos:@{@"fileName":@"TestOps.hx", @"lineNumber":@"80", @"className":@"unit.TestOps", @"methodName":@"testOps"}];
	[self t:YES pos:@{@"fileName":@"TestOps.hx", @"lineNumber":@"81", @"className":@"unit.TestOps", @"methodName":@"testOps"}];
	BOOL k = NO;
	[self f:k = NO pos:@{@"fileName":@"TestOps.hx", @"lineNumber":@"84", @"className":@"unit.TestOps", @"methodName":@"testOps"}];
	[self f:k pos:@{@"fileName":@"TestOps.hx", @"lineNumber":@"85", @"className":@"unit.TestOps", @"methodName":@"testOps"}];
	[self f:( (k = YES) ? NO : YES) pos:@{@"fileName":@"TestOps.hx", @"lineNumber":@"86", @"className":@"unit.TestOps", @"methodName":@"testOps"}];
	[self t:k pos:@{@"fileName":@"TestOps.hx", @"lineNumber":@"87", @"className":@"unit.TestOps", @"methodName":@"testOps"}];
	[self t:YES pos:@{@"fileName":@"TestOps.hx", @"lineNumber":@"89", @"className":@"unit.TestOps", @"methodName":@"testOps"}];
	int x2 = 1;
	[self eq:-x2++ v2:-1 pos:@{@"fileName":@"TestOps.hx", @"lineNumber":@"92", @"className":@"unit.TestOps", @"methodName":@"testOps"}];
	[self eq:-x2-- v2:-2 pos:@{@"fileName":@"TestOps.hx", @"lineNumber":@"93", @"className":@"unit.TestOps", @"methodName":@"testOps"}];
	[self eq:[ ([[@"bla" mutableCopy] stringByAppendingString:[@"x" mutableCopy]]) indexOf:[@"x" mutableCopy] startIndex:nil] v2:3 pos:@{@"fileName":@"TestOps.hx", @"lineNumber":@"95", @"className":@"unit.TestOps", @"methodName":@"testOps"}];
	[self eq:19 v2:19 pos:@{@"fileName":@"TestOps.hx", @"lineNumber":@"97", @"className":@"unit.TestOps", @"methodName":@"testOps"}];
	[self eq:19 v2:19 pos:@{@"fileName":@"TestOps.hx", @"lineNumber":@"98", @"className":@"unit.TestOps", @"methodName":@"testOps"}];
}

@end
