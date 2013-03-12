
public  class Date : global::haxe.lang.HxObject 
{
	public    Date(int year, int month, int day, int hour, int min, int sec) : base()
	{
		unchecked 
		{
			global::Date.__hx_ctor(this, year, month, day, hour, min, sec);
		}
	}
	
	
	public static   void __hx_ctor(global::Date __temp_me5, int year, int month, int day, int hour, int min, int sec)
	{
		unchecked 
		{
			if (( day <= 0 )) 
			{
				day = 1;
			}
			
			if (( year <= 0 )) 
			{
				year = 1;
			}
			
			__temp_me5.date = new global::System.DateTime(year, ( month + 1 ), day, hour, min, sec);
		}
	}
	
	
	public static   global::Date now()
	{
		unchecked 
		{
			global::Date d = new global::Date(0, 0, 0, 0, 0, 0);
			d.date = global::System.DateTime.Now;
			return d;
		}
	}
	
	
	public static   global::Date fromTime(double t)
	{
		unchecked 
		{
			global::Date d = new global::Date(0, 0, 0, 0, 0, 0);
			d.date = new global::System.DateTime(((long) (t) ));
			return d;
		}
	}
	
	
	public static   global::Date fromString(string s)
	{
		unchecked 
		{
			switch (s.Length)
			{
				case 8:
				{
					global::Array<object> k = global::haxe.lang.StringExt.split(s, ":");
					global::Date d = new global::Date(1, 1, 1, global::Std.parseInt(global::haxe.lang.Runtime.toString(k[0])).@value, global::Std.parseInt(global::haxe.lang.Runtime.toString(k[1])).@value, global::Std.parseInt(global::haxe.lang.Runtime.toString(k[2])).@value);
					return d;
				}
				
				
				case 10:
				{
					global::Array<object> k1 = global::haxe.lang.StringExt.split(s, "-");
					return new global::Date(global::Std.parseInt(global::haxe.lang.Runtime.toString(k1[0])).@value, ( global::Std.parseInt(global::haxe.lang.Runtime.toString(k1[1])).@value - 1 ), global::Std.parseInt(global::haxe.lang.Runtime.toString(k1[2])).@value, 0, 0, 0);
				}
				
				
				case 19:
				{
					global::Array<object> k2 = global::haxe.lang.StringExt.split(s, " ");
					global::Array<object> y = global::haxe.lang.StringExt.split(global::haxe.lang.Runtime.toString(k2[0]), "-");
					global::Array<object> t = global::haxe.lang.StringExt.split(global::haxe.lang.Runtime.toString(k2[1]), ":");
					return new global::Date(global::Std.parseInt(global::haxe.lang.Runtime.toString(y[0])).@value, ( global::Std.parseInt(global::haxe.lang.Runtime.toString(y[1])).@value - 1 ), global::Std.parseInt(global::haxe.lang.Runtime.toString(y[2])).@value, global::Std.parseInt(global::haxe.lang.Runtime.toString(t[0])).@value, global::Std.parseInt(global::haxe.lang.Runtime.toString(t[1])).@value, global::Std.parseInt(global::haxe.lang.Runtime.toString(t[2])).@value);
				}
				
				
				default:
				{
					throw global::haxe.lang.HaxeException.wrap(global::haxe.lang.Runtime.concat("Invalid date format : ", s));
				}
				
			}
			
		}
	}
	
	
	public static  new object __hx_createEmpty()
	{
		unchecked 
		{
			return new global::Date(global::haxe.lang.EmptyObject.EMPTY);
		}
	}
	
	
	public static  new object __hx_create(global::Array arr)
	{
		unchecked 
		{
			return new global::Date(((int) (global::haxe.lang.Runtime.toInt(arr[0])) ), ((int) (global::haxe.lang.Runtime.toInt(arr[1])) ), ((int) (global::haxe.lang.Runtime.toInt(arr[2])) ), ((int) (global::haxe.lang.Runtime.toInt(arr[3])) ), ((int) (global::haxe.lang.Runtime.toInt(arr[4])) ), ((int) (global::haxe.lang.Runtime.toInt(arr[5])) ));
		}
	}
	
	
	public    Date(global::haxe.lang.EmptyObject empty) : base()
	{
		unchecked 
		{
		}
	}
	
	
	public virtual   string toString()
	{
		unchecked 
		{
			int m = ( ( this.date.Month - 1 ) + 1 );
			int d = this.date.Day;
			int h = this.date.Hour;
			int mi = this.date.Minute;
			int s = this.date.Second;
			return global::haxe.lang.Runtime.concat(global::haxe.lang.Runtime.concat(global::haxe.lang.Runtime.concat(global::haxe.lang.Runtime.concat(global::haxe.lang.Runtime.concat(global::haxe.lang.Runtime.concat(global::haxe.lang.Runtime.concat(global::haxe.lang.Runtime.concat(global::haxe.lang.Runtime.concat(global::haxe.lang.Runtime.concat(global::haxe.lang.Runtime.toString(this.date.Year), "-"), (( (( m < 10 )) ? (global::haxe.lang.Runtime.concat("0", global::haxe.lang.Runtime.toString(m))) : (global::haxe.lang.Runtime.concat("", global::haxe.lang.Runtime.toString(m))) ))), "-"), (( (( d < 10 )) ? (global::haxe.lang.Runtime.concat("0", global::haxe.lang.Runtime.toString(d))) : (global::haxe.lang.Runtime.concat("", global::haxe.lang.Runtime.toString(d))) ))), " "), (( (( h < 10 )) ? (global::haxe.lang.Runtime.concat("0", global::haxe.lang.Runtime.toString(h))) : (global::haxe.lang.Runtime.concat("", global::haxe.lang.Runtime.toString(h))) ))), ":"), (( (( mi < 10 )) ? (global::haxe.lang.Runtime.concat("0", global::haxe.lang.Runtime.toString(mi))) : (global::haxe.lang.Runtime.concat("", global::haxe.lang.Runtime.toString(mi))) ))), ":"), (( (( s < 10 )) ? (global::haxe.lang.Runtime.concat("0", global::haxe.lang.Runtime.toString(s))) : (global::haxe.lang.Runtime.concat("", global::haxe.lang.Runtime.toString(s))) )));
		}
	}
	
	
	public virtual   int getDay()
	{
		unchecked 
		{
			int ret = ( ((int) (global::haxe.lang.Runtime.toInt(((object) (this.date.DayOfWeek) ))) ) - 1 );
			if (( ret == -1 )) 
			{
				ret = 6;
			}
			
			return ret;
		}
	}
	
	
	public  global::System.DateTime date;
	
	public override   object __hx_setField(string field, int hash, object @value, bool handleProperties)
	{
		unchecked 
		{
			switch (hash)
			{
				case 1113806382:
				{
					this.date = ((global::System.DateTime) (@value) );
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
				case 1113806382:
				{
					return this.date;
				}
				
				
				case 589000550:
				{
					return new global::haxe.lang.Closure(this, "getDay", 589000550);
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
				case 589000550:
				{
					return this.getDay();
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
			
		}
	}
	
	
	public override   void __hx_getFields(global::Array<object> baseArr)
	{
		unchecked 
		{
			baseArr.push("date");
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


