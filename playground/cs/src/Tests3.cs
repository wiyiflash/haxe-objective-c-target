
namespace _Tests3
{
	public enum Color
	{
		Red, Green, Blue
	}
}



public  class Tests3 : global::haxe.lang.HxObject 
{
	public    Tests3() : base()
	{
		unchecked 
		{
			global::Tests3.__hx_ctor(this);
		}
	}
	
	
	public static   void __hx_ctor(global::Tests3 __temp_me24)
	{
		unchecked 
		{
			__temp_me24.d1 = 34;
		}
	}
	
	
	public static  new object __hx_createEmpty()
	{
		unchecked 
		{
			return new global::Tests3(global::haxe.lang.EmptyObject.EMPTY);
		}
	}
	
	
	public static  new object __hx_create(global::Array arr)
	{
		unchecked 
		{
			return new global::Tests3();
		}
	}
	
	
	public    Tests3(global::haxe.lang.EmptyObject empty) : base()
	{
		unchecked 
		{
		}
	}
	
	
	public  int d1;
	
	public override   double __hx_setField_f(string field, int hash, double @value, bool handleProperties)
	{
		unchecked 
		{
			switch (hash)
			{
				case 22349:
				{
					this.d1 = ((int) (@value) );
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
				case 22349:
				{
					this.d1 = ((int) (global::haxe.lang.Runtime.toInt(@value)) );
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
				case 22349:
				{
					return this.d1;
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
				case 22349:
				{
					return ((double) (this.d1) );
				}
				
				
				default:
				{
					return base.__hx_getField_f(field, hash, throwErrors, handleProperties);
				}
				
			}
			
		}
	}
	
	
	public override   void __hx_getFields(global::Array<object> baseArr)
	{
		unchecked 
		{
			baseArr.push("d1");
			{
				base.__hx_getFields(baseArr);
			}
			
		}
	}
	
	
}


