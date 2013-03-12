
public  class Sys : global::haxe.lang.HxObject 
{
	public    Sys() : base()
	{
		unchecked 
		{
		}
	}
	
	
	public static   double time()
	{
		unchecked 
		{
			return ( ((double) (global::Date.now().date.Ticks) ) / global::System.TimeSpan.TicksPerMillisecond );
		}
	}
	
	
	public static  new object __hx_createEmpty()
	{
		unchecked 
		{
			return new global::Sys(global::haxe.lang.EmptyObject.EMPTY);
		}
	}
	
	
	public static  new object __hx_create(global::Array arr)
	{
		unchecked 
		{
			return new global::Sys();
		}
	}
	
	
	public    Sys(global::haxe.lang.EmptyObject empty) : base()
	{
		unchecked 
		{
		}
	}
	
	
}


