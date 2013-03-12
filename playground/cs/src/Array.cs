
public sealed class Array<T> : global::haxe.lang.HxObject, global::Array 
{
		public Array(T[] native)	{		this.__a = native;		this.length = native.Length;	}public    Array() : base()
	{
		unchecked 
		{
			global::Array<object>.__hx_ctor<T>(this);
		}
	}
	
	
	public static   void __hx_ctor<T2>(global::Array<T2> __temp_me4)
	{
		unchecked 
		{
			__temp_me4.length = 0;
			__temp_me4.__a = new T2[0];
		}
	}
	
	
	public static   global::Array<X> ofNative<X>(X[] native)
	{
					return new Array<X>(native);	
	}
	
	
	public static   global::Array<Y> alloc<Y>(int size)
	{
					return new Array<Y>(new Y[size]);	
	}
	
	
	public static  new object __hx_createEmpty()
	{
		unchecked 
		{
			return new global::Array<object>(global::haxe.lang.EmptyObject.EMPTY);
		}
	}
	
	
	public static  new object __hx_create(global::Array arr)
	{
		unchecked 
		{
			return new global::Array<object>();
		}
	}
	
	
	public    Array(global::haxe.lang.EmptyObject empty) : base()
	{
		unchecked 
		{
		}
	}
	
	
	   object Array.cast<T1>()
	{
		unchecked 
		{
			if (global::haxe.lang.Runtime.eq(typeof(T), typeof(T1))) 
			{
				return this;
			}
			
			global::Array<T1> new_me = new global::Array<T1>(global::haxe.lang.EmptyObject.EMPTY);
			{
				object __temp_iterator34 = global::Reflect.fields(this).iterator();
				while (((bool) (global::haxe.lang.Runtime.callField(__temp_iterator34, "hasNext", 407283053, default(global::Array))) ))
				{
					string field = global::haxe.lang.Runtime.toString(global::haxe.lang.Runtime.callField(__temp_iterator34, "next", 1224901875, default(global::Array)));
					switch (field)
					{
						case "__a":
						{
							{
								T1[] __temp_new_arr1 = new T1[this.__a.Length];
								int __temp_i2 = -1;
								while ((  ++ __temp_i2 < this.__a.Length ))
								{
									object __temp_obj3 = ((object) (this.__a[__temp_i2]) );
									if ( ! (( __temp_obj3 == default(T[]) )) ) 
									{
										__temp_new_arr1[__temp_i2] = global::haxe.lang.Runtime.genericCast<T1>(__temp_obj3);
									}
									
								}
								
								new_me.__a = __temp_new_arr1;
							}
							
							break;
						}
						
						
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
	
	
	public   T __unsafe_set(int idx, T val)
	{
		unchecked 
		{
			return this.__a[idx] = val;
		}
	}
	
	
	public   T __unsafe_get(int idx)
	{
		unchecked 
		{
			return this.__a[idx];
		}
	}
	
	
	public   T __set(int idx, T v)
	{
		unchecked 
		{
			uint idx1 = ((uint) (idx) );
			T[] __a = this.__a;
			if (( idx1 >= __a.Length )) 
			{
				T[] newArr = new T[((int) (( idx1 + 1 )) )];
				__a.CopyTo(newArr, 0);
				this.__a = __a = newArr;
				this.length = ((int) (( idx1 + 1 )) );
			}
			
			return __a[idx1] = v;
		}
	}
	
	
	public   T __get(int idx)
	{
		unchecked 
		{
			T[] __a = this.__a;
			uint idx1 = ((uint) (idx) );
			if (( idx1 >= this.length )) 
			{
				return default(T);
			}
			
			return __a[idx1];
		}
	}
	
	
	public   object iterator()
	{
		unchecked 
		{
			global::Array<object> _g = new global::Array<object>(new object[]{this});
			global::Array<int> i = new global::Array<int>(new int[]{0});
			global::Array<int> len = new global::Array<int>(new int[]{this.length});
			{
				global::haxe.lang.Function __temp_odecl48 = new global::Fun_13d3738f(i, len);
				global::haxe.lang.Function __temp_odecl49 = new global::Fun_d3b1a04a<T>(_g, i);
				return new global::haxe.lang.DynamicObject(new global::Array<int>(new int[]{407283053, 1224901875}), new global::Array<object>(new object[]{__temp_odecl48, __temp_odecl49}), new global::Array<int>(new int[]{}), new global::Array<double>(new double[]{}));
			}
			
		}
	}
	
	
	public   global::Array<T> copy()
	{
		unchecked 
		{
			int len = this.length;
			T[] __a = this.__a;
			T[] newarr = new T[len];
			global::System.Array.Copy(__a, 0, newarr, 0, len);
			return global::Array<object>.ofNative<T>(newarr);
		}
	}
	
	
	public   bool @remove(T x)
	{
		unchecked 
		{
			T[] __a = this.__a;
			int i = -1;
			int length = this.length;
			while ((  ++ i < length ))
			{
				if (global::haxe.lang.Runtime.eq(__a[i], x)) 
				{
					global::System.Array.Copy(__a, ( i + 1 ), __a, i, ( ( length - i ) - 1 ));
					__a[ -- this.length] = default(T);
					return true;
				}
				
			}
			
			return false;
		}
	}
	
	
	public   void insert(int pos, T x)
	{
		unchecked 
		{
			int l = this.length;
			if (( pos < 0 )) 
			{
				pos = ( l + pos );
				if (( pos < 0 )) 
				{
					pos = 0;
				}
				
			}
			
			if (( pos >= l )) 
			{
				this.push(x);
				return ;
			}
			 else 
			{
				if (( pos == 0 )) 
				{
					this.unshift(x);
					return ;
				}
				
			}
			
			if (( l >= this.__a.Length )) 
			{
				int newLen = ( (( this.length << 1 )) + 1 );
				T[] newarr = new T[newLen];
				global::System.Array.Copy(this.__a, 0, newarr, 0, pos);
				newarr[pos] = x;
				global::System.Array.Copy(this.__a, pos, newarr, ( pos + 1 ), ( l - pos ));
				this.__a = newarr;
				 ++ this.length;
			}
			 else 
			{
				T[] __a = this.__a;
				global::System.Array.Copy(__a, pos, __a, ( pos + 1 ), ( l - pos ));
				global::System.Array.Copy(__a, 0, __a, 0, pos);
				__a[pos] = x;
				 ++ this.length;
			}
			
		}
	}
	
	
	public   void unshift(T x)
	{
		unchecked 
		{
			T[] __a = this.__a;
			int length = this.length;
			if (( length >= __a.Length )) 
			{
				int newLen = ( (( length << 1 )) + 1 );
				T[] newarr = new T[newLen];
				global::System.Array.Copy(__a, 0, newarr, 1, length);
				this.__a = newarr;
			}
			 else 
			{
				global::System.Array.Copy(__a, 0, __a, 1, length);
			}
			
			this.__a[0] = x;
			 ++ this.length;
		}
	}
	
	
	public   string toString()
	{
		unchecked 
		{
			global::StringBuf ret = new global::StringBuf();
			T[] a = this.__a;
			ret.b.Append("[");
			bool first = true;
			{
				int _g1 = 0;
				int _g = this.length;
				while (( _g1 < _g ))
				{
					int i = _g1++;
					if (first) 
					{
						first = false;
					}
					 else 
					{
						ret.b.Append(",");
					}
					
					ret.b.Append(global::Std.@string(a[i]));
				}
				
			}
			
			ret.b.Append("]");
			return ret.toString();
		}
	}
	
	
	public   void spliceVoid(int pos, int len)
	{
		unchecked 
		{
			if (( len < 0 )) 
			{
				return ;
			}
			
			if (( pos < 0 )) 
			{
				pos = ( this.length + pos );
				if (( pos < 0 )) 
				{
					pos = 0;
				}
				
			}
			
			if (( pos > this.length )) 
			{
				pos = 0;
				len = 0;
			}
			 else 
			{
				if (( ( pos + len ) > this.length )) 
				{
					len = ( this.length - pos );
					if (( len < 0 )) 
					{
						len = 0;
					}
					
				}
				
			}
			
			T[] a = this.__a;
			int end = ( pos + len );
			global::System.Array.Copy(a, end, a, pos, ( this.length - end ));
			this.length -= len;
			while ((  -- len >= 0 ))
			{
				a[( this.length + len )] = default(T);
			}
			
		}
	}
	
	
	public   global::Array<T> splice(int pos, int len)
	{
		unchecked 
		{
			if (( len < 0 )) 
			{
				return new global::Array<T>();
			}
			
			if (( pos < 0 )) 
			{
				pos = ( this.length + pos );
				if (( pos < 0 )) 
				{
					pos = 0;
				}
				
			}
			
			if (( pos > this.length )) 
			{
				pos = 0;
				len = 0;
			}
			 else 
			{
				if (( ( pos + len ) > this.length )) 
				{
					len = ( this.length - pos );
					if (( len < 0 )) 
					{
						len = 0;
					}
					
				}
				
			}
			
			T[] a = this.__a;
			T[] ret = new T[len];
			global::System.Array.Copy(a, pos, ret, 0, len);
			global::Array<T> ret1 = global::Array<object>.ofNative<T>(ret);
			int end = ( pos + len );
			global::System.Array.Copy(a, end, a, pos, ( this.length - end ));
			this.length -= len;
			while ((  -- len >= 0 ))
			{
				a[( this.length + len )] = default(T);
			}
			
			return ret1;
		}
	}
	
	
	public   void quicksort(int lo, int hi, global::haxe.lang.Function f)
	{
		unchecked 
		{
			T[] buf = this.__a;
			int i = lo;
			int j = hi;
			T p = buf[( ( i + j ) >> 1 )];
			while (( i <= j ))
			{
				while (( ((int) (f.__hx_invoke2_f(default(double), default(double), buf[i], p)) ) < 0 ))
				{
					i++;
				}
				
				while (( ((int) (f.__hx_invoke2_f(default(double), default(double), buf[j], p)) ) > 0 ))
				{
					j--;
				}
				
				if (( i <= j )) 
				{
					T t = buf[i];
					buf[i++] = buf[j];
					buf[j--] = t;
				}
				
			}
			
			if (( lo < j )) 
			{
				this.quicksort(lo, j, f);
			}
			
			if (( i < hi )) 
			{
				this.quicksort(i, hi, f);
			}
			
		}
	}
	
	
	public   void sort(global::haxe.lang.Function f)
	{
		unchecked 
		{
			if (( this.length == 0 )) 
			{
				return ;
			}
			
			this.quicksort(0, ( this.length - 1 ), f);
		}
	}
	
	
	public   global::Array<T> slice(int pos, global::haxe.lang.Null<int> end)
	{
		unchecked 
		{
			if (( pos < 0 )) 
			{
				pos = ( this.length + pos );
				if (( pos < 0 )) 
				{
					pos = 0;
				}
				
			}
			
			if ( ! (end.hasValue) ) 
			{
				end = new global::haxe.lang.Null<int>(new global::haxe.lang.Null<int>(this.length, true).@value, true);
			}
			 else 
			{
				if (( end.@value < 0 )) 
				{
					end = new global::haxe.lang.Null<int>(new global::haxe.lang.Null<int>(( this.length + end.@value ), true).@value, true);
				}
				
			}
			
			if (( end.@value > this.length )) 
			{
				end = new global::haxe.lang.Null<int>(new global::haxe.lang.Null<int>(this.length, true).@value, true);
			}
			
			int len = ( end.@value - pos );
			if (( len < 0 )) 
			{
				return new global::Array<T>();
			}
			
			T[] newarr = new T[len];
			global::System.Array.Copy(this.__a, pos, newarr, 0, len);
			return global::Array<object>.ofNative<T>(newarr);
		}
	}
	
	
	public   global::haxe.lang.Null<T> shift()
	{
		unchecked 
		{
			int l = this.length;
			if (( l == 0 )) 
			{
				return default(global::haxe.lang.Null<T>);
			}
			
			T[] a = this.__a;
			T x = a[0];
			l -= 1;
			global::System.Array.Copy(a, 1, a, 0, ( this.length - 1 ));
			a[l] = default(T);
			this.length = l;
			return new global::haxe.lang.Null<T>(x, true);
		}
	}
	
	
	public   void reverse()
	{
		unchecked 
		{
			int i = 0;
			int l = this.length;
			T[] a = this.__a;
			int half = ( l >> 1 );
			l -= 1;
			while (( i < half ))
			{
				T tmp = a[i];
				a[i] = a[( l - i )];
				a[( l - i )] = tmp;
				i += 1;
			}
			
		}
	}
	
	
	public   int push(T x)
	{
		unchecked 
		{
			if (( this.length >= this.__a.Length )) 
			{
				int newLen = ( (( this.length << 1 )) + 1 );
				T[] newarr = new T[newLen];
				this.__a.CopyTo(newarr, 0);
				this.__a = newarr;
			}
			
			this.__a[this.length] = x;
			return this.length++;
		}
	}
	
	
	public   global::haxe.lang.Null<T> pop()
	{
		unchecked 
		{
			T[] __a = this.__a;
			int length = this.length;
			if (( length > 0 )) 
			{
				T val = __a[ -- length];
				__a[length] = default(T);
				this.length = length;
				return new global::haxe.lang.Null<T>(val, true);
			}
			 else 
			{
				return default(global::haxe.lang.Null<T>);
			}
			
		}
	}
	
	
	public   string @join(string sep)
	{
		unchecked 
		{
			global::StringBuf buf = new global::StringBuf();
			int i = -1;
			bool first = true;
			int length = this.length;
			while ((  ++ i < length ))
			{
				if (first) 
				{
					first = false;
				}
				 else 
				{
					buf.b.Append(global::Std.@string(sep));
				}
				
				buf.b.Append(global::Std.@string(this.__a[i]));
			}
			
			return buf.toString();
		}
	}
	
	
	public   void concatNative(T[] a)
	{
		unchecked 
		{
			T[] __a = this.__a;
			int len = ( this.length + a.Length );
			if (( __a.Length >= len )) 
			{
				global::System.Array.Copy(a, 0, __a, this.length, this.length);
			}
			 else 
			{
				T[] newarr = new T[len];
				global::System.Array.Copy(__a, 0, newarr, 0, this.length);
				global::System.Array.Copy(a, 0, newarr, this.length, a.Length);
				this.__a = newarr;
			}
			
			this.length = len;
		}
	}
	
	
	public   global::Array<T> concat(global::Array<T> a)
	{
		unchecked 
		{
			int len = ( this.length + a.length );
			T[] retarr = new T[len];
			global::System.Array.Copy(this.__a, 0, retarr, 0, this.length);
			global::System.Array.Copy(a.__a, 0, retarr, this.length, a.length);
			return global::Array<object>.ofNative<T>(retarr);
		}
	}
	
	
	public  T[] __a;
	
	public  int length;
	
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
				case 520590566:
				{
					this.length = ((int) (global::haxe.lang.Runtime.toInt(@value)) );
					return @value;
				}
				
				
				case 4745537:
				{
					this.__a = ((T[]) (@value) );
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
				case 520590566:
				{
					return this.length;
				}
				
				
				case 4745537:
				{
					return this.__a;
				}
				
				
				case 1204816148:
				{
					return new global::haxe.lang.Closure(this, "concat", 1204816148);
				}
				
				
				case 1532710347:
				{
					return new global::haxe.lang.Closure(this, "concatNative", 1532710347);
				}
				
				
				case 1181037546:
				{
					return new global::haxe.lang.Closure(this, "join", 1181037546);
				}
				
				
				case 5594513:
				{
					return new global::haxe.lang.Closure(this, "pop", 5594513);
				}
				
				
				case 1247875546:
				{
					return new global::haxe.lang.Closure(this, "push", 1247875546);
				}
				
				
				case 452737314:
				{
					return new global::haxe.lang.Closure(this, "reverse", 452737314);
				}
				
				
				case 2082663554:
				{
					return new global::haxe.lang.Closure(this, "shift", 2082663554);
				}
				
				
				case 2127021138:
				{
					return new global::haxe.lang.Closure(this, "slice", 2127021138);
				}
				
				
				case 1280845662:
				{
					return new global::haxe.lang.Closure(this, "sort", 1280845662);
				}
				
				
				case 1282943179:
				{
					return new global::haxe.lang.Closure(this, "quicksort", 1282943179);
				}
				
				
				case 1067353468:
				{
					return new global::haxe.lang.Closure(this, "splice", 1067353468);
				}
				
				
				case 1352786672:
				{
					return new global::haxe.lang.Closure(this, "spliceVoid", 1352786672);
				}
				
				
				case 946786476:
				{
					return new global::haxe.lang.Closure(this, "toString", 946786476);
				}
				
				
				case 2025055113:
				{
					return new global::haxe.lang.Closure(this, "unshift", 2025055113);
				}
				
				
				case 501039929:
				{
					return new global::haxe.lang.Closure(this, "insert", 501039929);
				}
				
				
				case 76061764:
				{
					return new global::haxe.lang.Closure(this, "remove", 76061764);
				}
				
				
				case 1103412149:
				{
					return new global::haxe.lang.Closure(this, "copy", 1103412149);
				}
				
				
				case 328878574:
				{
					return new global::haxe.lang.Closure(this, "iterator", 328878574);
				}
				
				
				case 1915412854:
				{
					return new global::haxe.lang.Closure(this, "__get", 1915412854);
				}
				
				
				case 1916009602:
				{
					return new global::haxe.lang.Closure(this, "__set", 1916009602);
				}
				
				
				case 1620824029:
				{
					return new global::haxe.lang.Closure(this, "__unsafe_get", 1620824029);
				}
				
				
				case 1621420777:
				{
					return new global::haxe.lang.Closure(this, "__unsafe_set", 1621420777);
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
				case 1204816148:
				{
					return this.concat(((global::Array<T>) (((global::Array) (dynargs[0]) ).cast<T>()) ));
				}
				
				
				case 1532710347:
				{
					this.concatNative(((T[]) (dynargs[0]) ));
					break;
				}
				
				
				case 1181037546:
				{
					return this.@join(global::haxe.lang.Runtime.toString(dynargs[0]));
				}
				
				
				case 5594513:
				{
					return (this.pop()).toDynamic();
				}
				
				
				case 1247875546:
				{
					return this.push(global::haxe.lang.Runtime.genericCast<T>(dynargs[0]));
				}
				
				
				case 452737314:
				{
					this.reverse();
					break;
				}
				
				
				case 2082663554:
				{
					return (this.shift()).toDynamic();
				}
				
				
				case 2127021138:
				{
					return this.slice(((int) (global::haxe.lang.Runtime.toInt(dynargs[0])) ), global::haxe.lang.Null<object>.ofDynamic<int>(dynargs[1]));
				}
				
				
				case 1280845662:
				{
					this.sort(((global::haxe.lang.Function) (dynargs[0]) ));
					break;
				}
				
				
				case 1282943179:
				{
					this.quicksort(((int) (global::haxe.lang.Runtime.toInt(dynargs[0])) ), ((int) (global::haxe.lang.Runtime.toInt(dynargs[1])) ), ((global::haxe.lang.Function) (dynargs[2]) ));
					break;
				}
				
				
				case 1067353468:
				{
					return this.splice(((int) (global::haxe.lang.Runtime.toInt(dynargs[0])) ), ((int) (global::haxe.lang.Runtime.toInt(dynargs[1])) ));
				}
				
				
				case 1352786672:
				{
					this.spliceVoid(((int) (global::haxe.lang.Runtime.toInt(dynargs[0])) ), ((int) (global::haxe.lang.Runtime.toInt(dynargs[1])) ));
					break;
				}
				
				
				case 946786476:
				{
					return this.toString();
				}
				
				
				case 2025055113:
				{
					this.unshift(global::haxe.lang.Runtime.genericCast<T>(dynargs[0]));
					break;
				}
				
				
				case 501039929:
				{
					this.insert(((int) (global::haxe.lang.Runtime.toInt(dynargs[0])) ), global::haxe.lang.Runtime.genericCast<T>(dynargs[1]));
					break;
				}
				
				
				case 76061764:
				{
					return this.@remove(global::haxe.lang.Runtime.genericCast<T>(dynargs[0]));
				}
				
				
				case 1103412149:
				{
					return this.copy();
				}
				
				
				case 328878574:
				{
					return this.iterator();
				}
				
				
				case 1915412854:
				{
					return this.__get(((int) (global::haxe.lang.Runtime.toInt(dynargs[0])) ));
				}
				
				
				case 1916009602:
				{
					return this.__set(((int) (global::haxe.lang.Runtime.toInt(dynargs[0])) ), global::haxe.lang.Runtime.genericCast<T>(dynargs[1]));
				}
				
				
				case 1620824029:
				{
					return this.__unsafe_get(((int) (global::haxe.lang.Runtime.toInt(dynargs[0])) ));
				}
				
				
				case 1621420777:
				{
					return this.__unsafe_set(((int) (global::haxe.lang.Runtime.toInt(dynargs[0])) ), global::haxe.lang.Runtime.genericCast<T>(dynargs[1]));
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
			baseArr.push("length");
			baseArr.push("__a");
			{
				base.__hx_getFields(baseArr);
			}
			
		}
	}
	
	
	object global::Array.this[int key]
	{
		get
		{
			return ((object) this.__get(key));
		}
		set
		{
			this.__set(key, (T) value);
		}
	}
	
	
	public T this[int key]
	{
		get
		{
			return this.__get(key);
		}
		set
		{
			this.__set(key, value);
		}
	}
	
	
	public override string ToString()
	{
		return this.toString();
	}
	
	
}



public  class Fun_13d3738f : global::haxe.lang.Function 
{
	public    Fun_13d3738f(global::Array<int> i, global::Array<int> len) : base(0, 0)
	{
		unchecked 
		{
			this.i = i;
			this.len = len;
		}
	}
	
	
	public override   object __hx_invoke0_o()
	{
		unchecked 
		{
			return ( this.i[0] < this.len[0] );
		}
	}
	
	
	public  global::Array<int> i;
	
	public  global::Array<int> len;
	
}



public  class Fun_d3b1a04a<T> : global::haxe.lang.Function 
{
	public    Fun_d3b1a04a(global::Array<object> _g, global::Array<int> i) : base(0, 0)
	{
		unchecked 
		{
			this._g = _g;
			this.i = i;
		}
	}
	
	
	public override   object __hx_invoke0_o()
	{
		unchecked 
		{
			return ((global::Array<T>) (((global::Array) (this._g[0]) ).cast<T>()) ).__a[this.i[0]++];
		}
	}
	
	
	public  global::Array<object> _g;
	
	public  global::Array<int> i;
	
}



public  interface Array : global::haxe.lang.IHxObject, global::haxe.lang.IGenericObject 
{
	   object cast<T1>();
	
	object this[int key]
	{
		get;
		set;
	}
	
	
}


