
public  class List<T> : global::haxe.lang.HxObject, global::List 
{
	public    List() : base()
	{
		unchecked 
		{
			global::List<object>.__hx_ctor<T>(this);
		}
	}
	
	
	public static   void __hx_ctor<T2>(global::List<T2> __temp_me16)
	{
		unchecked 
		{
			__temp_me16.length = 0;
		}
	}
	
	
	public static  new object __hx_createEmpty()
	{
		unchecked 
		{
			return new global::List<object>(global::haxe.lang.EmptyObject.EMPTY);
		}
	}
	
	
	public static  new object __hx_create(global::Array arr)
	{
		unchecked 
		{
			return new global::List<object>();
		}
	}
	
	
	public    List(global::haxe.lang.EmptyObject empty) : base()
	{
		unchecked 
		{
		}
	}
	
	
	   object List.cast<T1>()
	{
		unchecked 
		{
			if (global::haxe.lang.Runtime.eq(typeof(T), typeof(T1))) 
			{
				return this;
			}
			
			global::List<T1> new_me = new global::List<T1>(global::haxe.lang.EmptyObject.EMPTY);
			{
				object __temp_iterator42 = global::Reflect.fields(this).iterator();
				while (((bool) (global::haxe.lang.Runtime.callField(__temp_iterator42, "hasNext", 407283053, default(global::Array))) ))
				{
					string field = global::haxe.lang.Runtime.toString(global::haxe.lang.Runtime.callField(__temp_iterator42, "next", 1224901875, default(global::Array)));
					switch (field)
					{
						default:
						{
							global::Reflect.setField(new_me, field, ((object) (global::Reflect.field(this, field)) ));
							break;
						}
						
					}
					
				}
				
			}
			
			return new_me;
		}
	}
	
	
	public virtual   global::List<X> map<X>(global::haxe.lang.Function f)
	{
		unchecked 
		{
			global::List<X> b = new global::List<X>();
			global::Array l = this.h;
			while (( l != default(global::Array) ))
			{
				T v = global::haxe.lang.Runtime.genericCast<T>(l[0]);
				l = ((global::Array) (l[1]) );
				b.@add(global::haxe.lang.Runtime.genericCast<X>(f.__hx_invoke1_o(default(double), v)));
			}
			
			return b;
		}
	}
	
	
	public virtual   global::List<T> filter(global::haxe.lang.Function f)
	{
		unchecked 
		{
			global::List<T> l2 = new global::List<T>();
			global::Array l = this.h;
			while (( l != default(global::Array) ))
			{
				T v = global::haxe.lang.Runtime.genericCast<T>(l[0]);
				l = ((global::Array) (l[1]) );
				if (((bool) (f.__hx_invoke1_o(default(double), v)) )) 
				{
					l2.@add(v);
				}
				
			}
			
			return l2;
		}
	}
	
	
	public virtual   string @join(string sep)
	{
		unchecked 
		{
			global::StringBuf s = new global::StringBuf();
			bool first = true;
			global::Array l = this.h;
			while (( l != default(global::Array) ))
			{
				if (first) 
				{
					first = false;
				}
				 else 
				{
					s.b.Append(global::Std.@string(sep));
				}
				
				s.b.Append(global::Std.@string(l[0]));
				l = ((global::Array) (l[1]) );
			}
			
			return s.toString();
		}
	}
	
	
	public virtual   string toString()
	{
		unchecked 
		{
			global::StringBuf s = new global::StringBuf();
			bool first = true;
			global::Array l = this.h;
			s.b.Append("{");
			while (( l != default(global::Array) ))
			{
				if (first) 
				{
					first = false;
				}
				 else 
				{
					s.b.Append(", ");
				}
				
				s.b.Append(global::Std.@string(global::Std.@string(l[0])));
				l = ((global::Array) (l[1]) );
			}
			
			s.b.Append("}");
			return s.toString();
		}
	}
	
	
	public virtual   object iterator()
	{
		unchecked 
		{
			global::Array<object> h = new global::Array<object>(new object[]{this.h});
			object __temp_stmt60 = default(object);
			{
				global::haxe.lang.Function __temp_odecl58 = new global::Fun_377d2763(h);
				global::haxe.lang.Function __temp_odecl59 = new global::Fun_df0365a8(h);
				__temp_stmt60 = new global::haxe.lang.DynamicObject(new global::Array<int>(new int[]{407283053, 1224901875}), new global::Array<object>(new object[]{__temp_odecl58, __temp_odecl59}), new global::Array<int>(new int[]{}), new global::Array<double>(new double[]{}));
			}
			
			return ((object) (__temp_stmt60) );
		}
	}
	
	
	public virtual   bool @remove(T v)
	{
		unchecked 
		{
			global::Array<object> prev = default(global::Array<object>);
			global::Array l = this.h;
			while (( l != default(global::Array) ))
			{
				if (global::haxe.lang.Runtime.eq(l[0], v)) 
				{
					if (( prev == default(global::Array<object>) )) 
					{
						this.h = ((global::Array) (l[1]) );
					}
					 else 
					{
						prev[1] = l[1];
					}
					
					if (( this.q == l )) 
					{
						this.q = prev;
					}
					
					this.length--;
					return true;
				}
				
				prev = ((global::Array<object>) (((global::Array) (l) ).cast<object>()) );
				l = ((global::Array) (l[1]) );
			}
			
			return false;
		}
	}
	
	
	public virtual   void clear()
	{
		unchecked 
		{
			this.h = default(global::Array);
			this.q = default(global::Array);
			this.length = 0;
		}
	}
	
	
	public virtual   bool isEmpty()
	{
		unchecked 
		{
			return ( this.h == default(global::Array) );
		}
	}
	
	
	public virtual   global::haxe.lang.Null<T> pop()
	{
		unchecked 
		{
			if (( this.h == default(global::Array) )) 
			{
				return default(global::haxe.lang.Null<T>);
			}
			
			global::haxe.lang.Null<T> x = global::haxe.lang.Null<object>.ofDynamic<T>(this.h[0]);
			this.h = ((global::Array) (this.h[1]) );
			if (( this.h == default(global::Array) )) 
			{
				this.q = default(global::Array);
			}
			
			this.length--;
			return x;
		}
	}
	
	
	public virtual   global::haxe.lang.Null<T> last()
	{
		unchecked 
		{
			return ( (( this.q == default(global::Array) )) ? (default(global::haxe.lang.Null<T>)) : (global::haxe.lang.Null<object>.ofDynamic<T>(this.q[0])) );
		}
	}
	
	
	public virtual   global::haxe.lang.Null<T> first()
	{
		unchecked 
		{
			return ( (( this.h == default(global::Array) )) ? (default(global::haxe.lang.Null<T>)) : (global::haxe.lang.Null<object>.ofDynamic<T>(this.h[0])) );
		}
	}
	
	
	public virtual   void push(T item)
	{
		unchecked 
		{
			global::Array x = new global::Array<object>(new object[]{item, this.h});
			this.h = x;
			if (( this.q == default(global::Array) )) 
			{
				this.q = x;
			}
			
			this.length++;
		}
	}
	
	
	public virtual   void @add(T item)
	{
		unchecked 
		{
			global::Array x = new global::Array<object>(new object[]{item});
			if (( this.h == default(global::Array) )) 
			{
				this.h = x;
			}
			 else 
			{
				this.q[1] = x;
			}
			
			this.q = x;
			this.length++;
		}
	}
	
	
	public  int length;
	
	public  global::Array q;
	
	public  global::Array h;
	
	public override   double __hx_setField_f(string field, int hash, double @value, bool handleProperties)
	{
		unchecked 
		{
			switch (hash)
			{
				case 520590566:
				{
					this.length = ((int) (@value) );
					return @value;
				}
				
				
				default:
				{
					return base.__hx_setField_f(field, hash, @value, handleProperties);
				}
				
			}
			
		}
	}
	
	
	public override   object __hx_setField(string field, int hash, object @value, bool handleProperties)
	{
		unchecked 
		{
			switch (hash)
			{
				case 104:
				{
					this.h = ((global::Array) (@value) );
					return @value;
				}
				
				
				case 113:
				{
					this.q = ((global::Array) (@value) );
					return @value;
				}
				
				
				case 520590566:
				{
					this.length = ((int) (global::haxe.lang.Runtime.toInt(@value)) );
					return @value;
				}
				
				
				default:
				{
					return base.__hx_setField(field, hash, @value, handleProperties);
				}
				
			}
			
		}
	}
	
	
	public override   object __hx_getField(string field, int hash, bool throwErrors, bool isCheck, bool handleProperties)
	{
		unchecked 
		{
			switch (hash)
			{
				case 104:
				{
					return this.h;
				}
				
				
				case 113:
				{
					return this.q;
				}
				
				
				case 520590566:
				{
					return this.length;
				}
				
				
				case 4846113:
				{
					return new global::haxe.lang.Closure(this, "add", 4846113);
				}
				
				
				case 1247875546:
				{
					return new global::haxe.lang.Closure(this, "push", 1247875546);
				}
				
				
				case 10319920:
				{
					return new global::haxe.lang.Closure(this, "first", 10319920);
				}
				
				
				case 1202522710:
				{
					return new global::haxe.lang.Closure(this, "last", 1202522710);
				}
				
				
				case 5594513:
				{
					return new global::haxe.lang.Closure(this, "pop", 5594513);
				}
				
				
				case 207609411:
				{
					return new global::haxe.lang.Closure(this, "isEmpty", 207609411);
				}
				
				
				case 1213952397:
				{
					return new global::haxe.lang.Closure(this, "clear", 1213952397);
				}
				
				
				case 76061764:
				{
					return new global::haxe.lang.Closure(this, "remove", 76061764);
				}
				
				
				case 328878574:
				{
					return new global::haxe.lang.Closure(this, "iterator", 328878574);
				}
				
				
				case 946786476:
				{
					return new global::haxe.lang.Closure(this, "toString", 946786476);
				}
				
				
				case 1181037546:
				{
					return new global::haxe.lang.Closure(this, "join", 1181037546);
				}
				
				
				case 87367608:
				{
					return new global::haxe.lang.Closure(this, "filter", 87367608);
				}
				
				
				case 5442204:
				{
					return new global::haxe.lang.Closure(this, "map", 5442204);
				}
				
				
				default:
				{
					return base.__hx_getField(field, hash, throwErrors, isCheck, handleProperties);
				}
				
			}
			
		}
	}
	
	
	public override   double __hx_getField_f(string field, int hash, bool throwErrors, bool handleProperties)
	{
		unchecked 
		{
			switch (hash)
			{
				case 520590566:
				{
					return ((double) (this.length) );
				}
				
				
				default:
				{
					return base.__hx_getField_f(field, hash, throwErrors, handleProperties);
				}
				
			}
			
		}
	}
	
	
	public override   object __hx_invokeField(string field, int hash, global::Array dynargs)
	{
		unchecked 
		{
			switch (hash)
			{
				case 4846113:
				{
					this.@add(global::haxe.lang.Runtime.genericCast<T>(dynargs[0]));
					break;
				}
				
				
				case 1247875546:
				{
					this.push(global::haxe.lang.Runtime.genericCast<T>(dynargs[0]));
					break;
				}
				
				
				case 10319920:
				{
					return (this.first()).toDynamic();
				}
				
				
				case 1202522710:
				{
					return (this.last()).toDynamic();
				}
				
				
				case 5594513:
				{
					return (this.pop()).toDynamic();
				}
				
				
				case 207609411:
				{
					return this.isEmpty();
				}
				
				
				case 1213952397:
				{
					this.clear();
					break;
				}
				
				
				case 76061764:
				{
					return this.@remove(global::haxe.lang.Runtime.genericCast<T>(dynargs[0]));
				}
				
				
				case 328878574:
				{
					return this.iterator();
				}
				
				
				case 946786476:
				{
					return this.toString();
				}
				
				
				case 1181037546:
				{
					return this.@join(global::haxe.lang.Runtime.toString(dynargs[0]));
				}
				
				
				case 87367608:
				{
					return this.filter(((global::haxe.lang.Function) (dynargs[0]) ));
				}
				
				
				case 5442204:
				{
					return this.map<object>(((global::haxe.lang.Function) (dynargs[0]) ));
				}
				
				
				default:
				{
					return base.__hx_invokeField(field, hash, dynargs);
				}
				
			}
			
			return default(object);
		}
	}
	
	
	public override   void __hx_getFields(global::Array<object> baseArr)
	{
		unchecked 
		{
			baseArr.push("h");
			baseArr.push("q");
			baseArr.push("length");
			{
				base.__hx_getFields(baseArr);
			}
			
		}
	}
	
	
	public override string ToString()
	{
		return this.toString();
	}
	
	
}



public  class Fun_377d2763 : global::haxe.lang.Function 
{
	public    Fun_377d2763(global::Array<object> h) : base(0, 0)
	{
		unchecked 
		{
			this.h = h;
		}
	}
	
	
	public override   object __hx_invoke0_o()
	{
		unchecked 
		{
			return ( ((global::Array) (this.h[0]) ) != default(global::Array) );
		}
	}
	
	
	public  global::Array<object> h;
	
}



public  class Fun_df0365a8 : global::haxe.lang.Function 
{
	public    Fun_df0365a8(global::Array<object> h) : base(0, 0)
	{
		unchecked 
		{
			this.h = h;
		}
	}
	
	
	public override   object __hx_invoke0_o()
	{
		unchecked 
		{
			if (( ((global::Array) (this.h[0]) ) == default(global::Array) )) 
			{
				return default(object);
			}
			
			object x = ((global::Array) (this.h[0]) )[0];
			this.h[0] = ((global::Array) (this.h[0]) )[1];
			return x;
		}
	}
	
	
	public  global::Array<object> h;
	
}



public  interface List : global::haxe.lang.IHxObject, global::haxe.lang.IGenericObject 
{
	   object cast<T1>();
	
}


