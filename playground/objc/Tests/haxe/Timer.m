//
//  Timer
//  Tests
//
//  Source generated by Haxe Objective-C target
//

#import "../haxe/Timer.h"

@implementation Timer

+ (Timer*) delay:(id)f time_ms:(int)time_ms{
	
	
	Timer *t = [[Timer alloc] init:time_ms];
	t.hx_dyn_run = ^(){
		
		[t stop];
		[f];
	}
	return t;
}
+ (id) measure:(id)f pos:(id)pos{
	
	// Optional arguments
	if (!pos) pos = nil;
	
	float t0 = [Timer stamp];
	id r = [f];
	[Log trace:[[Timer stamp] - t0 stringByAppendingString:[@"s" mutableCopy]] infos:pos];
	return r;
}
+ (float) stamp{
	
	return [Sys time];
}
@synthesize nstimer;
@synthesize _id;
- (void) stop{
	
	if (self._id == nil) return;
	[self.nstimer invalidate];
	self.nstimer = nil;
	self._id = nil;
}
// Dynamic method defined with an objc method and a block property
- (void) run{
	if ( hx_dyn_run ) { hx_dyn_run(); return; }
	[Log trace:[@"run" mutableCopy] infos:@{@"fileName":@"Timer.hx", @"lineNumber":@"112", @"className":@"haxe.Timer", @"methodName":@"run"}];
}
@synthesize hx_dyn_run;

- (void) nsrun:(NSTimer*)aTimer{
	
	[self run];
}
- (id) init:(int)time_ms{
	
	self = [super init];
	self.nstimer = [NSTimer timerWithTimeInterval:time_ms * 1000 target:self selector:@selector(nsrun:) userInfo:nil repeats:YES];
	
	NSRunLoop *runner = [NSRunLoop currentRunLoop];
	[runner addTimer:self.nstimer forMode:NSDefaultRunLoopMode];
	return self;
}

@end
