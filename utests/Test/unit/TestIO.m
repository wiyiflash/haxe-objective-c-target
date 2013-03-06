//
//  TestIO
//  Test
//
//  Source generated by Haxe Objective-C target
//

#import "../unit/TestIO.h"

@implementation TestIO

- (void) test{
	[self check:NO];
	[self check:YES];
}
- (void) excv:(SEL)f e:(id)e pos:(id)pos{
	// Simulated optional arguments
	if (pos == nil) pos = nil;
	
	@try {
		[f];
		[self eq:nil v2:e pos:pos];
	}
	@catch (NSException *e2) {
		[self eq:e2 v2:e pos:pos];
	}
}
- (void) check:(BOOL)endian{
	[self infos:[(NSMutableString*)@"endian = " stringByAppendingString:[Std string:endian]]];
	
	NSMutableArray *b = [[NSMutableArray alloc] initWithObjects:[Bytes ofString:(NSMutableString*)@"ABCééé\r\n\t"], nil];
	[self eq:[b objectAtIndex:0] length v2:12 pos:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"TestIO.hx",@"24",@"unit.TestIO",@"check",nil] forKeys:[NSArray arrayWithObjects:@"fileName",@"lineNumber",@"className",@"methodName",nil]]];
	[[b objectAtIndex:0].b objectAtIndex:1] = 0;
	
	NSMutableArray *o = [[NSMutableArray alloc] initWithObjects:[[BytesOutput alloc] init], nil];
	[[o objectAtIndex:0] set_bigEndian:endian];
	[self eq:[o objectAtIndex:0] bigEndian v2:endian pos:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"TestIO.hx",@"30",@"unit.TestIO",@"check",nil] forKeys:[NSArray arrayWithObjects:@"fileName",@"lineNumber",@"className",@"methodName",nil]]];
	[[o objectAtIndex:0] prepare:4];
	[[o objectAtIndex:0] writeByte:0];
	[[o objectAtIndex:0] writeByte:1];
	[[o objectAtIndex:0] writeByte:2];
	[[o objectAtIndex:0] writeByte:3];
	[[o objectAtIndex:0] write:[b objectAtIndex:0]];
	[[o objectAtIndex:0] writeByte:55];
	[[o objectAtIndex:0] writeBytes:[b objectAtIndex:0] pos:3 len:5];
	[self excv:^- (void) {
		[[o objectAtIndex:0] writeBytes:[b objectAtIndex:0] pos:-1 len:5];
	} e: OutsideBounds pos:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"TestIO.hx",@"41",@"unit.TestIO",@"check",nil] forKeys:[NSArray arrayWithObjects:@"fileName",@"lineNumber",@"className",@"methodName",nil]]];
	[self excv:^- (void) {
		[[o objectAtIndex:0] writeBytes:[b objectAtIndex:0] pos:3 len:-1];
	} e: OutsideBounds pos:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"TestIO.hx",@"42",@"unit.TestIO",@"check",nil] forKeys:[NSArray arrayWithObjects:@"fileName",@"lineNumber",@"className",@"methodName",nil]]];
	[self excv:^- (void) {
		[[o objectAtIndex:0] writeBytes:[b objectAtIndex:0] pos:3 len:20];
	} e: OutsideBounds pos:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"TestIO.hx",@"43",@"unit.TestIO",@"check",nil] forKeys:[NSArray arrayWithObjects:@"fileName",@"lineNumber",@"className",@"methodName",nil]]];
	[[o objectAtIndex:0] writeByte:98];
	[[o objectAtIndex:0] writeDouble:1.23];
	[[o objectAtIndex:0] writeDouble:-1.23];
	[[o objectAtIndex:0] writeDouble:0.0];
	[[o objectAtIndex:0] writeDouble:-0.0];
	[[o objectAtIndex:0] writeFloat:1.2e10];
	[[o objectAtIndex:0] writeFloat:-1.2e10];
	[[o objectAtIndex:0] writeFloat:0.0];
	[[o objectAtIndex:0] writeFloat:-0.0];
	[[o objectAtIndex:0] writeByte:99];
	
	NSMutableString *str = (NSMutableString*)@"Héllo World !";
	[[o objectAtIndex:0] writeString:str];
	[[o objectAtIndex:0] writeInt16:-12345];
	[self excv:^- (void) {
		[[o objectAtIndex:0] writeInt16:32768];
	} e: Overflow pos:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"TestIO.hx",@"60",@"unit.TestIO",@"check",nil] forKeys:[NSArray arrayWithObjects:@"fileName",@"lineNumber",@"className",@"methodName",nil]]];
	[self excv:^- (void) {
		[[o objectAtIndex:0] writeInt16:-32769];
	} e: Overflow pos:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"TestIO.hx",@"61",@"unit.TestIO",@"check",nil] forKeys:[NSArray arrayWithObjects:@"fileName",@"lineNumber",@"className",@"methodName",nil]]];
	[[o objectAtIndex:0] writeInt24:-1234567];
	[self excv:^- (void) {
		[[o objectAtIndex:0] writeInt16:16777216];
	} e: Overflow pos:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"TestIO.hx",@"63",@"unit.TestIO",@"check",nil] forKeys:[NSArray arrayWithObjects:@"fileName",@"lineNumber",@"className",@"methodName",nil]]];
	[self excv:^- (void) {
		[[o objectAtIndex:0] writeInt16:-16777217];
	} e: Overflow pos:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"TestIO.hx",@"64",@"unit.TestIO",@"check",nil] forKeys:[NSArray arrayWithObjects:@"fileName",@"lineNumber",@"className",@"methodName",nil]]];
	[[o objectAtIndex:0] writeInt32:-123456789];
	[[o objectAtIndex:0] writeInt8:-5];
	[self excv:^- (void) {
		[[o objectAtIndex:0] writeInt8:128];
	} e: Overflow pos:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"TestIO.hx",@"68",@"unit.TestIO",@"check",nil] forKeys:[NSArray arrayWithObjects:@"fileName",@"lineNumber",@"className",@"methodName",nil]]];
	[self excv:^- (void) {
		[[o objectAtIndex:0] writeInt8:-129];
	} e: Overflow pos:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"TestIO.hx",@"69",@"unit.TestIO",@"check",nil] forKeys:[NSArray arrayWithObjects:@"fileName",@"lineNumber",@"className",@"methodName",nil]]];
	[[o objectAtIndex:0] writeUInt16:65365];
	[self excv:^- (void) {
		[[o objectAtIndex:0] writeUInt16:65536];
	} e: Overflow pos:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"TestIO.hx",@"71",@"unit.TestIO",@"check",nil] forKeys:[NSArray arrayWithObjects:@"fileName",@"lineNumber",@"className",@"methodName",nil]]];
	[self excv:^- (void) {
		[[o objectAtIndex:0] writeUInt16:-1];
	} e: Overflow pos:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"TestIO.hx",@"72",@"unit.TestIO",@"check",nil] forKeys:[NSArray arrayWithObjects:@"fileName",@"lineNumber",@"className",@"methodName",nil]]];
	[[o objectAtIndex:0] writeUInt24:16711918];
	[self excv:^- (void) {
		[[o objectAtIndex:0] writeUInt24:16777216];
	} e: Overflow pos:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"TestIO.hx",@"74",@"unit.TestIO",@"check",nil] forKeys:[NSArray arrayWithObjects:@"fileName",@"lineNumber",@"className",@"methodName",nil]]];
	[self excv:^- (void) {
		[[o objectAtIndex:0] writeUInt24:-1];
	} e: Overflow pos:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"TestIO.hx",@"75",@"unit.TestIO",@"check",nil] forKeys:[NSArray arrayWithObjects:@"fileName",@"lineNumber",@"className",@"methodName",nil]]];
	[[o objectAtIndex:0] writeInt32:1068153804];
	[[o objectAtIndex:0] writeInt32:-1593839907];
	[[o objectAtIndex:0] writeInt32:-1056968995];
	[self unspec:^- (void) {
		[[o objectAtIndex:0] writeByte:-1];
	} pos:nil];
	[self unspec:^- (void) {
		[[o objectAtIndex:0] writeByte:257];
	} pos:nil];
	
	BytesInput *i = [[BytesInput alloc] init:[[o objectAtIndex:0] getBytes] pos:nil len:nil];
	[i set_bigEndian:endian];
	[self eq:[i readInt32] v2:( (endian) ? 66051 : 50462976) pos:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"TestIO.hx",@"86",@"unit.TestIO",@"check",nil] forKeys:[NSArray arrayWithObjects:@"fileName",@"lineNumber",@"className",@"methodName",nil]]];
	[self eq:[[i read:[b objectAtIndex:0] length] compare:[b objectAtIndex:0]] v2:0 pos:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"TestIO.hx",@"87",@"unit.TestIO",@"check",nil] forKeys:[NSArray arrayWithObjects:@"fileName",@"lineNumber",@"className",@"methodName",nil]]];
	[self eq:[i readByte] v2:55 pos:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"TestIO.hx",@"88",@"unit.TestIO",@"check",nil] forKeys:[NSArray arrayWithObjects:@"fileName",@"lineNumber",@"className",@"methodName",nil]]];
	[self eq:[[i read:5] compare:[[b objectAtIndex:0] sub:3 len:5]] v2:0 pos:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"TestIO.hx",@"89",@"unit.TestIO",@"check",nil] forKeys:[NSArray arrayWithObjects:@"fileName",@"lineNumber",@"className",@"methodName",nil]]];
	[self eq:[i readByte] v2:98 pos:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"TestIO.hx",@"91",@"unit.TestIO",@"check",nil] forKeys:[NSArray arrayWithObjects:@"fileName",@"lineNumber",@"className",@"methodName",nil]]];
	[self eq:[i readDouble] v2:1.23 pos:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"TestIO.hx",@"92",@"unit.TestIO",@"check",nil] forKeys:[NSArray arrayWithObjects:@"fileName",@"lineNumber",@"className",@"methodName",nil]]];
	[self eq:[i readDouble] v2:-1.23 pos:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"TestIO.hx",@"93",@"unit.TestIO",@"check",nil] forKeys:[NSArray arrayWithObjects:@"fileName",@"lineNumber",@"className",@"methodName",nil]]];
	[self eq:[i readDouble] v2:0.0 pos:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"TestIO.hx",@"94",@"unit.TestIO",@"check",nil] forKeys:[NSArray arrayWithObjects:@"fileName",@"lineNumber",@"className",@"methodName",nil]]];
	[self eq:[i readDouble] v2:-0.0 pos:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"TestIO.hx",@"95",@"unit.TestIO",@"check",nil] forKeys:[NSArray arrayWithObjects:@"fileName",@"lineNumber",@"className",@"methodName",nil]]];
	[self eq:[i readFloat] v2:1.2e10 pos:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"TestIO.hx",@"96",@"unit.TestIO",@"check",nil] forKeys:[NSArray arrayWithObjects:@"fileName",@"lineNumber",@"className",@"methodName",nil]]];
	[self eq:[i readFloat] v2:-1.2e10 pos:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"TestIO.hx",@"97",@"unit.TestIO",@"check",nil] forKeys:[NSArray arrayWithObjects:@"fileName",@"lineNumber",@"className",@"methodName",nil]]];
	[self eq:[i readFloat] v2:0.0 pos:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"TestIO.hx",@"98",@"unit.TestIO",@"check",nil] forKeys:[NSArray arrayWithObjects:@"fileName",@"lineNumber",@"className",@"methodName",nil]]];
	[self eq:[i readFloat] v2:-0.0 pos:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"TestIO.hx",@"99",@"unit.TestIO",@"check",nil] forKeys:[NSArray arrayWithObjects:@"fileName",@"lineNumber",@"className",@"methodName",nil]]];
	[self eq:[i readByte] v2:99 pos:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"TestIO.hx",@"100",@"unit.TestIO",@"check",nil] forKeys:[NSArray arrayWithObjects:@"fileName",@"lineNumber",@"className",@"methodName",nil]]];
	[self eq:[i readString:[Bytes ofString:str] length] v2:str pos:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"TestIO.hx",@"102",@"unit.TestIO",@"check",nil] forKeys:[NSArray arrayWithObjects:@"fileName",@"lineNumber",@"className",@"methodName",nil]]];
	[self eq:[i readInt16] v2:-12345 pos:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"TestIO.hx",@"104",@"unit.TestIO",@"check",nil] forKeys:[NSArray arrayWithObjects:@"fileName",@"lineNumber",@"className",@"methodName",nil]]];
	[self eq:[i readInt24] v2:-1234567 pos:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"TestIO.hx",@"105",@"unit.TestIO",@"check",nil] forKeys:[NSArray arrayWithObjects:@"fileName",@"lineNumber",@"className",@"methodName",nil]]];
	[self eq:[i readInt32] v2:-123456789 pos:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"TestIO.hx",@"106",@"unit.TestIO",@"check",nil] forKeys:[NSArray arrayWithObjects:@"fileName",@"lineNumber",@"className",@"methodName",nil]]];
	[self eq:[i readInt8] v2:-5 pos:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"TestIO.hx",@"107",@"unit.TestIO",@"check",nil] forKeys:[NSArray arrayWithObjects:@"fileName",@"lineNumber",@"className",@"methodName",nil]]];
	[self eq:[i readUInt16] v2:65365 pos:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"TestIO.hx",@"108",@"unit.TestIO",@"check",nil] forKeys:[NSArray arrayWithObjects:@"fileName",@"lineNumber",@"className",@"methodName",nil]]];
	[self eq:[i readUInt24] v2:16711918 pos:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"TestIO.hx",@"109",@"unit.TestIO",@"check",nil] forKeys:[NSArray arrayWithObjects:@"fileName",@"lineNumber",@"className",@"methodName",nil]]];
	[self eq:[i readInt32] v2:1068153804 pos:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"TestIO.hx",@"110",@"unit.TestIO",@"check",nil] forKeys:[NSArray arrayWithObjects:@"fileName",@"lineNumber",@"className",@"methodName",nil]]];
	[self eq:[i readInt32] v2:-1593839907 pos:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"TestIO.hx",@"112",@"unit.TestIO",@"check",nil] forKeys:[NSArray arrayWithObjects:@"fileName",@"lineNumber",@"className",@"methodName",nil]]];
	[self eq:[i readInt32] v2:-1056968995 pos:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"TestIO.hx",@"113",@"unit.TestIO",@"check",nil] forKeys:[NSArray arrayWithObjects:@"fileName",@"lineNumber",@"className",@"methodName",nil]]];
}
- (void) testBytesBounds{
	
	Bytes *b = [Bytes ofString:(NSMutableString*)@"ABCDEFGHIJ"];
	
	NSMutableArray *tmp = [[NSMutableArray alloc] initWithObjects:[Bytes alloc:[NSNumber numberWithInt:7]], nil];
	
	NSMutableArray *i = [[NSMutableArray alloc] initWithObjects:[[BytesInput alloc] init:b pos:[NSNull null] len:[NSNull null]], nil];
	[self excv:^- (void) {
		[[i objectAtIndex:0] readBytes:[tmp objectAtIndex:0] pos:1 len:7];
	} e: OutsideBounds pos:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"TestIO.hx",@"121",@"unit.TestIO",@"testBytesBounds",nil] forKeys:[NSArray arrayWithObjects:@"fileName",@"lineNumber",@"className",@"methodName",nil]]];
	[self excv:^- (void) {
		[[i objectAtIndex:0] readBytes:[tmp objectAtIndex:0] pos:-1 len:7];
	} e: OutsideBounds pos:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"TestIO.hx",@"122",@"unit.TestIO",@"testBytesBounds",nil] forKeys:[NSArray arrayWithObjects:@"fileName",@"lineNumber",@"className",@"methodName",nil]]];
	[self excv:^- (void) {
		[[i objectAtIndex:0] readBytes:[tmp objectAtIndex:0] pos:8 len:1];
	} e: OutsideBounds pos:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"TestIO.hx",@"123",@"unit.TestIO",@"testBytesBounds",nil] forKeys:[NSArray arrayWithObjects:@"fileName",@"lineNumber",@"className",@"methodName",nil]]];
	[self eq:[[i objectAtIndex:0] readBytes:[tmp objectAtIndex:0] pos:0 len:7] v2:7 pos:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"TestIO.hx",@"124",@"unit.TestIO",@"testBytesBounds",nil] forKeys:[NSArray arrayWithObjects:@"fileName",@"lineNumber",@"className",@"methodName",nil]]];
	[self eq:[[tmp objectAtIndex:0] b objectAtIndex:0] v2:65 pos:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"TestIO.hx",@"125",@"unit.TestIO",@"testBytesBounds",nil] forKeys:[NSArray arrayWithObjects:@"fileName",@"lineNumber",@"className",@"methodName",nil]]];
	[self eq:[[tmp objectAtIndex:0] b objectAtIndex:6] v2:71 pos:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"TestIO.hx",@"126",@"unit.TestIO",@"testBytesBounds",nil] forKeys:[NSArray arrayWithObjects:@"fileName",@"lineNumber",@"className",@"methodName",nil]]];
	[self eq:[[i objectAtIndex:0] readBytes:[tmp objectAtIndex:0] pos:0 len:7] v2:3 pos:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"TestIO.hx",@"127",@"unit.TestIO",@"testBytesBounds",nil] forKeys:[NSArray arrayWithObjects:@"fileName",@"lineNumber",@"className",@"methodName",nil]]];
	[self eq:[[tmp objectAtIndex:0] b objectAtIndex:0] v2:72 pos:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"TestIO.hx",@"128",@"unit.TestIO",@"testBytesBounds",nil] forKeys:[NSArray arrayWithObjects:@"fileName",@"lineNumber",@"className",@"methodName",nil]]];
	[self eq:[[tmp objectAtIndex:0] b objectAtIndex:2] v2:74 pos:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"TestIO.hx",@"129",@"unit.TestIO",@"testBytesBounds",nil] forKeys:[NSArray arrayWithObjects:@"fileName",@"lineNumber",@"className",@"methodName",nil]]];
	[self eq:[[tmp objectAtIndex:0] b objectAtIndex:3] v2:68 pos:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"TestIO.hx",@"130",@"unit.TestIO",@"testBytesBounds",nil] forKeys:[NSArray arrayWithObjects:@"fileName",@"lineNumber",@"className",@"methodName",nil]]];
	[self exc:^- (void) {
		[[i objectAtIndex:0] readBytes:[tmp objectAtIndex:0] pos:0 len:7];
	} pos:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"TestIO.hx",@"131",@"unit.TestIO",@"testBytesBounds",nil] forKeys:[NSArray arrayWithObjects:@"fileName",@"lineNumber",@"className",@"methodName",nil]]];
}
- (id) init{
	self = [super init];
	[super];
	return self;
}

@end