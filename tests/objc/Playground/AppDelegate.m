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
	
	// redefine a method
	Tests2 *test2 = [[Tests2 alloc] init];
	test2.block1 = block_block1;
	test2.block2 = block_block2;
//	test2.block3 = ^(NSString*str){ NSLog(@"block3 called %@", str); [self login]; };
	test2.block4 = ^(NSString*str){ NSLog(@"block4 called %@", str); return @"block 4 called inline"; };
	[test2 callBlocks];
	
	// Redefine a method approach 2
	self_c = self;
//	WebViewDelegate *w = [[WebViewDelegate alloc] init];
//	w.loadFinished = &ttt;
//	w.callString = &ttt2;
//	[w webViewDidFinishLoad:nil];
	
	
	id e = [[NSObject alloc] init];
	
    // set
    //object_setInstanceVariable(e, "dynvar", (__bridge void *)([NSNumber numberWithInt:10908]));
	
    // get
    NSNumber *associatedObject = objc_getAssociatedObject(e, &fooKey);
    NSLog(@"associatedObject: %@", associatedObject);
	
	self.window.backgroundColor = [UIColor grayColor];
	
	NSArray* arr = [NSArray arrayWithObjects:@"a", @"b", @"c", nil];
	id it = [arr iterator];
	BOOL(^hasNext)() = [it objectForKey:@"hasNext"];
	id(^next)() = [it objectForKey:@"next"];
	while ( hasNext() ) {
		id obj = next();
		NSLog(@"print element of array here %@", obj);
	}
	
	NSLog(@"%i", AppDelegate.length);
//	NSLog(@"%i", [AppDelegate length]);
	AppDelegate.length = 6;
	NSLog(@"%i", AppDelegate.length);
	//[AppDelegate setLength:6];
//	NSLog(@"%i", [AppDelegate length]);
	
	NSLog(@"%@", [AppDelegate arr]);
	[AppDelegate setArr: [[NSMutableArray alloc] initWithObjects:[NSMutableString stringWithString:@"game_panda.png"], [NSMutableString stringWithString:@"game_piratePig.png"], nil] ];
	NSLog(@"%@", [AppDelegate arr]);
	
	NSLog(@"-------------");
	int type = roundf(rand() %  (8 - 1));
	int type2 = roundf(rand() %  (8 - 1));
	NSLog(@"%i %i", type, type2);
	
	timer = [NSTimer timerWithTimeInterval:0.2 target:self selector:@selector(loop:) userInfo:nil repeats:YES];
	NSRunLoop *runner = [NSRunLoop currentRunLoop];
	[runner addTimer:timer forMode: NSDefaultRunLoopMode];
	
    return YES;
}
- (void)loop:(NSTimer*)theTimer {
	NSLog(@"fff");
}

void(^block_block1)(void) = ^{ NSLog(@"block_block1 block_block1 block_block1"); };
void(^block_block2)(int i) = ^(int i){ NSLog(@"block_block2 block_block2 block_block2 called %i", i); /*[me login];*/ };
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




- (void) callThis:(SEL)sel {
	[self performSelector:sel];
}
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
@synthesize block1;
@synthesize block2;
@synthesize block3;
@synthesize block4;

- (void) callBlocks{
	NSLog(@"callBlock is calling block1 : %@", block1);
	block1();
	block2(0);
	//block3(@"dgdcgdfgcgcgdfg");
	block4(@"block 4 called");
	
	NSLog(@"%@",[NSThread callStackSymbols]);
}
- (void) redefineThisMethod{
}
- (id) init{
	self = [super init];
	self.d1 = 34;
	
	self.block1 = ^(){ [self _block1]; };
	
	//NSMutableArray *arr = [[NSMutableArray alloc] initWithObjects:self.d1, self.d1, [NSNumber numberWithInt:50], nil];
	return self;
}
-(void)_block1{
	NSLog(@"block1default was called");
}
- makeIdenticalTwin {
	Tests2 *twin = [[Tests2 alloc] init];
	twin->gender = gender;
	twin->appearance = appearance;
	return twin;
}

@end

