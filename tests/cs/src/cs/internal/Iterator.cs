
namespace haxe.lang
{
	public  interface Iterator<T> : global::haxe.lang.IHxObject, global::haxe.lang.Iterator 
	{
		   T next();
		
		   bool hasNext();
		
	}
}



namespace haxe.lang
{
	public  interface Iterator : global::haxe.lang.IHxObject, global::haxe.lang.IGenericObject 
	{
		   object cast<T>();
		
	}
}



namespace haxe.lang
{
	public  interface Iterable<T> : global::haxe.lang.IHxObject, global::haxe.lang.Iterable 
	{
		   global::haxe.lang.Iterator<T> iterator();
		
	}
}



namespace haxe.lang
{
	public  interface Iterable : global::haxe.lang.IHxObject, global::haxe.lang.IGenericObject 
	{
		   object cast<T>();
		
	}
}


