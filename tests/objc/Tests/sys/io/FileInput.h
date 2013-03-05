//
//  FileInput
//  Tests
//
//  Source generated by Haxe Objective-C target
//




@interface FileInput : Input 

@property (nonatomic) id __f;
- (int) readByte;
- (int) readBytes:(Bytes*)s p:(int)p l:(int)l;
- (void) close;
- (void) seek:(int)p pos:(FileSeek*)pos;
- (int) tell;
- (BOOL) eof;
- (id) init:(id)f;

@end

