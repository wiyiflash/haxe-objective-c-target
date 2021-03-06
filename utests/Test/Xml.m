//
//  Xml
//  Test
//
//  Source generated by Haxe Objective-C target
//

#import "Xml.h"

@implementation Xml

static XmlType* Element;
+ (XmlType*) Element {
	if (Element == nil) Element = ;
	return Element;
}
+ (void) setElement:(XmlType*)hx_val {
	Element = hx_val;
}
static XmlType* PCData;
+ (XmlType*) PCData {
	if (PCData == nil) PCData = ;
	return PCData;
}
+ (void) setPCData:(XmlType*)hx_val {
	PCData = hx_val;
}
static XmlType* CData;
+ (XmlType*) CData {
	if (CData == nil) CData = ;
	return CData;
}
+ (void) setCData:(XmlType*)hx_val {
	CData = hx_val;
}
static XmlType* Comment;
+ (XmlType*) Comment {
	if (Comment == nil) Comment = ;
	return Comment;
}
+ (void) setComment:(XmlType*)hx_val {
	Comment = hx_val;
}
static XmlType* DocType;
+ (XmlType*) DocType {
	if (DocType == nil) DocType = ;
	return DocType;
}
+ (void) setDocType:(XmlType*)hx_val {
	DocType = hx_val;
}
static XmlType* ProcessingInstruction;
+ (XmlType*) ProcessingInstruction {
	if (ProcessingInstruction == nil) ProcessingInstruction = ;
	return ProcessingInstruction;
}
+ (void) setProcessingInstruction:(XmlType*)hx_val {
	ProcessingInstruction = hx_val;
}
static XmlType* Document;
+ (XmlType*) Document {
	if (Document == nil) Document = ;
	return Document;
}
+ (void) setDocument:(XmlType*)hx_val {
	Document = hx_val;
}
+ (Xml*) parse:(NSMutableString*)str{
	
	
	Xml *x = [[Xml alloc] init];
	x._children = [[NSMutableArray alloc] init];
	id parser = [@{
		@"cur":[x copy],
		@"xml":[^(NSMutableString *name, id att){
		
		
		Xml *x1 = [[Xml alloc] init];
		x1._parent = [self cur];
		x1.nodeType = ;
		x1._nodeName = [[NSMutableString alloc] init:name];
		x1._attributes = att;
		x1._children = [[NSMutableArray alloc] init];
		{
			
			int i = @0;
			[self cur addChild:x1];
			[self cur] = x1;
		}
	} copy],
		@"cdata":[^(NSMutableString *text){
		
		
		Xml *x1 = [[Xml alloc] init];
		x1._parent = [self cur];
		x1.nodeType = ;
		x1._nodeValue = [[NSMutableString alloc] init:text];
		[self cur addChild:x1];
	} copy],
		@"pcdata":[^(NSMutableString *text){
		
		
		Xml *x1 = [[Xml alloc] init];
		x1._parent = [self cur];
		x1.nodeType = ;
		x1._nodeValue = [[NSMutableString alloc] init:text];
		[self cur addChild:x1];
	} copy],
		@"comment":[^(NSMutableString *text){
		
		
		Xml *x1 = [[Xml alloc] init];
		x1._parent = [self cur];
		if ([text cca:@0] == @63) {
			
			x1.nodeType = ;
			text = [[NSMutableString alloc] init:text];
			text = [text substr:@1 len:text.length - @2];
		}
		else {
			
			x1.nodeType = ;
			text = [[NSMutableString alloc] init:text];
		}
		x1._nodeValue = text;
		[self cur addChild:x1];
	} copy],
		@"doctype":[^(NSMutableString *text){
		
		
		Xml *x1 = [[Xml alloc] init];
		x1._parent = [self cur];
		x1.nodeType = ;
		x1._nodeValue = [[NSMutableString alloc] :text substr:@1 len:nil];
		
		Xml *p = [self cur];
		[p addChild:x1];
	} copy],
		@"done":[^(){
		
		[self cur] = [self cur] _parent;
	} copy],
	} mutableCopy];
	[_parse:str :parser];
	x.nodeType = ;
	return x;
}
+ (Xml*) createElement:(NSMutableString*)name{
	
	
	Xml *r = [[Xml alloc] init];
	r.nodeType = ;
	r._nodeName = name;
	r._attributes = nil;
	r._children = [[NSMutableArray alloc] init];
	return r;
}
+ (Xml*) createPCData:(NSMutableString*)data{
	
	
	Xml *r = [[Xml alloc] init];
	r.nodeType = ;
	r._nodeValue = data;
	return r;
}
+ (Xml*) createCData:(NSMutableString*)data{
	
	
	Xml *r = [[Xml alloc] init];
	r.nodeType = ;
	r._nodeValue = data;
	return r;
}
+ (Xml*) createComment:(NSMutableString*)data{
	
	
	Xml *r = [[Xml alloc] init];
	r.nodeType = ;
	r._nodeValue = data;
	return r;
}
+ (Xml*) createDocType:(NSMutableString*)data{
	
	
	Xml *r = [[Xml alloc] init];
	r.nodeType = ;
	r._nodeValue = data;
	return r;
}
+ (Xml*) createProcessingInstruction:(NSMutableString*)data{
	
	
	Xml *r = [[Xml alloc] init];
	r.nodeType = ;
	r._nodeValue = data;
	return r;
}
+ (Xml*) createDocument{
	
	
	Xml *r = [[Xml alloc] init];
	r.nodeType = ;
	r._children = [[NSMutableArray alloc] init];
	return r;
}
@synthesize _nodeName;
@synthesize _nodeValue;
@synthesize _attributes;
@synthesize _children;
@synthesize _parent;
@synthesize nodeType;


- (NSMutableString*) get_nodeName{
	
	if (self.nodeType != ) @throw [@"bad nodeType" mutableCopy];
	return self._nodeName;
}
- (NSMutableString*) set_nodeName:(NSMutableString*)n{
	
	if (self.nodeType != ) @throw [@"bad nodeType" mutableCopy];
	return self._nodeName = n;
}
- (NSMutableString*) get_nodeValue{
	
	if (self.nodeType ==  || self.nodeType == ) @throw [@"bad nodeType" mutableCopy];
	return self._nodeValue;
}
- (NSMutableString*) set_nodeValue:(NSMutableString*)v{
	
	if (self.nodeType ==  || self.nodeType == ) @throw [@"bad nodeType" mutableCopy];
	return self._nodeValue = v;
}

- (Xml*) get_parent{
	
	return self._parent;
}
- (NSMutableString*) get:(NSMutableString*)att{
	
	if (self.nodeType != ) @throw [@"bad nodeType" mutableCopy];
	return [Reflect field:self._attributes field:att];
}
- (void) set:(NSMutableString*)att value:(NSMutableString*)value{
	
	if (self.nodeType != ) @throw [@"bad nodeType" mutableCopy];
	if (self._attributes == nil) self._attributes = [@{
	} mutableCopy];
	{
		
		id o = self._attributes;
		if (o != nil) [o hx_set_field:att :value :NO];
	}
	{
	nil
	return{
		
		};
	}
	- (void) remove:(NSMutableString*)att{
		
		if (self.nodeType != ) @throw [@"bad nodeType" mutableCopy];
		[Reflect deleteField:self._attributes field:att];
		{
		nil
		return{
			
			};
		}
		- (BOOL) exists:(NSMutableString*)att{
			
			if (self.nodeType != ) @throw [@"bad nodeType" mutableCopy];
			return [Reflect hasField:self._attributes field:att];
		}
		- (id) attributes{
			
			if (self.nodeType != ) @throw [@"bad nodeType" mutableCopy];
			return [[Reflect fields:self _attributes] iterator];
		}
		- (id) iterator{
			
			if (self._children == nil) @throw [@"bad nodetype" mutableCopy];
			return [self._children iterator];
		}
		- (id) elements{
			
			if (self._children == nil) @throw [@"bad nodetype" mutableCopy];
			
			NSMutableArray *children = self._children;
			return [@{
				@"cur":[@0 copy],
				@"hasNext":[^(){
				
				int k = [self cur];
				int l = children.length;
				while (k < l) {
					
					if (((NSMutableArray*)[children hx_objectAtIndex:k]).nodeType == ) break;
					k += @1;
				}
				[self cur] = k;
				return k < l;
			} copy],
				@"next":[^(){
				
				int k = [self cur];
				int l = children.length;
				while (k < l) {
					
					
					Xml *n = ((NSMutableArray*)[children hx_objectAtIndex:k]);
					k += @1;
					if (n.nodeType == ) {
						
						[self cur] = k;
						return n;
					}
				}
				return [NSNull null];
			} copy],
			} mutableCopy];
		}
		- (id) elementsNamed:(NSMutableString*)name{
			
			if (self._children == nil) @throw [@"bad nodetype" mutableCopy];
			
			NSMutableArray *children = self._children;
			return [@{
				@"cur":[@0 copy],
				@"hasNext":[^(){
				
				int k = [self cur];
				int l = children.length;
				while (k < l) {
					
					
					Xml *n = ((NSMutableArray*)[children hx_objectAtIndex:k]);
					if (n.nodeType ==  && n._nodeName == name) break;
					k++;
				}
				[self cur] = k;
				return k < l;
			} copy],
				@"next":[^(){
				
				int k = [self cur];
				int l = children.length;
				while (k < l) {
					
					
					Xml *n = ((NSMutableArray*)[children hx_objectAtIndex:k]);
					k++;
					if (n.nodeType ==  && n._nodeName == name) {
						
						[self cur] = k;
						return n;
					}
				}
				return [NSNull null];
			} copy],
			} mutableCopy];
		}
		- (Xml*) firstChild{
			
			if (self._children == nil) @throw [@"bad nodetype" mutableCopy];
			return ((Xml*)[self._children hx_objectAtIndex:0]);
		}
		- (Xml*) firstElement{
			
			if (self._children == nil) @throw [@"bad nodetype" mutableCopy];
			{
				
				int _g1 = 0; int _g = self._children.length;
				while (_g1 < _g) {
					
					int cur = _g1++;
					
					Xml *n = ((Xml*)[self._children hx_objectAtIndex:cur]);
					if (n.nodeType == ) return n;
				}
			}
			return nil;
		}
		- (void) addChild:(Xml*)x{
			
			if (self._children == nil) @throw [@"bad nodetype" mutableCopy];
			if (x._parent != nil) [x._parent._children remove:x];
			x._parent = self;
			[self._children push:x];
			{
			nil
			return{
				
				};
			}
			- (BOOL) removeChild:(Xml*)x{
				
				if (self._children == nil) @throw [@"bad nodetype" mutableCopy];
				BOOL b = [self._children remove:x];
				if (b) x._parent = nil;
				return b;
			}
			- (void) insertChild:(Xml*)x pos:(int)pos{
				
				if (self._children == nil) @throw [@"bad nodetype" mutableCopy];
				if (x._parent != nil) [x._parent._children remove:x];
				x._parent = self;
				[self._children insert:pos x:x];
				{
				nil
				return{
					
					};
				}
				- (NSMutableString*) toString{
					
					
					StringBuf *s = [[StringBuf alloc] init];
					[self toStringRec:s];
					return s.b;
				}
				- (void) toStringRec:(StringBuf*)s{
					
					switch (self.nodeType){
						case :{
							
							int _g = 0; 
							NSMutableArray *_g1 = self._children;
							while (_g < _g1.length) {
								
								
								Xml *x = ((Xml*)[_g1 hx_objectAtIndex:_g]);
								++_g;
								[x toStringRec:s];
							}
						}
						break;
						case :{
							
							[s.b appendString:[@"<" mutableCopy]];
							[s.b appendString:[Std string:self._nodeName]];
							{
								
								int _g = 0; 
								NSMutableArray *_g1 = [Reflect fields:self._attributes];
								while (_g < _g1.length) {
									
									
									NSMutableString *k = ((NSMutableString*)[_g1 hx_objectAtIndex:_g]);
									++_g;
									[s.b appendString:[@" " mutableCopy]];
									[s.b appendString:[Std string:k]];
									[s.b appendString:[@"=" mutableCopy]];
									[s.b appendString:[@"\"" mutableCopy]];
									[s.b appendString:[Std string:[Reflect field:self._attributes field:k]]];
									[s.b appendString:[@"\"" mutableCopy]];
								}
							}
							if (self._children.length == 0) {
								
								[s.b appendString:[@"/" mutableCopy]];
								[s.b appendString:[@">" mutableCopy]];
								return;
							}
							[s.b appendString:[@">" mutableCopy]];
							{
								
								int _g = 0; 
								NSMutableArray *_g1 = self._children;
								while (_g < _g1.length) {
									
									
									Xml *x = ((Xml*)[_g1 hx_objectAtIndex:_g]);
									++_g;
									[x toStringRec:s];
								}
							}
							[s.b appendString:[@"<" mutableCopy]];
							[s.b appendString:[@"/" mutableCopy]];
							[s.b appendString:[Std string:self._nodeName]];
							[s.b appendString:[@">" mutableCopy]];
						}
						break;
						case :[s.b appendString:[Std string:self._nodeValue]];
						break;
						case :{
							
							[s.b appendString:[@"<![CDATA[" mutableCopy]];
							[s.b appendString:[Std string:self._nodeValue]];
							[s.b appendString:[@"]]>" mutableCopy]];
						}
						break;
						case :{
							
							[s.b appendString:[@"<!--" mutableCopy]];
							[s.b appendString:[Std string:self._nodeValue]];
							[s.b appendString:[@"-->" mutableCopy]];
						}
						break;
						case :{
							
							[s.b appendString:[@"<!DOCTYPE " mutableCopy]];
							[s.b appendString:[Std string:self._nodeValue]];
							[s.b appendString:[@">" mutableCopy]];
						}
						break;
						case :{
							
							[s.b appendString:[@"<?" mutableCopy]];
							[s.b appendString:[Std string:self._nodeValue]];
							[s.b appendString:[@"?>" mutableCopy]];
						}
						break;
					}
				}
				- (id) init{
					
					self = [super init];
					return self;
				}

@end
