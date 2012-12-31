//
//  FastList
//  Tests
//
//  Source generated by Haxe Objective-C target
//

#import "FastList.h"

@implementation FastCell

@synthesize elt;
@synthesize next;
- (id) init:(id)elt next:(FastCell*)next{
	self = [super init];
	self.elt = elt;
	self.next = next;
	return self;
}

@end

@implementation FastList

@synthesize head;
- (void) add:(id)item{
	self.head = [[FastCell alloc] init:item next:self head];
}
- (id) first{
	return ( (self.head == nil) ? nil : self.head.elt);
}
- (id) pop{
	
	FastCell *k = self.head;
	if (k == nil) return nil
	else {
		self.head = k.next;
		return k.elt;
	}
	return nil;
}
- (BOOL) isEmpty{
	return self.head == nil;
}
- (BOOL) remove:(id)v{
	id prev = nil;
	
	FastCell *l = self.head;
	while (l != nil) {
		if (l.elt == v) {
			if (prev == nil) self.head = l.next
			else prev GFA2 .next = l.next;
			break;
		}
		prev = l;
		l = l.next;
	}
	return l != nil;
}
- (id) iterator{
	
	NSMutableArray *l = [[NSMutableArray alloc] initWithObjects:self.head, nil]];
	return typedef struct {
	hasNext:^(BOOL){
		return [l objectAtIndex:0] != nil;
	}; next:^(id){
		
		FastCell *k = [l objectAtIndex:0];
		[l objectAtIndex:0] = k.next;
		return k.elt;
	}
	} structName;
}
- (NSMutableString*) toString{
	
	NSMutableArray *a = [[NSMutableArray alloc] init];
	
	FastCell *l = self.head;
	while (l != nil) {
		[a push:l elt];
		l = l.next;
	}
	return [[@"{" stringByAppendingString:[a join:@","]] stringByAppendingString:@"}"];
}
- (id) init{
	self = [super init];
	return self;
}

@end