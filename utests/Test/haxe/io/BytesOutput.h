//
//  BytesOutput
//  Test
//
//  Source generated by Haxe Objective-C target
//



#import "../../haxe/io/BytesBuffer.h"
#import "../../haxe/io/Bytes.h"
#import "../../Array.h"
#import "../../haxe/io/Output.h"

@interface BytesOutput : Output 

@property (nonatomic, strong) BytesBuffer *b;
@property (nonatomic, getter=get_length) int length;
- (int) get_length;
- (void) writeByte:(int)c;
- (int) writeBytes:(Bytes*)buf pos:(int)pos len:(int)len;
- (Bytes*) getBytes;
- (id) init;

@end

