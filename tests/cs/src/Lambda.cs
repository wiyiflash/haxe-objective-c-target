
public  class Lambda : global::haxe.lang.HxObject 
{
	public    Lambda() : base()
	{
		unchecked 
		{
		}
	}
	
	
	public static   global::Array<A> array<A>(object it)
	{
		unchecked 
		{
			global::Array<A> a = new global::Array<A>();
			{
				object __temp_iterator39 = ((object) (global::haxe.lang.Runtime.callField(it, "iterator", 328878574, default(global::Array))) );
				while (((bool) (global::haxe.lang.Runtime.callField(__temp_iterator39, "hasNext", 407283053, default(global::Array))) ))
				{
					A i = global::haxe.lang.Runtime.genericCast<A>(global::haxe.lang.Runtime.callField(__temp_iterator39, "next", 1224901875, default(global::Array)));
					a.push(i);
				}
				
			}
			
			return a;
		}
	}
	
	
	public static   global::List<T> concat<T>(object a, object b)
	{
		unchecked 
		{
			global::List<T> l = new global::List<T>();
			{
				object __temp_iterator40 = ((object) (global::haxe.lang.Runtime.callField(a, "iterator", 328878574, default(global::Array))) );
				while (((bool) (global::haxe.lang.Runtime.callField(__temp_iterator40, "hasNext", 407283053, default(global::Array))) ))
				{
					T x = global::haxe.lang.Runtime.genericCast<T>(global::haxe.lang.Runtime.callField(__temp_iterator40, "next", 1224901875, default(global::Array)));
					l.@add(x);
				}
				
			}
			
			{
				object __temp_iterator41 = ((object) (global::haxe.lang.Runtime.callField(b, "iterator", 328878574, default(global::Array))) );
				while (((bool) (global::haxe.lang.Runtime.callField(__temp_iterator41, "hasNext", 407283053, default(global::Array))) ))
				{
					T x1 = global::haxe.lang.Runtime.genericCast<T>(global::haxe.lang.Runtime.callField(__temp_iterator41, "next", 1224901875, default(global::Array)));
					l.@add(x1);
				}
				
			}
			
			return l;
		}
	}
	
	
	public static  new object __hx_createEmpty()
	{
		unchecked 
		{
			return new global::Lambda(global::haxe.lang.EmptyObject.EMPTY);
		}
	}
	
	
	public static  new object __hx_create(global::Array arr)
	{
		unchecked 
		{
			return new global::Lambda();
		}
	}
	
	
	public    Lambda(global::haxe.lang.EmptyObject empty) : base()
	{
		unchecked 
		{
		}
	}
	
	
}


