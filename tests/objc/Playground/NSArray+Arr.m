//
//  NSArray+Arr.m
//  Playground
//
//  Created by Baluta Cristian on 07/03/2013.
//  Copyright (c) 2013 Baluta Cristian. All rights reserved.
//

#import "NSArray+Arr.h"

@implementation NSArray (Arr)


- (id) iterator {
	
	__block int p = 0;
	
	//BOOL(^hasNext)() = ^BOOL() { return p < [a count]; };
	//id(^next)() = ^id() { id i = [a objectAtIndex:p]; p += 1; return i; };
	
	return [NSMutableDictionary dictionaryWithObjectsAndKeys:
			[^BOOL() { return p < [self count]; } copy], @"hasNext",
			[^id() { id i = [self objectAtIndex:p]; p += 1; return i; } copy], @"next",
			nil];
}

//- (id) iterator2{
//	
//	NSMutableArray *_g = [[NSMutableArray alloc] initWithArray:self];
//	NSMutableArray *i = [[NSMutableArray alloc] initWithObject:[NSNumber numberWithInt:0]];
//	NSMutableArray *len = [[NSMutableArray alloc] initWithObject:self.length];
//	
//	return [NSMutableDictionary dictionaryWithObjectsAndKeys:
//			[^BOOL(){
//		return [i objectAtIndex:0] < [len objectAtIndex:0];
//	} copy], @"hasNext",
//			[^id(){
//		return [[_g objectAtIndex:0] objectAtIndex:[i objectAtIndex:0]++];
//	} copy], @"next",
//			nil];
//}


@end
