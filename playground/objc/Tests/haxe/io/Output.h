//
//  Output
//  Tests
//
//  Source generated by Haxe Objective-C target
//



#import "../../Math.h"
#import "../../haxe/io/Bytes.h"
#import "../../Array.h"
#import "../../haxe/io/Input.h"
#import "../../String.h"

@interface Output : NSObject

+ (float) LN2;
+ (void) setLN2:(float)val;
@property (nonatomic, setter=set_bigEndian) BOOL bigEndian;
- (void) writeByte:(int)c;
- (int) writeBytes:(Bytes*)s pos:(int)pos len:(int)len;
- (void) flush;
- (void) close;
- (BOOL) set_bigEndian:(BOOL)b;
- (void) write:(Bytes*)s;
- (void) writeFullBytes:(Bytes*)s pos:(int)pos len:(int)len;
- (void) writeFloat:(float)x;
- (void) writeDouble:(float)x;
- (void) writeInt8:(int)x;
- (void) writeInt16:(int)x;
- (void) writeUInt16:(int)x;
- (void) writeInt24:(int)x;
- (void) writeUInt24:(int)x;
- (void) writeInt32:(int)x;
- (void) prepare:(int)nbytes;
- (void) writeInput:(Input*)i bufsize:(int)bufsize;
- (void) writeString:(NSMutableString*)s;

@end

