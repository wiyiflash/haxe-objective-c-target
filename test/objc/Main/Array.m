#import "Array.h"

@implementation Array


- (void) init{
self.__a = 	[[NSMutableArray alloc] init];
}


@synthesize __a;
@synthesize length;
- (Array*) fromNativeArray:(NSMutableArray*)array{
self.__a = array;
	return self;
}


- (Array*) concat:(Array*)a{
	return a;
}


- (Array*) copy{
	return 	[GEN_M_CALL>Field>[[Array alloc] init] fromNativeArray:1Field>TInst];
}


- (id) iterator{
	return nil;
}


- (void) insert:(int)pos x:(**)x{
	[__a insertObject:x atIndex:pos];
}


- (NSString*) join:(NSString*)sep{
	return 	[__a componentsJoinedByString:sep];
}


- (NSString*) toString{
	return @"[" + 	[__a componentsJoinedByString:@","] + @"]";
}


- (**) pop{
	return nil;
}


- (int) push:(**)x{
	[__a addObject:x];
	return 	[GEN_M_CALL>Field>self getLength:0TInst];
}


- (void) unshift:(**)x{
	[__a insertObject:x atIndex:pos];
}


- (BOOL) remove:(**)x{
	[__a removeObject:x];
	return YES;
}


- (void) reverse{
}


- (**) shift{
	return nil;
}


- (Array*) slice:(int)pos end:(**)end{
	return nil;
}


- (void) sort:(Function*)f{
}


- (Array*) splice:(int)pos len:(int)len{
	return nil;
}


- (int) getLength{
	return 	[__a count];
}



@end
