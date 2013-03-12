
namespace haxe.lang
{
	public  class HaxeException : global::System.Exception 
	{
		public    HaxeException(object obj) : base()
		{
			unchecked 
			{
				if (( obj is global::haxe.lang.HaxeException )) 
				{
					global::haxe.lang.HaxeException _obj = ((global::haxe.lang.HaxeException) (obj) );
					obj = _obj.getObject();
				}
				
				this.obj = obj;
			}
		}
		
		
		public static   global::System.Exception wrap(object obj)
		{
			unchecked 
			{
				if (( obj is global::System.Exception )) 
				{
					return ((global::System.Exception) (obj) );
				}
				
				return new global::haxe.lang.HaxeException(obj);
			}
		}
		
		
		public virtual   string toString()
		{
			unchecked 
			{
				return global::haxe.lang.Runtime.concat("Haxe Exception: ", global::Std.@string(this.obj));
			}
		}
		
		
		public virtual   object getObject()
		{
			unchecked 
			{
				return this.obj;
			}
		}
		
		
		public  object obj;
		
		public override string ToString()
		{
			return this.toString();
		}
		
		
	}
}


