//
//  Meta
//  Test
//
//  Source generated by Haxe Objective-C target
//

#import "../../haxe/rtti/Meta.h"

@implementation Meta

+ (id) getType:(id)t{
	id meta = t __meta__;
	return ( (meta == nil || meta obj == nil) ? struct {
	
	} structName : meta obj);
}
+ (id) getStatics:(id)t{
	id meta = t __meta__;
	return ( (meta == nil || meta statics == nil) ? struct {
	
	} structName : meta statics);
}
+ (id) getFields:(id)t{
	id meta = t __meta__;
	return ( (meta == nil || meta fields == nil) ? struct {
	
	} structName : meta fields);
}

@end
