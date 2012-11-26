

#import "Array.h"

@interface  ( IntHash )

- (void) set:(int)key value:(id)value;
- (id) get:(int)key;
- (BOOL) exists:(int)key;
- (BOOL) remove:(int)key;
- (id) keys;
- (id) iterator;
- (NSMutableString*) toString;
- (id) new;

@end
