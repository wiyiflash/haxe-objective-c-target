//
//  Timer
//  Tests
//
//  Source generated by Haxe Objective-C target
//


#import <Foundation/Foundation.h>

#import "../haxe/Timer.h"
#import "../haxe/Log.h"
#import "../Sys.h"

@interface Timer : NSObject

+ (Timer*) delay:(id)f time_ms:(int)time_ms;
+ (id) measure:(id)f pos:(id)pos;
+ (float) stamp;
@property (nonatomic, strong) NSTimer *nstimer;
@property (nonatomic) int _id;
- (void) stop;
// Dynamic method defined with an objc method and a block property
- (void) run;
@property (nonatomic,copy) void(^hx_dyn_run)();
- (void) nsrun:(NSTimer*)aTimer;
- (id) init:(int)time_ms;

@end

