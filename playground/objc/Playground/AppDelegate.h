//
//  AppDelegate.h
//  Playground
//
//  Created by Baluta Cristian on 03/01/2013.
//  Copyright (c) 2013 Baluta Cristian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreFoundation/CoreFoundation.h>
#import "haxe/Log.h"
//#import "NSArray+Arr.h"
//#import "Array.h"
#import "RCHTTPRequest.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate, UIWebViewDelegate>{
	id hx_self;
	NSTimer *timer;
}
@property (strong, nonatomic) UIWindow *window;
@property (nonatomic) int length;

- (void) block1;
- (void) block2:(int)i;
- (void) block3:(NSString*)str;

@end


@interface Tests2 : NSObject

@property (nonatomic) int d1;
@property (nonatomic,copy) void(^property_block1)();
@property (nonatomic,copy) void(^property_block2)(int);
@property (nonatomic,copy) void(^property_block3)(NSString*);
@property (nonatomic,copy) NSString*(^property_block4)(NSString*);

- (void) callBlocks;
- (void) redefineThisMethod;
- (id) init;
-(void)ttt;
-(void)ttt2:(NSString*)str;
- (void)login;
-(id)iterator;

@end