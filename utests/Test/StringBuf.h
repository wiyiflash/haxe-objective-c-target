//
//  StringBuf
//  Test
//
//  Source generated by Haxe Objective-C target
//



#import "String.h"
#import "Std.h"

@interface StringBuf : NSObject

@property (nonatomic, strong) NSMutableString *b;
- (void) add:(id)x;
- (void) addChar:(int)c;
- (void) addSub:(NSMutableString*)s pos:(int)pos len:(int)len;
- (NSMutableString*) toString;
- (id) init;

@end

