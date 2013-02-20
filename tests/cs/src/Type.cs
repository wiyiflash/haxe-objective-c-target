
public  class ValueType : global::haxe.lang.Enum 
{
	static ValueType() 
	{
		global::ValueType.constructs = new global::Array<object>(new object[]{"TNull", "TInt", "TFloat", "TBool", "TObject", "TFunction", "TClass", "TEnum", "TUnknown"});
		global::ValueType.TNull = new global::ValueType(0, default(global::Array<object>));
		global::ValueType.TInt = new global::ValueType(1, default(global::Array<object>));
		global::ValueType.TFloat = new global::ValueType(2, default(global::Array<object>));
		global::ValueType.TBool = new global::ValueType(3, default(global::Array<object>));
		global::ValueType.TObject = new global::ValueType(4, default(global::Array<object>));
		global::ValueType.TFunction = new global::ValueType(5, default(global::Array<object>));
		global::ValueType.TUnknown = new global::ValueType(8, default(global::Array<object>));
	}
	public    ValueType(int index, global::Array<object> @params) : base(index, @params)
	{
		unchecked 
		{
			global::ValueType.__hx_ctor(this, index, @params);
		}
	}
	
	
	public static   void __hx_ctor(global::ValueType __temp_me25, int index, global::Array<object> @params)
	{
		unchecked 
		{
			object __temp_expr67 = default(object);
		}
	}
	
	
	public static  global::Array<object> constructs;
	
	public static  global::ValueType TNull;
	
	public static  global::ValueType TInt;
	
	public static  global::ValueType TFloat;
	
	public static  global::ValueType TBool;
	
	public static  global::ValueType TObject;
	
	public static  global::ValueType TFunction;
	
	public static   global::ValueType TClass(global::System.Type c)
	{
		unchecked 
		{
			return new global::ValueType(6, new global::Array<object>(new object[]{c}));
		}
	}
	
	
	public static   global::ValueType TEnum(global::System.Type e)
	{
		unchecked 
		{
			return new global::ValueType(7, new global::Array<object>(new object[]{e}));
		}
	}
	
	
	public static  global::ValueType TUnknown;
	
	public static  new object __hx_createEmpty()
	{
		unchecked 
		{
			return new global::ValueType(global::haxe.lang.EmptyObject.EMPTY);
		}
	}
	
	
	public static  new object __hx_create(global::Array arr)
	{
		unchecked 
		{
			return new global::ValueType(((int) (global::haxe.lang.Runtime.toInt(arr[0])) ), ((global::Array<object>) (((global::Array) (arr[1]) ).cast<object>()) ));
		}
	}
	
	
	public    ValueType(global::haxe.lang.EmptyObject empty) : base(global::haxe.lang.EmptyObject.EMPTY)
	{
		unchecked 
		{
		}
	}
	
	
}



public  class Type : global::haxe.lang.HxObject 
{
	public    Type() : base()
	{
		unchecked 
		{
		}
	}
	
	
	public static   global::System.Type getClass<T>(T o)
	{
		
		if (o is haxe.lang.DynamicObject || o is System.Type)
			return null;

		return o.GetType();
	
	}
	
	
	public static   global::System.Type getEnum(object o)
	{
		
		if (o is System.Enum || o is haxe.lang.Enum)
			return o.GetType();
		return null;
	
	}
	
	
	public static   global::System.Type getSuperClass(global::System.Type c)
	{
		unchecked 
		{
			global::System.Type t = ((global::System.Type) (c) );
			global::System.Type @base = t.BaseType;
			if (( ( global::haxe.lang.Runtime.typeEq(@base, default(global::System.Type)) || string.Equals(global::haxe.lang.Runtime.concat(global::Std.@string(@base), ""), "haxe.lang.HxObject") ) || string.Equals(global::haxe.lang.Runtime.concat(global::Std.@string(@base), ""), "System.Object") )) 
			{
				return default(global::System.Type);
			}
			
			return ((global::System.Type) (@base) );
		}
	}
	
	
	public static   string getClassName(global::System.Type c)
	{
		unchecked 
		{
			string ret = global::haxe.lang.Runtime.toString(((global::System.Type) (c) ));
			switch (ret)
			{
				case "System.Int32":
				{
					return "Int";
				}
				
				
				case "System.Double":
				{
					return "Float";
				}
				
				
				case "System.String":
				{
					return "String";
				}
				
				
				case "System.Object":
				{
					return "Dynamic";
				}
				
				
				case "System.Type":
				{
					return "Class";
				}
				
				
				default:
				{
					return global::haxe.lang.Runtime.toString(global::haxe.lang.StringExt.split(ret, "`")[0]);
				}
				
			}
			
		}
	}
	
	
	public static   string getEnumName(global::System.Type e)
	{
		unchecked 
		{
			string ret = global::haxe.lang.Runtime.toString(((global::System.Type) (e) ));
			if (( ( ret.Length == 14 ) && string.Equals(ret, "System.Boolean") )) 
			{
				return "Bool";
			}
			
			return ret;
		}
	}
	
	
	public static   global::System.Type resolveClass(string name)
	{
		unchecked 
		{
			global::System.Type t = global::System.Type.GetType(name);
			if (global::haxe.lang.Runtime.typeEq(t, default(global::System.Type))) 
			{
				switch (name)
				{
					case "Int":
					{
						return ((global::System.Type) (typeof(int)) );
					}
					
					
					case "Float":
					{
						return ((global::System.Type) (typeof(double)) );
					}
					
					
					case "Class":
					{
						return ((global::System.Type) (typeof(global::System.Type)) );
					}
					
					
					case "Dynamic":
					{
						return ((global::System.Type) (typeof(object)) );
					}
					
					
					case "String":
					{
						return ((global::System.Type) (typeof(string)) );
					}
					
					
					default:
					{
						return default(global::System.Type);
					}
					
				}
				
			}
			 else 
			{
				if (( t.IsInterface && (((global::System.Type) (typeof(global::haxe.lang.IGenericObject)) )).IsAssignableFrom(t) )) 
				{
					t = default(global::System.Type);
					int i = 0;
					string ts = "";
					while (( global::haxe.lang.Runtime.typeEq(t, default(global::System.Type)) && ( i < 18 ) ))
					{
						i++;
						ts = global::haxe.lang.Runtime.concat(ts, global::haxe.lang.Runtime.concat((( (( i == 1 )) ? ("") : (",") )), "System.Object"));
						t = global::System.Type.GetType(global::haxe.lang.Runtime.concat(global::haxe.lang.Runtime.concat(global::haxe.lang.Runtime.concat(global::haxe.lang.Runtime.concat(global::haxe.lang.Runtime.concat(name, "`"), global::haxe.lang.Runtime.toString(i)), "["), ts), "]"));
					}
					
					return ((global::System.Type) (t) );
				}
				 else 
				{
					return ((global::System.Type) (t) );
				}
				
			}
			
		}
	}
	
	
	public static   global::System.Type resolveEnum(string name)
	{
		unchecked 
		{
			if (string.Equals(name, "Bool")) 
			{
				return ((global::System.Type) (typeof(bool)) );
			}
			
			return ((global::System.Type) (global::Type.resolveClass(name)) );
		}
	}
	
	
	public static   T createInstance<T>(global::System.Type cl, global::Array args)
	{
		unchecked 
		{
			global::System.Type t = ((global::System.Type) (cl) );
			global::System.Reflection.ConstructorInfo[] ctors = t.GetConstructors();
			return global::haxe.lang.Runtime.genericCast<T>(global::haxe.lang.Runtime.callMethod(default(object), ((global::System.Reflection.MethodBase[]) (ctors) ), ctors.Length, args));
		}
	}
	
	
	public static   T createEmptyInstance<T>(global::System.Type cl)
	{
		unchecked 
		{
			if (global::Reflect.hasField(cl, "__hx_createEmpty")) 
			{
				return global::haxe.lang.Runtime.genericCast<T>(global::haxe.lang.Runtime.callField(cl, "__hx_createEmpty", 2084789794, default(global::Array)));
			}
			
			return global::Type.createInstance<T>(cl, new global::Array<object>(new object[]{}));
		}
	}
	
	
	public static   T createEnum<T>(global::System.Type e, string constr, global::Array @params)
	{
		
		if (@params == null)
		{
			object ret = haxe.lang.Runtime.slowGetField(e, constr, false);
			if (ret is haxe.lang.Function)
				throw haxe.lang.HaxeException.wrap("Constructor " + constr + " needs parameters");
			return (T) ret;
		} else {
			return (T) haxe.lang.Runtime.slowCallField(e, constr, @params);
		}
	
	}
	
	
	public static   T createEnumIndex<T>(global::System.Type e, int index, global::Array @params)
	{
		unchecked 
		{
			global::Array<object> constr = global::Type.getEnumConstructs(e);
			return global::Type.createEnum<T>(e, global::haxe.lang.Runtime.toString(constr[index]), @params);
		}
	}
	
	
	public static   global::Array<object> getInstanceFields(global::System.Type c)
	{
		
		if (c == typeof(string))
		{
			return haxe.lang.StringRefl.fields;
		}

		Array<object> ret = new Array<object>();

        System.Reflection.MemberInfo[] mis = c.GetMembers(System.Reflection.BindingFlags.Public | System.Reflection.BindingFlags.DeclaredOnly | System.Reflection.BindingFlags.Instance);
        for (int i = 0; i < mis.Length; i++)
        {
			if (mis[i] is System.Reflection.PropertyInfo)
                continue;
			string n = mis[i].Name;
			if (!n.StartsWith("__hx_") && n[0] != '.')
				ret.push(mis[i].Name);
        }

		return ret;
	
	}
	
	
	public static   global::Array<object> getClassFields(global::System.Type c)
	{
		
		Array<object> ret = new Array<object>();

		if (c == typeof(string))
		{
			ret.push("fromCharCode");
			return ret;
		}

        System.Reflection.MemberInfo[] mis = c.GetMembers(System.Reflection.BindingFlags.Public | System.Reflection.BindingFlags.Static);
        for (int i = 0; i < mis.Length; i++)
        {
            string n = mis[i].Name;
			if (!n.StartsWith("__hx_"))
				ret.push(mis[i].Name);
        }

        return ret;
	
	}
	
	
	public static   global::Array<object> getEnumConstructs(global::System.Type e)
	{
		unchecked 
		{
			if (global::Reflect.hasField(e, "constructs")) 
			{
				return ((global::Array<object>) (((global::Array) (global::haxe.lang.Runtime.callField(global::haxe.lang.Runtime.getField(e, "constructs", 1744813180, true), "copy", 1103412149, default(global::Array))) ).cast<object>()) );
			}
			
			return new Array<object>(System.Enum.GetNames(e));
		}
	}
	
	
	public static   global::ValueType @typeof(object v)
	{
		
		if (v == null) return ValueType.TNull;

        System.Type t = v as System.Type;
        if (t != null)
        {
            //class type
            return ValueType.TObject;
        }

        t = v.GetType();
        if (t.IsEnum)
            return ValueType.TEnum(t);
        if (t.IsValueType)
        {
            System.IConvertible vc = v as System.IConvertible;
            if (vc != null)
            {
                switch (vc.GetTypeCode())
                {
                    case System.TypeCode.Boolean: return ValueType.TBool;
                    case System.TypeCode.Double:
						double d = vc.ToDouble(null);
						if (d >= int.MinValue && d <= int.MaxValue && d == vc.ToInt32(null))
							return ValueType.TInt;
						else
							return ValueType.TFloat;
                    case System.TypeCode.Int32:
                        return ValueType.TInt;
                    default:
                        return ValueType.TClass(t);
                }
            } else {
                return ValueType.TClass(t);
            }
        }

        if (v is haxe.lang.IHxObject)
        {
            if (v is haxe.lang.DynamicObject)
                return ValueType.TObject;
            else if (v is haxe.lang.Enum)
                return ValueType.TEnum(t);
            return ValueType.TClass(t);
        } else if (v is haxe.lang.Function) {
            return ValueType.TFunction;
        } else {
            return ValueType.TClass(t);
        }
	
	}
	
	
	public static   bool enumEq<T>(T a, T b)
	{
		
			if (a is haxe.lang.Enum)
				return a.Equals(b);
			else
				return haxe.lang.Runtime.eq(a, b);
	
	}
	
	
	public static   string enumConstructor(object e)
	{
		
		if (e is System.Enum)
			return e + "";
		else
			return ((haxe.lang.Enum) e).getTag();
	
	}
	
	
	public static   global::Array enumParameters(object e)
	{
		
		return ( e is System.Enum ) ? new Array<object>() : ((haxe.lang.Enum) e).@params;
	
	}
	
	
	public static   int enumIndex(object e)
	{
		
		if (e is System.Enum)
			return ((System.IConvertible) e).ToInt32(null);
		else
			return ((haxe.lang.Enum) e).index;
	
	}
	
	
	public static   global::Array<T> allEnums<T>(global::System.Type e)
	{
		unchecked 
		{
			global::Array<object> ctors = global::Type.getEnumConstructs(e);
			global::Array<T> ret = new global::Array<T>(new T[]{});
			{
				int _g = 0;
				while (( _g < ctors.length ))
				{
					string ctor = global::haxe.lang.Runtime.toString(ctors[_g]);
					 ++ _g;
					T v = global::haxe.lang.Runtime.genericCast<T>(global::Reflect.field(e, ctor));
					if (global::Std.@is(v, e)) 
					{
						ret.push(v);
					}
					
				}
				
			}
			
			return ret;
		}
	}
	
	
	public static  new object __hx_createEmpty()
	{
		unchecked 
		{
			return new global::Type(global::haxe.lang.EmptyObject.EMPTY);
		}
	}
	
	
	public static  new object __hx_create(global::Array arr)
	{
		unchecked 
		{
			return new global::Type();
		}
	}
	
	
	public    Type(global::haxe.lang.EmptyObject empty) : base()
	{
		unchecked 
		{
		}
	}
	
	
}


