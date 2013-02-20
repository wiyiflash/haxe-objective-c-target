
namespace haxe.io
{
	public  class Input : haxe.lang.HxObject 
	{
		public    Input() : base()
		{
			unchecked 
			{
			}
		}
		
		
		public static   object __hx_createEmpty()
		{
			unchecked 
			{
				return new haxe.io.Input(haxe.lang.EmptyObject.EMPTY);
			}
		}
		
		
		public static   object __hx_create(Array arr)
		{
			unchecked 
			{
				return new haxe.io.Input();
			}
		}
		
		
		public    Input(haxe.lang.EmptyObject empty) : base()
		{
			unchecked 
			{
			}
		}
		
		
		public virtual   string readString(int len)
		{
			unchecked 
			{
				haxe.io.Bytes b = haxe.io.Bytes.alloc(len);
				this.readFullBytes(b, 0, len);
				return b.toString();
			}
		}
		
		
		public virtual   int readInt32()
		{
			unchecked 
			{
				int ch1 = this.readByte();
				int ch2 = this.readByte();
				int ch3 = this.readByte();
				int ch4 = this.readByte();
				return ( (this.bigEndian) ? (((int) (( ( (( ( ch1 << 8 ) | ch2 )) << 16 ) | (( ( ch3 << 8 ) | ch4 )) )) )) : (((int) (( ( (( ( ch4 << 8 ) | ch3 )) << 16 ) | (( ( ch2 << 8 ) | ch1 )) )) )) );
			}
		}
		
		
		public virtual   int readUInt30()
		{
			unchecked 
			{
				int ch1 = this.readByte();
				int ch2 = this.readByte();
				int ch3 = this.readByte();
				int ch4 = this.readByte();
				if (( (( (this.bigEndian) ? (ch1) : (ch4) )) >= 64 )) 
				{
					throw haxe.lang.HaxeException.wrap(haxe.io.Error.Overflow);
				}
				
				return ( (this.bigEndian) ? (( ( ( ch4 | ( ch3 << 8 ) ) | ( ch2 << 16 ) ) | ( ch1 << 24 ) )) : (( ( ( ch1 | ( ch2 << 8 ) ) | ( ch3 << 16 ) ) | ( ch4 << 24 ) )) );
			}
		}
		
		
		public virtual   int readInt31()
		{
			unchecked 
			{
				int ch1;
				int ch2;
				int ch3;
				int ch4;
				if (this.bigEndian) 
				{
					ch4 = this.readByte();
					ch3 = this.readByte();
					ch2 = this.readByte();
					ch1 = this.readByte();
				}
				 else 
				{
					ch1 = this.readByte();
					ch2 = this.readByte();
					ch3 = this.readByte();
					ch4 = this.readByte();
				}
				
				if (( ( (( ch4 & 128 )) == 0 ) != (( (( ch4 & 64 )) == 0 )) )) 
				{
					throw haxe.lang.HaxeException.wrap(haxe.io.Error.Overflow);
				}
				
				return ( ( ( ch1 | ( ch2 << 8 ) ) | ( ch3 << 16 ) ) | ( ch4 << 24 ) );
			}
		}
		
		
		public virtual   int readUInt24()
		{
			unchecked 
			{
				int ch1 = this.readByte();
				int ch2 = this.readByte();
				int ch3 = this.readByte();
				return ( (this.bigEndian) ? (( ( ch3 | ( ch2 << 8 ) ) | ( ch1 << 16 ) )) : (( ( ch1 | ( ch2 << 8 ) ) | ( ch3 << 16 ) )) );
			}
		}
		
		
		public virtual   int readInt24()
		{
			unchecked 
			{
				int ch1 = this.readByte();
				int ch2 = this.readByte();
				int ch3 = this.readByte();
				int n = ( (this.bigEndian) ? (( ( ch3 | ( ch2 << 8 ) ) | ( ch1 << 16 ) )) : (( ( ch1 | ( ch2 << 8 ) ) | ( ch3 << 16 ) )) );
				if (( (( n & 8388608 )) != 0 )) 
				{
					return ( n - 16777216 );
				}
				
				return n;
			}
		}
		
		
		public virtual   int readUInt16()
		{
			unchecked 
			{
				int ch1 = this.readByte();
				int ch2 = this.readByte();
				return ( (this.bigEndian) ? (( ch2 | ( ch1 << 8 ) )) : (( ch1 | ( ch2 << 8 ) )) );
			}
		}
		
		
		public virtual   int readInt16()
		{
			unchecked 
			{
				int ch1 = this.readByte();
				int ch2 = this.readByte();
				int n = ( (this.bigEndian) ? (( ch2 | ( ch1 << 8 ) )) : (( ch1 | ( ch2 << 8 ) )) );
				if (( (( n & 32768 )) != 0 )) 
				{
					return ( n - 65536 );
				}
				
				return n;
			}
		}
		
		
		public virtual   int readInt8()
		{
			unchecked 
			{
				int n = this.readByte();
				if (( n >= 128 )) 
				{
					return ( n - 256 );
				}
				
				return n;
			}
		}
		
		
		public virtual   double readDouble()
		{
			unchecked 
			{
				if (( this.helper == default(byte[]) )) 
				{
					this.helper = new byte[8];
				}
				
				byte[] helper = this.helper;
				if (( this.bigEndian ==  ! (System.BitConverter.IsLittleEndian)  )) 
				{
					helper[0] = ((byte) (this.readByte()) );
					helper[1] = ((byte) (this.readByte()) );
					helper[2] = ((byte) (this.readByte()) );
					helper[3] = ((byte) (this.readByte()) );
					helper[4] = ((byte) (this.readByte()) );
					helper[5] = ((byte) (this.readByte()) );
					helper[6] = ((byte) (this.readByte()) );
					helper[7] = ((byte) (this.readByte()) );
				}
				 else 
				{
					helper[7] = ((byte) (this.readByte()) );
					helper[6] = ((byte) (this.readByte()) );
					helper[5] = ((byte) (this.readByte()) );
					helper[4] = ((byte) (this.readByte()) );
					helper[3] = ((byte) (this.readByte()) );
					helper[2] = ((byte) (this.readByte()) );
					helper[1] = ((byte) (this.readByte()) );
					helper[0] = ((byte) (this.readByte()) );
				}
				
				return System.BitConverter.ToDouble(helper, 0);
			}
		}
		
		
		public virtual   double readFloat()
		{
			unchecked 
			{
				if (( this.helper == default(byte[]) )) 
				{
					this.helper = new byte[8];
				}
				
				byte[] helper = this.helper;
				if (( this.bigEndian ==  ! (System.BitConverter.IsLittleEndian)  )) 
				{
					helper[0] = ((byte) (this.readByte()) );
					helper[1] = ((byte) (this.readByte()) );
					helper[2] = ((byte) (this.readByte()) );
					helper[3] = ((byte) (this.readByte()) );
				}
				 else 
				{
					helper[3] = ((byte) (this.readByte()) );
					helper[2] = ((byte) (this.readByte()) );
					helper[1] = ((byte) (this.readByte()) );
					helper[0] = ((byte) (this.readByte()) );
				}
				
				return ((double) (System.BitConverter.ToSingle(helper, 0)) );
			}
		}
		
		
		public virtual   string readLine()
		{
			unchecked 
			{
				StringBuf buf = new StringBuf();
				int last;
				string s;
				try 
				{
					while (( (last = this.readByte()) != 10 ))
					{
						buf.b.Append(((char) (last) ));
					}
					
					s = buf.toString();
					if (haxe.lang.Runtime.eq((haxe.lang.StringExt.charCodeAt(s, ( s.Length - 1 ))).toDynamic(), 13)) 
					{
						s = haxe.lang.StringExt.substr(s, 0, new haxe.lang.Null<int>(-1, true));
					}
					
				}
				catch (System.Exception __temp_catchallException96)
				{
					object __temp_catchall97 = __temp_catchallException96;
					if (( __temp_catchall97 is haxe.lang.HaxeException )) 
					{
						__temp_catchall97 = ((haxe.lang.HaxeException) (__temp_catchallException96) ).obj;
					}
					
					if (( __temp_catchall97 is haxe.io.Eof )) 
					{
						haxe.io.Eof e = ((haxe.io.Eof) (__temp_catchall97) );
						{
							s = buf.toString();
							if (( s.Length == 0 )) 
							{
								throw haxe.lang.HaxeException.wrap(e);
							}
							
						}
						
					}
					 else 
					{
						throw;
					}
					
				}
				
				
				return s;
			}
		}
		
		
		public virtual   string readUntil(int end)
		{
			unchecked 
			{
				StringBuf buf = new StringBuf();
				int last;
				while (( (last = this.readByte()) != end ))
				{
					buf.b.Append(((char) (last) ));
				}
				
				return buf.toString();
			}
		}
		
		
		public virtual   haxe.io.Bytes read(int nbytes)
		{
			unchecked 
			{
				haxe.io.Bytes s = haxe.io.Bytes.alloc(nbytes);
				int p = 0;
				while (( nbytes > 0 ))
				{
					int k = this.readBytes(s, p, nbytes);
					if (( k == 0 )) 
					{
						throw haxe.lang.HaxeException.wrap(haxe.io.Error.Blocked);
					}
					
					p += k;
					nbytes -= k;
				}
				
				return s;
			}
		}
		
		
		public virtual   void readFullBytes(haxe.io.Bytes s, int pos, int len)
		{
			unchecked 
			{
				while (( len > 0 ))
				{
					int k = this.readBytes(s, pos, len);
					pos += k;
					len -= k;
				}
				
			}
		}
		
		
		public virtual   haxe.io.Bytes readAll(haxe.lang.Null<int> bufsize)
		{
			unchecked 
			{
				if ( ! (bufsize.hasValue) ) 
				{
					bufsize = new haxe.lang.Null<int>(new haxe.lang.Null<int>(16384, true).@value, true);
				}
				
				haxe.io.Bytes buf = haxe.io.Bytes.alloc(bufsize.@value);
				haxe.io.BytesBuffer total = new haxe.io.BytesBuffer();
				try 
				{
					while (true)
					{
						int len = this.readBytes(buf, 0, bufsize.@value);
						if (( len == 0 )) 
						{
							throw haxe.lang.HaxeException.wrap(haxe.io.Error.Blocked);
						}
						
						{
							if (( ( len < 0 ) || ( len > buf.length ) )) 
							{
								throw haxe.lang.HaxeException.wrap(haxe.io.Error.OutsideBounds);
							}
							
							total.b.Write(buf.b, 0, len);
						}
						
					}
					
				}
				catch (System.Exception __temp_catchallException98)
				{
					object __temp_catchall99 = __temp_catchallException98;
					if (( __temp_catchall99 is haxe.lang.HaxeException )) 
					{
						__temp_catchall99 = ((haxe.lang.HaxeException) (__temp_catchallException98) ).obj;
					}
					
					if (( __temp_catchall99 is haxe.io.Eof )) 
					{
						haxe.io.Eof e = ((haxe.io.Eof) (__temp_catchall99) );
						{
							{
							}
							
						}
						
					}
					 else 
					{
						throw;
					}
					
				}
				
				
				return total.getBytes();
			}
		}
		
		
		public virtual   bool setEndian(bool b)
		{
			unchecked 
			{
				this.bigEndian = b;
				return b;
			}
		}
		
		
		public virtual   void close()
		{
			unchecked 
			{
				{
				}
				
			}
		}
		
		
		public virtual   int readBytes(haxe.io.Bytes s, int pos, int len)
		{
			unchecked 
			{
				int k = len;
				byte[] b = s.b;
				if (( ( ( pos < 0 ) || ( len < 0 ) ) || ( ( pos + len ) > s.length ) )) 
				{
					throw haxe.lang.HaxeException.wrap(haxe.io.Error.OutsideBounds);
				}
				
				while (( k > 0 ))
				{
					b[pos] = ((byte) (this.readByte()) );
					pos++;
					k--;
				}
				
				return len;
			}
		}
		
		
		public virtual   int readByte()
		{
			unchecked 
			{
				throw haxe.lang.HaxeException.wrap("Not implemented");
			}
		}
		
		
		public  byte[] helper;
		
		public  bool bigEndian;
		
		public override   object __hx_setField(string field, int hash, object @value, bool handleProperties)
		{
			unchecked 
			{
				switch (hash)
				{
					case 542823803:
					{
						if (handleProperties) 
						{
							this.setEndian(((bool) (@value) ));
							return @value;
						}
						 else 
						{
							this.bigEndian = ((bool) (@value) );
							return @value;
						}
						
					}
					
					
					case 72252782:
					{
						this.helper = ((byte[]) (@value) );
						return @value;
					}
					
					
					default:
					{
						return base.__hx_setField(field, hash, @value, handleProperties);
					}
					
				}
				
			}
		}
		
		
		public override   object __hx_getField(string field, int hash, bool throwErrors, bool isCheck, bool handleProperties)
		{
			unchecked 
			{
				switch (hash)
				{
					case 542823803:
					{
						return this.bigEndian;
					}
					
					
					case 72252782:
					{
						return this.helper;
					}
					
					
					case 1763375486:
					{
						return new haxe.lang.Closure(this, "readByte", 1763375486);
					}
					
					
					case 243225909:
					{
						return new haxe.lang.Closure(this, "readBytes", 243225909);
					}
					
					
					case 1214453688:
					{
						return new haxe.lang.Closure(this, "close", 1214453688);
					}
					
					
					case 1513098717:
					{
						return new haxe.lang.Closure(this, "setEndian", 1513098717);
					}
					
					
					case 46374763:
					{
						return new haxe.lang.Closure(this, "readAll", 46374763);
					}
					
					
					case 1309344294:
					{
						return new haxe.lang.Closure(this, "readFullBytes", 1309344294);
					}
					
					
					case 1269254998:
					{
						return new haxe.lang.Closure(this, "read", 1269254998);
					}
					
					
					case 2010580328:
					{
						return new haxe.lang.Closure(this, "readUntil", 2010580328);
					}
					
					
					case 1873474154:
					{
						return new haxe.lang.Closure(this, "readLine", 1873474154);
					}
					
					
					case 1400771174:
					{
						return new haxe.lang.Closure(this, "readFloat", 1400771174);
					}
					
					
					case 742854407:
					{
						return new haxe.lang.Closure(this, "readDouble", 742854407);
					}
					
					
					case 1840455391:
					{
						return new haxe.lang.Closure(this, "readInt8", 1840455391);
					}
					
					
					case 252173918:
					{
						return new haxe.lang.Closure(this, "readInt16", 252173918);
					}
					
					
					case 311106773:
					{
						return new haxe.lang.Closure(this, "readUInt16", 311106773);
					}
					
					
					case 252174139:
					{
						return new haxe.lang.Closure(this, "readInt24", 252174139);
					}
					
					
					case 311106994:
					{
						return new haxe.lang.Closure(this, "readUInt24", 311106994);
					}
					
					
					case 252174359:
					{
						return new haxe.lang.Closure(this, "readInt31", 252174359);
					}
					
					
					case 311107213:
					{
						return new haxe.lang.Closure(this, "readUInt30", 311107213);
					}
					
					
					case 252174360:
					{
						return new haxe.lang.Closure(this, "readInt32", 252174360);
					}
					
					
					case 179047623:
					{
						return new haxe.lang.Closure(this, "readString", 179047623);
					}
					
					
					default:
					{
						return base.__hx_getField(field, hash, throwErrors, isCheck, handleProperties);
					}
					
				}
				
			}
		}
		
		
		public override   object __hx_invokeField(string field, int hash, Array dynargs)
		{
			unchecked 
			{
				switch (hash)
				{
					case 1763375486:
					{
						return this.readByte();
					}
					
					
					case 243225909:
					{
						return this.readBytes(((haxe.io.Bytes) (dynargs[0]) ), haxe.lang.Runtime.toInt(dynargs[1]), haxe.lang.Runtime.toInt(dynargs[2]));
					}
					
					
					case 1214453688:
					{
						this.close();
						return default(object);
					}
					
					
					case 1513098717:
					{
						return this.setEndian(((bool) (dynargs[0]) ));
					}
					
					
					case 46374763:
					{
						return this.readAll(haxe.lang.Null<object>.ofDynamic<int>(dynargs[0]));
					}
					
					
					case 1309344294:
					{
						this.readFullBytes(((haxe.io.Bytes) (dynargs[0]) ), haxe.lang.Runtime.toInt(dynargs[1]), haxe.lang.Runtime.toInt(dynargs[2]));
						return default(object);
					}
					
					
					case 1269254998:
					{
						return this.read(haxe.lang.Runtime.toInt(dynargs[0]));
					}
					
					
					case 2010580328:
					{
						return this.readUntil(haxe.lang.Runtime.toInt(dynargs[0]));
					}
					
					
					case 1873474154:
					{
						return this.readLine();
					}
					
					
					case 1400771174:
					{
						return this.readFloat();
					}
					
					
					case 742854407:
					{
						return this.readDouble();
					}
					
					
					case 1840455391:
					{
						return this.readInt8();
					}
					
					
					case 252173918:
					{
						return this.readInt16();
					}
					
					
					case 311106773:
					{
						return this.readUInt16();
					}
					
					
					case 252174139:
					{
						return this.readInt24();
					}
					
					
					case 311106994:
					{
						return this.readUInt24();
					}
					
					
					case 252174359:
					{
						return this.readInt31();
					}
					
					
					case 311107213:
					{
						return this.readUInt30();
					}
					
					
					case 252174360:
					{
						return this.readInt32();
					}
					
					
					case 179047623:
					{
						return this.readString(haxe.lang.Runtime.toInt(dynargs[0]));
					}
					
					
					default:
					{
						return base.__hx_invokeField(field, hash, dynargs);
					}
					
				}
				
			}
		}
		
		
		public override   void __hx_getFields(Array<object> baseArr)
		{
			unchecked 
			{
				baseArr.push("bigEndian");
				baseArr.push("helper");
				{
					base.__hx_getFields(baseArr);
				}
				
			}
		}
		
		
	}
}


