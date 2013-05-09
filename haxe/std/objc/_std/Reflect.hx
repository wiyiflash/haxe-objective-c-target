/*
 * Copyright (c) 2005, The haXe Project Contributors
 * All rights reserved.
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 *   - Redistributions of source code must retain the above copyright
 *     notice, this list of conditions and the following disclaimer.
 *   - Redistributions in binary form must reproduce the above copyright
 *     notice, this list of conditions and the following disclaimer in the
 *     documentation and/or other materials provided with the distribution.
 *
 * THIS SOFTWARE IS PROVIDED BY THE HAXE PROJECT CONTRIBUTORS "AS IS" AND ANY
 * EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL THE HAXE PROJECT CONTRIBUTORS BE LIABLE FOR
 * ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
 * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
 * CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
 * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
 * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH
 * DAMAGE.
 */


@:coreApi class Reflect {

	public  static function hasField( o : Dynamic, field : String ) : Bool untyped {
		return o!=null && o.hx_has_field (field);
	}

	public static function field( o : Dynamic, field : String ) : Dynamic untyped {
		return (o==null) ? null : o.hx_field(field,false);
	}

	public inline static function setField( o : Dynamic, field : String, value : Dynamic ) : Void untyped {
		if (o!=null)
			o.hx_set_field (field,value,false);
	}

	public static inline function getProperty( o : Dynamic, field : String ) : Dynamic {
		return (o==null) ? null : o.hx_field (field,true);
	}

	public static inline function setProperty( o : Dynamic, field : String, value : Dynamic ) : Void {
		if (o!=null)
			o.hx_set_field (field,value,true);
	}

	public static function callMethod( o : Dynamic, func : Dynamic, args : Array<Dynamic> ) : Dynamic untyped {
		if (func!=null && func.hx_get_type() == __global__.vtString)
			func = o.hx_field(func,true);
		untyped func.hx_set_this(o);
		return untyped func.performSelector ( new SEL(args));
	}

	public static function fields( o : Dynamic ) : Array<String> untyped {
		if( o == null ) return new Array();
		var a : Array<String> = [];
		o.hx_get_fields(a);
		return a;
	}

	public static function isFunction( f : Dynamic ) : Bool untyped {
		return f!=null && f.hx_get_type() ==  __global__.vtFunction;
	}

	public static function compare<T>( a : T, b : T ) : Int {
		return ( a == b ) ? 0 : (((cast a) > (cast b)) ? 1 : -1);
	}

	public static function compareMethods( f1 : Dynamic, f2 : Dynamic ) : Bool {
		if( f1 == f2 )
			return true;
		if( !isFunction(f1) || !isFunction(f2) )
			return false;
		return untyped __global__.__hxcpp_same_closure(f1,f2);
	}

	public static function isObject( v : Dynamic ) : Bool untyped {
		if (v==null) return false;
		var t:Int = v.hx_get_type();
		return t==__global__.vtObject || 
			t==__global__.vtClass || 
			t==__global__.vtString ||
			t==__global__.vtArray;
	}

	public static function deleteField(o:Dynamic, field:String) :Bool untyped {
		if (o==null) return false;
		return untyped __global__.__hxcpp_anon_remove(o,f);
	}

	public static function copy<T>( o : T ) : T {
		if (o==null) return null;
		if(untyped o.hx_get_type()==__global__.vtString ) return o;
		if(untyped o.hx_get_type()==__global__.vtArray )
			return untyped o.hx_field("copy",true)();
		var o2 : Dynamic = {};
		for( f in Reflect.fields(o) )
			Reflect.setField (o2,f,Reflect.field(o,f));
		return o2;
	}

	public static function makeVarArgs( f : Array<Dynamic> -> Dynamic ) : Dynamic {
		return untyped __global__.__hxcpp_create_var_args(f);
	}
}
