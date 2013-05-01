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
	t.run = ^void(^property_)(){
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
	if (self.id == nil) return;
	[self.nstimer invalidate];
	self.nstimer = nil;
	self.id = nil;
}
// Defining a dynamic method
- (void) run{
	[Log trace:[@"run" mutableCopy] infos:@{@"fileName":@"Timer.hx", @"lineNumber":@"112", @"className":@"haxe.Timer", @"methodName":@"run"}];
}
@synthesize property_run;

- (void) nsrun:(NSTimer*)aTimer{
	[self run];
}
- (id) init:(int)time_ms{
	self = [super init];
	self.nstimer = [NSTimer timerWithTimeInterval:time_ms * 1000 target:self selector:@selector(-FClosure-nsrun:) userInfo:nil repeats:YES];
	
	NSRunLoop *runner = [NSRunLoop currentRunLoop];
	[runner addTimer:self.nstimer forMode: NSDefaultRunLoopMode];
	return self;
}

@end
