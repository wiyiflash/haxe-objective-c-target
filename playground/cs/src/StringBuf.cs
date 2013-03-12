
public  class StringBuf : global::haxe.lang.HxObject 
{
	public    StringBuf() : base()
	{
		unchecked 
		{
			global::StringBuf.__hx_ctor(this);
		}
	}
	
	
	public static   void __hx_ctor(global::StringBuf __temp_me17)
	{
		unchecked 
		{
			__temp_me17.b = new global::System.Text.StringBuilder();
		}
	}
	
	
	public static  new object __hx_createEmpty()
	{
		unchecked 
		{
			return new global::StringBuf(global::haxe.lang.EmptyObject.EMPTY);
		}
	}
	
	
	public static  new object __hx_create(global::Array arr)
	{
		unchecked 
		{
			return new global::StringBuf();
		}
	}
	
	
	public    StringBuf(global::haxe.lang.EmptyObject empty) : base()
	{
		unchecked 
		{
		}
	}
	
	
	public virtual   string toString()
	{
		unchecked 
		{
			return this.b.ToString();
		}
	}
	
	
	public virtual   void addSub(string s, int pos, global::haxe.lang.Null<int> len)
	{
		unchecked 
		{
			int l = ( ( ! (len.hasValue) ) ? (new global::haxe.lang.Null<int>(( s.Length - pos ), true)) : (len) ).@value;
			this.b.Append(s, pos, l);
		}
	}
	
	
	public  global::System.Text.StringBuilder b;
	
	public override   object __hx_setField(string field, int hash, object @value, bool handleProperties)
	{
		unchecked 
		{
			switch (hash)
			{
				case 98:
				{
					this.b = ((global::System.Text.StringBuilder) (@value) );
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
				case 98:
				{
					return this.b;
				}
				
				
				case 520665567:
				{
					return new global::haxe.lang.Closure(this, "addSub", 520665567);
				}
				
				
				case 946786476:
				{
					return new global::haxe.lang.Closure(this, "toString", 946786476);
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
				case 520665567:
				{
					this.addSub(global::haxe.lang.Runtime.toString(dynargs[0]), ((int) (global::haxe.lang.Runtime.toInt(dynargs[1])) ), global::haxe.lang.Null<object>.ofDynamic<int>(dynargs[2]));
					break;
				}
				
				
				case 946786476:
				{
					return this.toString();
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
			baseArr.push("b");
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


