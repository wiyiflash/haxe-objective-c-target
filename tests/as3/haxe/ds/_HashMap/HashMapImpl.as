package haxe.ds._HashMap {
	import haxe.ds.IntMap;
	public class HashMapImpl {
		static public function _new() : * {
			return { keys : new haxe.ds.IntMap(), values : new haxe.ds.IntMap()}
		}
		
		static public function set(this1 : *,k : *,v : *) : void {
			this1.keys.set(k.hashCode(),k);
			this1.values.set(k.hashCode(),v);
		}
		
		static public function get(this1 : *,k : *) : * {
			return this1.values.get(k.hashCode());
		}
		
		static public function exists(this1 : *,k : *) : Boolean {
			return this1.values.exists(k.hashCode());
		}
		
		static public function remove(this1 : *,k : *) : Boolean {
			this1.values.remove(k.hashCode());
			return this1.keys.remove(k.hashCode());
		}
		
		static public function keys(this1 : *) : * {
			return this1.keys.iterator();
		}
		
		static public function iterator(this1 : *) : * {
			return this1.values.iterator();
		}
		
		static protected function toIMap(this1 : *) : * {
			return this1;
		}
		
	}
}
