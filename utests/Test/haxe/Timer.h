//
//  Timer
//  Test
//
//  Source generated by Haxe Objective-C target
//


#import <Foundation/Foundation.h>

#import "../haxe/Log.h"

@interface Timer : NSObject

@property (nonatomic, strong) NSTimer *nstimer;
@property (nonatomic) int _id;
- (void) stop;
// Dynamic method defined with an objc method and a block property
- (void) run;
@property (nonatomic,copy) void(^hx_dyn_run)();
- (void) nsrun:(NSTimer*)aTimer;
- (id) init:(int)time_ms;

@end

