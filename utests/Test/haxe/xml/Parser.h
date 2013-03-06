//
//  Parser
//  Test
//
//  Source generated by Haxe Objective-C target
//



#import "../../haxe/ds/StringMap.h"
#import "../../String.h"
#import "../../Xml.h"
#import "../../haxe/xml/Parser.h"
#import "../../StringBuf.h"
#import "../../Std.h"

@interface Parser : HXObject

+ (StringMap*) escapes:(StringMap*)val;
+ (Xml*) parse:(NSMutableString*)str;
+ (int) doParse:(NSMutableString*)str p:(int)p parent:(Xml*)parent;

@end
