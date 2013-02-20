
namespace haxe.io
{
	public  class Eof : haxe.lang.HxObject 
	{
		public    Eof() : base()
		{
			unchecked 
			{
				haxe.io.Eof.__hx_ctor(this);
			}
		}
		
		
		public static   void __hx_ctor(haxe.io.Eof __temp_me35)
		{
			unchecked 
			{
				{
				}
				
			}
		}
		
		
		public static   object __hx_createEmpty()
		{
			unchecked 
			{
				return new haxe.io.Eof(haxe.lang.EmptyObject.EMPTY);
			}
		}
		
		
		public static   object __hx_create(Array arr)
		{
			unchecked 
			{
				return new haxe.io.Eof();
			}
		}
		
		
		public    Eof(haxe.lang.EmptyObject empty) : base()
		{
			unchecked 
			{
			}
		}
		
		
		public virtual   string toString()
		{
			unchecked 
			{
				return "Eof";
			}
		}
		
		
		public override   object __hx_getField(string field, int hash, bool throwErrors, bool isCheck, bool handleProperties)
		{
			unchecked 
			{
				switch (hash)
				{
					case 946786476:
					{
						return new haxe.lang.Closure(this, "toString", 946786476);
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
					case 946786476:
					{
						return this.toString();
					}
					
					
					default:
					{
						return base.__hx_invokeField(field, hash, dynargs);
					}
					
				}
				
			}
		}
		
		
		public override string ToString()
		{
			return this.toString();
		}
		
		
	}
}


