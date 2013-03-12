
namespace cs
{
	public  class Boot : global::haxe.lang.HxObject 
	{
		public    Boot() : base()
		{
			unchecked 
			{
			}
		}
		
		
		public static   void init()
		{
			unchecked 
			{
				global::cs.Lib.applyCultureChanges();
			}
		}
		
		
		public static  new object __hx_createEmpty()
		{
			unchecked 
			{
				return new global::cs.Boot(global::haxe.lang.EmptyObject.EMPTY);
			}
		}
		
		
		public static  new object __hx_create(global::Array arr)
		{
			unchecked 
			{
				return new global::cs.Boot();
			}
		}
		
		
		public    Boot(global::haxe.lang.EmptyObject empty) : base()
		{
			unchecked 
			{
			}
		}
		
		
	}
}


