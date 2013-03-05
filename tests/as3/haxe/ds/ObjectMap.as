package haxe.ds {
	import flash.utils.Dictionary;
	import flash.Boot;
	public class ObjectMap extends flash.utils.Dictionary {
		public function ObjectMap(weakKeys : * = null) : void { if( !flash.Boot.skip_constructor ) {
			super(weakKeys);
		}}
		
		public function toString() : String {
			var s : String = "";
			var it : * = this.keys();
			{ var $it : * = it;
			while( $it.hasNext() ) { var i : * = $it.next();
			{
				s += (((s == "")?"":",")) + Std.string(i);
				s += " => ";
				s += Std.string(this.get(i));
			}
			}}
			return s + "}";
		}
		
		public function iterator() : * {
			var ret : Array = [];
			{ var $it : * = this.keys();
			while( $it.hasNext() ) { var i : * = $it.next();
			ret.push(this.get(i));
			}}
			return ret.iterator();
		}
		
		public function keys() : * {
			return (function($this:ObjectMap) : * {
				var $r : *;
				$r = new Array();
				for(var $k2 : String in $this) $r.push($k2);
				return $r;
			}(this)).iterator();
		}
		
		public function remove(key : *) : Boolean {
			var has : Boolean = this.exists(key);
			delete(this[key]);
			return has;
		}
		
		public function exists(key : *) : Boolean {
			return this[key] != null;
		}
		
		public function set(key : *,value : *) : void {
			this[key] = value;
		}
		
		public function get(key : *) : * {
			return this[key];
		}
		
	}
}
