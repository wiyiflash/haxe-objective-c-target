
namespace haxe.io
{
	public  class Output : haxe.lang.HxObject 
	{
		static Output() 
		{
			haxe.io.Output.LN2 = System.Math.Log(2);
		}
		public    Output() : base()
		{
			unchecked 
			{
			}
		}
		
		
		public static  double LN2;
		
		public static   object __hx_createEmpty()
		{
			unchecked 
			{
				return new haxe.io.Output(haxe.lang.EmptyObject.EMPTY);
			}
		}
		
		
		public static   object __hx_create(Array arr)
		{
			unchecked 
			{
				return new haxe.io.Output();
			}
		}
		
		
		public    Output(haxe.lang.EmptyObject empty) : base()
		{
			unchecked 
			{
			}
		}
		
		
		public virtual   void writeString(string s)
		{
			unchecked 
			{
				haxe.io.Bytes b = haxe.io.Bytes.ofString(s);
				this.writeFullBytes(b, 0, b.length);
			}
		}
		
		
		public virtual   void writeInput(haxe.io.Input i, haxe.lang.Null<int> bufsize)
		{
			unchecked 
			{
				if ( ! (bufsize.hasValue) ) 
				{
					bufsize = new haxe.lang.Null<int>(new haxe.lang.Null<int>(4096, true).@value, true);
				}
				
				haxe.io.Bytes buf = haxe.io.Bytes.alloc(bufsize.@value);
				try 
				{
					while (true)
					{
						int len = i.readBytes(buf, 0, bufsize.@value);
						if (( len == 0 )) 
						{
							throw haxe.lang.HaxeException.wrap(haxe.io.Error.Blocked);
						}
						
						int p = 0;
						while (( len > 0 ))
						{
							int k = this.writeBytes(buf, p, len);
							if (( k == 0 )) 
							{
								throw haxe.lang.HaxeException.wrap(haxe.io.Error.Blocked);
							}
							
							p += k;
							len -= k;
						}
						
					}
					
				}
				catch (System.Exception __temp_catchallException101)
				{
					object __temp_catchall102 = __temp_catchallException101;
					if (( __temp_catchall102 is haxe.lang.HaxeException )) 
					{
						__temp_catchall102 = ((haxe.lang.HaxeException) (__temp_catchallException101) ).obj;
					}
					
					if (( __temp_catchall102 is haxe.io.Eof )) 
					{
						haxe.io.Eof e = ((haxe.io.Eof) (__temp_catchall102) );
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
				
				
			}
		}
		
		
		public virtual   void prepare(int nbytes)
		{
			unchecked 
			{
				{
				}
				
			}
		}
		
		
		public virtual   void writeInt32(int x)
		{
			unchecked 
			{
				if (this.bigEndian) 
				{
					this.writeByte(haxe.Int32.toInt(((int) (((int) (( ((uint) (((int) (x) )) ) >> 24 )) )) )));
					this.writeByte(( haxe.Int32.toInt(((int) (((int) (( ((uint) (((int) (x) )) ) >> 16 )) )) )) & 255 ));
					this.writeByte(( haxe.Int32.toInt(((int) (((int) (( ((uint) (((int) (x) )) ) >> 8 )) )) )) & 255 ));
					this.writeByte(haxe.Int32.toInt(((int) (( ((int) (x) ) & ((int) (255) ) )) )));
				}
				 else 
				{
					this.writeByte(haxe.Int32.toInt(((int) (( ((int) (x) ) & ((int) (255) ) )) )));
					this.writeByte(( haxe.Int32.toInt(((int) (((int) (( ((uint) (((int) (x) )) ) >> 8 )) )) )) & 255 ));
					this.writeByte(( haxe.Int32.toInt(((int) (((int) (( ((uint) (((int) (x) )) ) >> 16 )) )) )) & 255 ));
					this.writeByte(haxe.Int32.toInt(((int) (((int) (( ((uint) (((int) (x) )) ) >> 24 )) )) )));
				}
				
			}
		}
		
		
		public virtual   void writeUInt30(int x)
		{
			unchecked 
			{
				if (( ( x < 0 ) || ( x >= 1073741824 ) )) 
				{
					throw haxe.lang.HaxeException.wrap(haxe.io.Error.Overflow);
				}
				
				if (this.bigEndian) 
				{
					this.writeByte(((int) (( ((uint) (x) ) >> 24 )) ));
					this.writeByte(( ( x >> 16 ) & 255 ));
					this.writeByte(( ( x >> 8 ) & 255 ));
					this.writeByte(( x & 255 ));
				}
				 else 
				{
					this.writeByte(( x & 255 ));
					this.writeByte(( ( x >> 8 ) & 255 ));
					this.writeByte(( ( x >> 16 ) & 255 ));
					this.writeByte(((int) (( ((uint) (x) ) >> 24 )) ));
				}
				
			}
		}
		
		
		public virtual   void writeInt31(int x)
		{
			unchecked 
			{
				if (( ( x < -1073741824 ) || ( x >= 1073741824 ) )) 
				{
					throw haxe.lang.HaxeException.wrap(haxe.io.Error.Overflow);
				}
				
				if (this.bigEndian) 
				{
					this.writeByte(((int) (( ((uint) (x) ) >> 24 )) ));
					this.writeByte(( ( x >> 16 ) & 255 ));
					this.writeByte(( ( x >> 8 ) & 255 ));
					this.writeByte(( x & 255 ));
				}
				 else 
				{
					this.writeByte(( x & 255 ));
					this.writeByte(( ( x >> 8 ) & 255 ));
					this.writeByte(( ( x >> 16 ) & 255 ));
					this.writeByte(((int) (( ((uint) (x) ) >> 24 )) ));
				}
				
			}
		}
		
		
		public virtual   void writeUInt24(int x)
		{
			unchecked 
			{
				if (( ( x < 0 ) || ( x >= 16777216 ) )) 
				{
					throw haxe.lang.HaxeException.wrap(haxe.io.Error.Overflow);
				}
				
				if (this.bigEndian) 
				{
					this.writeByte(( x >> 16 ));
					this.writeByte(( ( x >> 8 ) & 255 ));
					this.writeByte(( x & 255 ));
				}
				 else 
				{
					this.writeByte(( x & 255 ));
					this.writeByte(( ( x >> 8 ) & 255 ));
					this.writeByte(( x >> 16 ));
				}
				
			}
		}
		
		
		public virtual   void writeInt24(int x)
		{
			unchecked 
			{
				if (( ( x < -8388608 ) || ( x >= 8388608 ) )) 
				{
					throw haxe.lang.HaxeException.wrap(haxe.io.Error.Overflow);
				}
				
				this.writeUInt24(( x & 16777215 ));
			}
		}
		
		
		public virtual   void writeUInt16(int x)
		{
			unchecked 
			{
				if (( ( x < 0 ) || ( x >= 65536 ) )) 
				{
					throw haxe.lang.HaxeException.wrap(haxe.io.Error.Overflow);
				}
				
				if (this.bigEndian) 
				{
					this.writeByte(( x >> 8 ));
					this.writeByte(( x & 255 ));
				}
				 else 
				{
					this.writeByte(( x & 255 ));
					this.writeByte(( x >> 8 ));
				}
				
			}
		}
		
		
		public virtual   void writeInt16(int x)
		{
			unchecked 
			{
				if (( ( x < -32768 ) || ( x >= 32768 ) )) 
				{
					throw haxe.lang.HaxeException.wrap(haxe.io.Error.Overflow);
				}
				
				this.writeUInt16(( x & 65535 ));
			}
		}
		
		
		public virtual   void writeInt8(int x)
		{
			unchecked 
			{
				if (( ( x < -128 ) || ( x >= 128 ) )) 
				{
					throw haxe.lang.HaxeException.wrap(haxe.io.Error.Overflow);
				}
				
				this.writeByte(( x & 255 ));
			}
		}
		
		
		public virtual   void writeDouble(double x)
		{
			unchecked 
			{
				byte[] bytes = System.BitConverter.GetBytes(x);
				if (( this.bigEndian == System.BitConverter.IsLittleEndian )) 
				{
					this.writeByte(((int) (bytes[7]) ));
					this.writeByte(((int) (bytes[6]) ));
					this.writeByte(((int) (bytes[5]) ));
					this.writeByte(((int) (bytes[4]) ));
					this.writeByte(((int) (bytes[3]) ));
					this.writeByte(((int) (bytes[2]) ));
					this.writeByte(((int) (bytes[1]) ));
					this.writeByte(((int) (bytes[0]) ));
				}
				 else 
				{
					this.writeByte(((int) (bytes[0]) ));
					this.writeByte(((int) (bytes[1]) ));
					this.writeByte(((int) (bytes[2]) ));
					this.writeByte(((int) (bytes[3]) ));
					this.writeByte(((int) (bytes[4]) ));
					this.writeByte(((int) (bytes[5]) ));
					this.writeByte(((int) (bytes[6]) ));
					this.writeByte(((int) (bytes[7]) ));
				}
				
			}
		}
		
		
		public virtual   void writeFloat(double x)
		{
			unchecked 
			{
				byte[] bytes = System.BitConverter.GetBytes(((float) (x) ));
				if (( this.bigEndian == System.BitConverter.IsLittleEndian )) 
				{
					this.writeByte(((int) (bytes[3]) ));
					this.writeByte(((int) (bytes[2]) ));
					this.writeByte(((int) (bytes[1]) ));
					this.writeByte(((int) (bytes[0]) ));
				}
				 else 
				{
					this.writeByte(((int) (bytes[0]) ));
					this.writeByte(((int) (bytes[1]) ));
					this.writeByte(((int) (bytes[2]) ));
					this.writeByte(((int) (bytes[3]) ));
				}
				
			}
		}
		
		
		public virtual   void writeFullBytes(haxe.io.Bytes s, int pos, int len)
		{
			unchecked 
			{
				while (( len > 0 ))
				{
					int k = this.writeBytes(s, pos, len);
					pos += k;
					len -= k;
				}
				
			}
		}
		
		
		public virtual   void write(haxe.io.Bytes s)
		{
			unchecked 
			{
				int l = s.length;
				int p = 0;
				while (( l > 0 ))
				{
					int k = this.writeBytes(s, p, l);
					if (( k == 0 )) 
					{
						throw haxe.lang.HaxeException.wrap(haxe.io.Error.Blocked);
					}
					
					p += k;
					l -= k;
				}
				
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
		
		
		public virtual   void flush()
		{
			unchecked 
			{
				{
				}
				
			}
		}
		
		
		public virtual   int writeBytes(haxe.io.Bytes s, int pos, int len)
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
					this.writeByte(((int) (b[pos]) ));
					pos++;
					k--;
				}
				
				return len;
			}
		}
		
		
		public virtual   void writeByte(int c)
		{
			unchecked 
			{
				throw haxe.lang.HaxeException.wrap("Not implemented");
			}
		}
		
		
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
					
					
					case 1238832007:
					{
						return new haxe.lang.Closure(this, "writeByte", 1238832007);
					}
					
					
					case 1381630732:
					{
						return new haxe.lang.Closure(this, "writeBytes", 1381630732);
					}
					
					
					case 43737796:
					{
						return new haxe.lang.Closure(this, "flush", 43737796);
					}
					
					
					case 1214453688:
					{
						return new haxe.lang.Closure(this, "close", 1214453688);
					}
					
					
					case 1513098717:
					{
						return new haxe.lang.Closure(this, "setEndian", 1513098717);
					}
					
					
					case 1348037855:
					{
						return new haxe.lang.Closure(this, "write", 1348037855);
					}
					
					
					case 610723709:
					{
						return new haxe.lang.Closure(this, "writeFullBytes", 610723709);
					}
					
					
					case 391692349:
					{
						return new haxe.lang.Closure(this, "writeFloat", 391692349);
					}
					
					
					case 1204059472:
					{
						return new haxe.lang.Closure(this, "writeDouble", 1204059472);
					}
					
					
					case 1315911912:
					{
						return new haxe.lang.Closure(this, "writeInt8", 1315911912);
					}
					
					
					case 1390578741:
					{
						return new haxe.lang.Closure(this, "writeInt16", 1390578741);
					}
					
					
					case 772311838:
					{
						return new haxe.lang.Closure(this, "writeUInt16", 772311838);
					}
					
					
					case 1390578962:
					{
						return new haxe.lang.Closure(this, "writeInt24", 1390578962);
					}
					
					
					case 772312059:
					{
						return new haxe.lang.Closure(this, "writeUInt24", 772312059);
					}
					
					
					case 1390579182:
					{
						return new haxe.lang.Closure(this, "writeInt31", 1390579182);
					}
					
					
					case 772312278:
					{
						return new haxe.lang.Closure(this, "writeUInt30", 772312278);
					}
					
					
					case 1390579183:
					{
						return new haxe.lang.Closure(this, "writeInt32", 1390579183);
					}
					
					
					case 937267591:
					{
						return new haxe.lang.Closure(this, "prepare", 937267591);
					}
					
					
					case 1390395051:
					{
						return new haxe.lang.Closure(this, "writeInput", 1390395051);
					}
					
					
					case 640252688:
					{
						return new haxe.lang.Closure(this, "writeString", 640252688);
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
					case 1238832007:
					{
						this.writeByte(haxe.lang.Runtime.toInt(dynargs[0]));
						return default(object);
					}
					
					
					case 1381630732:
					{
						return this.writeBytes(((haxe.io.Bytes) (dynargs[0]) ), haxe.lang.Runtime.toInt(dynargs[1]), haxe.lang.Runtime.toInt(dynargs[2]));
					}
					
					
					case 43737796:
					{
						this.flush();
						return default(object);
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
					
					
					case 1348037855:
					{
						this.write(((haxe.io.Bytes) (dynargs[0]) ));
						return default(object);
					}
					
					
					case 610723709:
					{
						this.writeFullBytes(((haxe.io.Bytes) (dynargs[0]) ), haxe.lang.Runtime.toInt(dynargs[1]), haxe.lang.Runtime.toInt(dynargs[2]));
						return default(object);
					}
					
					
					case 391692349:
					{
						this.writeFloat(haxe.lang.Runtime.toDouble(dynargs[0]));
						return default(object);
					}
					
					
					case 1204059472:
					{
						this.writeDouble(haxe.lang.Runtime.toDouble(dynargs[0]));
						return default(object);
					}
					
					
					case 1315911912:
					{
						this.writeInt8(haxe.lang.Runtime.toInt(dynargs[0]));
						return default(object);
					}
					
					
					case 1390578741:
					{
						this.writeInt16(haxe.lang.Runtime.toInt(dynargs[0]));
						return default(object);
					}
					
					
					case 772311838:
					{
						this.writeUInt16(haxe.lang.Runtime.toInt(dynargs[0]));
						return default(object);
					}
					
					
					case 1390578962:
					{
						this.writeInt24(haxe.lang.Runtime.toInt(dynargs[0]));
						return default(object);
					}
					
					
					case 772312059:
					{
						this.writeUInt24(haxe.lang.Runtime.toInt(dynargs[0]));
						return default(object);
					}
					
					
					case 1390579182:
					{
						this.writeInt31(haxe.lang.Runtime.toInt(dynargs[0]));
						return default(object);
					}
					
					
					case 772312278:
					{
						this.writeUInt30(haxe.lang.Runtime.toInt(dynargs[0]));
						return default(object);
					}
					
					
					case 1390579183:
					{
						this.writeInt32(haxe.lang.Runtime.toInt(dynargs[0]));
						return default(object);
					}
					
					
					case 937267591:
					{
						this.prepare(haxe.lang.Runtime.toInt(dynargs[0]));
						return default(object);
					}
					
					
					case 1390395051:
					{
						this.writeInput(((haxe.io.Input) (dynargs[0]) ), haxe.lang.Null<object>.ofDynamic<int>(dynargs[1]));
						return default(object);
					}
					
					
					case 640252688:
					{
						this.writeString(haxe.lang.Runtime.toString(dynargs[0]));
						return default(object);
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
				{
					base.__hx_getFields(baseArr);
				}
				
			}
		}
		
		
	}
}


