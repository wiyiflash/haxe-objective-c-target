//
//  Date
//  Tests
//
//  Source generated by Haxe Objective-C target
//

#import "Date.h"

@implementation NSDate ( Date )

+ (NSDate*) now{
	
	
	NSCalendar *calendar = [NSCalendar currentCalendar];
	
	NSDateComponents *components = [calendar components:((((NSYearCalendarUnit | NSMonthCalendarUnit) | NSDayCalendarUnit) | NSHourCalendarUnit) | NSMinuteCalendarUnit) | NSSecondCalendarUnit fromDate:[NSDate date]];
	return [[NSDate alloc] init:[components year] month:[components month] day:[components day] hour:[components hour] min:[components minute] sec:[components second]];
}
+ (NSDate*) fromTime:(float)t{
	
	
	NSDate *result = [[NSDate alloc] init:0 month:0 day:0 hour:0 min:0 sec:0];
	result._seconds = t * 0.001;
	return result;
}
+ (NSDate*) fromString:(NSMutableString*)s{
	
	switch (s.length){
		case 8:{
			
			
			NSMutableArray *k = [s split:[@":" mutableCopy]];
			
			NSDate *d = [[NSDate alloc] init:0 month:0 day:0 hour:[Std parseInt:((NSMutableArray*)[k hx_objectAtIndex:0])] min:[Std parseInt:((NSMutableArray*)[k hx_objectAtIndex:1])] sec:[Std parseInt:((NSMutableArray*)[k hx_objectAtIndex:2])]];
			return d;;
		}
		break;
		case 10:{
			
			
			NSMutableArray *k = [s split:[@"-" mutableCopy]];
			return [[NSDate alloc] init:[Std parseInt:((NSMutableArray*)[k hx_objectAtIndex:0])] month:[Std parseInt:((NSMutableArray*)[k hx_objectAtIndex:1])] - 1 day:[Std parseInt:((NSMutableArray*)[k hx_objectAtIndex:2])] hour:0 min:0 sec:0];;
		}
		break;
		case 19:{
			
			
			NSMutableArray *k = [s split:[@" " mutableCopy]];
			
			NSMutableArray *y = [((NSMutableArray*)[k hx_objectAtIndex:0]) split:[@"-" mutableCopy]];
			
			NSMutableArray *t = [((NSMutableArray*)[k hx_objectAtIndex:1]) split:[@":" mutableCopy]];
			return [[NSDate alloc] init:[Std parseInt:((NSMutableArray*)[y hx_objectAtIndex:0])] month:[Std parseInt:((NSMutableArray*)[y hx_objectAtIndex:1])] - 1 day:[Std parseInt:((NSMutableArray*)[y hx_objectAtIndex:2])] hour:[Std parseInt:((NSMutableArray*)[t hx_objectAtIndex:0])] min:[Std parseInt:((NSMutableArray*)[t hx_objectAtIndex:1])] sec:[Std parseInt:((NSMutableArray*)[t hx_objectAtIndex:2])]];;
		}
		break;
		default:@throw [[@"Invalid date format : " mutableCopy] stringByAppendingString:s];;break;
	}
	return nil;
}
// Please provide a getterBody for the property: _seconds

// Please provide a getterBody for the property: _calendar

// Please provide a getterBody for the property: _components

- (float) getTime{
	
	return self._seconds * 1000.0;
}
- (int) getHours{
	
	return [self._components hour];
}
- (int) getMinutes{
	
	return [self._components minute];
}
- (int) getSeconds{
	
	return [self._components second];
}
- (int) getFullYear{
	
	return [self._components year];
}
- (int) getMonth{
	
	return [self._components month];
}
- (int) getDate{
	
	return [self._components weekday];
}
- (int) getDay{
	
	return [self._components day];
}
- (NSMutableString*) toString{
	
	return nil;
}
- (id) init:(int)year month:(int)month day:(int)day hour:(int)hour min:(int)min sec:(int)sec{
	
	self = [super init];
	self._calendar = [NSCalendar currentCalendar];
	self._components = [self._calendar components:((((NSYearCalendarUnit | NSMonthCalendarUnit) | NSDayCalendarUnit) | NSHourCalendarUnit) | NSMinuteCalendarUnit) | NSSecondCalendarUnit fromDate:[NSDate date]];
	[self._components setYear:year];
	[self._components setMonth:month];
	[self._components setDay:day];
	[self._components setHour:hour];
	[self._components setMinute:min];
	[self._components setSecond:sec];
	self = [self._calendar dateFromComponents:self._components];
	return self;
}

@end
