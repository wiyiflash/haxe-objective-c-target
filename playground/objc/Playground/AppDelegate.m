//
//  AppDelegate.m
//  Playground
//
//  Created by Baluta Cristian on 03/01/2013.
//  Copyright (c) 2013 Baluta Cristian. All rights reserved.
//
typedef void (*FunctionType)();
typedef void (*FunctionType2)(const char);
typedef void (*FunctionType3)(int);

@interface WebViewDelegate : NSObject <UIWebViewDelegate>

@property (nonatomic) FunctionType loadFinished;
@property (nonatomic) FunctionType2 callString;
@property (nonatomic) FunctionType3 callInt;

@end


@implementation WebViewDelegate
@synthesize loadFinished;

- (void)webViewDidFinishLoad:(UIWebView *)webView {
	//NSLog(@"load complete at url %@", webView.request.URL);
	loadFinished();
	//callString("Http://imagin.ro");
	//callInt(0);
}

@end



#import "AppDelegate.h"
#import <objc/runtime.h>

@implementation AppDelegate
id me;
char fooKey;

int main(int argc, char *argv[])
{
	srand(time(NULL));
	@autoreleasepool {
	    return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
	}
}



- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
	
	NSMutableString *ms = [NSMutableString stringWithString:@"abc"];
	NSLog(@"%@", ms);
	[ms appendString:@"def"];	NSLog(@"%@", ms);
	//[self callThis:@selector(func)];
	//[self callBlock:^(){ NSLog(@"Block was called"); }];
	
	me = self;
	hx_self = self;
	
	// redefine a method, approach 1
	Tests2 *test2 = [[Tests2 alloc] init];
	test2.property_block1 = ^(){ [self block1]; };// property_block1_custom;
	test2.property_block2 = property_block2_custom;
	test2.property_block3 = ^(NSString*str){ NSLog(@"inlined block3 called with: %@", str); };
	test2.property_block3 = ^(NSString*str){ [self block3:str]; };
	test2.property_block4 = ^(NSString*str){ NSLog(@"inlined block4 called with: %@", str); return @"block 4 called inline"; };
	[test2 callBlocks];
	
	// Redefine a method, approach 2
//	WebViewDelegate *w = [[WebViewDelegate alloc] init];
//	w.loadFinished = &ttt;
//	w.callString = &ttt2;
//	[w webViewDidFinishLoad:nil];
	
	
	id e = [[NSObject alloc] init];
	
    // set
    //object_setInstanceVariable(e, "dynvar", (__bridge void *)([NSNumber numberWithInt:10908]));
	
    // get
	fooKey = "init";
    NSNumber *associatedObject = objc_getAssociatedObject(test2, &fooKey);
    NSLog(@"associatedObject: %@", associatedObject);
	
	self.window.backgroundColor = [UIColor grayColor];
	
//	NSMutableArray* arr = [[NSMutableArray alloc] initWithObjects:@"a", @"b", @"c", nil];
//	NSMutableArray* arr2 = [[NSMutableArray alloc] initWithObjects:@"d", @"e", @"f", nil];
//	NSMutableArray* arr3 = [arr concat:arr2];
//	id it = [arr iterator];
//	BOOL(^hasNext)() = [it objectForKey:@"hasNext"];
//	id(^next)() = [it objectForKey:@"next"];
//	while ( hasNext() ) {
//		id obj = next();
//		NSLog(@"print element of array here %@", obj);
//	}
//	
//	NSLog(@"arr %@", arr);
//	NSLog(@"arr2 %@", arr2);
//	NSLog(@"arr3 %@", arr3);
//	[arr pop];
//	NSLog(@"arr after pop %@", arr);
//	NSLog(@"arr3 after pop %@", arr3);
	
//	NSLog(@"%@", [arr safeObjectAtIndex:2]);
//	NSLog(@"%i %i", arr.length, [arr count]);
//	NSLog(@"%@", [arr safeObjectAtIndex:5]);
//	NSLog(@"%i %i", arr.length, [arr count]);
//	
//	NSLog(@"%i %i", arr.length, [arr count]);
//	NSLog(@"arr3 %i %i", arr3.length, [arr3 count]);
//	[arr insert:3 x:@"VVVV"];
//	[arr safeReplaceObjectAtIndex:1 withObject:[NSNull null]];
//	[arr push:@"asdsafdsf"];
//	NSLog(@"arr after pop %@", arr);
	
//	RCHttpRequest *req = [[RCHttpRequest alloc] init];
//	[req put];
	
	
	//int i = 0;
	//BOOL isRunning = YES;
//	while (isRunning) {
//		while(CFRunLoopRunInMode(kCFRunLoopDefaultMode, 0, TRUE) == kCFRunLoopRunHandledSource);
//		
//		//usleep(250000); // Sleep for a quarter of a second (250,000 microseconds) so that the framerate is 4 fps.
//		usleep(16666);
//		NSLog(@"looping %i", i);
//		i++;
//		
//		while(CFRunLoopRunInMode(kCFRunLoopDefaultMode, 0, TRUE) == kCFRunLoopRunHandledSource);
//	}
	
	NSString *res = @"[]";
	[res cStringUsingEncoding:NSUTF8StringEncoding];
	
//	while(isRunning /*&& !sgTerminated*/)
//	{
//		double delta = 0.03-0.0166666;
//		if (delta<0) delta = 0;
//		if (CFRunLoopRunInMode(kCFRunLoopDefaultMode,delta,TRUE) != kCFRunLoopRunHandledSource)
//		{
//			NSLog(@"looping %i", i);
//			i++;
//		}
//	}
	
	
//	CFRunLoopTimerRef timer_ = CFRunLoopTimerCreate (
//								kCFAllocatorDefault,
//								CFAbsoluteTimeGetCurrent(),
//								0.0166666,
//								0,
//								0,
//								tick,
//								NULL);
//	CFRunLoopAddTimer (CFRunLoopGetCurrent(), timer_, kCFRunLoopCommonModes);
//	CFRunLoopRun();
	
	
    return YES;
}
int i = 0;
void tick(CFRunLoopTimerRef timer) {
	i++;
    NSLog(@"looping %i", i);
}
//- (void)loop:(NSTimer*)theTimer {
//	NSLog(@"fff");
//}

- (void) block1 {
	 NSLog(@"custom block 1 called");
}
void(^property_block1_custom)(void) = ^(){ [me block1]; };
- (void) block2:(int)i {
	NSLog(@"custom block 2 called with i = %i", i);
}
void(^property_block2_custom)(int i) = ^(int i){ [me block2:i]; };
- (void) block3:(NSString*)str {
	NSLog(@"custom block 3 called with str = %@", str);
}
//void(^block_block22)(int i, id self) = ^(int i, id self){ NSLog(@"block_block2 block_block2 block_block2 called %i", i); [self login]; };



//void ttt () {
//	NSLog(@"c method called");
//	[self_c ttt];
//}
//-(void)ttt{
//	NSLog(@"objc method called");
//}
//void ttt2 (const char str) {
//	NSLog(@"c method 2 called");
//	[self_c ttt2:[[NSString alloc] initWithUTF8String:&str]];
//}
//// Very important, this function must be defined in the interface otherwise the call from C function will not work
//-(void)ttt2:(NSString*)str{
//	NSLog(@"objc method 2 called : %@", str);
//}




//- (void) callThis:(SEL)sel {
//	[self performSelector:sel];
//}
//- (void) callBlock:(void)(^sel) {
//	//[self performSelector:sel];
//	sel();
//}
- (void) func {
	NSLog(@"block1 was called");
}

static int NUM_COLUMNS;
+ (int) NUM_COLUMNS:(int)val {
	static int _val;
	if (val == nil) { if (_val == nil) _val = 8; }
	else { if (_val != nil) _val = val; }
	return _val;
}

static int length;
+ (int) length{
	// You get a warning but is working
	if (length == nil) length = 8;
	return length;
}
+ (void) setLength:(int)val{
	length = val;
}

static NSMutableArray *arr__;
+ (NSMutableArray*) arr{
	if (arr__ == nil) arr__ = [[NSMutableArray alloc] initWithObjects:[NSMutableString stringWithString:@"game_panda.png"], [NSMutableString stringWithString:@"game_piratePig.png"], nil];
	return arr__;
}
+ (void) setArr:(NSMutableArray*)val{
	arr__ = val;
}


@end



@implementation Tests2 {
	int gender;
	struct features *appearance;
@private
	int age;
	char *evaluation;
@protected
	id job;
	float wage;
@public
	id boss;
}

@synthesize d1;
@synthesize property_block1;
@synthesize property_block2;
@synthesize property_block3;
@synthesize property_block4;

- (void) callBlocks {
	NSLog(@"callBlocks and wait for them to be dispatched to super class : %@", property_block1);
	[self block1];
	property_block2(0);
	property_block3(@"block 3 argument");
	property_block4(@"block 4 argument");
	
	//NSLog(@"%@",[NSThread callStackSymbols]);
}
- (void) block1 {
	if(property_block1) {property_block1(); return;}
	NSLog(@"block1 content if the method is not redefined");
}

- (void) redefineThisMethod{
}
- (id) init{
	self = [super init];
	self.d1 = 34;
	
	// inlined block
	//self.property_block1 = ^(){ [self block1]; };
	
	//NSMutableArray *arr = [[NSMutableArray alloc] initWithObjects:self.d1, self.d1, [NSNumber numberWithInt:50], nil];
	return self;
}

- makeIdenticalTwin {
	Tests2 *twin = [[Tests2 alloc] init];
	twin->gender = gender;
	twin->appearance = appearance;
	return twin;
}

@end

