//
//  main.m
//  app_delegate_class
//
//  Source generated by Haxe Objective-C target
//

#import "Timer.h"

@implementation Timer

+ (Timer*) delay:(Function*)f time_ms:(int)time_ms{
	
	NSMutabeArray *f1 = [[NSMutableArray alloc] initWithObjects:f, nil]];
	
	NSMutabeArray *t = [[NSMutableArray alloc] initWithObjects:[[Timer alloc] new:time_ms], nil]];
	[t objectAtIndex:0].run = ^(void){
		[[t objectAtIndex:0] stop];
		[[f1 objectAtIndex:0]];
	}
	return [t objectAtIndex:0];
}
+ (id) measure:(Function*)f pos:(id)pos{
	float t0 = [Timer stamp];
	id r = [f];
	[Log trace:[[Timer stamp] - t0 stringByAppendingString:@"s"] infos:pos];
	return r;
}
+ (float) stamp{
	return [Sys time];
}
@synthesize nstimer;
@synthesize id;
- (void) stop{
	if (self.id == nil) return;
	[self nstimer invalidate];
	self.nstimer = nil;
	self.id = nil;
}
- (void) run{
}
- (id) new:(int)time_ms{
	self = [super init];
	self.nstimer = [NSTimer timerWithTimeInterval:time_ms target:self selector:@selector(run) userInfo:nil repeats:YES];
	return self;
}

@end
