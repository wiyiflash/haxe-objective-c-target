package haxe.ds;

@:category("NSMutableDictionary") @:coreApi class ObjectMap<K,V> {
	
	public function new(?weakKeys:Bool = false) : Void {
		
	}

	public function get( key : K ) : Null<V> {
		//return untyped this.objectForKey ( key );
		return untyped __objc__("[self objectForKey:[NSString stringWithFormat:@\"%@\",key]]");
	}

	public function set( key : K, value : V ) : Void {
		//untyped this.setObject (value, key);
		untyped __objc__("[self setObject:value forKey:[NSString stringWithFormat:@\"%@\",key]]");
	}

	public function exists( key : K ) : Bool {
		//return untyped this.objectForKey ( key ) != null;
		return untyped __objc__("[self objectForKey:[NSString stringWithFormat:@\"%@\",key]] != nil");
	}

	public function remove( key : K ) : Bool {
		//return untyped this.removeObjectForKey ( key );
		if (exists(key)) {
			untyped __objc__("[self removeObjectForKey:[NSString stringWithFormat:@\"%@\",key]]");
			return true;
		}
		return false;
	}

	public function keys() : Iterator<K> {
		var a:Array<K> = untyped this.allKeys();
		return a.iterator();
	}

	public function iterator() : Iterator<V> {
		var a:Array<Dynamic> = untyped this.allValues();
		return a.iterator();
	}

	public function toString() : String {
		var s = "";
		var it = keys();
		for( i in it ) {
			s += (s == "" ? "" : ",") + Std.string(i);
			s += " => ";
			s += Std.string(get(i));
		}
		return s + "}";
/*		return untyped this.description();*/
	}

}
/*@:coreApi
class ObjectMap<K,V> extends flash.utils.Dictionary {

	public inline function get( key : K ) : Null<V> {
		return untyped this[key];
	}

	public inline function set( key : K, value : V ):Void {
		untyped this[key] = value;
	}

	public inline function exists( key : K ) : Bool {
		return untyped this[key] != null;
	}

	public function remove( key : K ):Bool {
		var has = exists(key);
		untyped __delete__(this, key);
		return has;
	}

	public function keys() : Iterator<K> {
		return untyped __keys__(this).iterator();
	}

	public function iterator() : Iterator<V> {
		var ret = [];
		for (i in keys())
			ret.push(get(i));
		return ret.iterator();
	}

	public function toString() : String {
		var s = "";
		var it = keys();
		for( i in it ) {
			s += (s == "" ? "" : ",") + Std.string(i);
			s += " => ";
			s += Std.string(get(i));
		}
		return s + "}";
	}
}*/