//
//  main.m
//  app_delegate_class
//
//  Source generated by Haxe Objective-C target
//



#import "Array.h"
#import "StringBuf.h"
#import "Std.h"
#import "List.h"
#import "T.h"

@interface List : NSObject

@property (nonatomic, strong) NSMutabeArray *h;
@property (nonatomic, strong) NSMutabeArray *q;
@property (nonatomic) int length;
- (void) add:(id)item;
- (void) push:(id)item;
- (id) first;
- (id) last;
- (id) pop;
- (BOOL) isEmpty;
- (void) clear;
- (BOOL) remove:(id)v;
- (id) iterator;
- (NSMutableString*) toString;
- (NSMutableString*) join:(NSMutableString*)sep;
- (List*) filter:(Function*)f;
- (List*) map:(Function*)f;
- (id) new;

@end
