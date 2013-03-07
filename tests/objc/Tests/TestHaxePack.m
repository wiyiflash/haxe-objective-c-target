//
//  TestHaxePack
//  Tests
//
//  Source generated by Haxe Objective-C target
//

#import "TestHaxePack.h"

@implementation TestHaxePack

- (void) testTimer{
	
	NSMutableArray *_g = [[NSMutableArray alloc] initWithObject:self];
	
	Timer *timer = [[Timer alloc] init:50];
	timer.run = self testTimerLoop;
	[timer stop];
	timer = [Timer delay:self testTimerLoop time_ms:50];
	timer = [Timer delay:^- (void) {
		[[_g objectAtIndex:0] testTimerLoop];
	} time_ms:50];
	[Timer measure:self testTimerLoop pos:[NSDictionary dictionaryWithObjectsAndKeys:@"TestHaxePack.hx",@"fileName", @"22",@"lineNumber", @"TestHaxePack",@"className", @"testTimer",@"methodName", nil]];
	float f = [Timer stamp];
}
- (void) testTimerLoop{
}
- (void) testCrypto{
	
	NSMutableString *str1 = [Md5 encode:[NSMutableString stringWithString:@"Hello world"]];
	
	NSMutableString *str2 = [Sha1 encode:[NSMutableString stringWithString:@"Hello world"]];
}
- (void) testResources{
	
	NSMutableString *str = [Resource getString:[NSMutableString stringWithString:@"welcome"]];
	[Log trace:str infos:[NSDictionary dictionaryWithObjectsAndKeys:@"TestHaxePack.hx",@"fileName", @"39",@"lineNumber", @"TestHaxePack",@"className", @"testResources",@"methodName", nil]];
}
- (void) testCallstack{
	
	NSMutableArray *arr = [CallStack callStack];
}
- (void) testSerialization{
	
	NSMutableString *str = [Serializer run:[NSMutableDictionary dictionaryWithObjectsAndKeys:
	[[NSMutableString stringWithString:@"a"] copy], @"a",
	nil]];
	id obj = [Unserializer run:str];
}
- (id) init{
	self = [super init];
	
	NSMutableString *str = [Json stringify:[NSMutableDictionary dictionaryWithObjectsAndKeys:
	[[NSMutableString stringWithString:@"a"] copy], @"a",
	nil] replacer:nil];
	id obj = [Json parse:str];
	
	Template *t = [[Template alloc] init:str];
	return self;
}

@end
