//
//  AppDelegate.m
//  SpeedTests
//
//  Created by Baluta Cristian on 01/05/2013.
//  Copyright (c) 2013 Baluta Cristian. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (void)dealloc
{
	[_window release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
	
	NSDate *d1 = [NSDate date];
	for (int i=0; i<1000000; i++) {
		NSMutableString *s = [NSMutableString stringWithString:@"def"];
		//NSLog(@"%@", s);
	}
	NSDate *d2 = [NSDate date];
	
	for (int i=0; i<1000000; i++) {
		NSMutableString *s = [@"def" mutableCopy];
		//NSLog(@"%@", s);
	}
	NSDate *d3 = [NSDate date];
	
	for (int i=0; i<1000000; i++) {
		NSMutableString *s = @"def";
		//NSLog(@"%@", s);
	}
	NSDate *d4 = [NSDate date];
	
	NSLog(@"creation of 1000000 mutablestrings in %f    %@ %@", [d2 timeIntervalSinceDate:d1], d1, d2);
	NSLog(@"creation of 1000000 strings with mutableCopy in %f    %@ %@", [d3 timeIntervalSinceDate:d2], d2, d3);
	NSLog(@"creation of 1000000 strings in %f    %@ %@", [d4 timeIntervalSinceDate:d3], d3, d4);
	
	
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
	// Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
	// Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
	// Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
	// If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
	// Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
	// Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
	// Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
