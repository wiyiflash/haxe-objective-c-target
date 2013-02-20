
namespace cs
{
	public  class Lib : global::haxe.lang.HxObject 
	{
		public    Lib() : base()
		{
			unchecked 
			{
			}
		}
		
		
		public static  string decimalSeparator;
		
		public static   void applyCultureChanges()
		{
			
			System.Globalization.CultureInfo ci = new System.Globalization.CultureInfo(System.Threading.Thread.CurrentThread.CurrentCulture.Name, true);
			decimalSeparator = ci.NumberFormat.NumberDecimalSeparator;
            ci.NumberFormat.NumberDecimalSeparator = ".";
            System.Threading.Thread.CurrentThread.CurrentCulture = ci;
	
		}
		
		
		public static   global::System.Type nativeType(object obj)
		{
			unchecked 
			{
				return obj.GetType();
			}
		}
		
		
		public static   global::Array<T> array<T>(T[] native)
		{
			unchecked 
			{
				return global::Array<object>.ofNative<T>(native);
			}
		}
		
		
		public static  new object __hx_createEmpty()
		{
			unchecked 
			{
				return new global::cs.Lib(global::haxe.lang.EmptyObject.EMPTY);
			}
		}
		
		
		public static  new object __hx_create(global::Array arr)
		{
			unchecked 
			{
				return new global::cs.Lib();
			}
		}
		
		
		public    Lib(global::haxe.lang.EmptyObject empty) : base()
		{
			unchecked 
			{
			}
		}
		
		
	}
}


