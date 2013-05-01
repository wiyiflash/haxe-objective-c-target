//
//  Array
//  Tests
//
//  Source generated by Haxe Objective-C target
//

#import "Array.h"

@implementation NSMutableArray ( Array )

// Getters/setters for property: length
- (int) length { return [self count]; }
- (void) setLength:(int)val { nil; }

- (NSMutableArray*) concat:(NSMutableArray*)a{
	
	NSMutableArray *b = [[NSMutableArray alloc] init];
	[-FDynamic-b addObjectsFromArray:self];
	[-FDynamic-b addObjectsFromArray:a];
	return b;
}
- (NSMutableArray*) copy{
	return [-FDynamic-NSMutableArray arrayWithArray:self];
}
- (void) insert:(int)pos x:(id)x{
	[self insertObject:(x!=nil?x:[NSNull null]) atIndex:pos];
}
- (NSMutableString*) join:(NSMutableString*)sep{
	return [NSMutableString[@"stringWithString"]:[-FDynamic-self componentsJoinedByString:sep]];
}
- (NSMutableString*) toString{
	return [NSMutableString[@"stringWithString"]:[-FDynamic-self description]];
}
- (id) pop{
	if ([-FDynamic-self count] == 0) return nil;
	id theLastObject = [-FDynamic-self lastObject];
	if ([theLastObject isKindOfClass:[NSNull class]]) theLastObject = nil;
	[-FDynamic-self removeLastObject];
	return theLastObject;
}
- (int) push:(id)x{
	[self addObject:(x!=nil?x:[NSNull null])];
	return [-FDynamic-self count];
}
- (void) unshift:(id)x{
	[self insertObject:(x!=nil?x:[NSNull null]) atIndex:0];
}
- (BOOL) remove:(id)x{
	BOOL containsObject = [-FDynamic-self containsObject:x];
	if (containsObject) [-FDynamic-self removeObject:x];
	return containsObject;
}
- (void) reverse{
	id reverseArray = [[-FDynamic-self reverseObjectEnumerator][@"allObjects"]];
}
- (id) shift{
	if (self.length > 0) {
		id obj = [-FDynamic-self objectAtIndex:0];
		[-FDynamic-self removeObjectAtIndex:0];
		return obj;
	}
	return nil;
}
- (NSMutableArray*) slice:(int)pos end:(int)end{
	// Optional arguments
	if (!end) end = nil;
	
	return [self splice:pos len:end - pos];
}
- (void) sort:(id)f{
}
- (NSMutableArray*) splice:(int)pos len:(int)len{
	NSArray *newArray = [self subarrayWithRange:NSMakeRange(pos, len)];
	[-FDynamic-self removeObjectsInArray:newArray];
	return [-FDynamic-NSMutableArray arrayWithArray:newArray];
}
- (id) iterator{
	__block int p = 0;		return [NSMutableDictionary dictionaryWithObjectsAndKeys:			[^BOOL() { return p < [self count]; } copy], @"hasNext",			[^id() { id i = [self objectAtIndex:p]; p += 1; return i; } copy], @"next",			nil];
	return nil;
}
- (NSMutableArray*) map:(id)f{
	return nil;
}
- (NSMutableArray*) filter:(id)f{
	return nil;
}
- (void) hx_replaceObjectAtIndex:(int)index withObject:(id)withObject{
	if (index >= [self count]) while ([self count] <= index) [self addObject:[NSNull null]];
	[self replaceObjectAtIndex:index withObject:(withObject==nil?[NSNull null]:withObject)];
}
- (id) hx_objectAtIndex:(int)index{
	if (index >= [self count]) while ([self count] <= index) [self addObject:[NSNull null]];
	id obj = [-FDynamic-self objectAtIndex:index];
	if ([obj isKindOfClass:[NSNull class]]) obj = nil;
	return obj;
}
- (id) init{
	self = [super init];
	return self;
}

@end
