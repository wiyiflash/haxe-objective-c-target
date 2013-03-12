
public  class Color : global::haxe.lang.Enum 
{
	static Color() 
	{
		global::Color.constructs = new global::Array<object>(new object[]{"Red", "Green", "Blue", "Grey", "Rgb", "Alpha"});
		global::Color.Red = new global::Color(0, default(global::Array<object>));
		global::Color.Green = new global::Color(1, default(global::Array<object>));
		global::Color.Blue = new global::Color(2, default(global::Array<object>));
	}
	public    Color(int index, global::Array<object> @params) : base(index, @params)
	{
		unchecked 
		{
			global::Color.__hx_ctor(this, index, @params);
		}
	}
	
	
	public static   void __hx_ctor(global::Color __temp_me18, int index, global::Array<object> @params)
	{
		unchecked 
		{
			object __temp_expr61 = default(object);
		}
	}
	
	
	public static  global::Array<object> constructs;
	
	public static  global::Color Red;
	
	public static  global::Color Green;
	
	public static  global::Color Blue;
	
	public static   global::Color Grey(int v)
	{
		unchecked 
		{
			return new global::Color(3, new global::Array<object>(new object[]{v}));
		}
	}
	
	
	public static   global::Color Rgb(int r, int g, int b)
	{
		unchecked 
		{
			return new global::Color(4, new global::Array<object>(new object[]{r, g, b}));
		}
	}
	
	
	public static   global::Color Alpha(int a, global::Color col)
	{
		unchecked 
		{
			return new global::Color(5, new global::Array<object>(new object[]{a, col}));
		}
	}
	
	
	public static  new object __hx_createEmpty()
	{
		unchecked 
		{
			return new global::Color(global::haxe.lang.EmptyObject.EMPTY);
		}
	}
	
	
	public static  new object __hx_create(global::Array arr)
	{
		unchecked 
		{
			return new global::Color(((int) (global::haxe.lang.Runtime.toInt(arr[0])) ), ((global::Array<object>) (((global::Array) (arr[1]) ).cast<object>()) ));
		}
	}
	
	
	public    Color(global::haxe.lang.EmptyObject empty) : base(global::haxe.lang.EmptyObject.EMPTY)
	{
		unchecked 
		{
		}
	}
	
	
}



public  class Tests : global::haxe.lang.HxObject, global::Interface2, global::Interface1 
{
	public static void Main()
	{
		cs.Boot.init();
		main();
	}
	static Tests() 
	{
		global::Tests.staticVar1 = "abcd";
		global::Tests.staticVar2 = 5;
		global::Tests.staticVar3 = 5;
	}
	public    Tests() : base()
	{
		unchecked 
		{
			global::Tests.__hx_ctor(this);
		}
	}
	
	
	public static   void __hx_ctor(global::Tests __temp_me22)
	{
		unchecked 
		{
			__temp_me22.s = "str";
			__temp_me22.d2 = 4.5;
			__temp_me22.d1 = 34;
			global::Tests2 test2 = new global::Tests2();
			test2.functionToRedefine = new global::haxe.lang.Closure(__temp_me22, "functionToRedefine", 1165048321);
			test2.functionToRedefine2 = new global::haxe.lang.Closure(__temp_me22, "functionToRedefine2", 2107737873);
		}
	}
	
	
	public static  string staticVar1;
	
	public static  int staticVar2;
	
	public static  int staticVar3;
	
	public static   void main()
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
			return new global::Tests(global::haxe.lang.EmptyObject.EMPTY);
		}
	}
	
	
	public static  new object __hx_create(global::Array arr)
	{
		unchecked 
		{
			return new global::Tests();
		}
	}
	
	
	public    Tests(global::haxe.lang.EmptyObject empty) : base()
	{
		unchecked 
		{
		}
	}
	
	
	public virtual   void functionToRedefine2(int param1, string param2)
	{
		unchecked 
		{
			int i = param1;
		}
	}
	
	
	public virtual   void functionToRedefine()
	{
		unchecked 
		{
			global::haxe.Log.trace.__hx_invoke2_o(default(double), default(double), "do something else", new global::haxe.lang.DynamicObject(new global::Array<int>(new int[]{302979532, 1547539107, 1648581351}), new global::Array<object>(new object[]{"functionToRedefine", "Tests", "Tests.hx"}), new global::Array<int>(new int[]{1981972957}), new global::Array<double>(new double[]{((double) (603) )})));
		}
	}
	
	
	public virtual   void printHello()
	{
		unchecked 
		{
			global::haxe.Log.trace.__hx_invoke2_o(default(double), default(double), "Hello from Haxe Objective-C", new global::haxe.lang.DynamicObject(new global::Array<int>(new int[]{302979532, 1547539107, 1648581351}), new global::Array<object>(new object[]{"printHello", "Tests", "Tests.hx"}), new global::Array<int>(new int[]{1981972957}), new global::Array<double>(new double[]{((double) (593) )})));
		}
	}
	
	
	public virtual   void init()
	{
		unchecked 
		{
			int x = 6;
			this.s = "init";
		}
	}
	
	
	public virtual   void optionalArguments3(int arg1, global::haxe.lang.Null<int> __temp_arg219, global::haxe.lang.Null<bool> __temp_arg320, global::haxe.lang.Null<bool> arg4)
	{
		unchecked 
		{
			global::haxe.lang.Null<bool> arg3 = ( ( ! (__temp_arg320.hasValue) ) ? (new global::haxe.lang.Null<bool>(true, true)) : (new global::haxe.lang.Null<bool>(__temp_arg320.@value, true)) );
			int arg2 = ( ( ! (__temp_arg219.hasValue) ) ? (((int) (6) )) : (__temp_arg219.@value) );
		}
	}
	
	
	public virtual   void optionalArguments2(int arg1, global::haxe.lang.Null<int> arg2, global::haxe.lang.Null<int> arg3, int arg4)
	{
		unchecked 
		{
			{
			}
			
		}
	}
	
	
	public virtual   void optionalArguments1(int arg1, int arg2, int arg3, global::haxe.lang.Null<int> __temp_arg421)
	{
		unchecked 
		{
			int arg4 = ( ( ! (__temp_arg421.hasValue) ) ? (((int) (5) )) : (__temp_arg421.@value) );
		}
	}
	
	
	public virtual   void optionalArguments(int arg1, int arg2, int arg3, global::haxe.lang.Null<int> arg4)
	{
		unchecked 
		{
			{
			}
			
		}
	}
	
	
	public virtual   void callLotsOfArguments(int arg1, int arg2, int arg3, int arg4)
	{
		unchecked 
		{
			this.optionalArguments(0, 1, 2, default(global::haxe.lang.Null<int>));
			this.optionalArguments1(0, 1, 2, default(global::haxe.lang.Null<int>));
			this.optionalArguments2(0, default(global::haxe.lang.Null<int>), default(global::haxe.lang.Null<int>), 3);
			this.optionalArguments3(0, new global::haxe.lang.Null<int>(1, true), default(global::haxe.lang.Null<bool>), default(global::haxe.lang.Null<bool>));
		}
	}
	
	
	public virtual   int minus(int a, int b)
	{
		unchecked 
		{
			return ( a - b );
		}
	}
	
	
	public virtual   int @add(int a, int b)
	{
		unchecked 
		{
			return ( a + b );
		}
	}
	
	
	public virtual   int setWidth(int v)
	{
		unchecked 
		{
			return 0;
		}
	}
	
	
	public virtual   int getWidth()
	{
		unchecked 
		{
			return 0;
		}
	}
	
	
	public virtual   void testFrameworksImport()
	{
		unchecked 
		{
			{
			}
			
		}
	}
	
	
	public virtual   void testOverload()
	{
		unchecked 
		{
			this.foo();
			this.foo("bar");
			this.foo("str", new global::Array<object>(new object[]{"bar1", "bar2"}));
			this.foo(new global::Array<object>(new object[]{new global::Array<object>(new object[]{"bar", "1"}), new global::Array<object>(new object[]{"bar", "2"})}));
		}
	}
	
	
	public virtual   void foo()
	{
		unchecked 
		{
			{
			}
			
		}
	}
	
	
	public virtual   void testCrypto()
	{
		unchecked 
		{
			string str1 = global::haxe.crypto.Md5.encode("Hello world");
			string str2 = global::haxe.crypto.Sha1.encode("Hello world");
		}
	}
	
	
	public virtual   void testTimer()
	{
		unchecked 
		{
			global::Array<object> _g = new global::Array<object>(new object[]{this});
			global::haxe.Timer timer = new global::haxe.Timer(50);
			timer.run = new global::haxe.lang.Closure(this, "testXml", 1036639397);
			timer.stop();
			timer = global::haxe.Timer.delay(new global::haxe.lang.Closure(this, "testTimer", 1496841747), 50);
			timer = global::haxe.Timer.delay(new global::Fun_21f364a7(_g), 50);
			global::haxe.Timer.measure<object>(new global::haxe.lang.Closure(this, "testTimer", 1496841747), new global::haxe.lang.DynamicObject(new global::Array<int>(new int[]{302979532, 1547539107, 1648581351}), new global::Array<object>(new object[]{"testTimer", "Tests", "Tests.hx"}), new global::Array<int>(new int[]{1981972957}), new global::Array<double>(new double[]{((double) (521) )})));
			double f = global::haxe.Timer.stamp();
		}
	}
	
	
	public virtual   void testXml()
	{
		unchecked 
		{
			{
			}
			
		}
	}
	
	
	public virtual   void testType()
	{
		unchecked 
		{
			global::System.Type cl = global::Type.resolveClass("ios.map.MKMapView");
		}
	}
	
	
	public virtual   void testString()
	{
		unchecked 
		{
			string @string = "abcdefghijklmnopqrstuvwxyz";
			int len = @string.Length;
			string s = global::haxe.lang.StringExt.charAt(@string, 5);
			global::haxe.lang.Null<int> ch = global::haxe.lang.StringExt.charCodeAt(@string, 5);
			int i = global::haxe.lang.StringExt.indexOf(@string, "abc", default(global::haxe.lang.Null<int>));
			int i1 = global::haxe.lang.StringExt.indexOf(@string, "abc", new global::haxe.lang.Null<int>(2, true));
			int li = global::haxe.lang.StringExt.lastIndexOf(@string, "abc", default(global::haxe.lang.Null<int>));
			global::Array<object> components = global::haxe.lang.StringExt.split(@string, "-");
			string s2 = global::haxe.lang.StringExt.substr(@string, 5, default(global::haxe.lang.Null<int>));
			s2 = global::haxe.lang.StringExt.substr(@string, 5, new global::haxe.lang.Null<int>(len, true));
			s2 = global::haxe.lang.StringExt.substring(@string, 5, default(global::haxe.lang.Null<int>));
			s2 = global::haxe.lang.StringExt.substring(@string, 1, new global::haxe.lang.Null<int>(len, true));
			s2 = @string.ToLower();
			s2 = @string.ToUpper();
			s2 = @string.toString();
			string s3 = "\t";
			global::StringBuf buf = new global::StringBuf();
			buf.b.Append("abc");
			buf.b.Append(((char) (18) ));
			buf.addSub("abcdefghijklmnopqerstuvwxyz", 5, default(global::haxe.lang.Null<int>));
			buf.addSub("abcdefghijklmnopqerstuvwxyz", 5, new global::haxe.lang.Null<int>(10, true));
			string strbuf = buf.toString();
			string st = global::StringTools.urlEncode("http://imagin.ro/Gorgeous Elena/2");
			st = global::StringTools.urlDecode("http://imagin.ro/Gorgeous Elena/2");
			st = global::StringTools.htmlEscape("<a href= &>", default(global::haxe.lang.Null<bool>));
			st = global::StringTools.htmlUnescape("<a href= &>");
			st = " abcdefgh".TrimStart();
			st = "abcdefgh ".TrimEnd();
			st = global::haxe.lang.Runtime.toString(global::haxe.lang.Runtime.callField(" abcdefgh ", "Trim", 937216258, default(global::Array)));
			st = global::StringTools.rpad("abcdefgh", "0", 10);
			st = global::StringTools.lpad("abcdefgh", "0", 10);
			st = "abcdefgh".Replace("abc", "_abc");
			bool b = "abcdefg".StartsWith("abc");
			b = "abcdefg".EndsWith("efg");
			b = global::StringTools.isSpace("abcdefg", 3);
			string i2 = global::StringTools.hex(345345, new global::haxe.lang.Null<int>(10, true));
			string sfin = global::haxe.lang.Runtime.concat(strbuf, st);
			sfin = global::haxe.lang.Runtime.concat(global::haxe.lang.Runtime.concat(strbuf, st), s2);
			sfin = global::haxe.lang.Runtime.concat(sfin, "abc");
			sfin = global::haxe.lang.Runtime.concat(global::haxe.lang.Runtime.concat(st, "abc"), global::haxe.lang.Runtime.toString(5));
			sfin = global::haxe.lang.Runtime.concat(global::haxe.lang.Runtime.toString(55), "abc");
		}
	}
	
	
	public virtual   void testStd()
	{
		unchecked 
		{
			int @int = 3;
			bool BOOL = ( this.d1 is double );
			double @float = global::Std.parseFloat("55454.65");
			@int = global::Std.parseInt("435345.23").@value;
			@int = global::Std.random(543);
			string @string = global::Std.@string(@int);
		}
	}
	
	
	public virtual   void testReflect()
	{
		unchecked 
		{
			object obj = new global::haxe.lang.DynamicObject(new global::Array<int>(new int[]{97}), new global::Array<object>(new object[]{"aaaaa"}), new global::Array<int>(new int[]{}), new global::Array<double>(new double[]{}));
			bool b = global::Reflect.hasField(obj, "a");
			object f = global::haxe.lang.Runtime.toString(global::haxe.lang.Runtime.getField(obj, "a", 97, false));
			global::haxe.lang.Runtime.setField(obj, "a", 97, "bbbbb");
			global::Reflect.setProperty(this, "interfaceVar1", "bbbbb");
			object p = global::Reflect.getProperty(this, "interfaceVar1");
			global::Reflect.callMethod(this, new global::haxe.lang.Closure(this, "testStd", 1036392305), new global::Array<object>(new object[]{}));
			global::Reflect.callMethod(this, new global::haxe.lang.Closure(this, "callLotsOfArguments", 1843721375), new global::Array<object>(new object[]{1, 2, 3, 4}));
			global::Array<object> fs = global::Reflect.fields(obj);
			bool isf = global::Reflect.isFunction(new global::haxe.lang.Closure(this, "testStd", 1036392305));
			int i = global::Reflect.compare<int>(1, 2);
			bool cm = global::Reflect.compareMethods(new global::haxe.lang.Closure(this, "testStd", 1036392305), new global::haxe.lang.Closure(this, "testString", 707030723));
			bool isobj = global::Reflect.isObject(obj);
			isobj = global::Reflect.isObject(new global::haxe.lang.Closure(this, "testStd", 1036392305));
			global::Reflect.deleteField(obj, "a");
			object obj2 = global::Reflect.copy<object>(obj);
		}
	}
	
	
	public virtual   void testMath()
	{
		unchecked 
		{
			double pi = global::Math.PI;
			double max = global::Math.NEGATIVE_INFINITY;
			double min = global::Math.POSITIVE_INFINITY;
			double nan = global::Math.NaN;
			double x = global::System.Math.Sqrt(((double) (5) ));
			x = global::System.Math.Abs(((double) (5) ));
			x = ((double) (45555) );
			x = ((double) (5) );
			x = global::System.Math.Sin(((double) (5) ));
			x = global::System.Math.Cos(((double) (5) ));
			x = global::System.Math.Atan2(((double) (5) ), ((double) (3) ));
			x = global::System.Math.Tan(((double) (5) ));
			x = global::System.Math.Exp(((double) (5) ));
			x = global::System.Math.Log(((double) (5) ));
			x = global::System.Math.Sqrt(((double) (5) ));
			int xr = global::Math.round(((double) (5) ));
			xr = ((int) (global::System.Math.Floor(((double) (5) ))) );
			xr = ((int) (global::System.Math.Ceiling(((double) (5) ))) );
			x = global::System.Math.Atan(((double) (5) ));
			x = global::System.Math.Asin(((double) (5) ));
			x = global::System.Math.Acos(((double) (5) ));
			x = global::System.Math.Pow(((double) (5) ), ((double) (4) ));
			x = ( global::Math.rand.NextDouble() * 5 );
			bool b = global::Math.isFinite(((double) (45454) ));
			b = global::Math.isNaN(((double) (45454) ));
			double j = ( x + xr );
			j += x;
			double k = ( (b) ? ( - (x) ) : (x) );
		}
	}
	
	
	public virtual   void testList()
	{
		unchecked 
		{
			global::List<int> l = new global::List<int>();
			l.@add(2);
			l.push(18);
			global::List<int> l2 = l.filter(( (( global::Fun_4bae2a17.__hx_current != default(global::Fun_4bae2a17) )) ? (global::Fun_4bae2a17.__hx_current) : (global::Fun_4bae2a17.__hx_current = ((global::Fun_4bae2a17) (new global::Fun_4bae2a17()) )) ));
			global::haxe.lang.Null<int> item = l.first();
			bool empty = l.isEmpty();
			object iter = l.iterator();
			string s = l.@join(", ");
			s = l.toString();
			item = new global::haxe.lang.Null<int>(l.last().@value, true);
			item = new global::haxe.lang.Null<int>(l.pop().@value, true);
			bool r = l.@remove(5);
			global::haxe.Log.trace.__hx_invoke2_o(((double) (l.length) ), default(double), global::haxe.lang.Runtime.undefined, new global::haxe.lang.DynamicObject(new global::Array<int>(new int[]{302979532, 1547539107, 1648581351}), new global::Array<object>(new object[]{"testList", "Tests", "Tests.hx"}), new global::Array<int>(new int[]{1981972957}), new global::Array<double>(new double[]{((double) (285) )})));
			l.clear();
			global::haxe.Log.trace.__hx_invoke2_o(((double) (l.length) ), default(double), global::haxe.lang.Runtime.undefined, new global::haxe.lang.DynamicObject(new global::Array<int>(new int[]{302979532, 1547539107, 1648581351}), new global::Array<object>(new object[]{"testList", "Tests", "Tests.hx"}), new global::Array<int>(new int[]{1981972957}), new global::Array<double>(new double[]{((double) (287) )})));
			global::List<object> newList = l.map<object>(( (( global::Fun_c48b88b9.__hx_current != default(global::Fun_c48b88b9) )) ? (global::Fun_c48b88b9.__hx_current) : (global::Fun_c48b88b9.__hx_current = ((global::Fun_c48b88b9) (new global::Fun_c48b88b9()) )) ));
			global::haxe.FastList<int> fl = new global::haxe.FastList<int>();
			fl.head = new global::haxe.FastCell<int>(8, fl.head);
		}
	}
	
	
	public virtual   void testLambda()
	{
		unchecked 
		{
			global::Array<int> a = global::Lambda.array<int>(new global::Array<int>(new int[]{0, 1, 2, 3}));
			global::List<int> l = global::Lambda.concat<int>(new global::Array<int>(new int[]{0, 1, 2, 3}), new global::Array<int>(new int[]{4, 5}));
		}
	}
	
	
	public virtual   void testHash()
	{
		unchecked 
		{
			global::Hash<object> h = new global::Hash<object>();
			h.@set("key", "value");
			h.@get("key");
			h.@remove("key");
			bool b = h.exists("key");
			object arr = h.keys();
			object iter = h.iterator();
			string str = h.toString();
			global::IntHash<object> hi = new global::IntHash<object>();
			hi.@set(0, "value");
			hi.@get(0);
			hi.@remove(0);
			bool bi = hi.exists(0);
			object arri = hi.keys();
			object iteri = hi.iterator();
			string stri = hi.toString();
		}
	}
	
	
	public virtual   void testEReg()
	{
		unchecked 
		{
			global::EReg ereg = new global::EReg("ytrytrevev76", "099");
			string s = ereg.map("s", ( (( global::Fun_584bcc2e.__hx_current != default(global::Fun_584bcc2e) )) ? (global::Fun_584bcc2e.__hx_current) : (global::Fun_584bcc2e.__hx_current = ((global::Fun_584bcc2e) (new global::Fun_584bcc2e()) )) ));
			bool b = ereg.match("s");
			s = ereg.matched(5);
			s = ereg.matchedLeft();
			object o = ereg.matchedPos();
			s = ereg.matchedRight();
			s = ereg.replace("s", "by");
			global::Array<object> arr = ereg.split(",");
		}
	}
	
	
	public virtual   void testEnum(global::TestsEnumExtern v)
	{
		unchecked 
		{
			int i = default(int);
			switch (((int) (global::haxe.lang.Runtime.toInt(((object) ((v)) ))) ))
			{
				case 0:
				{
					i = 5;
					break;
				}
				
				
				case 1:
				{
					i = 6;
					break;
				}
				
				
				case 2:
				{
					i = 7;
					break;
				}
				
				
			}
			
			global::Color2 red = global::Color2.Red2;
			int j = default(int);
			switch (((int) (global::haxe.lang.Runtime.toInt(((object) ((red)) ))) ))
			{
				case 0:
				{
					j = 5;
					break;
				}
				
				
				case 1:
				{
					j = 6;
					break;
				}
				
				
				case 2:
				{
					j = 7;
					break;
				}
				
				
			}
			
		}
	}
	
	
	public virtual   int enumToInt(global::Color c)
	{
		unchecked 
		{
			this.testEnum(global::TestsEnumExtern.ExternEnumValue1);
			{
				global::Color __temp_cond43 = (c);
				switch (__temp_cond43.index)
				{
					case 0:
					{
						return 16711680;
					}
					
					
					case 1:
					{
						return 65280;
					}
					
					
					case 2:
					{
						return 255;
					}
					
					
					case 3:
					{
						int c_eGrey_0 = ((int) (global::haxe.lang.Runtime.toInt(__temp_cond43.@params[0])) );
						return ( ( ( c_eGrey_0 << 16 ) | ( c_eGrey_0 << 8 ) ) | c_eGrey_0 );
					}
					
					
					case 4:
					{
						int c_eRgb_2 = ((int) (global::haxe.lang.Runtime.toInt(__temp_cond43.@params[2])) );
						int c_eRgb_1 = ((int) (global::haxe.lang.Runtime.toInt(__temp_cond43.@params[1])) );
						int c_eRgb_0 = ((int) (global::haxe.lang.Runtime.toInt(__temp_cond43.@params[0])) );
						return ( ( ( c_eRgb_0 << 16 ) | ( c_eRgb_1 << 8 ) ) | c_eRgb_2 );
					}
					
					
					case 5:
					{
						global::Color c_eAlpha_1 = ((global::Color) (__temp_cond43.@params[1]) );
						int c_eAlpha_0 = ((int) (global::haxe.lang.Runtime.toInt(__temp_cond43.@params[0])) );
						return ( ( c_eAlpha_0 << 24 ) | ( this.enumToInt(c_eAlpha_1) & 16777215 ) );
					}
					
					
				}
				
			}
			
			return default(int);
		}
	}
	
	
	public virtual   void testDate()
	{
		unchecked 
		{
			global::Date d = new global::Date(2012, 11, 13, 19, 30, 0);
			int @int = d.date.Day;
			@int = d.getDay();
			@int = d.date.Year;
			@int = d.date.Hour;
			@int = d.date.Minute;
			@int = ( d.date.Month - 1 );
			@int = d.date.Second;
			double @float = ( ((double) (d.date.Ticks) ) / global::System.TimeSpan.TicksPerMillisecond );
			string str = d.toString();
			global::Date d2 = global::Date.fromString("2012-12-12 06:40:00");
			d2 = global::Date.fromTime(((double) (120000) ));
			d2 = global::Date.now();
			int x = global::DateTools.getMonthDays(d2);
			@float = global::DateTools.days(((double) (5) ));
			global::Date d3 = global::DateTools.delta(d, 1000.0);
			str = global::DateTools.format(d, "HH:mm");
			@int = global::DateTools.getMonthDays(d);
			@float = global::DateTools.hours(((double) (1000) ));
			@float = global::DateTools.make(new global::haxe.lang.DynamicObject(new global::Array<int>(new int[]{}), new global::Array<object>(new object[]{}), new global::Array<int>(new int[]{24422, 727985871, 1113807511, 1407096607, 1519236735}), new global::Array<double>(new double[]{((double) (110) ), ((double) (8) ), ((double) (5) ), ((double) (6) ), ((double) (0) )})));
			@float = global::DateTools.minutes(((double) (56) ));
			object obj = global::DateTools.parse(((double) (45546) ));
			@float = global::DateTools.seconds(((double) (1000) ));
		}
	}
	
	
	public virtual   void testArray()
	{
		unchecked 
		{
			global::Array<object> @as = new global::Array<object>();
			global::Array<double> aa = new global::Array<double>(new double[]{1.0, ((double) (2) ), ((double) (3) ), ((double) (4) ), ((double) (5) )});
			double aaa = aa[2];
			double __temp_expr62 = aa[3];
			global::Array<object> concatArray = @as.concat(new global::Array<object>(new object[]{"5", "6", "7"}));
			concatArray = @as.copy();
			concatArray.insert(2, "2");
			object iter = @as.iterator();
			string s = concatArray.@join(", ");
			string item = global::haxe.lang.Runtime.toString(@as.pop().@value);
			@as.push("454");
			bool @bool = @as.@remove("5");
			@as.reverse();
			item = global::haxe.lang.Runtime.toString(@as.shift().@value);
			global::Array<object> sliceArray = @as.slice(1, new global::haxe.lang.Null<int>(3, true));
			@as.sort(( (( global::Fun_7664377c.__hx_current != default(global::Fun_7664377c) )) ? (global::Fun_7664377c.__hx_current) : (global::Fun_7664377c.__hx_current = ((global::Fun_7664377c) (new global::Fun_7664377c()) )) ));
			sliceArray = @as.splice(2, 2);
			s = @as.toString();
			@as.unshift("44");
			global::Array<int> a_comprehention = default(global::Array<int>);
			{
				global::Array<int> _g = new global::Array<int>(new int[]{});
				{
					int _g1 = 0;
					while (( _g1 < 10 ))
					{
						int x = _g1++;
						_g.push(x);
					}
					
				}
				
				a_comprehention = _g;
			}
			
			global::Array<int> b_comprehention = default(global::Array<int>);
			{
				global::Array<int> _g11 = new global::Array<int>(new int[]{});
				{
					int _g2 = 0;
					while (( _g2 < a_comprehention.length ))
					{
						int x1 = a_comprehention[_g2];
						 ++ _g2;
						if (( ( x1 % 2 ) == 0 )) 
						{
							_g11.push(x1);
						}
						
					}
					
				}
				
				b_comprehention = _g11;
			}
			
			global::Array<int> c_comprehention = default(global::Array<int>);
			{
				global::Array<int> _g21 = new global::Array<int>(new int[]{});
				{
					int _g3 = 0;
					while (( _g3 < 4 ))
					{
						int x2 = _g3++;
						int _g5 = 0;
						int _g4 = ( x2 + 1 );
						while (( _g5 < _g4 ))
						{
							int i = _g5++;
							_g21.push(i);
						}
						
					}
					
				}
				
				c_comprehention = _g21;
			}
			
		}
	}
	
	
	public virtual   void testSwitch()
	{
		unchecked 
		{
			bool _g = true;
			{
				bool __temp_switch63 = (_g);
				if (( __temp_switch63 == true )) 
				{
					int x = 0;
				}
				 else 
				{
					if (( __temp_switch63 == false )) 
					{
						int y = 0;
					}
					
				}
				
			}
			
		}
	}
	
	
	public virtual   void testTry()
	{
		unchecked 
		{
			try 
			{
				int a = 3;
			}
			catch (global::System.Exception __temp_catchallException64)
			{
				object __temp_catchall65 = __temp_catchallException64;
				if (( __temp_catchall65 is global::haxe.lang.HaxeException )) 
				{
					__temp_catchall65 = ((global::haxe.lang.HaxeException) (__temp_catchallException64) ).obj;
				}
				
				{
					object e = __temp_catchall65;
					global::haxe.Log.trace.__hx_invoke2_o(default(double), default(double), "error", new global::haxe.lang.DynamicObject(new global::Array<int>(new int[]{302979532, 1547539107, 1648581351}), new global::Array<object>(new object[]{"testTry", "Tests", "Tests.hx"}), new global::Array<int>(new int[]{1981972957}), new global::Array<double>(new double[]{((double) (101) )})));
				}
				
			}
			
			
		}
	}
	
	
	public virtual   void testWhile()
	{
		unchecked 
		{
			int aa = 5;
			do 
			{
				global::haxe.Log.trace.__hx_invoke2_o(default(double), default(double), "do something", new global::haxe.lang.DynamicObject(new global::Array<int>(new int[]{302979532, 1547539107, 1648581351}), new global::Array<object>(new object[]{"testWhile", "Tests", "Tests.hx"}), new global::Array<int>(new int[]{1981972957}), new global::Array<double>(new double[]{((double) (84) )})));
				aa++;
			}
			while (( aa < 10 ));
			while (( aa > 0 ))
			{
				aa--;
			}
			
		}
	}
	
	
	public virtual   void testingFor()
	{
		unchecked 
		{
			global::Array<int> aa = new global::Array<int>(new int[]{1, 2, 3, 4, 5});
			{
				int _g = 0;
				while (( _g < 5 ))
				{
					int i = _g++;
					aa.push(i);
				}
				
			}
			
			{
				int _g1 = 0;
				int _g2 = aa.length;
				while (( _g1 < _g2 ))
				{
					int i1 = _g1++;
					aa.push(i1);
				}
				
			}
			
			{
				int _g3 = 0;
				while (( _g3 < aa.length ))
				{
					int i2 = aa[_g3];
					 ++ _g3;
					aa.push(i2);
				}
				
			}
			
		}
	}
	
	
	public virtual   void testVariables()
	{
		unchecked 
		{
			global::Array<object> a = new global::Array<object>();
			int b = 5;
			double c = 5.0;
			string d = "xyz";
			bool e = true;
			int f;
			int g = ((int) (5.3) );
			object g1 = ((object) (6.3) );
			object g2 = ((object) (a) );
			int xy = a.length;
			a.push("6");
			if (( a.length > 3 )) 
			{
				f = 3;
			}
			 else 
			{
				f = a.length;
			}
			
			f = ( (( a.length > 3 )) ? (3) : (a.length) );
			int x = new global::Tests().@add(1, 1);
		}
	}
	
	
	public  string s;
	
	public  double d2;
	
	public  int d1;
	
	public  int width;
	
	public  double interfaceVar2;
	
	public  int interfaceVar1;
	
	public override   double __hx_setField_f(string field, int hash, double @value, bool handleProperties)
	{
		unchecked 
		{
			switch (hash)
			{
				case 260725187:
				{
					this.interfaceVar1 = ((int) (@value) );
					return @value;
				}
				
				
				case 260725188:
				{
					this.interfaceVar2 = ((double) (@value) );
					return @value;
				}
				
				
				case 1247983110:
				{
					if (handleProperties) 
					{
						this.setWidth(((int) (@value) ));
						return @value;
					}
					 else 
					{
						this.width = ((int) (@value) );
						return @value;
					}
					
				}
				
				
				case 22349:
				{
					this.d1 = ((int) (@value) );
					return @value;
				}
				
				
				case 22350:
				{
					this.d2 = ((double) (@value) );
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
				case 260725187:
				{
					this.interfaceVar1 = ((int) (global::haxe.lang.Runtime.toInt(@value)) );
					return @value;
				}
				
				
				case 260725188:
				{
					this.interfaceVar2 = ((double) (global::haxe.lang.Runtime.toDouble(@value)) );
					return @value;
				}
				
				
				case 1247983110:
				{
					if (handleProperties) 
					{
						this.setWidth(((int) (global::haxe.lang.Runtime.toInt(@value)) ));
						return @value;
					}
					 else 
					{
						this.width = ((int) (global::haxe.lang.Runtime.toInt(@value)) );
						return @value;
					}
					
				}
				
				
				case 22349:
				{
					this.d1 = ((int) (global::haxe.lang.Runtime.toInt(@value)) );
					return @value;
				}
				
				
				case 22350:
				{
					this.d2 = ((double) (global::haxe.lang.Runtime.toDouble(@value)) );
					return @value;
				}
				
				
				case 115:
				{
					this.s = global::haxe.lang.Runtime.toString(@value);
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
				case 260725187:
				{
					return this.interfaceVar1;
				}
				
				
				case 260725188:
				{
					return this.interfaceVar2;
				}
				
				
				case 1247983110:
				{
					if (handleProperties) 
					{
						return this.getWidth();
					}
					 else 
					{
						return this.width;
					}
					
				}
				
				
				case 22349:
				{
					return this.d1;
				}
				
				
				case 22350:
				{
					return this.d2;
				}
				
				
				case 115:
				{
					return this.s;
				}
				
				
				case 899506181:
				{
					return new global::haxe.lang.Closure(this, "testVariables", 899506181);
				}
				
				
				case 2050424089:
				{
					return new global::haxe.lang.Closure(this, "testingFor", 2050424089);
				}
				
				
				case 314540543:
				{
					return new global::haxe.lang.Closure(this, "testWhile", 314540543);
				}
				
				
				case 1036441609:
				{
					return new global::haxe.lang.Closure(this, "testTry", 1036441609);
				}
				
				
				case 1584238566:
				{
					return new global::haxe.lang.Closure(this, "testSwitch", 1584238566);
				}
				
				
				case 1855040487:
				{
					return new global::haxe.lang.Closure(this, "testArray", 1855040487);
				}
				
				
				case 1167448992:
				{
					return new global::haxe.lang.Closure(this, "testDate", 1167448992);
				}
				
				
				case 174079859:
				{
					return new global::haxe.lang.Closure(this, "enumToInt", 174079859);
				}
				
				
				case 1179185267:
				{
					return new global::haxe.lang.Closure(this, "testEnum", 1179185267);
				}
				
				
				case 1177789281:
				{
					return new global::haxe.lang.Closure(this, "testEReg", 1177789281);
				}
				
				
				case 1211807040:
				{
					return new global::haxe.lang.Closure(this, "testHash", 1211807040);
				}
				
				
				case 1773435129:
				{
					return new global::haxe.lang.Closure(this, "testLambda", 1773435129);
				}
				
				
				case 1256563152:
				{
					return new global::haxe.lang.Closure(this, "testList", 1256563152);
				}
				
				
				case 1267255098:
				{
					return new global::haxe.lang.Closure(this, "testMath", 1267255098);
				}
				
				
				case 636645899:
				{
					return new global::haxe.lang.Closure(this, "testReflect", 636645899);
				}
				
				
				case 1036392305:
				{
					return new global::haxe.lang.Closure(this, "testStd", 1036392305);
				}
				
				
				case 707030723:
				{
					return new global::haxe.lang.Closure(this, "testString", 707030723);
				}
				
				
				case 1346074668:
				{
					return new global::haxe.lang.Closure(this, "testType", 1346074668);
				}
				
				
				case 1036639397:
				{
					return new global::haxe.lang.Closure(this, "testXml", 1036639397);
				}
				
				
				case 1496841747:
				{
					return new global::haxe.lang.Closure(this, "testTimer", 1496841747);
				}
				
				
				case 575099699:
				{
					return new global::haxe.lang.Closure(this, "testCrypto", 575099699);
				}
				
				
				case 5097222:
				{
					return new global::haxe.lang.Closure(this, "foo", 5097222);
				}
				
				
				case 943492076:
				{
					return new global::haxe.lang.Closure(this, "testOverload", 943492076);
				}
				
				
				case 1040412140:
				{
					return new global::haxe.lang.Closure(this, "testFrameworksImport", 1040412140);
				}
				
				
				case 708429200:
				{
					return new global::haxe.lang.Closure(this, "getWidth", 708429200);
				}
				
				
				case 1486298884:
				{
					return new global::haxe.lang.Closure(this, "setWidth", 1486298884);
				}
				
				
				case 4846113:
				{
					return new global::haxe.lang.Closure(this, "add", 4846113);
				}
				
				
				case 141066352:
				{
					return new global::haxe.lang.Closure(this, "minus", 141066352);
				}
				
				
				case 1843721375:
				{
					return new global::haxe.lang.Closure(this, "callLotsOfArguments", 1843721375);
				}
				
				
				case 1253604246:
				{
					return new global::haxe.lang.Closure(this, "optionalArguments", 1253604246);
				}
				
				
				case 380872667:
				{
					return new global::haxe.lang.Closure(this, "optionalArguments1", 380872667);
				}
				
				
				case 380872668:
				{
					return new global::haxe.lang.Closure(this, "optionalArguments2", 380872668);
				}
				
				
				case 380872669:
				{
					return new global::haxe.lang.Closure(this, "optionalArguments3", 380872669);
				}
				
				
				case 1169898256:
				{
					return new global::haxe.lang.Closure(this, "init", 1169898256);
				}
				
				
				case 2102626213:
				{
					return new global::haxe.lang.Closure(this, "printHello", 2102626213);
				}
				
				
				case 1165048321:
				{
					return new global::haxe.lang.Closure(this, "functionToRedefine", 1165048321);
				}
				
				
				case 2107737873:
				{
					return new global::haxe.lang.Closure(this, "functionToRedefine2", 2107737873);
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
				case 260725187:
				{
					return ((double) (this.interfaceVar1) );
				}
				
				
				case 260725188:
				{
					return this.interfaceVar2;
				}
				
				
				case 1247983110:
				{
					int __temp_stmt66 = default(int);
					if (handleProperties) 
					{
						return ((double) (this.getWidth()) );
					}
					 else 
					{
						__temp_stmt66 = this.width;
					}
					
					return ((double) (__temp_stmt66) );
				}
				
				
				case 22349:
				{
					return ((double) (this.d1) );
				}
				
				
				case 22350:
				{
					return this.d2;
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
				case 899506181:
				{
					this.testVariables();
					break;
				}
				
				
				case 2050424089:
				{
					this.testingFor();
					break;
				}
				
				
				case 314540543:
				{
					this.testWhile();
					break;
				}
				
				
				case 1036441609:
				{
					this.testTry();
					break;
				}
				
				
				case 1584238566:
				{
					this.testSwitch();
					break;
				}
				
				
				case 1855040487:
				{
					this.testArray();
					break;
				}
				
				
				case 1167448992:
				{
					this.testDate();
					break;
				}
				
				
				case 174079859:
				{
					return this.enumToInt(((global::Color) (dynargs[0]) ));
				}
				
				
				case 1179185267:
				{
					this.testEnum(((global::TestsEnumExtern) (dynargs[0]) ));
					break;
				}
				
				
				case 1177789281:
				{
					this.testEReg();
					break;
				}
				
				
				case 1211807040:
				{
					this.testHash();
					break;
				}
				
				
				case 1773435129:
				{
					this.testLambda();
					break;
				}
				
				
				case 1256563152:
				{
					this.testList();
					break;
				}
				
				
				case 1267255098:
				{
					this.testMath();
					break;
				}
				
				
				case 636645899:
				{
					this.testReflect();
					break;
				}
				
				
				case 1036392305:
				{
					this.testStd();
					break;
				}
				
				
				case 707030723:
				{
					this.testString();
					break;
				}
				
				
				case 1346074668:
				{
					this.testType();
					break;
				}
				
				
				case 1036639397:
				{
					this.testXml();
					break;
				}
				
				
				case 1496841747:
				{
					this.testTimer();
					break;
				}
				
				
				case 575099699:
				{
					this.testCrypto();
					break;
				}
				
				
				case 5097222:
				{
					this.foo();
					break;
				}
				
				
				case 943492076:
				{
					this.testOverload();
					break;
				}
				
				
				case 1040412140:
				{
					this.testFrameworksImport();
					break;
				}
				
				
				case 708429200:
				{
					return this.getWidth();
				}
				
				
				case 1486298884:
				{
					return this.setWidth(((int) (global::haxe.lang.Runtime.toInt(dynargs[0])) ));
				}
				
				
				case 4846113:
				{
					return this.@add(((int) (global::haxe.lang.Runtime.toInt(dynargs[0])) ), ((int) (global::haxe.lang.Runtime.toInt(dynargs[1])) ));
				}
				
				
				case 141066352:
				{
					return this.minus(((int) (global::haxe.lang.Runtime.toInt(dynargs[0])) ), ((int) (global::haxe.lang.Runtime.toInt(dynargs[1])) ));
				}
				
				
				case 1843721375:
				{
					this.callLotsOfArguments(((int) (global::haxe.lang.Runtime.toInt(dynargs[0])) ), ((int) (global::haxe.lang.Runtime.toInt(dynargs[1])) ), ((int) (global::haxe.lang.Runtime.toInt(dynargs[2])) ), ((int) (global::haxe.lang.Runtime.toInt(dynargs[3])) ));
					break;
				}
				
				
				case 1253604246:
				{
					this.optionalArguments(((int) (global::haxe.lang.Runtime.toInt(dynargs[0])) ), ((int) (global::haxe.lang.Runtime.toInt(dynargs[1])) ), ((int) (global::haxe.lang.Runtime.toInt(dynargs[2])) ), global::haxe.lang.Null<object>.ofDynamic<int>(dynargs[3]));
					break;
				}
				
				
				case 380872667:
				{
					this.optionalArguments1(((int) (global::haxe.lang.Runtime.toInt(dynargs[0])) ), ((int) (global::haxe.lang.Runtime.toInt(dynargs[1])) ), ((int) (global::haxe.lang.Runtime.toInt(dynargs[2])) ), global::haxe.lang.Null<object>.ofDynamic<int>(dynargs[3]));
					break;
				}
				
				
				case 380872668:
				{
					this.optionalArguments2(((int) (global::haxe.lang.Runtime.toInt(dynargs[0])) ), global::haxe.lang.Null<object>.ofDynamic<int>(dynargs[1]), global::haxe.lang.Null<object>.ofDynamic<int>(dynargs[2]), ((int) (global::haxe.lang.Runtime.toInt(dynargs[3])) ));
					break;
				}
				
				
				case 380872669:
				{
					this.optionalArguments3(((int) (global::haxe.lang.Runtime.toInt(dynargs[0])) ), global::haxe.lang.Null<object>.ofDynamic<int>(dynargs[1]), global::haxe.lang.Null<object>.ofDynamic<bool>(dynargs[2]), global::haxe.lang.Null<object>.ofDynamic<bool>(dynargs[3]));
					break;
				}
				
				
				case 1169898256:
				{
					this.init();
					break;
				}
				
				
				case 2102626213:
				{
					this.printHello();
					break;
				}
				
				
				case 1165048321:
				{
					this.functionToRedefine();
					break;
				}
				
				
				case 2107737873:
				{
					this.functionToRedefine2(((int) (global::haxe.lang.Runtime.toInt(dynargs[0])) ), global::haxe.lang.Runtime.toString(dynargs[1]));
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
			baseArr.push("interfaceVar1");
			baseArr.push("interfaceVar2");
			baseArr.push("width");
			baseArr.push("d1");
			baseArr.push("d2");
			baseArr.push("s");
			{
				base.__hx_getFields(baseArr);
			}
			
		}
	}
	
	
}



public  class Fun_21f364a7 : global::haxe.lang.Function 
{
	public    Fun_21f364a7(global::Array<object> _g) : base(0, 0)
	{
		unchecked 
		{
			this._g = _g;
		}
	}
	
	
	public override   object __hx_invoke0_o()
	{
		unchecked 
		{
			((global::Tests) (this._g[0]) ).testTimer();
			return default(object);
		}
	}
	
	
	public  global::Array<object> _g;
	
}



public  class Fun_4bae2a17 : global::haxe.lang.Function 
{
	public    Fun_4bae2a17() : base(1, 0)
	{
		unchecked 
		{
		}
	}
	
	
	public static  global::Fun_4bae2a17 __hx_current;
	
	public override   object __hx_invoke1_o(double __fn_float1, object __fn_dyn1)
	{
		unchecked 
		{
			int i = ( (( __fn_dyn1 == global::haxe.lang.Runtime.undefined )) ? (((int) (__fn_float1) )) : (((int) (global::haxe.lang.Runtime.toInt(__fn_dyn1)) )) );
			return ( i > 5 );
		}
	}
	
	
}



public  class Fun_c48b88b9 : global::haxe.lang.Function 
{
	public    Fun_c48b88b9() : base(1, 0)
	{
		unchecked 
		{
		}
	}
	
	
	public static  global::Fun_c48b88b9 __hx_current;
	
	public override   object __hx_invoke1_o(double __fn_float1, object __fn_dyn1)
	{
		unchecked 
		{
			int i1 = ( (( __fn_dyn1 == global::haxe.lang.Runtime.undefined )) ? (((int) (__fn_float1) )) : (((int) (global::haxe.lang.Runtime.toInt(__fn_dyn1)) )) );
			return global::Std.@string(i1);
		}
	}
	
	
}



public  class Fun_584bcc2e : global::haxe.lang.Function 
{
	public    Fun_584bcc2e() : base(1, 0)
	{
		unchecked 
		{
		}
	}
	
	
	public static  global::Fun_584bcc2e __hx_current;
	
	public override   object __hx_invoke1_o(double __fn_float1, object __fn_dyn1)
	{
		unchecked 
		{
			global::EReg e = ( (( __fn_dyn1 == global::haxe.lang.Runtime.undefined )) ? (((global::EReg) (((object) (__fn_float1) )) )) : (((global::EReg) (__fn_dyn1) )) );
			return "ss";
		}
	}
	
	
}



public  class Fun_7664377c : global::haxe.lang.Function 
{
	public    Fun_7664377c() : base(2, 1)
	{
		unchecked 
		{
		}
	}
	
	
	public static  global::Fun_7664377c __hx_current;
	
	public override   double __hx_invoke2_f(double __fn_float1, double __fn_float2, object __fn_dyn1, object __fn_dyn2)
	{
		unchecked 
		{
			string b = ( (( __fn_dyn2 == global::haxe.lang.Runtime.undefined )) ? (global::haxe.lang.Runtime.toString(__fn_float2)) : (global::haxe.lang.Runtime.toString(__fn_dyn2)) );
			string a = ( (( __fn_dyn1 == global::haxe.lang.Runtime.undefined )) ? (global::haxe.lang.Runtime.toString(__fn_float1)) : (global::haxe.lang.Runtime.toString(__fn_dyn1)) );
			return ((double) (0) );
		}
	}
	
	
}



public  class Tests2 : global::haxe.lang.HxObject 
{
	public    Tests2() : base()
	{
		unchecked 
		{
			global::Tests2.__hx_ctor(this);
		}
	}
	
	
	public static   void __hx_ctor(global::Tests2 __temp_me23)
	{
		unchecked 
		{
			__temp_me23.functionToRedefine = ( (( global::Fun_47b85060.__hx_current != default(global::Fun_47b85060) )) ? (global::Fun_47b85060.__hx_current) : (global::Fun_47b85060.__hx_current = ((global::Fun_47b85060) (new global::Fun_47b85060()) )) );
			__temp_me23.functionToRedefine2 = ( (( global::Fun_d41d8cd9.__hx_current != default(global::Fun_d41d8cd9) )) ? (global::Fun_d41d8cd9.__hx_current) : (global::Fun_d41d8cd9.__hx_current = ((global::Fun_d41d8cd9) (new global::Fun_d41d8cd9()) )) );
			__temp_me23.d1 = 34;
			global::Array<int> arr = new global::Array<int>(new int[]{__temp_me23.d1, __temp_me23.d1, 50});
		}
	}
	
	
	public static  new object __hx_createEmpty()
	{
		unchecked 
		{
			return new global::Tests2(global::haxe.lang.EmptyObject.EMPTY);
		}
	}
	
	
	public static  new object __hx_create(global::Array arr)
	{
		unchecked 
		{
			return new global::Tests2();
		}
	}
	
	
	public    Tests2(global::haxe.lang.EmptyObject empty) : base()
	{
		unchecked 
		{
		}
	}
	
	
	public  global::haxe.lang.Function functionToRedefine2;
	
	public  global::haxe.lang.Function functionToRedefine;
	
	public virtual   void methodInTests2()
	{
		unchecked 
		{
			this.functionToRedefine.__hx_invoke0_o();
			this.functionToRedefine2.__hx_invoke2_o(((double) (0) ), default(double), global::haxe.lang.Runtime.undefined, "00");
		}
	}
	
	
	public  int d1;
	
	public override   double __hx_setField_f(string field, int hash, double @value, bool handleProperties)
	{
		unchecked 
		{
			switch (hash)
			{
				case 22349:
				{
					this.d1 = ((int) (@value) );
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
				case 22349:
				{
					this.d1 = ((int) (global::haxe.lang.Runtime.toInt(@value)) );
					return @value;
				}
				
				
				case 1165048321:
				{
					this.functionToRedefine = ((global::haxe.lang.Function) (@value) );
					return @value;
				}
				
				
				case 2107737873:
				{
					this.functionToRedefine2 = ((global::haxe.lang.Function) (@value) );
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
				case 22349:
				{
					return this.d1;
				}
				
				
				case 198748919:
				{
					return new global::haxe.lang.Closure(this, "methodInTests2", 198748919);
				}
				
				
				case 1165048321:
				{
					return this.functionToRedefine;
				}
				
				
				case 2107737873:
				{
					return this.functionToRedefine2;
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
				case 22349:
				{
					return ((double) (this.d1) );
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
				case 198748919:
				{
					this.methodInTests2();
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
			baseArr.push("d1");
			baseArr.push("functionToRedefine");
			baseArr.push("functionToRedefine2");
			{
				base.__hx_getFields(baseArr);
			}
			
		}
	}
	
	
}



public  class Fun_47b85060 : global::haxe.lang.Function 
{
	public    Fun_47b85060() : base(0, 0)
	{
		unchecked 
		{
		}
	}
	
	
	public static  global::Fun_47b85060 __hx_current;
	
	public override   object __hx_invoke0_o()
	{
		unchecked 
		{
			global::haxe.Log.trace.__hx_invoke2_o(default(double), default(double), "originally do something", new global::haxe.lang.DynamicObject(new global::Array<int>(new int[]{302979532, 1547539107, 1648581351}), new global::Array<object>(new object[]{"functionToRedefine", "Tests2", "Tests.hx"}), new global::Array<int>(new int[]{1981972957}), new global::Array<double>(new double[]{((double) (626) )})));
			return default(object);
		}
	}
	
	
}



public  class Fun_d41d8cd9 : global::haxe.lang.Function 
{
	public    Fun_d41d8cd9() : base(2, 0)
	{
		unchecked 
		{
		}
	}
	
	
	public static  global::Fun_d41d8cd9 __hx_current;
	
	public override   object __hx_invoke2_o(double __fn_float1, double __fn_float2, object __fn_dyn1, object __fn_dyn2)
	{
		unchecked 
		{
			string param2 = ( (( __fn_dyn2 == global::haxe.lang.Runtime.undefined )) ? (global::haxe.lang.Runtime.toString(__fn_float2)) : (global::haxe.lang.Runtime.toString(__fn_dyn2)) );
			int param1 = ( (( __fn_dyn1 == global::haxe.lang.Runtime.undefined )) ? (((int) (__fn_float1) )) : (((int) (global::haxe.lang.Runtime.toInt(__fn_dyn1)) )) );
			{
			}
			
			return default(object);
		}
	}
	
	
}



public enum Color2
{
	Red2, Green2, Blue2
}


