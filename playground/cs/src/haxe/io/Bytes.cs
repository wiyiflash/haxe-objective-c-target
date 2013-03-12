
namespace haxe.io
{
	public  class Bytes : haxe.lang.HxObject 
	{
		public    Bytes(int length, byte[] b) : base()
		{
			unchecked 
			{
				haxe.io.Bytes.__hx_ctor(this, length, b);
			}
		}
		
		
		public static   void __hx_ctor(haxe.io.Bytes __temp_me32, int length, byte[] b)
		{
			unchecked 
			{
				__temp_me32.length = length;
				__temp_me32.b = b;
			}
		}
		
		
		public static   haxe.io.Bytes alloc(int length)
		{
			unchecked 
			{
				return new haxe.io.Bytes(length, new byte[length]);
			}
		}
		
		
		public static   haxe.io.Bytes ofString(string s)
		{
			unchecked 
			{
				byte[] b = System.Text.Encoding.UTF8.GetBytes(s);
				return new haxe.io.Bytes(b.Length, b);
			}
		}
		
		
		public static   haxe.io.Bytes ofData(byte[] b)
		{
			unchecked 
			{
				return new haxe.io.Bytes(b.Length, b);
			}
		}
		
		
		public static   object __hx_createEmpty()
		{
			unchecked 
			{
				return new haxe.io.Bytes(haxe.lang.EmptyObject.EMPTY);
			}
		}
		
		
		public static   object __hx_create(Array arr)
		{
			unchecked 
			{
				return new haxe.io.Bytes(haxe.lang.Runtime.toInt(arr[0]), ((byte[]) (arr[1]) ));
			}
		}
		
		
		public    Bytes(haxe.lang.EmptyObject empty) : base()
		{
			unchecked 
			{
			}
		}
		
		
		public   byte[] getData()
		{
			unchecked 
			{
				return this.b;
			}
		}
		
		
		public virtual   string toHex()
		{
			unchecked 
			{
				StringBuf s = new StringBuf();
				Array<object> chars = new Array<object>(new object[]{});
				string str = "0123456789abcdef";
				{
					int _g1 = 0;
					int _g = str.Length;
					while (( _g1 < _g ))
					{
						int i = _g1++;
						chars.push((haxe.lang.StringExt.charCodeAt(str, i)).toDynamic());
					}
					
				}
				
				{
					int _g11 = 0;
					int _g2 = this.length;
					while (( _g11 < _g2 ))
					{
						int i1 = _g11++;
						byte c = this.b[i1];
						{
							int c1 = haxe.lang.Runtime.toInt(chars[( c >> 4 )]);
							s.b.Append(((char) (c1) ));
						}
						
						{
							int c2 = haxe.lang.Runtime.toInt(chars[( c & 15 )]);
							s.b.Append(((char) (c2) ));
						}
						
					}
					
				}
				
				return s.toString();
			}
		}
		
		
		public virtual   string toString()
		{
			unchecked 
			{
				return System.Text.Encoding.UTF8.GetString(this.b, 0, this.length);
			}
		}
		
		
		public virtual   string readString(int pos, int len)
		{
			unchecked 
			{
				if (( ( ( pos < 0 ) || ( len < 0 ) ) || ( ( pos + len ) > this.length ) )) 
				{
					throw haxe.lang.HaxeException.wrap(haxe.io.Error.OutsideBounds);
				}
				
				return System.Text.Encoding.UTF8.GetString(this.b, pos, len);
			}
		}
		
		
		public virtual   int compare(haxe.io.Bytes other)
		{
			unchecked 
			{
				byte[] b1 = this.b;
				byte[] b2 = other.b;
				int len = ( (( this.length < other.length )) ? (this.length) : (other.length) );
				{
					int _g = 0;
					while (( _g < ((int) (len) ) ))
					{
						int i = _g++;
						if (( b1[i] != b2[i] )) 
						{
							return ( b1[i] - b2[i] );
						}
						
					}
					
				}
				
				return ( this.length - other.length );
			}
		}
		
		
		public virtual   haxe.io.Bytes sub(int pos, int len)
		{
			unchecked 
			{
				if (( ( ( pos < 0 ) || ( len < 0 ) ) || ( ( pos + len ) > this.length ) )) 
				{
					throw haxe.lang.HaxeException.wrap(haxe.io.Error.OutsideBounds);
				}
				
				byte[] newarr = new byte[len];
				System.Array.Copy(this.b, pos, newarr, 0, len);
				return new haxe.io.Bytes(len, newarr);
			}
		}
		
		
		public virtual   void blit(int pos, haxe.io.Bytes src, int srcpos, int len)
		{
			unchecked 
			{
				if (( ( ( ( ( pos < 0 ) || ( srcpos < 0 ) ) || ( len < 0 ) ) || ( ( pos + len ) > this.length ) ) || ( ( srcpos + len ) > src.length ) )) 
				{
					throw haxe.lang.HaxeException.wrap(haxe.io.Error.OutsideBounds);
				}
				
				System.Array.Copy(src.b, srcpos, this.b, pos, len);
			}
		}
		
		
		public   void @set(int pos, int v)
		{
			unchecked 
			{
				this.b[pos] = ((byte) (v) );
			}
		}
		
		
		public   int @get(int pos)
		{
			unchecked 
			{
				return ((int) (this.b[pos]) );
			}
		}
		
		
		public  byte[] b;
		
		public  int length;
		
		public override   double __hx_setField_f(string field, int hash, double @value, bool handleProperties)
		{
			unchecked 
			{
				switch (hash)
				{
					case 520590566:
					{
						this.length = ((int) (@value) );
						return @value;
					}
					
					
					default:
					{
						return base.__hx_setField_f(field, hash, @value, handleProperties);
					}
					
				}
				
			}
		}
		
		
		public override   object __hx_setField(string field, int hash, object @value, bool handleProperties)
		{
			unchecked 
			{
				switch (hash)
				{
					case 520590566:
					{
						this.length = haxe.lang.Runtime.toInt(@value);
						return @value;
					}
					
					
					case 98:
					{
						this.b = ((byte[]) (@value) );
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
					case 520590566:
					{
						return this.length;
					}
					
					
					case 98:
					{
						return this.b;
					}
					
					
					case 5144726:
					{
						return new haxe.lang.Closure(this, "get", 5144726);
					}
					
					
					case 5741474:
					{
						return new haxe.lang.Closure(this, "set", 5741474);
					}
					
					
					case 1092171829:
					{
						return new haxe.lang.Closure(this, "blit", 1092171829);
					}
					
					
					case 5745024:
					{
						return new haxe.lang.Closure(this, "sub", 5745024);
					}
					
					
					case 57219237:
					{
						return new haxe.lang.Closure(this, "compare", 57219237);
					}
					
					
					case 179047623:
					{
						return new haxe.lang.Closure(this, "readString", 179047623);
					}
					
					
					case 946786476:
					{
						return new haxe.lang.Closure(this, "toString", 946786476);
					}
					
					
					case 336655392:
					{
						return new haxe.lang.Closure(this, "toHex", 336655392);
					}
					
					
					case 350619104:
					{
						return new haxe.lang.Closure(this, "getData", 350619104);
					}
					
					
					default:
					{
						return base.__hx_getField(field, hash, throwErrors, isCheck, handleProperties);
					}
					
				}
				
			}
		}
		
		
		public override   double __hx_getField_f(string field, int hash, bool throwErrors, bool handleProperties)
		{
			unchecked 
			{
				switch (hash)
				{
					case 520590566:
					{
						return this.length;
					}
					
					
					default:
					{
						return base.__hx_getField_f(field, hash, throwErrors, handleProperties);
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
					case 5144726:
					{
						return this.@get(haxe.lang.Runtime.toInt(dynargs[0]));
					}
					
					
					case 5741474:
					{
						this.@set(haxe.lang.Runtime.toInt(dynargs[0]), haxe.lang.Runtime.toInt(dynargs[1]));
						return default(object);
					}
					
					
					case 1092171829:
					{
						this.blit(haxe.lang.Runtime.toInt(dynargs[0]), ((haxe.io.Bytes) (dynargs[1]) ), haxe.lang.Runtime.toInt(dynargs[2]), haxe.lang.Runtime.toInt(dynargs[3]));
						return default(object);
					}
					
					
					case 5745024:
					{
						return this.sub(haxe.lang.Runtime.toInt(dynargs[0]), haxe.lang.Runtime.toInt(dynargs[1]));
					}
					
					
					case 57219237:
					{
						return this.compare(((haxe.io.Bytes) (dynargs[0]) ));
					}
					
					
					case 179047623:
					{
						return this.readString(haxe.lang.Runtime.toInt(dynargs[0]), haxe.lang.Runtime.toInt(dynargs[1]));
					}
					
					
					case 946786476:
					{
						return this.toString();
					}
					
					
					case 336655392:
					{
						return this.toHex();
					}
					
					
					case 350619104:
					{
						return this.getData();
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
				baseArr.push("length");
				baseArr.push("b");
				{
					base.__hx_getFields(baseArr);
				}
				
			}
		}
		
		
		public override string ToString()
		{
			return this.toString();
		}
		
		
	}
}


