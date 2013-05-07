//
//  Test
//  Test
//
//  Source generated by Haxe Objective-C target
//



#import "../String.h"
#import "../Array.h"
#import "../haxe/Timer.h"
#import "../haxe/Log.h"
#import "../unit/Test.h"
#import "../haxe/CallStack.h"
#import "../Std.h"
#import "../Math.h"
#import "../Class.h"
#import "../Lambda.h"
#import "../Type.h"

@interface Test : NSObject

+ (int) count;
+ (void) setCount:(int)val;
+ (NSMutableString*) reportInfos;
+ (void) setReportInfos:(NSMutableString*)val;
+ (int) reportCount;
+ (void) setReportCount:(int)val;
+ (int) checkCount;
+ (void) setCheckCount:(int)val;
+ (NSMutableArray*) asyncWaits;
+ (void) setAsyncWaits:(NSMutableArray*)val;
+ (NSMutableArray*) asyncCache;
+ (void) setAsyncCache:(NSMutableArray*)val;
+ (int) AMAX;
+ (void) setAMAX:(int)val;
+ (Timer*) timer;
+ (void) setTimer:(Timer*)val;
// Defining a dynamic method
+ (void) report:(NSMutableString*)msg pos:(id)pos;
@property (nonatomic,copy) void(^property_report);
+ (void) checkDone;
+ (void) asyncTimeout;
+ (void) resetTimer;
+ (void) onError:(id)e msg:(NSMutableString*)msg context:(NSMutableString*)context;

- (void) eq:(id)v v2:(id)v2 pos:(id)pos;
- (void) feq:(float)v v2:(float)v2 pos:(id)pos;
- (void) t:(BOOL)v pos:(id)pos;
- (void) f:(BOOL)v pos:(id)pos;
- (void) _assert:(id)pos;
- (void) exc:(id)f pos:(id)pos;
- (void) unspec:(id)f pos:(id)pos;
- (void) allow:(id)v values:(NSMutableArray*)values pos:(id)pos;
- (void) hf:(Class*)c n:(NSMutableString*)n pos:(id)pos;
- (void) nhf:(Class*)c n:(NSMutableString*)n pos:(id)pos;
- (void) hsf:(Class*)c n:(NSMutableString*)n pos:(id)pos;
- (void) nhsf:(Class*)c n:(NSMutableString*)n pos:(id)pos;
- (void) infos:(NSMutableString*)m;
- (void) async:(id)f args:(id)args v:(id)v pos:(id)pos;
- (void) asyncExc:(id)seterror f:(id)f args:(id)args pos:(id)pos;
- (void) log:(id)msg pos:(id)pos;
- (id) init;

@end

