//
//  EnumValueMap
//  Tests
//
//  Source generated by Haxe Objective-C target
//

#import "../../haxe/ds/EnumValueMap.h"

@implementation EnumValueMap

- (int) compare:(EnumValue*)k1 k2:(EnumValue*)k2{
	
	int d = [k1 __Index] - [k2 __Index];
	if (d != 0) return d;
	
	NSMutableArray *p1 = [Type enumParameters:k1];
	
	NSMutableArray *p2 = [Type enumParameters:k2];
	if (p1.length == 0 && p2.length == 0) return 0;
	return [self compareArgs:p1 a2:p2];
}
- (int) compareArgs:(NSMutableArray*)a1 a2:(NSMutableArray*)a2{
	
	int ld = a1.length - a2.length;
	if (ld != 0) return ld;
	{
		
		int _g1 = 0; int _g = a1.length;
		while (_g1 < _g) {
			
			int i = _g1++;
			id v1 = ((id)[a1 hx_objectAtIndex:i]); id v2 = ((id)[a2 hx_objectAtIndex:i]);
			int d = ( ([Reflect isEnumValue:v1] && [Reflect isEnumValue:v2]) ? [self compare:v1 k2:v2] : [Reflect compare:v1 b:v2]);
			if (d != 0) return d;
		}
	}
	return 0;
}

@end
