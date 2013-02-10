//
//  Test
//  Test
//
//  Source generated by Haxe Objective-C target
//

#import "../unit/Test.h"

@implementation Test

+ (int) count:(int)val {
	static int _val;
	if (val == nil) { if (_val == nil) _val = 0; }
	else { if (_val != nil) _val = val; }
	return _val;
}
+ (NSMutableString*) reportInfos:(NSMutableString*)val {
	static NSMutableString *_val;
	if (val == nil) { if (_val == nil) _val = nil; }
	else { if (_val != nil) _val = val; }
	return _val;
}
+ (int) reportCount:(int)val {
	static int _val;
	if (val == nil) { if (_val == nil) _val = 0; }
	else { if (_val != nil) _val = val; }
	return _val;
}
+ (int) checkCount:(int)val {
	static int _val;
	if (val == nil) { if (_val == nil) _val = 0; }
	else { if (_val != nil) _val = val; }
	return _val;
}
+ (NSMutableArray*) asyncWaits:(NSMutableArray*)val {
	static NSMutableArray *_val;
	if (val == nil) { if (_val == nil) _val = [[NSMutableArray alloc] init]; }
	else { if (_val != nil) _val = val; }
	return _val;
}
+ (NSMutableArray*) asyncCache:(NSMutableArray*)val {
	static NSMutableArray *_val;
	if (val == nil) { if (_val == nil) _val = [[NSMutableArray alloc] init]; }
	else { if (_val != nil) _val = val; }
	return _val;
}
+ (int) AMAX:(int)val {
	static int _val;
	if (val == nil) { if (_val == nil) _val = 3; }
	else { if (_val != nil) _val = val; }
	return _val;
}
+ (Timer*) timer:(Timer*)val {
	static Timer *_val;
	if (val == nil) { if (_val == nil) _val = ; }
	else { if (_val != nil) _val = val; }
	return _val;
}
// Defining a dynamic method
+ (void) report:(NSMutableString*)msg pos:(id)pos{
	// Simulated optional arguments
	if (pos == nil) pos = nil;
	
	if (Test.reportInfos != nil) {
		[msg appendString:[[(NSMutableString*)@" (" stringByAppendingString:Test.reportInfos] stringByAppendingString:(NSMutableString*)@")"]];
		Test.reportInfos = nil;
	}
	[Log trace:msg infos:pos];
	Test.reportCount++;
	if (Test.reportCount == 50) {
		[Log trace:(NSMutableString*)@"Too many errors" infos:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Test.hx",@"153",@"unit.Test",@"report",nil] forKeys:[NSArray arrayWithObjects:@"fileName",@"lineNumber",@"className",@"methodName",nil]]];
		Test.report = ^+ (void) :(NSMutableString*)msg1 pos1:(id)pos1{
			// Simulated optional arguments
			if (pos1 == nil) pos1 = nil;
			
		}
	}
}
@synthesize property_report;

+ (void) checkDone{
	if (Test.asyncWaits.length != 0) return;
	if (Test.asyncCache.length == 0) {
		[Test report:[[(NSMutableString*)@"DONE [" stringByAppendingString:Test count] stringByAppendingString:(NSMutableString*)@" tests]"] pos:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Test.hx",@"161",@"unit.Test",@"checkDone",nil] forKeys:[NSArray arrayWithObjects:@"fileName",@"lineNumber",@"className",@"methodName",nil]]];
		return;
	}
	[Test resetTimer];
	while (Test.asyncCache.length > 0 && Test.asyncWaits.length < Test.AMAX) [[Test.asyncCache shift]];
}
+ (void) asyncTimeout{
	if (Test.asyncWaits.length == 0) return;
	{
		int _g = 0; 
		NSMutableArray *_g1 = (NSMutableArray*)Test.asyncWaits;
		while (_g < _g1.length) {
			id pos = [_g1 objectAtIndex:_g];
			++_g;
			[Test report:(NSMutableString*)@"TIMEOUT" pos:pos];
		}
	}
	Test.asyncWaits = [[NSMutableArray alloc] init];
	[Test checkDone];
}
+ (void) resetTimer{
	if (Test.timer != nil) [Test.timer stop];
	Test.timer = [[Timer alloc] init:10000];
	Test.timer.run = Test.asyncTimeout;
}
+ (void) onError:(id)e msg:(NSMutableString*)msg context:(NSMutableString*)context{
	
	NSMutableString *msg1 = (NSMutableString*)@"???";
	
	NSMutableString *stack = [CallStack toString:[CallStack exceptionStack]];
	@try {
		msg1 = [Std string:e];
	}
	@catch (NSException *e1) {
	}
	Test.reportCount = 0;
	[Test report:[[[(NSMutableString*)@"ABORTED : " stringByAppendingString:msg1] stringByAppendingString:(NSMutableString*)@" in "] stringByAppendingString:context] pos:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Test.hx",@"196",@"unit.Test",@"onError",nil] forKeys:[NSArray arrayWithObjects:@"fileName",@"lineNumber",@"className",@"methodName",nil]]];
	Test.reportInfos = nil;
	[Log trace:[(NSMutableString*)@"STACK :\n" stringByAppendingString:stack] infos:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Test.hx",@"198",@"unit.Test",@"onError",nil] forKeys:[NSArray arrayWithObjects:@"fileName",@"lineNumber",@"className",@"methodName",nil]]];
}

- (void) eq:(id)v v2:(id)v2 pos:(id)pos{
	// Simulated optional arguments
	if (pos == nil) pos = nil;
	
	Test.count++;
	if (v != v2) [Test report:[[[Std string:v] stringByAppendingString:(NSMutableString*)@" should be "] stringByAppendingString:[Std string:v2]] pos:pos];
}
- (void) feq:(float)v v2:(float)v2 pos:(id)pos{
	// Simulated optional arguments
	if (pos == nil) pos = nil;
	
	Test.count++;
	if (!isfinite(v) || !isfinite(v2)) [self eq:v v2:v2 pos:pos];
	else if (fabsf(v - v2) > 1e-15) [Test report:[[v stringByAppendingString:(NSMutableString*)@" should be "] stringByAppendingString:v2] pos:pos];
}
- (void) t:(BOOL)v pos:(id)pos{
	// Simulated optional arguments
	if (pos == nil) pos = nil;
	
	[self eq:v v2:YES pos:pos];
}
- (void) f:(BOOL)v pos:(id)pos{
	// Simulated optional arguments
	if (pos == nil) pos = nil;
	
	[self eq:v v2:NO pos:pos];
}
- (void) assert:(id)pos{
	// Simulated optional arguments
	if (pos == nil) pos = nil;
	
	[Test report:(NSMutableString*)@"Assert" pos:pos];
}
- (void) exc:(SEL)f pos:(id)pos{
	// Simulated optional arguments
	if (pos == nil) pos = nil;
	
	Test.count++;
	@try {
		[f];
		[Test report:(NSMutableString*)@"No exception occured" pos:pos];
	}
	@catch (NSException *e) {
	}
}
- (void) unspec:(SEL)f pos:(id)pos{
	// Simulated optional arguments
	if (pos == nil) pos = nil;
	
	Test.count++;
	@try {
		[f];
	}
	@catch (NSException *e) {
	}
}
- (void) allow:(id)v values:(NSMutableArray*)values pos:(id)pos{
	// Simulated optional arguments
	if (pos == nil) pos = nil;
	
	Test.count++;
	{
		int _g = 0;
		while (_g < values.length) {
			id v2 = [values objectAtIndex:_g];
			++_g;
			if (v == v2) return;
		}
	}
	[Test report:[[[Std string:v] stringByAppendingString:(NSMutableString*)@" not in "] stringByAppendingString:[Std string:values]] pos:pos];
}
- (void) hf:(Class*)c n:(NSMutableString*)n pos:(id)pos{
	// Simulated optional arguments
	if (pos == nil) pos = nil;
	
	Test.count++;
	if (![Lambda has:[Type getInstanceFields:c] elt:n cmp:nil]) [Test report:[[[Type getClassName:c] stringByAppendingString:(NSMutableString*)@" should have member field "] stringByAppendingString:n] pos:pos];
}
- (void) nhf:(Class*)c n:(NSMutableString*)n pos:(id)pos{
	// Simulated optional arguments
	if (pos == nil) pos = nil;
	
	Test.count++;
	if ([Lambda has:[Type getInstanceFields:c] elt:n cmp:nil]) [Test report:[[[Type getClassName:c] stringByAppendingString:(NSMutableString*)@" should not have member field "] stringByAppendingString:n] pos:pos];
}
- (void) hsf:(Class*)c n:(NSMutableString*)n pos:(id)pos{
	// Simulated optional arguments
	if (pos == nil) pos = nil;
	
	Test.count++;
	if (![Lambda has:[Type getClassFields:c] elt:n cmp:nil]) [Test report:[[[Type getClassName:c] stringByAppendingString:(NSMutableString*)@" should have static field "] stringByAppendingString:n] pos:pos];
}
- (void) nhsf:(Class*)c n:(NSMutableString*)n pos:(id)pos{
	// Simulated optional arguments
	if (pos == nil) pos = nil;
	
	Test.count++;
	if ([Lambda has:[Type getClassFields:c] elt:n cmp:nil]) [Test report:[[[Type getClassName:c] stringByAppendingString:(NSMutableString*)@" should not have static field "] stringByAppendingString:n] pos:pos];
}
- (void) infos:(NSMutableString*)m{
	Test.reportInfos = m;
}
- (void) async:(SEL)f args:(id)args v:(id)v pos:(id)pos{
	// Simulated optional arguments
	if (pos == nil) pos = nil;
	
	
	NSMutableArray *pos1 = [[NSMutableArray alloc] initWithObjects:pos, nil];
	
	NSMutableArray *v1 = [[NSMutableArray alloc] initWithObjects:v, nil];
	if (Test.asyncWaits.length >= Test.AMAX) {
		[Test.asyncCache push:((SEL)($this:(snd ctx.path)) 
		NSMutableArray *f1 = [[NSMutableArray alloc] initWithObjects:self.async, nil]; 
		NSMutableArray *f2 = [[NSMutableArray alloc] initWithObjects:f, nil]; 
		NSMutableArray *a1 = [[NSMutableArray alloc] initWithObjects:args, nil]; 
		NSMutableArray *v2 = [[NSMutableArray alloc] initWithObjects:[v1 objectAtIndex:[NSNumber numberWithInt:0]], nil]; 
		NSMutableArray *a2 = [[NSMutableArray alloc] initWithObjects:[pos1 objectAtIndex:[NSNumber numberWithInt:0]], nil]
		__r__ = ^- (void) {
			{
			[[f1 objectAtIndex:0]:[f2 objectAtIndex:0] args:[a1 objectAtIndex:0] v:[v2 objectAtIndex:0] pos:[a2 objectAtIndex:0]]
			return{
				
				};
			}
			return __r__{
				
				SEL* __r__}
			}(self))];
			return;
		}
		[Test.asyncWaits push:[pos1 objectAtIndex:0]];
		[f:args :^- (void) :(id)v2{
			Test count++;
			if (![Test.asyncWaits remove:[pos1 objectAtIndex:0]]) {
				[Test report:(NSMutableString*)@"Double async result" pos:[pos1 objectAtIndex:0]];
				return;
			}
			if ([v1 objectAtIndex:0] != v2) [Test report:[[[Std string:v2] stringByAppendingString:(NSMutableString*)@" should be "] stringByAppendingString:[Std string:[v1 objectAtIndex:@"0"]]] pos:[pos1 objectAtIndex:0]];
			[Test checkDone];
		}];
	}
	- (void) asyncExc:(SEL)seterror f:(SEL)f args:(id)args pos:(id)pos{
		// Simulated optional arguments
		if (pos == nil) pos = nil;
		
		
		NSMutableArray *pos1 = [[NSMutableArray alloc] initWithObjects:pos, nil];
		if (Test.asyncWaits.length >= Test.AMAX) {
			[Test.asyncCache push:((SEL)($this:(snd ctx.path)) 
			NSMutableArray *f1 = [[NSMutableArray alloc] initWithObjects:self.asyncExc, nil]; 
			NSMutableArray *a1 = [[NSMutableArray alloc] initWithObjects:seterror, nil]; 
			NSMutableArray *f2 = [[NSMutableArray alloc] initWithObjects:f, nil]; 
			NSMutableArray *a2 = [[NSMutableArray alloc] initWithObjects:args, nil]; 
			NSMutableArray *a3 = [[NSMutableArray alloc] initWithObjects:[pos1 objectAtIndex:[NSNumber numberWithInt:0]], nil]
			__r__ = ^- (void) {
				{
				[[f1 objectAtIndex:0]:[a1 objectAtIndex:0] f:[f2 objectAtIndex:0] args:[a2 objectAtIndex:0] pos:[a3 objectAtIndex:0]]
				return{
					
					};
				}
				return __r__{
					
					SEL* __r__}
				}(self))];
				return;
			}
			[Test.asyncWaits push:[pos1 objectAtIndex:0]];
			[seterror:^- (void) :(id)e{
				Test count++;
				if ([Test.asyncWaits remove:[pos1 objectAtIndex:0]]) [Test checkDone];
				else [Test report:(NSMutableString*)@"Multiple async events" pos:[pos1 objectAtIndex:0]];
			}];
			[f:args :^- (void) :(id)v{
				Test count++;
				if ([Test.asyncWaits remove:[pos1 objectAtIndex:0]]) {
					[Test report:(NSMutableString*)@"No exception occured" pos:[pos1 objectAtIndex:0]];
					[Test checkDone];
				}
				else [Test report:(NSMutableString*)@"Multiple async events" pos:[pos1 objectAtIndex:0]];
			}];
		}
		- (void) log:(id)msg pos:(id)pos{
			// Simulated optional arguments
			if (pos == nil) pos = nil;
			
			[Log trace:msg infos:pos];
		}
		- (id) init{
			self = [super init];
			return self;
		}

@end
