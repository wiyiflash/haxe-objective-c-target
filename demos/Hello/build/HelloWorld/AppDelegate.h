//
//  AppDelegate
//  HelloWorld
//
//  Source generated by Haxe Objective-C target
//


#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

#import "CustomMapView.h"
#import "objc/foundation/NSDictionary.h"
#import "ios/ui/UIScreen.h"
#import "ios/ui/UIViewAutoresizing.h"
#import "ios/ui/UIColor.h"
#import "ios/ui/NSTextAlignment.h"
#import "ios/ui/UIFont.h"
#import "objc/graphics/CGGeometry.h"
#import "ios/ui/UIControlState.h"
#import "haxe/Log.h"
#import "ios/ui/UIResponder.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (nonatomic, strong) UIWindow *window;
@property (nonatomic, strong) UIViewController *viewController;
@property (nonatomic, strong) UIView *view;
@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) CustomMapView *map;
@property (nonatomic, strong) UIButton *but;
- (BOOL) application:(UIApplication*)application didFinishLaunchingWithOptions:(NSDictionary*)didFinishLaunchingWithOptions;
- (void) locateLondon;
- (void) applicationDidBecomeActive:(UIApplication*)application;
- (void) applicationWillResignActive:(UIApplication*)application;

@end
