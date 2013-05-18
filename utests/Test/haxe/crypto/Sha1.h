//
//  Sha1
//  Test
//
//  Source generated by Haxe Objective-C target
//



#import "../../String.h"
#import "../../haxe/io/Bytes.h"
#import "../../Array.h"
#import "../../haxe/crypto/Sha1.h"
#import <CommonCrypto/CommonCryptor.h>
#import <CommonCrypto/CommonDigest.h>

@interface Sha1 : NSObject

+ (NSMutableString*) encode:(NSMutableString*)s;
+ (Bytes*) make:(Bytes*)b;
+ (NSMutableArray*) str2blks:(NSMutableString*)s;
+ (NSMutableArray*) bytes2blks:(Bytes*)b;
- (NSMutableArray*) doEncode:(NSMutableArray*)x;
- (int) rol:(int)num cnt:(int)cnt;
- (int) ft:(int)t b:(int)b c:(int)c d:(int)d;
- (int) kt:(int)t;
- (NSMutableString*) hex:(NSMutableArray*)a;
- (id) init;

@end

