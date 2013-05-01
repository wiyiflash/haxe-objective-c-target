//
//  WeakMap
//  Tests
//
//  Source generated by Haxe Objective-C target
//



#import "../../String.h"

@interface WeakMap : NSObject<IMap>

- (void) set:(id)_tmp_key _tmp_value:(id)_tmp_value;
- (id) get:(id)_tmp_key;
- (BOOL) exists:(id)_tmp_key;
- (BOOL) remove:(id)_tmp_key;
- (id) keys;
- (id) iterator;
- (NSMutableString*) toString;
- (id) init;

@end
