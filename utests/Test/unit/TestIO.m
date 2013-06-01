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
- (void) excv:(id)f e:(id)e pos:(id)pos{
	
	// Optional arguments
	if (!pos) pos = nil;
	
	@try {
		
		[f];
		[self eq:nil v2:e pos:pos];
	}
	@catch (NSException *e2) {
		
		[self eq:e2 v2:e pos:pos];
	}
}
- (void) check:(BOOL)endian{
	
	[self infos:[[@"endian = " mutableCopy] stringByAppendingString:[Std string:endian]]];
	
	Bytes *b = [Bytes ofString:[@"ABCééé\r\n\t" mutableCopy]];
	[self eq:b.length v2:12 pos:@{@"fileName":@"TestIO.hx", @"lineNumber":@"24", @"className":@"unit.TestIO", @"methodName":@"check"}];
	[b.b hx_replaceObjectAtIndex:1 withObject:@0];
	
	BytesOutput *o = [[BytesOutput alloc] init];
	[self eq:o.b.b.length v2:0 pos:@{@"fileName":@"TestIO.hx", @"lineNumber":@"28", @"className":@"unit.TestIO", @"methodName":@"check"}];
	[o set_bigEndian:endian];
	[self eq:o.bigEndian v2:endian pos:@{@"fileName":@"TestIO.hx", @"lineNumber":@"31", @"className":@"unit.TestIO", @"methodName":@"check"}];
	[o prepare:4];
	[o writeByte:0];
	[o writeByte:1];
	[o writeByte:2];
	[o writeByte:3];
	[self eq:o.b.b.length v2:4 pos:@{@"fileName":@"TestIO.hx", @"lineNumber":@"38", @"className":@"unit.TestIO", @"methodName":@"check"}];
	[o write:b];
	[o writeByte:55];
	[o writeBytes:b pos:3 len:5];
	[self excv:^(){
		
		[o writeBytes:b pos:-1 len:5];
	} e:OutsideBounds pos:@{@"fileName":@"TestIO.hx", @"lineNumber":@"43", @"className":@"unit.TestIO", @"methodName":@"check"}];
	[self excv:^(){
		
		[o writeBytes:b pos:3 len:-1];
	} e:OutsideBounds pos:@{@"fileName":@"TestIO.hx", @"lineNumber":@"44", @"className":@"unit.TestIO", @"methodName":@"check"}];
	[self excv:^(){
		
		[o writeBytes:b pos:3 len:20];
	} e:OutsideBounds pos:@{@"fileName":@"TestIO.hx", @"lineNumber":@"45", @"className":@"unit.TestIO", @"methodName":@"check"}];
	[o writeByte:98];
	[o writeDouble:1.23];
	[o writeDouble:-1.23];
	[o writeDouble:0.0];
	[o writeDouble:-0.0];
	[o writeFloat:1.2e10];
	[o writeFloat:-1.2e10];
	[o writeFloat:0.0];
	[o writeFloat:-0.0];
	[o writeByte:99];
	
	NSMutableString *str = [@"Héllo World !" mutableCopy];
	[o writeString:str];
	[self eq:o.b.b.length v2:86 pos:@{@"fileName":@"TestIO.hx", @"lineNumber":@"61", @"className":@"unit.TestIO", @"methodName":@"check"}];
	[o writeInt16:-12345];
	[self excv:^(){
		
		[o writeInt16:32768];
	} e:Overflow pos:@{@"fileName":@"TestIO.hx", @"lineNumber":@"64", @"className":@"unit.TestIO", @"methodName":@"check"}];
	[self excv:^(){
		
		[o writeInt16:-32769];
	} e:Overflow pos:@{@"fileName":@"TestIO.hx", @"lineNumber":@"65", @"className":@"unit.TestIO", @"methodName":@"check"}];
	[o writeInt24:-1234567];
	[self excv:^(){
		
		[o writeInt16:16777216];
	} e:Overflow pos:@{@"fileName":@"TestIO.hx", @"lineNumber":@"67", @"className":@"unit.TestIO", @"methodName":@"check"}];
	[self excv:^(){
		
		[o writeInt16:-16777217];
	} e:Overflow pos:@{@"fileName":@"TestIO.hx", @"lineNumber":@"68", @"className":@"unit.TestIO", @"methodName":@"check"}];
	[o writeInt32:-123456789];
	[o writeInt8:-5];
	[self excv:^(){
		
		[o writeInt8:128];
	} e:Overflow pos:@{@"fileName":@"TestIO.hx", @"lineNumber":@"72", @"className":@"unit.TestIO", @"methodName":@"check"}];
	[self excv:^(){
		
		[o writeInt8:-129];
	} e:Overflow pos:@{@"fileName":@"TestIO.hx", @"lineNumber":@"73", @"className":@"unit.TestIO", @"methodName":@"check"}];
	[o writeUInt16:65365];
	[self excv:^(){
		
		[o writeUInt16:65536];
	} e:Overflow pos:@{@"fileName":@"TestIO.hx", @"lineNumber":@"75", @"className":@"unit.TestIO", @"methodName":@"check"}];
	[self excv:^(){
		
		[o writeUInt16:-1];
	} e:Overflow pos:@{@"fileName":@"TestIO.hx", @"lineNumber":@"76", @"className":@"unit.TestIO", @"methodName":@"check"}];
	[o writeUInt24:16711918];
	[self excv:^(){
		
		[o writeUInt24:16777216];
	} e:Overflow pos:@{@"fileName":@"TestIO.hx", @"lineNumber":@"78", @"className":@"unit.TestIO", @"methodName":@"check"}];
	[self excv:^(){
		
		[o writeUInt24:-1];
	} e:Overflow pos:@{@"fileName":@"TestIO.hx", @"lineNumber":@"79", @"className":@"unit.TestIO", @"methodName":@"check"}];
	[o writeInt32:1068153804];
	[o writeInt32:-1593839907];
	[o writeInt32:-1056968995];
	
	BytesInput *i = [[BytesInput alloc] init:[o getBytes] pos:nil len:nil];
	[i set_bigEndian:endian];
	[self eq:i.pos v2:0 pos:@{@"fileName":@"TestIO.hx", @"lineNumber":@"87", @"className":@"unit.TestIO", @"methodName":@"check"}];
	[self eq:i.totlen v2:113 pos:@{@"fileName":@"TestIO.hx", @"lineNumber":@"88", @"className":@"unit.TestIO", @"methodName":@"check"}];
	[self eq:[i readInt32] v2:( (endian) ? 66051 : 50462976) pos:@{@"fileName":@"TestIO.hx", @"lineNumber":@"90", @"className":@"unit.TestIO", @"methodName":@"check"}];
	[self eq:[[i read:b length] compare:b] v2:0 pos:@{@"fileName":@"TestIO.hx", @"lineNumber":@"91", @"className":@"unit.TestIO", @"methodName":@"check"}];
	[self eq:[i readByte] v2:55 pos:@{@"fileName":@"TestIO.hx", @"lineNumber":@"92", @"className":@"unit.TestIO", @"methodName":@"check"}];
	[self eq:[[i read:5] compare:[b sub:3 len:5]] v2:0 pos:@{@"fileName":@"TestIO.hx", @"lineNumber":@"93", @"className":@"unit.TestIO", @"methodName":@"check"}];
	[self eq:[i readByte] v2:98 pos:@{@"fileName":@"TestIO.hx", @"lineNumber":@"95", @"className":@"unit.TestIO", @"methodName":@"check"}];
	[self eq:[i readDouble] v2:1.23 pos:@{@"fileName":@"TestIO.hx", @"lineNumber":@"96", @"className":@"unit.TestIO", @"methodName":@"check"}];
	[self eq:[i readDouble] v2:-1.23 pos:@{@"fileName":@"TestIO.hx", @"lineNumber":@"97", @"className":@"unit.TestIO", @"methodName":@"check"}];
	[self eq:[i readDouble] v2:0.0 pos:@{@"fileName":@"TestIO.hx", @"lineNumber":@"98", @"className":@"unit.TestIO", @"methodName":@"check"}];
	[self eq:[i readDouble] v2:-0.0 pos:@{@"fileName":@"TestIO.hx", @"lineNumber":@"99", @"className":@"unit.TestIO", @"methodName":@"check"}];
	[self eq:[i readFloat] v2:1.2e10 pos:@{@"fileName":@"TestIO.hx", @"lineNumber":@"100", @"className":@"unit.TestIO", @"methodName":@"check"}];
	[self eq:[i readFloat] v2:-1.2e10 pos:@{@"fileName":@"TestIO.hx", @"lineNumber":@"101", @"className":@"unit.TestIO", @"methodName":@"check"}];
	[self eq:[i readFloat] v2:0.0 pos:@{@"fileName":@"TestIO.hx", @"lineNumber":@"102", @"className":@"unit.TestIO", @"methodName":@"check"}];
	[self eq:[i readFloat] v2:-0.0 pos:@{@"fileName":@"TestIO.hx", @"lineNumber":@"103", @"className":@"unit.TestIO", @"methodName":@"check"}];
	[self eq:[i readByte] v2:99 pos:@{@"fileName":@"TestIO.hx", @"lineNumber":@"104", @"className":@"unit.TestIO", @"methodName":@"check"}];
	[self eq:[i readString:[Bytes ofString:str].length] v2:str pos:@{@"fileName":@"TestIO.hx", @"lineNumber":@"106", @"className":@"unit.TestIO", @"methodName":@"check"}];
	[self eq:[i readInt16] v2:-12345 pos:@{@"fileName":@"TestIO.hx", @"lineNumber":@"108", @"className":@"unit.TestIO", @"methodName":@"check"}];
	[self eq:[i readInt24] v2:-1234567 pos:@{@"fileName":@"TestIO.hx", @"lineNumber":@"109", @"className":@"unit.TestIO", @"methodName":@"check"}];
	[self eq:[i readInt32] v2:-123456789 pos:@{@"fileName":@"TestIO.hx", @"lineNumber":@"110", @"className":@"unit.TestIO", @"methodName":@"check"}];
	[self eq:[i readInt8] v2:-5 pos:@{@"fileName":@"TestIO.hx", @"lineNumber":@"111", @"className":@"unit.TestIO", @"methodName":@"check"}];
	[self eq:[i readUInt16] v2:65365 pos:@{@"fileName":@"TestIO.hx", @"lineNumber":@"112", @"className":@"unit.TestIO", @"methodName":@"check"}];
	[self eq:[i readUInt24] v2:16711918 pos:@{@"fileName":@"TestIO.hx", @"lineNumber":@"113", @"className":@"unit.TestIO", @"methodName":@"check"}];
	[self eq:[i readInt32] v2:1068153804 pos:@{@"fileName":@"TestIO.hx", @"lineNumber":@"114", @"className":@"unit.TestIO", @"methodName":@"check"}];
	[self eq:[i readInt32] v2:-1593839907 pos:@{@"fileName":@"TestIO.hx", @"lineNumber":@"116", @"className":@"unit.TestIO", @"methodName":@"check"}];
	[self eq:[i readInt32] v2:-1056968995 pos:@{@"fileName":@"TestIO.hx", @"lineNumber":@"117", @"className":@"unit.TestIO", @"methodName":@"check"}];
	[self eq:i.pos v2:i.totlen pos:@{@"fileName":@"TestIO.hx", @"lineNumber":@"119", @"className":@"unit.TestIO", @"methodName":@"check"}];
}
- (void) testBytesBounds{
	
	
	Bytes *b = [Bytes ofString:[@"ABCDEFGHIJ" mutableCopy]];
	
	Bytes *tmp = [Bytes alloc:7];
	
	BytesInput *i = [[BytesInput alloc] init:b pos:nil len:nil];
	[self excv:^(){
		
		[i readBytes:tmp pos:1 len:7];
	} e:OutsideBounds pos:@{@"fileName":@"TestIO.hx", @"lineNumber":@"126", @"className":@"unit.TestIO", @"methodName":@"testBytesBounds"}];
	[self excv:^(){
		
		[i readBytes:tmp pos:-1 len:7];
	} e:OutsideBounds pos:@{@"fileName":@"TestIO.hx", @"lineNumber":@"127", @"className":@"unit.TestIO", @"methodName":@"testBytesBounds"}];
	[self excv:^(){
		
		[i readBytes:tmp pos:8 len:1];
	} e:OutsideBounds pos:@{@"fileName":@"TestIO.hx", @"lineNumber":@"128", @"className":@"unit.TestIO", @"methodName":@"testBytesBounds"}];
	[self eq:[i readBytes:tmp pos:0 len:7] v2:7 pos:@{@"fileName":@"TestIO.hx", @"lineNumber":@"129", @"className":@"unit.TestIO", @"methodName":@"testBytesBounds"}];
	[self eq:((BytesData*)[tmp.b hx_objectAtIndex:0]) v2:65 pos:@{@"fileName":@"TestIO.hx", @"lineNumber":@"130", @"className":@"unit.TestIO", @"methodName":@"testBytesBounds"}];
	[self eq:((BytesData*)[tmp.b hx_objectAtIndex:6]) v2:71 pos:@{@"fileName":@"TestIO.hx", @"lineNumber":@"131", @"className":@"unit.TestIO", @"methodName":@"testBytesBounds"}];
	[self eq:[i readBytes:tmp pos:0 len:7] v2:3 pos:@{@"fileName":@"TestIO.hx", @"lineNumber":@"132", @"className":@"unit.TestIO", @"methodName":@"testBytesBounds"}];
	[self eq:((BytesData*)[tmp.b hx_objectAtIndex:0]) v2:72 pos:@{@"fileName":@"TestIO.hx", @"lineNumber":@"133", @"className":@"unit.TestIO", @"methodName":@"testBytesBounds"}];
	[self eq:((BytesData*)[tmp.b hx_objectAtIndex:2]) v2:74 pos:@{@"fileName":@"TestIO.hx", @"lineNumber":@"134", @"className":@"unit.TestIO", @"methodName":@"testBytesBounds"}];
	[self eq:((BytesData*)[tmp.b hx_objectAtIndex:3]) v2:68 pos:@{@"fileName":@"TestIO.hx", @"lineNumber":@"135", @"className":@"unit.TestIO", @"methodName":@"testBytesBounds"}];
	[self exc:^(){
		
		[i readBytes:tmp pos:0 len:7];
	} pos:@{@"fileName":@"TestIO.hx", @"lineNumber":@"136", @"className":@"unit.TestIO", @"methodName":@"testBytesBounds"}];
}

@end
