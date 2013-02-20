
namespace haxe
{
	public  class FastCell<T> : global::haxe.lang.HxObject, global::haxe.FastCell 
	{
		public    FastCell(T elt, global::haxe.FastCell<T> next) : base()
		{
			unchecked 
			{
				global::haxe.FastCell<object>.__hx_ctor<T>(this, elt, next);
			}
		}
		
		
		public static   void __hx_ctor<T2>(global::haxe.FastCell<T2> __temp_me29, T2 elt, global::haxe.FastCell<T2> next)
		{
			unchecked 
			{
				__temp_me29.elt = elt;
				__temp_me29.next = next;
			}
		}
		
		
		public static  new object __hx_createEmpty()
		{
			unchecked 
			{
				return new global::haxe.FastCell<object>(global::haxe.lang.EmptyObject.EMPTY);
			}
		}
		
		
		public static  new object __hx_create(global::Array arr)
		{
			unchecked 
			{
				return new global::haxe.FastCell<object>(arr[0], ((global::haxe.FastCell<object>) (((global::haxe.FastCell) (arr[1]) ).cast<object>()) ));
			}
		}
		
		
		public    FastCell(global::haxe.lang.EmptyObject empty) : base()
		{
			unchecked 
			{
			}
		}
		
		
		   object haxe.FastCell.cast<T1>()
		{
			unchecked 
			{
				if (global::haxe.lang.Runtime.eq(typeof(T), typeof(T1))) 
				{
					return this;
				}
				
				global::haxe.FastCell<T1> new_me = new global::haxe.FastCell<T1>(global::haxe.lang.EmptyObject.EMPTY);
				{
					object __temp_iterator46 = global::Reflect.fields(this).iterator();
					while (((bool) (global::haxe.lang.Runtime.callField(__temp_iterator46, "hasNext", 407283053, default(global::Array))) ))
					{
						string field = global::haxe.lang.Runtime.toString(global::haxe.lang.Runtime.callField(__temp_iterator46, "next", 1224901875, default(global::Array)));
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
		
		
		public  global::haxe.FastCell<T> next;
		
		public  T elt;
		
		public override   double __hx_setField_f(string field, int hash, double @value, bool handleProperties)
		{
			unchecked 
			{
				switch (hash)
				{
					case 5046829:
					{
						this.elt = global::haxe.lang.Runtime.genericCast<T>(((object) (@value) ));
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
					case 5046829:
					{
						this.elt = global::haxe.lang.Runtime.genericCast<T>(@value);
						return @value;
					}
					
					
					case 1224901875:
					{
						this.next = ((global::haxe.FastCell<T>) (((global::haxe.FastCell) (@value) ).cast<T>()) );
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
					case 5046829:
					{
						return this.elt;
					}
					
					
					case 1224901875:
					{
						return this.next;
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
					case 5046829:
					{
						return ((double) (global::haxe.lang.Runtime.toDouble(((object) (this.elt) ))) );
					}
					
					
					default:
					{
						return base.__hx_getField_f(field, hash, throwErrors, handleProperties);
					}
					
				}
				
			}
		}
		
		
		public override   void __hx_getFields(global::Array<object> baseArr)
		{
			unchecked 
			{
				baseArr.push("elt");
				baseArr.push("next");
				{
					base.__hx_getFields(baseArr);
				}
				
			}
		}
		
		
	}
}



namespace haxe
{
	public  interface FastCell : global::haxe.lang.IHxObject, global::haxe.lang.IGenericObject 
	{
		   object cast<T1>();
		
	}
}



namespace haxe
{
	public  class FastList<T> : global::haxe.lang.HxObject, global::haxe.FastList 
	{
		public    FastList() : base()
		{
			unchecked 
			{
				global::haxe.FastList<object>.__hx_ctor<T>(this);
			}
		}
		
		
		public static   void __hx_ctor<T2>(global::haxe.FastList<T2> __temp_me30)
		{
			unchecked 
			{
				{
				}
				
			}
		}
		
		
		public static  new object __hx_createEmpty()
		{
			unchecked 
			{
				return new global::haxe.FastList<object>(global::haxe.lang.EmptyObject.EMPTY);
			}
		}
		
		
		public static  new object __hx_create(global::Array arr)
		{
			unchecked 
			{
				return new global::haxe.FastList<object>();
			}
		}
		
		
		public    FastList(global::haxe.lang.EmptyObject empty) : base()
		{
			unchecked 
			{
			}
		}
		
		
		   object haxe.FastList.cast<T1>()
		{
			unchecked 
			{
				if (global::haxe.lang.Runtime.eq(typeof(T), typeof(T1))) 
				{
					return this;
				}
				
				global::haxe.FastList<T1> new_me = new global::haxe.FastList<T1>(global::haxe.lang.EmptyObject.EMPTY);
				{
					object __temp_iterator47 = global::Reflect.fields(this).iterator();
					while (((bool) (global::haxe.lang.Runtime.callField(__temp_iterator47, "hasNext", 407283053, default(global::Array))) ))
					{
						string field = global::haxe.lang.Runtime.toString(global::haxe.lang.Runtime.callField(__temp_iterator47, "next", 1224901875, default(global::Array)));
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
		
		
		public  global::haxe.FastCell<T> head;
		
		public override   object __hx_setField(string field, int hash, object @value, bool handleProperties)
		{
			unchecked 
			{
				switch (hash)
				{
					case 1158359328:
					{
						this.head = ((global::haxe.FastCell<T>) (((global::haxe.FastCell) (@value) ).cast<T>()) );
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
					case 1158359328:
					{
						return this.head;
					}
					
					
					default:
					{
						return base.__hx_getField(field, hash, throwErrors, isCheck, handleProperties);
					}
					
				}
				
			}
		}
		
		
		public override   void __hx_getFields(global::Array<object> baseArr)
		{
			unchecked 
			{
				baseArr.push("head");
				{
					base.__hx_getFields(baseArr);
				}
				
			}
		}
		
		
	}
}



namespace haxe
{
	public  interface FastList : global::haxe.lang.IHxObject, global::haxe.lang.IGenericObject 
	{
		   object cast<T1>();
		
	}
}


