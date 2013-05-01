//
//  DateTools
//  Tests
//
//  Source generated by Haxe Objective-C target
//

#import "DateTools.h"

@implementation DateTools

+ (NSMutableString*) __format_get:(NSDate*)d e:(NSMutableString*)e{
	return ^(NSMutableString*)switch (e){
		case [@"%" mutableCopy]:{
			__r__ = [@"%" mutableCopy]}break;
		case [@"C" mutableCopy]:{
			__r__ = [StringTools lpad:[Std string:[Std _int:[d getFullYear] / 100]] c:[@"0" mutableCopy] l:2]}break;
		case [@"d" mutableCopy]:{
			__r__ = [StringTools lpad:[Std string:[d getDate]] c:[@"0" mutableCopy] l:2]}break;
		case [@"D" mutableCopy]:{
			__r__ = [DateTools __format:d f:[@"%m/%d/%y" mutableCopy]]}break;
		case [@"e" mutableCopy]:{
			__r__ = [Std string:[d getDate]]}break;
		case [@"H" mutableCopy]:case [@"k" mutableCopy]:{
			__r__ = [StringTools lpad:[Std string:[d getHours]] c:( (e == [@"H" mutableCopy]) ? [@"0" mutableCopy] : [@" " mutableCopy]) l:2]}break;
		case [@"I" mutableCopy]:case [@"l" mutableCopy]:{
			__r__ = ^(NSMutableString*)int hour = [d getHours] % 12
			__r__2 = [StringTools lpad:[Std string:( (hour == 0) ? 12 : hour)] c:( (e == [@"I" mutableCopy]) ? [@"0" mutableCopy] : [@" " mutableCopy]) l:2]
			return __r__2{
				
				NSMutableString* __r__2}
			}()}break;
		case [@"m" mutableCopy]:{
			__r__ = [StringTools lpad:[Std string:[[d getMonth] stringByAppendingString:@"1"]] c:[@"0" mutableCopy] l:2]}break;
		case [@"M" mutableCopy]:{
			__r__ = [StringTools lpad:[Std string:[d getMinutes]] c:[@"0" mutableCopy] l:2]}break;
		case [@"n" mutableCopy]:{
			__r__ = [@"\n" mutableCopy]}break;
		case [@"p" mutableCopy]:{
			__r__ = ( ([d getHours] > 11) ? [@"PM" mutableCopy] : [@"AM" mutableCopy])}break;
		case [@"r" mutableCopy]:{
			__r__ = [DateTools __format:d f:[@"%I:%M:%S %p" mutableCopy]]}break;
		case [@"R" mutableCopy]:{
			__r__ = [DateTools __format:d f:[@"%H:%M" mutableCopy]]}break;
		case [@"s" mutableCopy]:{
			__r__ = [Std string:[Std _int:[d getTime] / 1000]]}break;
		case [@"S" mutableCopy]:{
			__r__ = [StringTools lpad:[Std string:[d getSeconds]] c:[@"0" mutableCopy] l:2]}break;
		case [@"t" mutableCopy]:{
			__r__ = [@"\t" mutableCopy]}break;
		case [@"T" mutableCopy]:{
			__r__ = [DateTools __format:d f:[@"%H:%M:%S" mutableCopy]]}break;
		case [@"u" mutableCopy]:{
			__r__ = ^(NSMutableString*)int t = [d getDay]
			__r__3 = ( (t == 0) ? [@"7" mutableCopy] : [Std string:t])
			return __r__3{
				
				NSMutableString* __r__3}
			}()}break;
		case [@"w" mutableCopy]:{
			__r__ = [Std string:[d getDay]]}break;
		case [@"y" mutableCopy]:{
			__r__ = [StringTools lpad:[Std string:[d getFullYear] % 100] c:[@"0" mutableCopy] l:2]}break;
		case [@"Y" mutableCopy]:{
			__r__ = [Std string:[d getFullYear]]}break;
		default:{
			__r__ = ^(NSMutableString*)@throw [[[@"Date.format %" mutableCopy] stringByAppendingString:e] stringByAppendingString:[@"- not implemented yet." mutableCopy]];
			return __r__4{
				
				NSMutableString* __r__4}
			}()}break;
	}
	return __r__{
		
		NSMutableString* __r__}
	}();
}
+ (NSMutableString*) __format:(NSDate*)d f:(NSMutableString*)f{
	
	StringBuf *r = [[StringBuf alloc] init];
	int p = 0;
	while (YES) {
		int np = [f indexOf:[@"%" mutableCopy] startIndex:p];
		if (np < 0) break;
		{
			int len = np - p;
			r.b += ( (len == nil) ? [f substr:p len:nil] : [f substr:p len:len]);
		}
		r.b += [Std string:[DateTools __format_get:d e:[f substr:[np stringByAppendingString:@"1"] len:1]]];
		p = [np stringByAppendingString:@"2"];
	}
	{
		int len = f.length - p;
		r.b += ( (len == nil) ? [f substr:p len:nil] : [f substr:p len:len]);
	}
	return r.b;
}
+ (NSMutableString*) format:(NSDate*)d f:(NSMutableString*)f{
	return [DateTools __format:d f:f];
}
+ (NSDate*) delta:(NSDate*)d t:(float)t{
	return [NSDatefromTime:[d getTime] + t];
}
static NSMutableArray* DAYS_OF_MONTH;
+ (NSMutableArray*) DAYS_OF_MONTH {
	if (DAYS_OF_MONTH == nil) DAYS_OF_MONTH = [@[@31, @28, @31, @30, @31, @30, @31, @31, @30, @31, @30, @31] mutableCopy];
	return DAYS_OF_MONTH;
}
+ (void) setDAYS_OF_MONTH:(NSMutableArray*)val {
	DAYS_OF_MONTH = val;
}
+ (int) getMonthDays:(NSDate*)d{
	int month = [d getMonth];
	int year = [d getFullYear];
	if (month != 1) return [DAYS_OF_MONTH hx_objectAtIndex:month];
	BOOL isB = year % 4 == 0 && year % 100 != 0 || year % 400 == 0;
	return ( (isB) ? 29 : 28);
}
+ (float) seconds:(float)n{
	return n * 1000.0;
}
+ (float) minutes:(float)n{
	return n * 60.0 * 1000.0;
}
+ (float) hours:(float)n{
	return n * 60.0 * 60.0 * 1000.0;
}
+ (float) days:(float)n{
	return n * 24.0 * 60.0 * 60.0 * 1000.0;
}
+ (id) parse:(float)t{
	float s = t / 1000;
	float m = s / 60;
	float h = m / 60;
	return [@{
		@"ms":[t % @1000 copy],
		@"seconds":[[Std _int:s % @60] copy],
		@"minutes":[[Std _int:m % @60] copy],
		@"hours":[[Std _int:h % @24] copy],
		@"days":[[Std _int:h / @24] copy],
	} mutableCopy];
}
+ (float) make:(id)o{
	return [o[@"ms"] stringByAppendingString:@"1000.0" *  ([o[@"seconds"] stringByAppendingString:@"60.0" *  ([o[@"minutes"] stringByAppendingString:@"60.0" *  ([o[@"hours"] stringByAppendingString:@"24.0" * o[@"days"]])])])];
}

@end
