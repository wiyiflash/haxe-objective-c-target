//
//  Array
//  PiratePig
//
//  Source generated by Haxe Objective-C target
//



#import "Array.h"

@interface NSMutableArray ( Array )

@property (nonatomic) int length;
- (NSMutableArray*) concat:(NSMutableArray*)a;
- (NSMutableArray*) copy;
- (void) insert:(int)pos x:(id)x;
- (NSMutableString*) join:(NSMutableString*)sep;
- (NSMutableString*) toString;
- (id) pop;
- (int) push:(id)x;
- (void) unshift:(id)x;
- (BOOL) remove:(id)x;
- (void) reverse;
- (id) shift;
- (NSMutableArray*) slice:(int)pos end:(int)end;
- (void) sort:(id)f;
- (NSMutableArray*) splice:(int)pos len:(int)len;
- (id) iterator;
- (NSMutableArray*) map:(id)f;
- (NSMutableArray*) filter:(id)f;
- (void) hx_replaceObjectAtIndex:(int)index withObject:(id)withObject;
- (id) hx_objectAtIndex:(int)index;
- (id) init;

@end

