
namespace haxe.io
{
	public  class BytesInput : haxe.io.Input 
	{
		public    BytesInput(haxe.io.Bytes b, haxe.lang.Null<int> pos, haxe.lang.Null<int> len) : base(haxe.lang.EmptyObject.EMPTY)
		{
			unchecked 
			{
				haxe.io.BytesInput.__hx_ctor(this, b, pos, len);
			}
		}
		
		
		public static   void __hx_ctor(haxe.io.BytesInput __temp_me34, haxe.io.Bytes b, haxe.lang.Null<int> pos, haxe.lang.Null<int> len)
		{
			unchecked 
			{
				if ( ! (pos.hasValue) ) 
				{
					pos = new haxe.lang.Null<int>(new haxe.lang.Null<int>(0, true).@value, true);
				}
				
				if ( ! (len.hasValue) ) 
				{
					len = new haxe.lang.Null<int>(new haxe.lang.Null<int>(( b.length - pos.@value ), true).@value, true);
				}
				
				if (( ( ( pos.@value < 0 ) || ( len.@value < 0 ) ) || ( ( pos.@value + len.@value ) > b.length ) )) 
				{
					throw haxe.lang.HaxeException.wrap(haxe.io.Error.OutsideBounds);
				}
				
				__temp_me34.b = b.b;
				__temp_me34.pos = pos.@value;
				__temp_me34.len = len.@value;
			}
		}
		
		
		public static   object __hx_createEmpty()
		{
			unchecked 
			{
				return new haxe.io.BytesInput(haxe.lang.EmptyObject.EMPTY);
			}
		}
		
		
		public static   object __hx_create(Array arr)
		{
			unchecked 
			{
				return new haxe.io.BytesInput(((haxe.io.Bytes) (arr[0]) ), haxe.lang.Null<object>.ofDynamic<int>(arr[1]), haxe.lang.Null<object>.ofDynamic<int>(arr[2]));
			}
		}
		
		
		public    BytesInput(haxe.lang.EmptyObject empty) : base(haxe.lang.EmptyObject.EMPTY)
		{
			unchecked 
			{
			}
		}
		
		
		public override   int readBytes(haxe.io.Bytes buf, int pos, int len)
		{
			unchecked 
			{
				if (( ( ( pos < 0 ) || ( len < 0 ) ) || ( ( pos + len ) > buf.length ) )) 
				{
					throw haxe.lang.HaxeException.wrap(haxe.io.Error.OutsideBounds);
				}
				
				int avail = this.len;
				if (( len > avail )) 
				{
					len = avail;
				}
				
				if (( len == 0 )) 
				{
					throw haxe.lang.HaxeException.wrap(new haxe.io.Eof());
				}
				
				System.Array.Copy(this.b, this.pos, buf.b, pos, len);
				this.pos += len;
				this.len -= len;
				return len;
			}
		}
		
		
		public override   int readByte()
		{
			unchecked 
			{
				if (( this.len == 0 )) 
				{
					throw haxe.lang.HaxeException.wrap(new haxe.io.Eof());
				}
				
				this.len--;
				return ((int) (this.b[this.pos++]) );
			}
		}
		
		
		public  int len;
		
		public  int pos;
		
		public  byte[] b;
		
		public override   double __hx_setField_f(string field, int hash, double @value, bool handleProperties)
		{
			unchecked 
			{
				switch (hash)
				{
					case 5594516:
					{
						this.pos = ((int) (@value) );
						return @value;
					}
					
					
					case 5393365:
					{
						this.len = ((int) (@value) );
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
					case 98:
					{
						this.b = ((byte[]) (@value) );
						return @value;
					}
					
					
					case 5594516:
					{
						this.pos = haxe.lang.Runtime.toInt(@value);
						return @value;
					}
					
					
					case 5393365:
					{
						this.len = haxe.lang.Runtime.toInt(@value);
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
					case 98:
					{
						return this.b;
					}
					
					
					case 5594516:
					{
						return this.pos;
					}
					
					
					case 5393365:
					{
						return this.len;
					}
					
					
					case 1763375486:
					{
						return new haxe.lang.Closure(this, "readByte", 1763375486);
					}
					
					
					case 243225909:
					{
						return new haxe.lang.Closure(this, "readBytes", 243225909);
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
					case 5594516:
					{
						return this.pos;
					}
					
					
					case 5393365:
					{
						return this.len;
					}
					
					
					default:
					{
						return base.__hx_getField_f(field, hash, throwErrors, handleProperties);
					}
					
				}
				
			}
		}
		
		
		public override   void __hx_getFields(Array<object> baseArr)
		{
			unchecked 
			{
				baseArr.push("b");
				baseArr.push("pos");
				baseArr.push("len");
				{
					base.__hx_getFields(baseArr);
				}
				
			}
		}
		
		
	}
}


