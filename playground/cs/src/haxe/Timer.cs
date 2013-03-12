
namespace haxe
{
	public  class Timer : global::haxe.lang.HxObject 
	{
		public    Timer(int time_ms) : base()
		{
			unchecked 
			{
				global::haxe.Timer.__hx_ctor(this, time_ms);
			}
		}
		
		
		public static   void __hx_ctor(global::haxe.Timer __temp_me31, int time_ms)
		{
			unchecked 
			{
				__temp_me31.run = ( (( global::haxe.Fun_d41d8cd9.__hx_current != default(global::haxe.Fun_d41d8cd9) )) ? (global::haxe.Fun_d41d8cd9.__hx_current) : (global::haxe.Fun_d41d8cd9.__hx_current = ((global::haxe.Fun_d41d8cd9) (new global::haxe.Fun_d41d8cd9()) )) );
			}
		}
		
		
		public static   global::haxe.Timer delay(global::haxe.lang.Function f, int time_ms)
		{
			unchecked 
			{
				global::Array<object> f1 = new global::Array<object>(new object[]{f});
				global::Array<object> t = new global::Array<object>(new object[]{new global::haxe.Timer(time_ms)});
				((global::haxe.Timer) (t[0]) ).run = new global::haxe.Fun_f6ebc864(f1, t);
				return ((global::haxe.Timer) (t[0]) );
			}
		}
		
		
		public static   T measure<T>(global::haxe.lang.Function f, object pos)
		{
			unchecked 
			{
				double t0 = global::haxe.Timer.stamp();
				T r = global::haxe.lang.Runtime.genericCast<T>(f.__hx_invoke0_o());
				global::haxe.Log.trace.__hx_invoke2_o(default(double), default(double), global::haxe.lang.Runtime.concat(global::haxe.lang.Runtime.toString(( global::haxe.Timer.stamp() - t0 )), "s"), pos);
				return r;
			}
		}
		
		
		public static   double stamp()
		{
			unchecked 
			{
				return global::Sys.time();
			}
		}
		
		
		public static  new object __hx_createEmpty()
		{
			unchecked 
			{
				return new global::haxe.Timer(global::haxe.lang.EmptyObject.EMPTY);
			}
		}
		
		
		public static  new object __hx_create(global::Array arr)
		{
			unchecked 
			{
				return new global::haxe.Timer(((int) (global::haxe.lang.Runtime.toInt(arr[0])) ));
			}
		}
		
		
		public    Timer(global::haxe.lang.EmptyObject empty) : base()
		{
			unchecked 
			{
			}
		}
		
		
		public  global::haxe.lang.Function run;
		
		public virtual   void stop()
		{
			unchecked 
			{
				if ( ! (this.id.hasValue) ) 
				{
					return ;
				}
				
				this.id = new global::haxe.lang.Null<int>(default(global::haxe.lang.Null<int>).@value, true);
			}
		}
		
		
		public  global::haxe.lang.Null<int> id;
		
		public override   object __hx_setField(string field, int hash, object @value, bool handleProperties)
		{
			unchecked 
			{
				switch (hash)
				{
					case 23515:
					{
						this.id = new global::haxe.lang.Null<int>(global::haxe.lang.Null<object>.ofDynamic<int>(@value).@value, true);
						return @value;
					}
					
					
					case 5695307:
					{
						this.run = ((global::haxe.lang.Function) (@value) );
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
					case 23515:
					{
						return (this.id).toDynamic();
					}
					
					
					case 1281093634:
					{
						return new global::haxe.lang.Closure(this, "stop", 1281093634);
					}
					
					
					case 5695307:
					{
						return this.run;
					}
					
					
					default:
					{
						return base.__hx_getField(field, hash, throwErrors, isCheck, handleProperties);
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
					case 1281093634:
					{
						this.stop();
						break;
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
				baseArr.push("id");
				baseArr.push("run");
				{
					base.__hx_getFields(baseArr);
				}
				
			}
		}
		
		
	}
}



namespace haxe
{
	public  class Fun_d41d8cd9 : global::haxe.lang.Function 
	{
		public    Fun_d41d8cd9() : base(0, 0)
		{
			unchecked 
			{
			}
		}
		
		
		public static  global::haxe.Fun_d41d8cd9 __hx_current;
		
		public override   object __hx_invoke0_o()
		{
			unchecked 
			{
				{
				}
				
				return default(object);
			}
		}
		
		
	}
}



namespace haxe
{
	public  class Fun_f6ebc864 : global::haxe.lang.Function 
	{
		public    Fun_f6ebc864(global::Array<object> f1, global::Array<object> t) : base(0, 0)
		{
			unchecked 
			{
				this.f1 = f1;
				this.t = t;
			}
		}
		
		
		public override   object __hx_invoke0_o()
		{
			unchecked 
			{
				((global::haxe.Timer) (this.t[0]) ).stop();
				((global::haxe.lang.Function) (this.f1[0]) ).__hx_invoke0_o();
				return default(object);
			}
		}
		
		
		public  global::Array<object> f1;
		
		public  global::Array<object> t;
		
	}
}


