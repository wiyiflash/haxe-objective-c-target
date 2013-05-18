//
//  Parser
//  Test
//
//  Source generated by Haxe Objective-C target
//

#import "../../haxe/xml/Parser.h"

@implementation Parser

static StringMap* escapes;
+ (StringMap*) escapes {
	if (escapes == nil) escapes = ^(StringMap*)
StringMap *h = [[StringMap alloc] init]
[h set:[@"lt" mutableCopy] value:[@"<" mutableCopy]]
[h set:[@"gt" mutableCopy] value:[@">" mutableCopy]]
[h set:[@"amp" mutableCopy] value:[@"&" mutableCopy]]
[h set:[@"quot" mutableCopy] value:[@"\"" mutableCopy]]
[h set:[@"apos" mutableCopy] value:[@"'" mutableCopy]]
[h set:[@"nbsp" mutableCopy] value:[NSMutableString:160]]
__r__ = h
return __r__{
	
	StringMap* __r__}
}();
	return escapes;
}
+ (void) setEscapes:(StringMap*)hx_val {
	escapes = hx_val;
}
+ (Xml*) parse:(NSMutableString*)str{
	
	
	Xml *doc = [Xml createDocument];
	[Parser doParse:str p:0 parent:doc];
	return doc;
}
+ (int) doParse:(NSMutableString*)str p:(int)p parent:(Xml*)parent{
	
	// Optional arguments
	if (!parent) parent = nil;
	if (!p) p = 0;
	
	
	Xml *xml = nil;
	int state = 1;
	int next = 1;
	
	NSMutableString *aname = nil;
	int start = 0;
	int nsubs = 0;
	int nbrackets = 0;
	int c = [str characterAtIndex:p];
	
	StringBuf *buf = [[StringBuf alloc] init];
	while (! (c == -1)) {
		
		switch (state){
			case 0:switch (c){
				case 10:case 13:case 9:case 32:{
					
				}
				break;
				default:{
					
					state = next;
					continue;
				}break;
			};
			break;
			case 1:switch (c){
				case 60:{
					
					state = 0;
					next = 2;
				}
				break;
				default:{
					
					start = p;
					state = 13;
					continue;
				}break;
			};
			break;
			case 13:if (c == 60) {
				
				
				Xml *child = [Xml createPCData:[buf.b stringByAppendingString:[str substr:start len:p - start]]];
				buf = [[StringBuf alloc] init];
				[parent addChild:child];
				nsubs++;
				state = 0;
				next = 2;
			}
			else if (c == 38) {
				
				{
					
					int len = p - start;
					[buf.b appendString:( (len == nil) ? [str substr:start len:nil] : [str substr:start len:len])];
				}
				state = 18;
				next = 13;
				start = p + 1;
			};
			break;
			case 17:if (c == 93 && [str characterAtIndex:p + 1] == 93 && [str characterAtIndex:p + 2] == 62) {
				
				
				Xml *child = [Xml createCData:[str substr:start len:p - start]];
				[parent addChild:child];
				nsubs++;
				p += 2;
				state = 1;
			};
			break;
			case 2:switch (c){
				case 33:if ([str characterAtIndex:p + 1] == 91) {
					
					p += 2;
					if ([[str substr:p len:6] toUpperCase] != [@"CDATA[" mutableCopy]) @throw [@"Expected <![CDATA[" mutableCopy];;
					p += 5;
					state = 17;
					start = p + 1;
				}
				else if ([str characterAtIndex:p + 1] == 68 || [str characterAtIndex:p + 1] == 100) {
					
					if ([[str substr:p + 2 len:6] toUpperCase] != [@"OCTYPE" mutableCopy]) @throw [@"Expected <!DOCTYPE" mutableCopy];;
					p += 8;
					state = 16;
					start = p + 1;
				}
				else if ([str characterAtIndex:p + 1] != 45 || [str characterAtIndex:p + 2] != 45) @throw [@"Expected <!--" mutableCopy];;
				else {
					
					p += 2;
					state = 15;
					start = p + 1;
				};
				break;
				case 63:{
					
					state = 14;
					start = p;
				}
				break;
				case 47:{
					
					if (parent == nil) @throw [@"Expected node name" mutableCopy];;
					start = p + 1;
					state = 0;
					next = 10;
				}
				break;
				default:{
					
					state = 3;
					start = p;
					continue;
				}break;
			};
			break;
			case 3:if (! (c >= 97 && c <= 122 || c >= 65 && c <= 90 || c >= 48 && c <= 57 || c == 58 || c == 46 || c == 95 || c == 45)) {
				
				if (p == start) @throw [@"Expected node name" mutableCopy];;
				xml = [Xml createElement:[str substr:start len:p - start]];
				[parent addChild:xml];
				state = 0;
				next = 4;
				continue;
			};
			break;
			case 4:switch (c){
				case 47:{
					
					state = 11;
					nsubs++;
				}
				break;
				case 62:{
					
					state = 9;
					nsubs++;
				}
				break;
				default:{
					
					state = 5;
					start = p;
					continue;
				}break;
			};
			break;
			case 5:if (! (c >= 97 && c <= 122 || c >= 65 && c <= 90 || c >= 48 && c <= 57 || c == 58 || c == 46 || c == 95 || c == 45)) {
				
				
				NSMutableString *tmp;
				if (start == p) @throw [@"Expected attribute name" mutableCopy];;
				tmp = [str substr:start len:p - start];
				aname = tmp;
				if ([xml exists:aname]) @throw [@"Duplicate attribute" mutableCopy];;
				state = 0;
				next = 6;
				continue;
			};
			break;
			case 6:switch (c){
				case 61:{
					
					state = 0;
					next = 7;
				}
				break;
				default:@throw [@"Expected =" mutableCopy];;break;
			};
			break;
			case 7:switch (c){
				case 34:case 39:{
					
					state = 8;
					start = p;
				}
				break;
				default:@throw [@"Expected \"" mutableCopy];;break;
			};
			break;
			case 8:if (c == [str characterAtIndex:start]) {
				
				
				NSMutableString *val = [str substr:start + 1 len:p - start - 1];
				[xml set:aname value:val];
				state = 0;
				next = 4;
			};
			break;
			case 9:{
				
				p = [Parser doParse:str p:p parent:xml];
				start = p;
				state = 1;
			}
			break;
			case 11:switch (c){
				case 62:state = 1;
				break;
				default:@throw [@"Expected >" mutableCopy];;break;
			};
			break;
			case 12:switch (c){
				case 62:{
					
					if (nsubs == 0) [parent addChild:[Xml createPCData:[@"" mutableCopy]]];
					return p;;
				}
				break;
				default:@throw [@"Expected >" mutableCopy];;break;
			};
			break;
			case 10:if (! (c >= 97 && c <= 122 || c >= 65 && c <= 90 || c >= 48 && c <= 57 || c == 58 || c == 46 || c == 95 || c == 45)) {
				
				if (start == p) @throw [@"Expected node name" mutableCopy];;
				
				NSMutableString *v = [str substr:start len:p - start];
				if (v != [parent get_nodeName]) @throw [[[@"Expected </" mutableCopy] stringByAppendingString:[parent get_nodeName]] stringByAppendingString:[@">" mutableCopy]];;
				state = 0;
				next = 12;
				continue;
			};
			break;
			case 15:if (c == 45 && [str characterAtIndex:p + 1] == 45 && [str characterAtIndex:p + 2] == 62) {
				
				[parent addChild:[Xml createComment:[str substr:start len:p - start]]];
				p += 2;
				state = 1;
			};
			break;
			case 16:if (c == 91) nbrackets++;
			else if (c == 93) nbrackets--;
			else if (c == 62 && nbrackets == 0) {
				
				[parent addChild:[Xml createDocType:[str substr:start len:p - start]]];
				state = 1;
			};
			break;
			case 14:if (c == 63 && [str characterAtIndex:p + 1] == 62) {
				
				p++;
				
				NSMutableString *str1 = [str substr:start + 1 len:p - start - 2];
				[parent addChild:[Xml createProcessingInstruction:str1]];
				state = 1;
			};
			break;
			case 18:if (c == 59) {
				
				
				NSMutableString *s = [str substr:start len:p - start];
				if ([s characterAtIndex:0] == 35) {
					
					int i = ( ([s characterAtIndex:1] == 120) ? [Std parseInt:[[@"0" mutableCopy] stringByAppendingString:[s substr:@"1" len:s.length - @"1"]]] : [Std parseInt:[s substr:1 len:s.length - 1]]);
					[buf.b appendString:[Std string:[NSMutableString:i]]];
				}
				else if (![escapes exists:s]) [buf.b appendString:[Std string:[[[@"&" mutableCopy] stringByAppendingString:s] stringByAppendingString:[@";" mutableCopy]]]];
				else [buf.b appendString:[Std string:[escapes get:s]]];
				start = p + 1;
				state = next;
			};
			break;
		}
		c = [str characterAtIndex:++p];
	}
	if (state == 1) {
		
		start = p;
		state = 13;
	}
	if (state == 13) {
		
		if (p != start || nsubs == 0) [parent addChild:[Xml createPCData:[buf.b stringByAppendingString:[str substr:start len:p - start]]]];
		return p;
	}
	@throw [@"Unexpected end" mutableCopy];;
	return 0;
}

@end
