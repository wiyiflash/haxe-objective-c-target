
namespace haxe.io
{
	public  class Error : haxe.lang.Enum 
	{
		static Error() 
		{
			haxe.io.Error.constructs = new Array<object>(new object[]{"Blocked", "Overflow", "OutsideBounds", "Custom"});
			haxe.io.Error.Blocked = new haxe.io.Error(0, default(Array<object>));
			haxe.io.Error.Overflow = new haxe.io.Error(1, default(Array<object>));
			haxe.io.Error.OutsideBounds = new haxe.io.Error(2, default(Array<object>));
		}
		public    Error(int index, Array<object> @params) : base(index, @params)
		{
			unchecked 
			{
				haxe.io.Error.__hx_ctor(this, index, @params);
			}
		}
		
		
		public static   void __hx_ctor(haxe.io.Error __temp_me36, int index, Array<object> @params)
		{
			unchecked 
			{
				object __temp_expr107 = default(object);
			}
		}
		
		
		public static  Array<object> constructs;
		
		public static  haxe.io.Error Blocked;
		
		public static  haxe.io.Error Overflow;
		
		public static  haxe.io.Error OutsideBounds;
		
		public static   haxe.io.Error Custom(object e)
		{
			unchecked 
			{
				return new haxe.io.Error(3, new Array<object>(new object[]{((object) (e) )}));
			}
		}
		
		
		public static   object __hx_createEmpty()
		{
			unchecked 
			{
				return new haxe.io.Error(haxe.lang.EmptyObject.EMPTY);
			}
		}
		
		
		public static   object __hx_create(Array arr)
		{
			unchecked 
			{
				return new haxe.io.Error(haxe.lang.Runtime.toInt(arr[0]), ((Array<object>) (((Array) (arr[1]) ).cast<object>()) ));
			}
		}
		
		
		public    Error(haxe.lang.EmptyObject empty) : base(haxe.lang.EmptyObject.EMPTY)
		{
			unchecked 
			{
			}
		}
		
		
	}
}


