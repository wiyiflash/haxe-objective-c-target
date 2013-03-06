//
//  PiratePig
//  PiratePig
//
//  Source generated by Haxe Objective-C target
//


#import <UIKit/UIKit.h>

#import "ios/ui/UIImageView.h"
#import "PiratePigGame.h"
#import "objc/foundation/NSDictionary.h"
#import "haxe/Log.h"
#import "ios/ui/UIScreen.h"
#import "ios/ui/UIViewAutoresizing.h"
#import "ios/ui/UIColor.h"
#import "ios/ui/UIImage.h"
#import "ios/ui/UIResponder.h"

@interface PiratePig : UIResponder <UIApplicationDelegate>


@property (nonatomic, strong) UIWindow *window;
@property (nonatomic, strong) UIViewController *viewController;
@property (nonatomic, strong) UIView *view;
@property (nonatomic, strong) UIImageView *background;
@property (nonatomic, strong) UIImageView *footer;
@property (nonatomic, strong) PiratePigGame *game;
- (BOOL) application:(UIApplication*)application didFinishLaunchingWithOptions:(NSDictionary*)didFinishLaunchingWithOptions;
- (void) construct;
- (void) initialize;
- (void) applicationDidBecomeActive:(UIApplication*)application;
- (void) applicationWillResignActive:(UIApplication*)application;

@end
