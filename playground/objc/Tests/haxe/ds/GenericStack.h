//
//  GenericStack
//  Tests
//
//  Source generated by Haxe Objective-C target
//



#import "../../haxe/ds/GenericStack.h"

@interface GenericCell : NSObject

@property (nonatomic) id elt;
@property (nonatomic, strong) GenericCell *next;
- (id) init:(id)elt next:(GenericCell*)next;

@end



#import "../../haxe/ds/GenericStack.h"
#import "../../String.h"
#import "../../Array.h"

@interface GenericStack : NSObject

@property (nonatomic, strong) GenericCell *head;
- (void) add:(id)item;
- (id) first;
- (id) pop;
- (BOOL) isEmpty;
- (BOOL) remove:(id)v;
- (id) iterator;
- (NSMutableString*) toString;
- (id) init;

@end

