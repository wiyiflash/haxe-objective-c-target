//
//  TestLocals
//  Test
//
//  Source generated by Haxe Objective-C target
//

#import "../unit/TestLocals.h"

@implementation TestLocals

- (void) testIncrDecr{
	int i = 5;
	[self eq:i++ v2:5 pos:@{@"fileName":@"TestLocals.hx", @"lineNumber":@"7", @"className":@"unit.TestLocals", @"methodName":@"testIncrDecr"}];
	[self eq:i v2:6 pos:@{@"fileName":@"TestLocals.hx", @"lineNumber":@"8", @"className":@"unit.TestLocals", @"methodName":@"testIncrDecr"}];
	[self eq:i-- v2:6 pos:@{@"fileName":@"TestLocals.hx", @"lineNumber":@"9", @"className":@"unit.TestLocals", @"methodName":@"testIncrDecr"}];
	[self eq:i v2:5 pos:@{@"fileName":@"TestLocals.hx", @"lineNumber":@"10", @"className":@"unit.TestLocals", @"methodName":@"testIncrDecr"}];
	[self eq:++i v2:6 pos:@{@"fileName":@"TestLocals.hx", @"lineNumber":@"11", @"className":@"unit.TestLocals", @"methodName":@"testIncrDecr"}];
	[self eq:i v2:6 pos:@{@"fileName":@"TestLocals.hx", @"lineNumber":@"12", @"className":@"unit.TestLocals", @"methodName":@"testIncrDecr"}];
	[self eq:--i v2:5 pos:@{@"fileName":@"TestLocals.hx", @"lineNumber":@"13", @"className":@"unit.TestLocals", @"methodName":@"testIncrDecr"}];
	[self eq:i v2:5 pos:@{@"fileName":@"TestLocals.hx", @"lineNumber":@"14", @"className":@"unit.TestLocals", @"methodName":@"testIncrDecr"}];
}
- (void) testScope{
	int x = 0;
	[self eq:x v2:0 pos:@{@"fileName":@"TestLocals.hx", @"lineNumber":@"19", @"className":@"unit.TestLocals", @"methodName":@"testScope"}];
	{
		
		NSMutableString *x1 = [@"hello" mutableCopy];
		[self eq:x1 v2:[@"hello" mutableCopy] pos:@{@"fileName":@"TestLocals.hx", @"lineNumber":@"23", @"className":@"unit.TestLocals", @"methodName":@"testScope"}];
		{
			
			NSMutableString *x2 = [@"" mutableCopy];
			[self eq:x2 v2:[@"" mutableCopy] pos:@{@"fileName":@"TestLocals.hx", @"lineNumber":@"26", @"className":@"unit.TestLocals", @"methodName":@"testScope"}];
		}
		[self eq:x1 v2:[@"hello" mutableCopy] pos:@{@"fileName":@"TestLocals.hx", @"lineNumber":@"28", @"className":@"unit.TestLocals", @"methodName":@"testScope"}];
	}
	[self eq:x v2:0 pos:@{@"fileName":@"TestLocals.hx", @"lineNumber":@"30", @"className":@"unit.TestLocals", @"methodName":@"testScope"}];
	BOOL flag = YES;
	if (flag) {
		
		NSMutableString *x1 = [@"hello" mutableCopy];
		[self eq:x1 v2:[@"hello" mutableCopy] pos:@{@"fileName":@"TestLocals.hx", @"lineNumber":@"35", @"className":@"unit.TestLocals", @"methodName":@"testScope"}];
	}
	[self eq:x v2:0 pos:@{@"fileName":@"TestLocals.hx", @"lineNumber":@"37", @"className":@"unit.TestLocals", @"methodName":@"testScope"}];
	{
		int _g = 0; 
		NSMutableArray *_g1 = [@[[@"hello" mutableCopy]] mutableCopy];
		while (_g < _g1.length) {
			
			NSMutableString *x1 = [_g1 hx_objectAtIndex:_g];
			++_g;
			[self eq:x1 v2:[@"hello" mutableCopy] pos:@{@"fileName":@"TestLocals.hx", @"lineNumber":@"40", @"className":@"unit.TestLocals", @"methodName":@"testScope"}];
		}
	}
	[self eq:x v2:0 pos:@{@"fileName":@"TestLocals.hx", @"lineNumber":@"41", @"className":@"unit.TestLocals", @"methodName":@"testScope"}];
	{
		
		MyEnum *_g = [D:A];
		
		enum s = e (_g)
		switch ( e.index ) {
			
			case 3:
			
			var MATCH _g_eD_0 : MyEnum = e.params[0]{
				[self eq:_g_eD_0 v2:A pos:@{@"fileName":@"TestLocals.hx", @"lineNumber":@"45", @"className":@"unit.TestLocals", @"methodName":@"testScope"}]}break
			default:{
				[self assert:@{@"fileName":@"TestLocals.hx", @"lineNumber":@"47", @"className":@"unit.TestLocals", @"methodName":@"testScope"}]}break
		}
	}
	[self eq:x v2:0 pos:@{@"fileName":@"TestLocals.hx", @"lineNumber":@"49", @"className":@"unit.TestLocals", @"methodName":@"testScope"}];
	@try {
		@throw [@"hello" mutableCopy];;
	}
	@catch (NSException *x1) {
		[self eq:x1 v2:[@"hello" mutableCopy] pos:@{@"fileName":@"TestLocals.hx", @"lineNumber":@"54", @"className":@"unit.TestLocals", @"methodName":@"testScope"}];
	}
	[self eq:x v2:0 pos:@{@"fileName":@"TestLocals.hx", @"lineNumber":@"56", @"className":@"unit.TestLocals", @"methodName":@"testScope"}];
}
- (void) testCapture{
	
	NSMutableArray *funs = [[NSMutableArray alloc] init];
	{
		int _g = 0;
		while (_g < 5) {
			int i = _g++;
			[funs push:^(){
				return i;
			}];
		}
	}
	{
		int _g = 0;
		while (_g < 5) {
			int k = _g++;
			[self eq:[[funs hx_objectAtIndex:k]] v2:k pos:@{@"fileName":@"TestLocals.hx", @"lineNumber":@"65", @"className":@"unit.TestLocals", @"methodName":@"testCapture"}];
		}
	}
	funs = [[NSMutableArray alloc] init];
	int sum = 0;
	{
		int _g = 0;
		while (_g < 5) {
			int i = _g++;
			int k = 0;
			[funs push:^(){
				k++;
				sum++;
				return k;
			}];
		}
	}
	{
		int _g = 0;
		while (_g < 5) {
			int i = _g++;
			[self eq:[[funs hx_objectAtIndex:i]] v2:1 pos:@{@"fileName":@"TestLocals.hx", @"lineNumber":@"75", @"className":@"unit.TestLocals", @"methodName":@"testCapture"}];
		}
	}
	[self eq:sum v2:5 pos:@{@"fileName":@"TestLocals.hx", @"lineNumber":@"76", @"className":@"unit.TestLocals", @"methodName":@"testCapture"}];
	
	NSMutableArray *accesses = [[NSMutableArray alloc] init];
	int sum1 = 0;
	{
		int _g = 0;
		while (_g < 5) {
			int i = _g++;
			int j = i;
			[accesses push:[@{
				@"inc":[^(){
				sum1 += j;
				j++;
				return j;
			} copy],
				@"dec":[^(){
				j--;
				sum1 -= j;
				return j;
			} copy],
			} mutableCopy]];
		}
	}
	{
		int _g = 0;
		while (_g < 5) {
			int i = _g++;
			id a = [accesses hx_objectAtIndex:i];
			[self eq:[a[@"inc"]] v2:[i stringByAppendingString:@"1"] pos:@{@"fileName":@"TestLocals.hx", @"lineNumber":@"90", @"className":@"unit.TestLocals", @"methodName":@"testCapture"}];
			[self eq:sum1 v2:i pos:@{@"fileName":@"TestLocals.hx", @"lineNumber":@"91", @"className":@"unit.TestLocals", @"methodName":@"testCapture"}];
			[self eq:[a[@"dec"]] v2:i pos:@{@"fileName":@"TestLocals.hx", @"lineNumber":@"92", @"className":@"unit.TestLocals", @"methodName":@"testCapture"}];
			[self eq:sum1 v2:0 pos:@{@"fileName":@"TestLocals.hx", @"lineNumber":@"93", @"className":@"unit.TestLocals", @"methodName":@"testCapture"}];
		}
	}
}
- (void) testSubCapture{
	
	NSMutableArray *funs = [[NSMutableArray alloc] init];
	{
		int _g = 0;
		while (_g < 5) {
			int i = _g++;
			[funs push:^(){
				
				NSMutableArray *tmp = [[NSMutableArray alloc] init];
				{
					int _g1 = 0;
					while (_g1 < 5) {
						int j = _g1++;
						[tmp push:^(){
							return i + j;
						}];
					}
				}
				int sum = 0;
				{
					int _g1 = 0;
					while (_g1 < 5) {
						int j = _g1++;
						sum += [[tmp hx_objectAtIndex:j]];
					}
				}
				return sum;
			}];
		}
	}
	{
		int _g = 0;
		while (_g < 5) {
			int i = _g++;
			[self eq:[[funs hx_objectAtIndex:i]] v2:[i * @"5" stringByAppendingString:@"10"] pos:@{@"fileName":@"TestLocals.hx", @"lineNumber":@"110", @"className":@"unit.TestLocals", @"methodName":@"testSubCapture"}];
		}
	}
}
- (void) testParallelCapture{
	
	NSMutableArray *funs = [[NSMutableArray alloc] init];
	{
		int _g = 0;
		while (_g < 5) {
			int i = _g++;
			{
				int j = i;
				[funs push:^(int *k){
					return j;
				}];
			}
			[funs push:^(int *j){
				return j;
			}];
		}
	}
	{
		int _g = 0;
		while (_g < 5) {
			int k = _g++;
			[self eq:[[funs hx_objectAtIndex:k * 2]:0] v2:k pos:@{@"fileName":@"TestLocals.hx", @"lineNumber":@"124", @"className":@"unit.TestLocals", @"methodName":@"testParallelCapture"}];
			[self eq:[[funs hx_objectAtIndex:[k * @"2" stringByAppendingString:@"1"]]:k] v2:k pos:@{@"fileName":@"TestLocals.hx", @"lineNumber":@"125", @"className":@"unit.TestLocals", @"methodName":@"testParallelCapture"}];
		}
	}
}
- (void) testPossibleBug{
	
	NSMutableArray *funs = [[NSMutableArray alloc] init];
	{
		int _g = 0;
		while (_g < 5) {
			int i = _g++;
			[funs push:^(int *i1){
				return i1;
			}];
		}
	}
	{
		int _g = 0;
		while (_g < 5) {
			int k = _g++;
			[self eq:[[funs hx_objectAtIndex:k]:55] v2:55 pos:@{@"fileName":@"TestLocals.hx", @"lineNumber":@"134", @"className":@"unit.TestLocals", @"methodName":@"testPossibleBug"}];
		}
	}
}

@end
