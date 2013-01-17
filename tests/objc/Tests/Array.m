//
//  Array
//  Tests
//
//  Source generated by Haxe Objective-C target
//

#import "Array.h"

@implementation NSMutableArray ( Array )

// Getters/setters for property length
static int length__;
- (int) length { return length__; }
- (void) setLength:(int)val { length__ = val; }

NSMutableArray*(^block_concat)(NSMutableArray *a) = ^(NSMutableArray *a) { [me concat:a]; };
- (NSMutableArray*) concat:(NSMutableArray*)a{
	return [self arrayByAddingObjectsFromArray:a];
}
NSMutableArray*(^block_copy)() = ^() { [me copy]; };
- (NSMutableArray*) copy{
	return [NSMutableArray arrayWithArray:self];
}
id(^block_iterator)() = ^() { [me iterator]; };
- (id) iterator{
	return struct {
	a:self; p:0; hasNext:^BOOL(^block_)() = ^() { [me ]; };
- (BOOL) {
		return self.p < block_length;
	}; next:^id(^block_)() = ^() { [me ]; };
- (id) {
		id i = [self.a objectAtIndex:self.p];
		self.p += 1;
		return i;
	}
	} structName;
}
void(^block_insert)(int pos, id x) = ^(int pos, id x) { [me insert:pos x:x]; };
- (void) insert:(int)pos x:(id)x{
	[self insertObject:x atIndex:pos];
}
NSMutableString*(^block_join)(NSMutableString *sep) = ^(NSMutableString *sep) { [me join:sep]; };
- (NSMutableString*) join:(NSMutableString*)sep{
	return [self componentsJoinedByString:sep];
}
NSMutableString*(^block_toString)() = ^() { [me toString]; };
- (NSMutableString*) toString{
	return [(NSMutableString*)@"[" stringByAppendingString: ([[self componentsJoinedByString:(NSMutableString*)@","] stringByAppendingString:(NSMutableString*)@"]"])];
}
id(^block_pop)() = ^() { [me pop]; };
- (id) pop{
	if (self.length == 0) return nil;
	id theLastObject = [self lastObject];
	[self removeLastObject];
	return theLastObject;
}
int(^block_push)(id x) = ^(id x) { [me push:x]; };
- (int) push:(id)x{
	[self addObject:x];
	return [self count];
}
void(^block_unshift)(id x) = ^(id x) { [me unshift:x]; };
- (void) unshift:(id)x{
	[self insertObject:x atIndex:0];
}
BOOL(^block_remove)(id x) = ^(id x) { [me remove:x]; };
- (BOOL) remove:(id)x{
	BOOL containsObject = [self containsObject:x];
	if (containsObject) [self removeObject:x];
	return containsObject;
}
void(^block_reverse)() = ^() { [me reverse]; };
- (void) reverse{
	id reverseArray = [[self reverseObjectEnumerator] allObjects];
}
id(^block_shift)() = ^() { [me shift]; };
- (id) shift{
	if ([self count] > 0) {
		id obj = [self objectAtIndex:0];
		[self removeObjectAtIndex:0];
		return obj;
	}
	return nil;
}
NSMutableArray*(^block_slice)(int pos, int end) = ^(int pos, int end) { [me slice:pos end:end]; };
- (NSMutableArray*) slice:(int)pos end:(int)end{
	// Simulated optional arguments
	if (end == nil) end = nil;
	
	return [self splice:pos len:end - pos];
}
void(^block_sort)(SEL f) = ^(SEL f) { [me sort:f]; };
- (void) sort:(SEL)f{
}
NSMutableArray*(^block_splice)(int pos, int len) = ^(int pos, int len) { [me splice:pos len:len]; };
- (NSMutableArray*) splice:(int)pos len:(int)len{
	
	NSMutableArray *newArray = (NSMutableArray*)[self subarrayWithRange:NSMakeRange (pos,len)];
	[self removeObjectsInArray:newArray];
	return [NSMutableArray arrayWithArray:newArray];
}
id(^block_init)() = ^() { [me init]; };
- (id) init{
	self = [super init];
	me = self;
	return self;
}

@end
