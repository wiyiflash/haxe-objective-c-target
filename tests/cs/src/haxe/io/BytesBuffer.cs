
namespace haxe.io
{
	public  class BytesBuffer : haxe.lang.HxObject 
	{
		public    BytesBuffer() : base()
		{
			unchecked 
			{
				haxe.io.BytesBuffer.__hx_ctor(this);
			}
		}
		
		
		public static   void __hx_ctor(haxe.io.BytesBuffer __temp_me33)
		{
			unchecked 
			{
				__temp_me33.b = new System.IO.MemoryStream();
			}
		}
		
		
		public static   object __hx_createEmpty()
		{
			unchecked 
			{
				return new haxe.io.BytesBuffer(haxe.lang.EmptyObject.EMPTY);
			}
		}
		
		
		public static   object __hx_create(Array arr)
		{
			unchecked 
			{
				return new haxe.io.BytesBuffer();
			}
		}
		
		
		public    BytesBuffer(haxe.lang.EmptyObject empty) : base()
		{
			unchecked 
			{
			}
		}
		
		
		public virtual   haxe.io.Bytes getBytes()
		{
			unchecked 
			{
				byte[] buf = this.b.GetBuffer();
				haxe.io.Bytes bytes = new haxe.io.Bytes(((int) (this.b.Length) ), buf);
				this.b = default(System.IO.MemoryStream);
				return bytes;
			}
		}
		
		
		public   void addBytes(haxe.io.Bytes src, int pos, int len)
		{
			unchecked 
			{
				if (( ( ( pos < 0 ) || ( len < 0 ) ) || ( ( pos + len ) > src.length ) )) 
				{
					throw haxe.lang.HaxeException.wrap(haxe.io.Error.OutsideBounds);
				}
				
				this.b.Write(src.b, pos, len);
			}
		}
		
		
		public   void @add(haxe.io.Bytes src)
		{
			unchecked 
			{
				this.b.Write(src.b, 0, src.length);
			}
		}
		
		
		public   void addByte(int @byte)
		{
			unchecked 
			{
				this.b.WriteByte(((byte) (@byte) ));
			}
		}
		
		
		public  System.IO.MemoryStream b;
		
		public override   object __hx_setField(string field, int hash, object @value, bool handleProperties)
		{
			unchecked 
			{
				switch (hash)
				{
					case 98:
					{
						this.b = ((System.IO.MemoryStream) (@value) );
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
					
					
					case 2103468489:
					{
						return new haxe.lang.Closure(this, "addByte", 2103468489);
					}
					
					
					case 4846113:
					{
						return new haxe.lang.Closure(this, "add", 4846113);
					}
					
					
					case 922037898:
					{
						return new haxe.lang.Closure(this, "addBytes", 922037898);
					}
					
					
					case 493819893:
					{
						return new haxe.lang.Closure(this, "getBytes", 493819893);
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
					case 2103468489:
					{
						this.addByte(haxe.lang.Runtime.toInt(dynargs[0]));
						return default(object);
					}
					
					
					case 4846113:
					{
						this.@add(((haxe.io.Bytes) (dynargs[0]) ));
						return default(object);
					}
					
					
					case 922037898:
					{
						this.addBytes(((haxe.io.Bytes) (dynargs[0]) ), haxe.lang.Runtime.toInt(dynargs[1]), haxe.lang.Runtime.toInt(dynargs[2]));
						return default(object);
					}
					
					
					case 493819893:
					{
						return this.getBytes();
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
				baseArr.push("b");
				{
					base.__hx_getFields(baseArr);
				}
				
			}
		}
		
		
	}
}


