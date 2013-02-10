//
//  Json
//  Tests
//
//  Source generated by Haxe Objective-C target
//



#import "../String.h"
#import "../haxe/Json.h"
#import "../StringBuf.h"
#import "../Array.h"
#import "../Reflect.h"
#import "../Type.h"
#import "../Std.h"
#import "../Math.h"
#import "../Class.h"
#import "../haxe/ds/StringMap.h"
#import "../EnumValue.h"

@interface Json : NSObject

+ (id) parse:(NSMutableString*)text;
+ (NSMutableString*) stringify:(id)value replacer:(SEL)replacer;
@property (nonatomic, strong) StringBuf *buf;
@property (nonatomic, strong) NSMutableString *str;
@property (nonatomic) int pos;

- (NSMutableString*) toString:(id)v replacer:(SEL)replacer;
- (void) fieldsString:(id)v fields:(NSMutableArray*)fields;
- (void) objString:(id)v;
- (void) toStringRec:(id)k v:(id)v;
- (void) quote:(NSMutableString*)s;
- (id) doParse:(NSMutableString*)str;
- (void) invalidChar;
- (int) nextChar;
- (id) parseRec;
- (NSMutableString*) parseString;
- (void) invalidNumber:(int)start;
- (float) parseNumber:(int)c;
- (id) init;

@end

