#import "Date.h"

@implementation Date

+ (NSDate*) now{
	
	NSCalendar *calendar = [NSCalendar currentCalendar];
	
	NSDateComponents *components = [calendar components:7 fromDate:[NSDate date]];
	return [[NSDate alloc] new:[components year],[components month],[components day],[components hour],[components minute],[components second]];
}
+ (NSDate*) fromTime:(float)t{
	
	NSDate *result = [[NSDate alloc] new:0,0,0,0,0,0];
	result_seconds = t * 0.001;
	return result;
}
+ (NSDate*) fromString:(NSMutableString*)s{
	switch (slength){
		case 8:{
			{
				
				NSMutabeArray *k = [s componentsSeparatedByString:@":"];
				
				NSDate *d = [[NSDate alloc] new:0,0,0,[Std parseInt:[k objectAtIndex:0]],[Std parseInt:[k objectAtIndex:1]],[Std parseInt:[k objectAtIndex:2]]];
				return d;
			}}break;
		case 10:{
			{
				
				NSMutabeArray *k = [s componentsSeparatedByString:@"-"];
				return [[NSDate alloc] new:[Std parseInt:[k objectAtIndex:0]],[Std parseInt:[k objectAtIndex:1]] - 1,[Std parseInt:[k objectAtIndex:2]],0,0,0];
			}}break;
		case 19:{
			{
				
				NSMutabeArray *k = [s componentsSeparatedByString:@" "];
				
				NSMutabeArray *y = [[k objectAtIndex:0] componentsSeparatedByString:@"-"];
				
				NSMutabeArray *t = [[k objectAtIndex:1] componentsSeparatedByString:@":"];
				return [[NSDate alloc] new:[Std parseInt:[y objectAtIndex:0]],[Std parseInt:[y objectAtIndex:1]] - 1,[Std parseInt:[y objectAtIndex:2]],[Std parseInt:[t objectAtIndex:0]],[Std parseInt:[t objectAtIndex:1]],[Std parseInt:[t objectAtIndex:2]]];
			}}break;
		default:{
			throw [@"Invalid date format : " stringByAppendingString:s]}break
	}
	return nil;
}
@synthesize _seconds;
@synthesize _calendar;
@synthesize _components;
- (float) getTime{
	return self_seconds * 1000.0;
}
- (int) getHours{
	return [self_components.hour];
}
- (int) getMinutes{
	return [self_components.minute];
}
- (int) getSeconds{
	return [self_components.second];
}
- (int) getFullYear{
	return [self_components.year];
}
- (int) getMonth{
	return [self_components.month];
}
- (int) getDate{
	return [self_components.weekday];
}
- (int) getDay{
	return [self_components.day];
}
- (NSMutableString*) toString{
	return nil;
}
- (id) new:(int)year month:(int)month day:(int)day hour:(int)hour min:(int)min sec:(int)sec{
	self = [super init];
	self_calendar = [NSCalendar.currentCalendar];
	self_components = [self_calendar.components:7 fromDate:[NSDate date]];
	[self_components.setYear:year];
	[self_components.setMonth:month];
	[self_components.setDay:day];
	[self_components.setHour:hour];
	[self_components.setMinute:min];
	[self_components.setSecond:sec];
	self = _calendar.dateFromComponents ( _components );
	return self;
}

@end
