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
	
	NSDateComponents *components = [calendar components:7 fromDate:[NSDate date]];
	return [[NSDate alloc] init:[components year] month:[components month] day:[components day] hour:[components hour] min:[components minute] sec:[components second]];
}
+ (NSDate*) fromTime:(float)t{
	
	NSDate *result = [[NSDate alloc] init:0 month:0 day:0 hour:0 min:0 sec:0];
	result. _seconds = t * 0.001;
	return result;
}
+ (NSDate*) fromString:(NSMutableString*)s{
	switch (s.length){
		case 8:{
			{
				
				NSMutableArray *k = [s  componentsSeparatedByString:@":"];
				
				NSDate *d = [[NSDate alloc] init:0 month:0 day:0 hour:[Std parseInt:[k objectAtIndex:0]] min:[Std parseInt:[k objectAtIndex:1]] sec:[Std parseInt:[k objectAtIndex:2]]];
				return d;
			}}break;
		case 10:{
			{
				
				NSMutableArray *k = [s  componentsSeparatedByString:@"-"];
				return [[NSDate alloc] init:[Std parseInt:[k objectAtIndex:0]] month:[Std parseInt:[k objectAtIndex:1]] - 1 day:[Std parseInt:[k objectAtIndex:2]] hour:0 min:0 sec:0];
			}}break;
		case 19:{
			{
				
				NSMutableArray *k = [s  componentsSeparatedByString:@" "];
				
				NSMutableArray *y = [[k objectAtIndex:0]  componentsSeparatedByString:@"-"];
				
				NSMutableArray *t = [[k objectAtIndex:1]  componentsSeparatedByString:@":"];
				return [[NSDate alloc] init:[Std parseInt:[y objectAtIndex:0]] month:[Std parseInt:[y objectAtIndex:1]] - 1 day:[Std parseInt:[y objectAtIndex:2]] hour:[Std parseInt:[t objectAtIndex:0]] min:[Std parseInt:[t objectAtIndex:1]] sec:[Std parseInt:[t objectAtIndex:2]]];
			}}break;
		default:{
			@throw [@"Invalid date format : " stringByAppendingString:s];}break;
	}
	return nil;
}
// Getters/setters for property _seconds
static float _seconds__;
- (float) _seconds{
	return _seconds__;
}
- (void) set_seconds:(float)val{
	_seconds__ = val;
}
// Getters/setters for property _calendar
static NSCalendar* _calendar__;
- (NSCalendar*) _calendar{
	return _calendar__;
}
- (void) set_calendar:(NSCalendar*)val{
	_calendar__ = val;
}
// Getters/setters for property _components
static NSDateComponents* _components__;
- (NSDateComponents*) _components{
	return _components__;
}
- (void) set_components:(NSDateComponents*)val{
	_components__ = val;
}
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
	self._components = [self._calendar components:7 fromDate:[NSDate date]];
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
