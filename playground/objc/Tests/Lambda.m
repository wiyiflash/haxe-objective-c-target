//
//  Lambda
//  Tests
//
//  Source generated by Haxe Objective-C target
//

#import "Lambda.h"

@implementation Lambda

+ (NSMutableArray*) array:(id)it{
	
	NSMutableArray *a = [[NSMutableArray alloc] init];
	{
		id _it = [it[@"iterator"]];
		while ( [_it hasNext] ) do {
			id i = [_it next];
			[a push:i];
		}
	}
	return a;
}
+ (List*) list:(id)it{
	
	List *l = [[List alloc] init];
	{
		id _it = [it[@"iterator"]];
		while ( [_it hasNext] ) do {
			id i = [_it next];
			[l add:i];
		}
	}
	return l;
}
+ (List*) map:(id)it f:(id)f{
	
	List *l = [[List alloc] init];
	{
		id _it = [it[@"iterator"]];
		while ( [_it hasNext] ) do {
			id x = [_it next];
			[l add:[f:x]];
		}
	}
	return l;
}
+ (List*) mapi:(id)it f:(id)f{
	
	List *l = [[List alloc] init];
	int i = 0;
	{
		id _it = [it[@"iterator"]];
		while ( [_it hasNext] ) do {
			id x = [_it next];
			[l add:[f:i++ :x]];
		}
	}
	return l;
}
+ (BOOL) has:(id)it elt:(id)elt{
	{
		id _it = [it[@"iterator"]];
		while ( [_it hasNext] ) do {
			id x = [_it next];
			if (x == elt) return YES;
		}
	}
	return NO;
}
+ (BOOL) exists:(id)it f:(id)f{
	{
		id _it = [it[@"iterator"]];
		while ( [_it hasNext] ) do {
			id x = [_it next];
			if ([f:x]) return YES;
		}
	}
	return NO;
}
+ (BOOL) foreach:(id)it f:(id)f{
	{
		id _it = [it[@"iterator"]];
		while ( [_it hasNext] ) do {
			id x = [_it next];
			if (![f:x]) return NO;
		}
	}
	return YES;
}
+ (void) iter:(id)it f:(id)f{
	{
		id _it = [it[@"iterator"]];
		while ( [_it hasNext] ) do {
			id x = [_it next];
			[f:x];
		}
	}
}
+ (List*) filter:(id)it f:(id)f{
	
	List *l = [[List alloc] init];
	{
		id _it = [it[@"iterator"]];
		while ( [_it hasNext] ) do {
			id x = [_it next];
			if ([f:x]) [l add:x];
		}
	}
	return l;
}
+ (id) fold:(id)it f:(id)f first:(id)first{
	{
		id _it = [it[@"iterator"]];
		while ( [_it hasNext] ) do {
			id x = [_it next];
			first = [f:x :first];
		}
	}
	return first;
}
+ (int) count:(id)it pred:(id)pred{
	// Optional arguments
	if (!pred) pred = nil;
	
	int n = 0;
	if (pred == nil) {
		{
			id _it = [it[@"iterator"]];
			while ( [_it hasNext] ) do {
				id _ = [_it next];
				n++;
			}
		}
	}
	else {
		{
			id _it2 = [it[@"iterator"]];
			while ( [_it2 hasNext] ) do {
				id x = [_it2 next];
				if ([pred:x]) n++;
			}
		}
	}
	return n;
}
+ (BOOL) empty:(id)it{
	return ![[it[@"iterator"]][@"hasNext"]];
}
+ (int) indexOf:(id)it v:(id)v{
	int i = 0;
	{
		id _it = [it[@"iterator"]];
		while ( [_it hasNext] ) do {
			id v2 = [_it next];
			{
				if (v == v2) return i;
				i++;
			};
		}
	}
	return -1;
}
+ (List*) concat:(id)a b:(id)b{
	
	List *l = [[List alloc] init];
	{
		id _it = [a[@"iterator"]];
		while ( [_it hasNext] ) do {
			id x = [_it next];
			[l add:x];
		}
	}
	{
		id _it2 = [b[@"iterator"]];
		while ( [_it2 hasNext] ) do {
			id x = [_it2 next];
			[l add:x];
		}
	}
	return l;
}

@end
