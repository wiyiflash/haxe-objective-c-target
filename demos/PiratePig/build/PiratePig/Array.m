//
//  Array
//  PiratePig
//
//  Source generated by Haxe Objective-C target
//

#import "Array.h"

@implementation NSMutableArray ( Array )

// Getters/setters for property: length
static int length__;
- (int) length { return length__; }
- (void) setLength:(int)val { length__ = val; }

- (NSMutableArray*) concat:(NSMutableArray*)a{
	return [self arrayByAddingObjectsFromArray:a];
}
- (NSMutableArray*) copy{
	return [NSMutableArray arrayWithArray:self];
}
- (void) insert:(int)pos x:(id)x{
	[self insertObject:x atIndex:pos];
}
- (NSMutableString*) join:(NSMutableString*)sep{
	return [self componentsJoinedByString:sep];
}
- (NSMutableString*) toString{
	return [[NSMutableString stringWithString:@"["] stringByAppendingString: ([[self componentsJoinedByString:[NSMutableString stringWithString:@","]] stringByAppendingString:[NSMutableString stringWithString:@"]"]])];
}
- (id) pop{
	if (self.length == 0) return nil;
	id theLastObject = [self lastObject];
	[self removeLastObject];
	return theLastObject;
}
- (int) push:(id)x{
	[self addObject:x];
	return [self count];
}
- (void) unshift:(id)x{
	[self insertObject:x atIndex:0];
}
- (BOOL) remove:(id)x{
	BOOL containsObject = [self containsObject:x];
	if (containsObject) [self removeObject:x];
	return containsObject;
}
- (void) reverse{
	id reverseArray = [[self reverseObjectEnumerator] allObjects];
}
- (id) shift{
	if ([self count] > 0) {
		id obj = [self objectAtIndex:0];
		[self removeObjectAtIndex:0];
		return obj;
	}
	return nil;
}
- (NSMutableArray*) slice:(int)pos end:(int)end{
	// Optional arguments
	if (!end) end = nil;
	
	return [self splice:pos len:end - pos];
}
- (void) sort:(SEL)f{
}
- (NSMutableArray*) splice:(int)pos len:(int)len{
	
	NSMutableArray *newArray = [self subarrayWithRange:NSMakeRange (pos,len)];
	[self removeObjectsInArray:newArray];
	return [NSMutableArray arrayWithArray:newArray];
}
- (id) iterator{
	__block int p = 0;		return [NSMutableDictionary dictionaryWithObjectsAndKeys:			[^BOOL() { return p < [self count]; } copy], @"hasNext",			[^id() { id i = [self objectAtIndex:p]; p += 1; return i; } copy], @"next",			nil];
	return nil;
}
- (NSMutableArray*) map:(SEL)f{
	return nil;
}
- (NSMutableArray*) filter:(SEL)f{
	return nil;
}
- (id) init{
	self = [super init];
	return self;
}

@end
