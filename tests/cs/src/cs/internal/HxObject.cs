
namespace haxe.lang
{
	public  interface IHxObject 
	{
		   bool __hx_deleteField(string field, int hash);
		
		   object __hx_lookupField(string field, int hash, bool throwErrors, bool isCheck);
		
		   double __hx_lookupField_f(string field, int hash, bool throwErrors);
		
		   object __hx_lookupSetField(string field, int hash, object @value);
		
		   double __hx_lookupSetField_f(string field, int hash, double @value);
		
		   double __hx_setField_f(string field, int hash, double @value, bool handleProperties);
		
		   object __hx_setField(string field, int hash, object @value, bool handleProperties);
		
		   object __hx_getField(string field, int hash, bool throwErrors, bool isCheck, bool handleProperties);
		
		   double __hx_getField_f(string field, int hash, bool throwErrors, bool handleProperties);
		
		   object __hx_invokeField(string field, int hash, global::Array dynargs);
		
		   void __hx_getFields(global::Array<object> baseArr);
		
	}
}



namespace haxe.lang
{
	public  class HxObject : global::haxe.lang.IHxObject 
	{
		public    HxObject() : base()
		{
			unchecked 
			{
			}
		}
		
		
		public static   object __hx_createEmpty()
		{
			unchecked 
			{
				return new global::haxe.lang.HxObject(global::haxe.lang.EmptyObject.EMPTY);
			}
		}
		
		
		public static   object __hx_create(global::Array arr)
		{
			unchecked 
			{
				return new global::haxe.lang.HxObject();
			}
		}
		
		
		public    HxObject(global::haxe.lang.EmptyObject empty) : base()
		{
			unchecked 
			{
			}
		}
		
		
		public virtual   bool __hx_deleteField(string field, int hash)
		{
			unchecked 
			{
				return false;
			}
		}
		
		
		public virtual   object __hx_lookupField(string field, int hash, bool throwErrors, bool isCheck)
		{
			unchecked 
			{
				if (isCheck) 
				{
					return global::haxe.lang.Runtime.undefined;
				}
				 else 
				{
					if (throwErrors) 
					{
						throw global::haxe.lang.HaxeException.wrap("Field not found.");
					}
					 else 
					{
						return default(object);
					}
					
				}
				
			}
		}
		
		
		public virtual   double __hx_lookupField_f(string field, int hash, bool throwErrors)
		{
			unchecked 
			{
				if (throwErrors) 
				{
					throw global::haxe.lang.HaxeException.wrap("Field not found or incompatible field type.");
				}
				 else 
				{
					return default(double);
				}
				
			}
		}
		
		
		public virtual   object __hx_lookupSetField(string field, int hash, object @value)
		{
			unchecked 
			{
				throw global::haxe.lang.HaxeException.wrap("Cannot access field for writing.");
			}
		}
		
		
		public virtual   double __hx_lookupSetField_f(string field, int hash, double @value)
		{
			unchecked 
			{
				throw global::haxe.lang.HaxeException.wrap("Cannot access field for writing or incompatible type.");
			}
		}
		
		
		public virtual   double __hx_setField_f(string field, int hash, double @value, bool handleProperties)
		{
			unchecked 
			{
				switch (hash)
				{
					default:
					{
						return this.__hx_lookupSetField_f(field, hash, @value);
					}
					
				}
				
			}
		}
		
		
		public virtual   object __hx_setField(string field, int hash, object @value, bool handleProperties)
		{
			unchecked 
			{
				switch (hash)
				{
					default:
					{
						return this.__hx_lookupSetField(field, hash, @value);
					}
					
				}
				
			}
		}
		
		
		public virtual   object __hx_getField(string field, int hash, bool throwErrors, bool isCheck, bool handleProperties)
		{
			unchecked 
			{
				switch (hash)
				{
					default:
					{
						return this.__hx_lookupField(field, hash, throwErrors, isCheck);
					}
					
				}
				
			}
		}
		
		
		public virtual   double __hx_getField_f(string field, int hash, bool throwErrors, bool handleProperties)
		{
			unchecked 
			{
				switch (hash)
				{
					default:
					{
						return this.__hx_lookupField_f(field, hash, throwErrors);
					}
					
				}
				
			}
		}
		
		
		public virtual   object __hx_invokeField(string field, int hash, global::Array dynargs)
		{
			unchecked 
			{
				switch (hash)
				{
					default:
					{
						return ((global::haxe.lang.Function) (this.__hx_getField(field, hash, true, false, false)) ).__hx_invokeDynamic(dynargs);
					}
					
				}
				
			}
		}
		
		
		public virtual   void __hx_getFields(global::Array<object> baseArr)
		{
			unchecked 
			{
				{
				}
				
			}
		}
		
		
	}
}



namespace haxe.lang
{
	public  class DynamicObject : global::haxe.lang.HxObject 
	{
		public    DynamicObject() : base()
		{
			unchecked 
			{
				global::haxe.lang.DynamicObject.__hx_ctor(this);
			}
		}
		
		
		public static   void __hx_ctor(global::haxe.lang.DynamicObject __temp_me26)
		{
			unchecked 
			{
				object __temp_expr68 = default(object);
			}
		}
		
		
		public static  new object __hx_createEmpty()
		{
			unchecked 
			{
				return new global::haxe.lang.DynamicObject(global::haxe.lang.EmptyObject.EMPTY);
			}
		}
		
		
		public static  new object __hx_create(global::Array arr)
		{
			unchecked 
			{
				return new global::haxe.lang.DynamicObject();
			}
		}
		
		
		public    DynamicObject(global::haxe.lang.EmptyObject empty) : base(global::haxe.lang.EmptyObject.EMPTY)
		{
			unchecked 
			{
			}
		}
		
		
		public    DynamicObject(global::Array<int> __hx_hashes, global::Array<object> __hx_dynamics, global::Array<int> __hx_hashes_f, global::Array<double> __hx_dynamics_f)
		{
			unchecked 
			{
				this.__hx_hashes = __hx_hashes;
				this.__hx_dynamics = __hx_dynamics;
				this.__hx_hashes_f = __hx_hashes_f;
				this.__hx_dynamics_f = __hx_dynamics_f;
			}
		}
		
		
		public virtual   string toString()
		{
			unchecked 
			{
				global::haxe.lang.Function ts = ((global::haxe.lang.Function) (global::haxe.lang.Runtime.getField(this, "toString", 946786476, false)) );
				if (( ts != default(global::haxe.lang.Function) )) 
				{
					return global::haxe.lang.Runtime.toString(ts.__hx_invoke0_o());
				}
				
				global::StringBuf ret = new global::StringBuf();
				ret.b.Append("{");
				bool first = true;
				{
					int _g = 0;
					global::Array<object> _g1 = global::Reflect.fields(this);
					while (( _g < _g1.length ))
					{
						string f = global::haxe.lang.Runtime.toString(_g1[_g]);
						 ++ _g;
						if (first) 
						{
							first = false;
						}
						 else 
						{
							ret.b.Append(",");
						}
						
						ret.b.Append(" ");
						ret.b.Append(global::Std.@string(f));
						ret.b.Append(" : ");
						ret.b.Append(global::Std.@string(global::Reflect.field(this, f)));
					}
					
				}
				
				if ( ! (first) ) 
				{
					ret.b.Append(" ");
				}
				
				ret.b.Append("}");
				return ret.toString();
			}
		}
		
		
		public override   bool __hx_deleteField(string field, int hash)
		{
			unchecked 
			{
				int res = global::haxe.lang.FieldLookup.findHash(hash, this.__hx_hashes);
				if (( res >= 0 )) 
				{
					this.__hx_hashes.splice(res, 1);
					this.__hx_dynamics.splice(res, 1);
					return true;
				}
				 else 
				{
					res = global::haxe.lang.FieldLookup.findHash(hash, this.__hx_hashes_f);
					if (( res >= 0 )) 
					{
						this.__hx_hashes_f.splice(res, 1);
						this.__hx_dynamics_f.splice(res, 1);
						return true;
					}
					
				}
				
				return false;
			}
		}
		
		
		public  global::Array<int> __hx_hashes = new global::Array<int>(new int[]{});
		
		public  global::Array<object> __hx_dynamics = new global::Array<object>(new object[]{});
		
		public  global::Array<int> __hx_hashes_f = new global::Array<int>(new int[]{});
		
		public  global::Array<double> __hx_dynamics_f = new global::Array<double>(new double[]{});
		
		public override   object __hx_lookupField(string field, int hash, bool throwErrors, bool isCheck)
		{
			unchecked 
			{
				int res = global::haxe.lang.FieldLookup.findHash(hash, this.__hx_hashes);
				if (( res >= 0 )) 
				{
					return this.__hx_dynamics[res];
				}
				 else 
				{
					res = global::haxe.lang.FieldLookup.findHash(hash, this.__hx_hashes_f);
					if (( res >= 0 )) 
					{
						return this.__hx_dynamics_f[res];
					}
					
				}
				
				if (isCheck) 
				{
					return global::haxe.lang.Runtime.undefined;
				}
				 else 
				{
					return default(object);
				}
				
			}
		}
		
		
		public override   double __hx_lookupField_f(string field, int hash, bool throwErrors)
		{
			unchecked 
			{
				int res = global::haxe.lang.FieldLookup.findHash(hash, this.__hx_hashes_f);
				if (( res >= 0 )) 
				{
					return this.__hx_dynamics_f[res];
				}
				 else 
				{
					res = global::haxe.lang.FieldLookup.findHash(hash, this.__hx_hashes);
					if (( res >= 0 )) 
					{
						return ((double) (global::haxe.lang.Runtime.toDouble(this.__hx_dynamics[res])) );
					}
					
				}
				
				return default(double);
			}
		}
		
		
		public override   object __hx_lookupSetField(string field, int hash, object @value)
		{
			unchecked 
			{
				int res = global::haxe.lang.FieldLookup.findHash(hash, this.__hx_hashes);
				if (( res >= 0 )) 
				{
					return this.__hx_dynamics[res] = @value;
				}
				 else 
				{
					int res2 = global::haxe.lang.FieldLookup.findHash(hash, this.__hx_hashes_f);
					if (( res >= 0 )) 
					{
						this.__hx_hashes_f.splice(res2, 1);
						this.__hx_dynamics_f.splice(res2, 1);
					}
					
				}
				
				this.__hx_hashes.insert( ~ (res) , hash);
				this.__hx_dynamics.insert( ~ (res) , @value);
				return @value;
			}
		}
		
		
		public override   double __hx_lookupSetField_f(string field, int hash, double @value)
		{
			unchecked 
			{
				int res = global::haxe.lang.FieldLookup.findHash(hash, this.__hx_hashes_f);
				if (( res >= 0 )) 
				{
					return this.__hx_dynamics_f[res] = @value;
				}
				 else 
				{
					int res2 = global::haxe.lang.FieldLookup.findHash(hash, this.__hx_hashes);
					if (( res >= 0 )) 
					{
						this.__hx_hashes.splice(res2, 1);
						this.__hx_dynamics.splice(res2, 1);
					}
					
				}
				
				this.__hx_hashes_f.insert( ~ (res) , hash);
				this.__hx_dynamics_f.insert( ~ (res) , @value);
				return @value;
			}
		}
		
		
		public override   void __hx_getFields(global::Array<object> baseArr)
		{
			unchecked 
			{
				{
					{
						object __temp_iterator44 = this.__hx_hashes.iterator();
						while (((bool) (global::haxe.lang.Runtime.callField(__temp_iterator44, "hasNext", 407283053, default(global::Array))) ))
						{
							int __temp_field28 = ((int) (global::haxe.lang.Runtime.toInt(global::haxe.lang.Runtime.callField(__temp_iterator44, "next", 1224901875, default(global::Array)))) );
							baseArr.push(global::haxe.lang.FieldLookup.lookupHash(__temp_field28));
						}
						
					}
					
					{
						object __temp_iterator45 = this.__hx_hashes_f.iterator();
						while (((bool) (global::haxe.lang.Runtime.callField(__temp_iterator45, "hasNext", 407283053, default(global::Array))) ))
						{
							int __temp_field27 = ((int) (global::haxe.lang.Runtime.toInt(global::haxe.lang.Runtime.callField(__temp_iterator45, "next", 1224901875, default(global::Array)))) );
							baseArr.push(global::haxe.lang.FieldLookup.lookupHash(__temp_field27));
						}
						
					}
					
					base.__hx_getFields(baseArr);
				}
				
			}
		}
		
		
		public override string ToString()
		{
			return this.toString();
		}
		
		
	}
}



namespace haxe.lang
{
	public  interface IGenericObject : global::haxe.lang.IHxObject 
	{
	}
}



namespace haxe.lang
{
	public  class Enum : global::haxe.lang.HxObject 
	{
		public    Enum(int index, global::Array<object> @params)
		{
			unchecked 
			{
				this.index = index;
				this.@params = @params;
			}
		}
		
		
		public static  new object __hx_createEmpty()
		{
			unchecked 
			{
				return new global::haxe.lang.Enum(global::haxe.lang.EmptyObject.EMPTY);
			}
		}
		
		
		public static  new object __hx_create(global::Array arr)
		{
			unchecked 
			{
				return new global::haxe.lang.Enum(((int) (global::haxe.lang.Runtime.toInt(arr[0])) ), ((global::Array<object>) (((global::Array) (arr[1]) ).cast<object>()) ));
			}
		}
		
		
		public    Enum(global::haxe.lang.EmptyObject empty) : base()
		{
			unchecked 
			{
			}
		}
		
		
		public override   bool Equals(object obj)
		{
			unchecked 
			{
				if (global::haxe.lang.Runtime.eq(obj, this)) 
				{
					return true;
				}
				
				global::haxe.lang.Enum obj1 = ((global::haxe.lang.Enum) (obj) );
				bool ret = ( ( ( obj1 != default(global::haxe.lang.Enum) ) && global::Std.@is(obj1, global::Type.getClass<object>(this)) ) && ( obj1.index == this.index ) );
				if ( ! (ret) ) 
				{
					return false;
				}
				
				if (( obj1.@params == this.@params )) 
				{
					return true;
				}
				
				int len = 0;
				if (( ( ( obj1.@params == default(global::Array<object>) ) || ( this.@params == default(global::Array<object>) ) ) || ( (len = this.@params.length) != obj1.@params.length ) )) 
				{
					return false;
				}
				
				{
					int _g = 0;
					while (( _g < ((int) (len) ) ))
					{
						int i = _g++;
						if ( ! (global::Type.enumEq<object>(obj1.@params[i], this.@params[i])) ) 
						{
							return false;
						}
						
					}
					
				}
				
				return true;
			}
		}
		
		
		public virtual   string toString()
		{
			unchecked 
			{
				if (( this.@params == default(global::Array<object>) )) 
				{
					return this.getTag();
				}
				
				global::StringBuf ret = new global::StringBuf();
				ret.b.Append(global::Std.@string(this.getTag()));
				ret.b.Append("(");
				bool first = true;
				{
					int _g = 0;
					global::Array<object> _g1 = this.@params;
					while (( _g < _g1.length ))
					{
						object p = _g1[_g];
						 ++ _g;
						if (first) 
						{
							first = false;
						}
						 else 
						{
							ret.b.Append(",");
						}
						
						ret.b.Append(global::Std.@string(p));
					}
					
				}
				
				ret.b.Append(")");
				return ret.toString();
			}
		}
		
		
		public   string getTag()
		{
			unchecked 
			{
				object cl = global::Type.getClass<object>(this);
				return global::haxe.lang.Runtime.toString(global::haxe.lang.Runtime.callField(global::haxe.lang.Runtime.getField(cl, "constructs", 1744813180, true), "__get", 1915412854, new global::Array<object>(new object[]{this.index})));
			}
		}
		
		
		public readonly global::Array<object> @params;
		
		public readonly int index;
		
		public override   object __hx_getField(string field, int hash, bool throwErrors, bool isCheck, bool handleProperties)
		{
			unchecked 
			{
				switch (hash)
				{
					case 1041537810:
					{
						return this.index;
					}
					
					
					case 1836776262:
					{
						return this.@params;
					}
					
					
					case 589796196:
					{
						return new global::haxe.lang.Closure(this, "getTag", 589796196);
					}
					
					
					case 946786476:
					{
						return new global::haxe.lang.Closure(this, "toString", 946786476);
					}
					
					
					case 1955029599:
					{
						return new global::haxe.lang.Closure(this, "Equals", 1955029599);
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
					case 1041537810:
					{
						return ((double) (this.index) );
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
					case 589796196:
					{
						return this.getTag();
					}
					
					
					case 946786476:
					{
						return this.toString();
					}
					
					
					case 1955029599:
					{
						return this.Equals(dynargs[0]);
					}
					
					
					default:
					{
						return base.__hx_invokeField(field, hash, dynargs);
					}
					
				}
				
			}
		}
		
		
		public override   void __hx_getFields(global::Array<object> baseArr)
		{
			unchecked 
			{
				baseArr.push("index");
				baseArr.push("params");
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
}


