//
//  Map
//  Tests
//
//  Source generated by Haxe Objective-C target
//


#import <Foundation/Foundation.h>

#import "Map.h"
#import "String.h"
#import "haxe/ds/EnumValueMap.h"
#import "haxe/ds/ObjectMap.h"

@interface Map_Impl_ : NSObject


+ (void) set:(IMap*)this1 key:(id)key value:(id)value;
+ (id) get:(IMap*)this1 key:(id)key;
+ (BOOL) exists:(IMap*)this1 key:(id)key;
+ (BOOL) remove:(IMap*)this1 key:(id)key;
+ (id) keys:(IMap*)this1;
+ (id) iterator:(IMap*)this1;
+ (NSMutableString*) toString:(IMap*)this1;
+ (id) arrayWrite:(IMap*)this1 k:(id)k v:(id)v;
+ (StringMap*) toStringMap:(IMap*)t;
+ (IntMap*) toIntMap:(IMap*)t;
+ (EnumValueMap*) toEnumValueMapMap:(IMap*)t;
+ (ObjectMap*) toObjectMap:(IMap*)t;
+ (Map*) fromStringMap:(StringMap*)map;
+ (Map*) fromIntMap:(IntMap*)map;
+ (Map*) fromObjectMap:(ObjectMap*)map;

@end




@protocol IMap<NSObject>









@end

