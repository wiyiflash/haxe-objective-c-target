//
//  Test
//  Test
//
//  Source generated by Haxe Objective-C target
//

#import "../unit/Test.h"

@implementation Test

static int count;
+ (int) count {
	if (count == nil) count = 0;
	return count;
}
+ (void) setCount:(int)val {
	count = val;
}
static NSMutableString* reportInfos;
+ (NSMutableString*) reportInfos {
	if (reportInfos == nil) reportInfos = nil;
	return reportInfos;
}
+ (void) setReportInfos:(NSMutableString*)val {
	reportInfos = val;
}
static int reportCount;
+ (int) reportCount {
	if (reportCount == nil) reportCount = 0;
	return reportCount;
}
+ (void) setReportCount:(int)val {
	reportCount = val;
}
static int checkCount;
+ (int) checkCount {
	if (checkCount == nil) checkCount = 0;
	return checkCount;
}
+ (void) setCheckCount:(int)val {
	checkCount = val;
}
static NSMutableArray* asyncWaits;
+ (NSMutableArray*) asyncWaits {
	if (asyncWaits == nil) asyncWaits = [[NSMutableArray alloc] init];
	return asyncWaits;
}
+ (void) setAsyncWaits:(NSMutableArray*)val {
	asyncWaits = val;
}
static NSMutableArray* asyncCache;
+ (NSMutableArray*) asyncCache {
	if (asyncCache == nil) asyncCache = [[NSMutableArray alloc] init];
	return asyncCache;
}
+ (void) setAsyncCache:(NSMutableArray*)val {
	asyncCache = val;
}
static int AMAX;
+ (int) AMAX {
	if (AMAX == nil) AMAX = 3;
	return AMAX;
}
+ (void) setAMAX:(int)val {
	AMAX = val;
}
static Timer* timer;
+ (Timer*) timer {
	if (timer == nil) timer = ;
	return timer;
}
+ (void) setTimer:(Timer*)val {
	timer = val;
}
// Defining a dynamic method
+ (void) report:(NSMutableString*)msg pos:(id)pos{
	// Optional arguments
	if (!pos) pos = nil;
	
	if (-TMono- != nil) {
		[msg appendString:[[[NSMutableString stringWithString:@" ("] stringByAppendingString:-TMono-] stringByAppendingString:[NSMutableString stringWithString:@")"]]];
		-TMono- = nil;
	}
	[Log trace:msg infos:pos];
	-TMono-++;
	if (-TMono- == 50) {
		[Log trace:[NSMutableString stringWithString:@"Too many errors"] infos:[NSDictionary dictionaryWithObjectsAndKeys:@"Test.hx",@"fileName", @"154",@"lineNumber", @"unit.Test",@"className", @"report",@"methodName", nil]];
		Test report = ^+ (void) :(NSMutableString*)msg1 pos1:(id)pos1{
			// Optional arguments
			if (!pos1) pos1 = nil;
			
		}
	}
}
@synthesize property_report;

+ (void) checkDone{
	if (-TMono-.length != 0) return;
	if (-TMono-.length == 0) {
		[Test report:[[[NSMutableString stringWithString:@"DONE ["] stringByAppendingString:-TMono-] stringByAppendingString:[NSMutableString stringWithString:@" tests]"]] pos:[NSDictionary dictionaryWithObjectsAndKeys:@"Test.hx",@"fileName", @"163",@"lineNumber", @"unit.Test",@"className", @"checkDone",@"methodName", nil]];
		return;
	}
	[Test resetTimer];
	while (-TMono-.length > 0 && -TMono-.length < -TMono-) [[-TMono-.shift]];
}
+ (void) asyncTimeout{
	if (-TMono-.length == 0) return;
	{
		int _g = 0; 
		NSMutableArray *_g1 = -TMono-;
		while (_g < _g1.length) {
			id pos = [_g1 hx_objectAtIndex:_g];
			++_g;
			[Test report:[NSMutableString stringWithString:@"TIMEOUT"] pos:pos];
		}
	}
	-TMono- = [[NSMutableArray alloc] init];
	[Test checkDone];
}
+ (void) resetTimer{
	if (Test.timer != nil) [Test.timer.stop];
	Test.timer = [[Timer alloc] init:10000];
	Test.timer.run = Test asyncTimeout;
}
+ (void) onError:(id)e msg:(NSMutableString*)msg context:(NSMutableString*)context{
	
	NSMutableString *msg1 = [NSMutableString stringWithString:@"???"];
	
	NSMutableString *stack = [CallStack toString:[CallStack exceptionStack]];
	@try {
		msg1 = [Std string:e];
	}
	@catch (NSException *e1) {
	}
	-TMono- = 0;
	[Test report:[[[[NSMutableString stringWithString:@"ABORTED : "] stringByAppendingString:msg1] stringByAppendingString:[NSMutableString stringWithString:@" in "]] stringByAppendingString:context] pos:[NSDictionary dictionaryWithObjectsAndKeys:@"Test.hx",@"fileName", @"198",@"lineNumber", @"unit.Test",@"className", @"onError",@"methodName", nil]];
	-TMono- = nil;
	[Log trace:[[NSMutableString stringWithString:@"STACK :\n"] stringByAppendingString:stack] infos:[NSDictionary dictionaryWithObjectsAndKeys:@"Test.hx",@"fileName", @"200",@"lineNumber", @"unit.Test",@"className", @"onError",@"methodName", nil]];
}

- (void) eq:(id)v v2:(id)v2 pos:(id)pos{
	// Optional arguments
	if (!pos) pos = nil;
	
	-TMono-++;
	if (v != v2) [Test report:[[[Std string:v] stringByAppendingString:[NSMutableString stringWithString:@" should be "]] stringByAppendingString:[Std string:v2]] pos:pos];
}
- (void) feq:(float)v v2:(float)v2 pos:(id)pos{
	// Optional arguments
	if (!pos) pos = nil;
	
	-TMono-++;
	if (!isfinite(v) || !isfinite(v2)) [self eq:v v2:v2 pos:pos];
	else if (fabsf(v - v2) > 1e-15) [Test report:[[v stringByAppendingString:[NSMutableString stringWithString:@" should be "]] stringByAppendingString:v2] pos:pos];
}
- (void) t:(BOOL)v pos:(id)pos{
	// Optional arguments
	if (!pos) pos = nil;
	
	[self eq:v v2:YES pos:pos];
}
- (void) f:(BOOL)v pos:(id)pos{
	// Optional arguments
	if (!pos) pos = nil;
	
	[self eq:v v2:NO pos:pos];
}
- (void) _assert:(id)pos{
	// Optional arguments
	if (!pos) pos = nil;
	
	[Test report:[NSMutableString stringWithString:@"Assert"] pos:pos];
}
- (void) exc:(SEL)f pos:(id)pos{
	// Optional arguments
	if (!pos) pos = nil;
	
	-TMono-++;
	@try {
		[f];
		[Test report:[NSMutableString stringWithString:@"No exception occured"] pos:pos];
	}
	@catch (NSException *e) {
	}
}
- (void) unspec:(SEL)f pos:(id)pos{
	// Optional arguments
	if (!pos) pos = nil;
	
	-TMono-++;
	@try {
		[f];
	}
	@catch (NSException *e) {
	}
}
- (void) allow:(id)v values:(NSMutableArray*)values pos:(id)pos{
	// Optional arguments
	if (!pos) pos = nil;
	
	-TMono-++;
	{
		int _g = 0;
		while (_g < values.length) {
			id v2 = [values hx_objectAtIndex:_g];
			++_g;
			if (v == v2) return;
		}
	}
	[Test report:[[[Std string:v] stringByAppendingString:[NSMutableString stringWithString:@" not in "]] stringByAppendingString:[Std string:values]] pos:pos];
}
- (void) hf:(Class*)c n:(NSMutableString*)n pos:(id)pos{
	// Optional arguments
	if (!pos) pos = nil;
	
	-TMono-++;
	if (![Lambda has:[Type getInstanceFields:c] elt:n]) [Test report:[[[Type getClassName:c] stringByAppendingString:[NSMutableString stringWithString:@" should have member field "]] stringByAppendingString:n] pos:pos];
}
- (void) nhf:(Class*)c n:(NSMutableString*)n pos:(id)pos{
	// Optional arguments
	if (!pos) pos = nil;
	
	-TMono-++;
	if ([Lambda has:[Type getInstanceFields:c] elt:n]) [Test report:[[[Type getClassName:c] stringByAppendingString:[NSMutableString stringWithString:@" should not have member field "]] stringByAppendingString:n] pos:pos];
}
- (void) hsf:(Class*)c n:(NSMutableString*)n pos:(id)pos{
	// Optional arguments
	if (!pos) pos = nil;
	
	-TMono-++;
	if (![Lambda has:[Type getClassFields:c] elt:n]) [Test report:[[[Type getClassName:c] stringByAppendingString:[NSMutableString stringWithString:@" should have static field "]] stringByAppendingString:n] pos:pos];
}
- (void) nhsf:(Class*)c n:(NSMutableString*)n pos:(id)pos{
	// Optional arguments
	if (!pos) pos = nil;
	
	-TMono-++;
	if ([Lambda has:[Type getClassFields:c] elt:n]) [Test report:[[[Type getClassName:c] stringByAppendingString:[NSMutableString stringWithString:@" should not have static field "]] stringByAppendingString:n] pos:pos];
}
- (void) infos:(NSMutableString*)m{
	-TMono- = m;
}
- (void) async:(SEL)f args:(id)args v:(id)v pos:(id)pos{
	// Optional arguments
	if (!pos) pos = nil;
	
	
	NSMutableArray *pos1 = [[NSMutableArray alloc] initWithObject:pos];
	
	NSMutableArray *v1 = [[NSMutableArray alloc] initWithObject:v];
	if (-TMono-.length >= -TMono-) {
		[-TMono- push:((SEL)($this:(snd ctx.path)) 
		NSMutableArray *f1 = [[NSMutableArray alloc] initWithObject:async:args:v:pos:]; 
		NSMutableArray *f2 = [[NSMutableArray alloc] initWithObject:f]; 
		NSMutableArray *a1 = [[NSMutableArray alloc] initWithObject:args]; 
		NSMutableArray *v2 = [[NSMutableArray alloc] initWithObject:[v1 hx_objectAtIndex:[NSNumber numberWithInt:0]]]; 
		NSMutableArray *a2 = [[NSMutableArray alloc] initWithObject:[pos1 hx_objectAtIndex:[NSNumber numberWithInt:0]]]
		__r__ = ^- (void) {
			{
			[[f1 hx_objectAtIndex:0]:[f2 hx_objectAtIndex:0] args:[a1 hx_objectAtIndex:0] v:[v2 hx_objectAtIndex:0] pos:[a2 hx_objectAtIndex:0]]
			return{
				
				};
			}
			return __r__{
				
				SEL* __r__}
			}(self))];
			return;
		}
		[-TMono- push:[pos1 hx_objectAtIndex:0]];
		[f:args :^- (void) :(id)v2{
			-TMono-++;
			if (![-TMono- remove:[pos1 hx_objectAtIndex:0]]) {
				[Test report:[NSMutableString stringWithString:@"Double async result"] pos:[pos1 hx_objectAtIndex:0]];
				return;
			}
			if ([v1 hx_objectAtIndex:0] != v2) [Test report:[[[Std string:v2] stringByAppendingString:[NSMutableString stringWithString:@" should be "]] stringByAppendingString:[Std string:[v1 hx_objectAtIndex:@"0"]]] pos:[pos1 hx_objectAtIndex:0]];
			[Test checkDone];
		}];
	}
	- (void) asyncExc:(SEL)seterror f:(SEL)f args:(id)args pos:(id)pos{
		// Optional arguments
		if (!pos) pos = nil;
		
		
		NSMutableArray *pos1 = [[NSMutableArray alloc] initWithObject:pos];
		if (-TMono-.length >= -TMono-) {
			[-TMono- push:((SEL)($this:(snd ctx.path)) 
			NSMutableArray *f1 = [[NSMutableArray alloc] initWithObject:asyncExc:f:args:pos:]; 
			NSMutableArray *a1 = [[NSMutableArray alloc] initWithObject:seterror]; 
			NSMutableArray *f2 = [[NSMutableArray alloc] initWithObject:f]; 
			NSMutableArray *a2 = [[NSMutableArray alloc] initWithObject:args]; 
			NSMutableArray *a3 = [[NSMutableArray alloc] initWithObject:[pos1 hx_objectAtIndex:[NSNumber numberWithInt:0]]]
			__r__ = ^- (void) {
				{
				[[f1 hx_objectAtIndex:0]:[a1 hx_objectAtIndex:0] f:[f2 hx_objectAtIndex:0] args:[a2 hx_objectAtIndex:0] pos:[a3 hx_objectAtIndex:0]]
				return{
					
					};
				}
				return __r__{
					
					SEL* __r__}
				}(self))];
				return;
			}
			[-TMono- push:[pos1 hx_objectAtIndex:0]];
			[seterror:^- (void) :(id)e{
				-TMono-++;
				if ([-TMono- remove:[pos1 hx_objectAtIndex:0]]) [Test checkDone];
				else [Test report:[NSMutableString stringWithString:@"Multiple async events"] pos:[pos1 hx_objectAtIndex:0]];
			}];
			[f:args :^- (void) :(id)v{
				-TMono-++;
				if ([-TMono- remove:[pos1 hx_objectAtIndex:0]]) {
					[Test report:[NSMutableString stringWithString:@"No exception occured"] pos:[pos1 hx_objectAtIndex:0]];
					[Test checkDone];
				}
				else [Test report:[NSMutableString stringWithString:@"Multiple async events"] pos:[pos1 hx_objectAtIndex:0]];
			}];
		}
		- (void) log:(id)msg pos:(id)pos{
			// Optional arguments
			if (!pos) pos = nil;
			
			[Log trace:msg infos:pos];
		}
		- (id) init{
			self = [super init];
			return self;
		}

@end
