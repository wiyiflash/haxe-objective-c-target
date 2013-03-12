
public  class DateTools : global::haxe.lang.HxObject 
{
	static DateTools() 
	{
		global::DateTools.DAYS_OF_MONTH = new global::Array<int>(new int[]{31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31});
	}
	public    DateTools() : base()
	{
		unchecked 
		{
		}
	}
	
	
	public static   string __format_get(global::Date d, string e)
	{
		unchecked 
		{
			switch (e)
			{
				case "%":
				{
					return "%";
				}
				
				
				case "C":
				{
					return global::StringTools.lpad(global::Std.@string(( d.date.Year / 100 )), "0", 2);
				}
				
				
				case "d":
				{
					return global::StringTools.lpad(global::Std.@string(d.date.Day), "0", 2);
				}
				
				
				case "D":
				{
					return global::DateTools.__format(d, "%m/%d/%y");
				}
				
				
				case "e":
				{
					return global::Std.@string(d.date.Day);
				}
				
				
				case "H":case "k":
				{
					return global::StringTools.lpad(global::Std.@string(d.date.Hour), ( (string.Equals(e, "H")) ? ("0") : (" ") ), 2);
				}
				
				
				case "I":case "l":
				{
					int hour = ( d.date.Hour % 12 );
					return global::StringTools.lpad(global::Std.@string(( (( hour == 0 )) ? (12) : (hour) )), ( (string.Equals(e, "I")) ? ("0") : (" ") ), 2);
				}
				
				
				case "m":
				{
					return global::StringTools.lpad(global::Std.@string(( ( d.date.Month - 1 ) + 1 )), "0", 2);
				}
				
				
				case "M":
				{
					return global::StringTools.lpad(global::Std.@string(d.date.Minute), "0", 2);
				}
				
				
				case "n":
				{
					return "\n";
				}
				
				
				case "p":
				{
					return ( (( d.date.Hour > 11 )) ? ("PM") : ("AM") );
				}
				
				
				case "r":
				{
					return global::DateTools.__format(d, "%I:%M:%S %p");
				}
				
				
				case "R":
				{
					return global::DateTools.__format(d, "%H:%M");
				}
				
				
				case "s":
				{
					return global::Std.@string(((int) (( ( ((double) (d.date.Ticks) ) / global::System.TimeSpan.TicksPerMillisecond ) / 1000 )) ));
				}
				
				
				case "S":
				{
					return global::StringTools.lpad(global::Std.@string(d.date.Second), "0", 2);
				}
				
				
				case "t":
				{
					return "\t";
				}
				
				
				case "T":
				{
					return global::DateTools.__format(d, "%H:%M:%S");
				}
				
				
				case "u":
				{
					int t = d.getDay();
					return ( (( t == 0 )) ? ("7") : (global::Std.@string(t)) );
				}
				
				
				case "w":
				{
					return global::Std.@string(d.getDay());
				}
				
				
				case "y":
				{
					return global::StringTools.lpad(global::Std.@string(( d.date.Year % 100 )), "0", 2);
				}
				
				
				case "Y":
				{
					return global::Std.@string(d.date.Year);
				}
				
				
				default:
				{
					throw global::haxe.lang.HaxeException.wrap(global::haxe.lang.Runtime.concat(global::haxe.lang.Runtime.concat("Date.format %", e), "- not implemented yet."));
				}
				
			}
			
		}
	}
	
	
	public static   string __format(global::Date d, string f)
	{
		unchecked 
		{
			global::StringBuf r = new global::StringBuf();
			int p = 0;
			while (true)
			{
				int np = global::haxe.lang.StringExt.indexOf(f, "%", new global::haxe.lang.Null<int>(p, true));
				if (( np < 0 )) 
				{
					break;
				}
				
				r.addSub(f, p, new global::haxe.lang.Null<int>(( np - p ), true));
				r.b.Append(global::Std.@string(global::DateTools.__format_get(d, global::haxe.lang.StringExt.substr(f, ( np + 1 ), new global::haxe.lang.Null<int>(1, true)))));
				p = ( np + 2 );
			}
			
			r.addSub(f, p, new global::haxe.lang.Null<int>(( f.Length - p ), true));
			return r.toString();
		}
	}
	
	
	public static   string format(global::Date d, string f)
	{
		unchecked 
		{
			return global::DateTools.__format(d, f);
		}
	}
	
	
	public static   global::Date delta(global::Date d, double t)
	{
		unchecked 
		{
			return global::Date.fromTime(( ( ((double) (d.date.Ticks) ) / global::System.TimeSpan.TicksPerMillisecond ) + t ));
		}
	}
	
	
	public static  global::Array<int> DAYS_OF_MONTH;
	
	public static   int getMonthDays(global::Date d)
	{
		unchecked 
		{
			int month = ( d.date.Month - 1 );
			int year = d.date.Year;
			if (( month != 1 )) 
			{
				return global::DateTools.DAYS_OF_MONTH[month];
			}
			
			bool isB = ( ( ( ( year % 4 ) == 0 ) && ( ( year % 100 ) != 0 ) ) || ( ( year % 400 ) == 0 ) );
			return ( (isB) ? (29) : (28) );
		}
	}
	
	
	public static   double seconds(double n)
	{
		unchecked 
		{
			return ( n * 1000.0 );
		}
	}
	
	
	public static   double minutes(double n)
	{
		unchecked 
		{
			return ( ( n * 60.0 ) * 1000.0 );
		}
	}
	
	
	public static   double hours(double n)
	{
		unchecked 
		{
			return ( ( ( n * 60.0 ) * 60.0 ) * 1000.0 );
		}
	}
	
	
	public static   double days(double n)
	{
		unchecked 
		{
			return ( ( ( ( n * 24.0 ) * 60.0 ) * 60.0 ) * 1000.0 );
		}
	}
	
	
	public static   object parse(double t)
	{
		unchecked 
		{
			double s = ( t / 1000 );
			double m = ( s / 60 );
			double h = ( m / 60 );
			return new global::haxe.lang.DynamicObject(new global::Array<int>(new int[]{}), new global::Array<object>(new object[]{}), new global::Array<int>(new int[]{24422, 727985871, 1113807511, 1407096607, 1519236735}), new global::Array<double>(new double[]{( t % 1000 ), ((double) (((int) (( h % 24 )) )) ), ((double) (((int) (( h / 24 )) )) ), ((double) (((int) (( m % 60 )) )) ), ((double) (((int) (( s % 60 )) )) )}));
		}
	}
	
	
	public static   double make(object o)
	{
		unchecked 
		{
			return ( ((double) (global::haxe.lang.Runtime.getField_f(o, "ms", 24422, true)) ) + ( 1000.0 * (( ((int) (global::haxe.lang.Runtime.getField_f(o, "seconds", 1519236735, true)) ) + ( 60.0 * (( ((int) (global::haxe.lang.Runtime.getField_f(o, "minutes", 1407096607, true)) ) + ( 60.0 * (( ((int) (global::haxe.lang.Runtime.getField_f(o, "hours", 727985871, true)) ) + ( ((double) (24.0) ) * ((double) (((int) (global::haxe.lang.Runtime.getField_f(o, "days", 1113807511, true)) )) ) ) )) ) )) ) )) ) );
		}
	}
	
	
	public static  new object __hx_createEmpty()
	{
		unchecked 
		{
			return new global::DateTools(global::haxe.lang.EmptyObject.EMPTY);
		}
	}
	
	
	public static  new object __hx_create(global::Array arr)
	{
		unchecked 
		{
			return new global::DateTools();
		}
	}
	
	
	public    DateTools(global::haxe.lang.EmptyObject empty) : base()
	{
		unchecked 
		{
		}
	}
	
	
}


