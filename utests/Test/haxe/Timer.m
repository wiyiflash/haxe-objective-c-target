//
//  Timer
//  Test
//
//  Source generated by Haxe Objective-C target
//

#import "../haxe/Timer.h"

@implementation Timer

@synthesize nstimer;
@synthesize _id;
- (void) stop{
	if (self.id == nil) return;
	[self.nstimer invalidate];
	self.nstimer = nil;
	self.id = nil;
}
// Defining a dynamic method
- (void) run{
	[Log trace:[NSMutableString stringWithString:@"run"] infos:[NSDictionary dictionaryWithObjectsAndKeys:@"Timer.hx",@"fileName", @"112",@"lineNumber", @"haxe.Timer",@"className", @"run",@"methodName", nil]];
}
@synthesize property_run;

- (void) nsrun:(NSTimer*)aTimer{
	[self run];
}
- (id) init:(int)time_ms{
	self = [super init];
	self.nstimer = [NSTimer timerWithTimeInterval:time_ms * 1000 target:self selector:@selector(nsrun:) userInfo:nil repeats:YES];
	
	NSRunLoop *runner = [NSRunLoop currentRunLoop];
	[runner addTimer:self.nstimer forMode: NSDefaultRunLoopMode];
	return self;
}

@end
