package _Map {
	import haxe.ds.IntMap;
	import haxe.ds._HashMap.HashMapImpl;
	import haxe.ds.StringMap;
	import haxe.ds.ObjectMap;
	public class MapImpl {
		static public var _new : Function;
		static public function set(this1 : *,key : *,value : *) : void {
			this1.set(key,value);
		}
		
		static public function get(this1 : *,key : *) : * {
			return this1.get(key);
		}
		
		static public function exists(this1 : *,key : *) : Boolean {
			return this1.exists(key);
		}
		
		static public function remove(this1 : *,key : *) : Boolean {
			return this1.remove(key);
		}
		
		static public function keys(this1 : *) : * {
			return this1.keys();
		}
		
		static public function iterator(this1 : *) : * {
			return this1.iterator();
		}
		
		static public function toString(this1 : *) : String {
			return this1.toString();
		}
		
		static protected function toStringMap(t : *) : haxe.ds.StringMap {
			return new haxe.ds.StringMap();
		}
		
		static protected function toIntMap(t : *) : haxe.ds.IntMap {
			return new haxe.ds.IntMap();
		}
		
		static protected function toHashMap(t : *) : * {
			return haxe.ds._HashMap.HashMapImpl._new();
		}
		
		static protected function toObjectMap(t : *) : haxe.ds.ObjectMap {
			return new haxe.ds.ObjectMap();
		}
		
		static protected function fromStringMap(map : haxe.ds.StringMap) : * {
			return map;
		}
		
		static protected function fromIntMap(map : haxe.ds.IntMap) : * {
			return map;
		}
		
		static protected function fromHashMap(map : *) : * {
			return map;
		}
		
		static protected function fromObjectMap(map : haxe.ds.ObjectMap) : * {
			return map;
		}
		
	}
}
