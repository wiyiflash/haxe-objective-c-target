//
//  Date
//  Test
//
//  Source generated by Haxe Objective-C target
//


#import <Foundation/Foundation.h>

#import "String.h"
#import "Array.h"
#import "Std.h"

@interface NSDate ( Date )

+ (NSDate*) now;
+ (NSDate*) fromString:(NSMutableString*)s;
@property (nonatomic, strong) NSCalendar *_calendar;
@property (nonatomic) id _components;
- (int) getHours;
- (int) getMinutes;
- (int) getSeconds;
- (int) getFullYear;
- (int) getMonth;
- (int) getDate;
- (int) getDay;
- (NSMutableString*) toString;
- (id) init:(int)year month:(int)month day:(int)day hour:(int)hour min:(int)min sec:(int)sec;

@end

