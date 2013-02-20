
namespace haxe
{
	public  class Log : global::haxe.lang.HxObject 
	{
		static Log() 
		{
			global::haxe.Log.trace = ( (( global::haxe.Fun_3776503c.__hx_current != default(global::haxe.Fun_3776503c) )) ? (global::haxe.Fun_3776503c.__hx_current) : (global::haxe.Fun_3776503c.__hx_current = ((global::haxe.Fun_3776503c) (new global::haxe.Fun_3776503c()) )) );
		}
		public    Log() : base()
		{
			unchecked 
			{
			}
		}
		
		
		public static  global::haxe.lang.Function trace;
		
		public static  new object __hx_createEmpty()
		{
			unchecked 
			{
				return new global::haxe.Log(global::haxe.lang.EmptyObject.EMPTY);
			}
		}
		
		
		public static  new object __hx_create(global::Array arr)
		{
			unchecked 
			{
				return new global::haxe.Log();
			}
		}
		
		
		public    Log(global::haxe.lang.EmptyObject empty) : base()
		{
			unchecked 
			{
			}
		}
		
		
	}
}



namespace haxe
{
	public  class Fun_3776503c : global::haxe.lang.Function 
	{
		public    Fun_3776503c() : base(2, 0)
		{
			unchecked 
			{
			}
		}
		
		
		public static  global::haxe.Fun_3776503c __hx_current;
		
		public override   object __hx_invoke2_o(double __fn_float1, double __fn_float2, object __fn_dyn1, object __fn_dyn2)
		{
			unchecked 
			{
				object infos = ( (( __fn_dyn2 == global::haxe.lang.Runtime.undefined )) ? (((object) (__fn_float2) )) : (( (( __fn_dyn2 == default(object) )) ? (default(object)) : (((object) (__fn_dyn2) )) )) );
				object v = ( (( __fn_dyn1 == global::haxe.lang.Runtime.undefined )) ? (((object) (__fn_float1) )) : (((object) (__fn_dyn1) )) );
				string str = global::haxe.lang.Runtime.concat(global::haxe.lang.Runtime.concat(global::haxe.lang.Runtime.concat(global::haxe.lang.Runtime.concat(global::haxe.lang.Runtime.toString(global::haxe.lang.Runtime.getField(infos, "fileName", 1648581351, true)), ":"), global::haxe.lang.Runtime.toString(((int) (global::haxe.lang.Runtime.getField_f(infos, "lineNumber", 1981972957, true)) ))), ": "), global::Std.@string(v));
				System.Console.WriteLine(str);
				return default(object);
			}
		}
		
		
	}
}


