//
//  Input
//  Tests
//
//  Source generated by Haxe Objective-C target
//



#import "Bytes.h"
#import "Array.h"
#import "Error.h"
#import "BytesBuffer.h"
#import "StringBuf.h"
#import "CppInt32__.h"

@interface Input : NSObject

@property (nonatomic, setter=setEndian) BOOL bigEndian;
- (int) readByte;
- (int) readBytes:(Bytes*)s pos:(int)pos len:(int)len;
- (void) close;
- (BOOL) setEndian:(BOOL)b;
- (Bytes*) readAll:(id)bufsize;
- (void) readFullBytes:(Bytes*)s pos:(int)pos len:(int)len;
- (Bytes*) read:(int)nbytes;
- (NSMutableString*) readUntil:(int)end;
- (NSMutableString*) readLine;
- (float) readFloat;
- (float) readDouble;
- (int) readInt8;
- (int) readInt16;
- (int) readUInt16;
- (int) readInt24;
- (int) readUInt24;
- (int) readInt31;
- (int) readUInt30;
- (CppInt32__*) readInt32;
- (NSMutableString*) readString:(int)len;

@end
