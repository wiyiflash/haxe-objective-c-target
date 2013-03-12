
public  class StringTools : global::haxe.lang.HxObject 
{
	public    StringTools() : base()
	{
		unchecked 
		{
		}
	}
	
	
	public static   string urlEncode(string s)
	{
		unchecked 
		{
			return System.Uri.EscapeUriString(s);
		}
	}
	
	
	public static   string urlDecode(string s)
	{
		unchecked 
		{
			return System.Uri.UnescapeDataString(s);
		}
	}
	
	
	public static   string htmlEscape(string s, global::haxe.lang.Null<bool> quotes)
	{
		unchecked 
		{
			s = global::haxe.lang.StringExt.split(global::haxe.lang.StringExt.split(global::haxe.lang.StringExt.split(s, "&").@join("&amp;"), "<").@join("&lt;"), ">").@join("&gt;");
			return ( ((quotes).@value) ? (global::haxe.lang.StringExt.split(global::haxe.lang.StringExt.split(s, "\"").@join("&quot;"), "\'").@join("&#039;")) : (s) );
		}
	}
	
	
	public static   string htmlUnescape(string s)
	{
		unchecked 
		{
			return global::haxe.lang.StringExt.split(global::haxe.lang.StringExt.split(global::haxe.lang.StringExt.split(global::haxe.lang.StringExt.split(global::haxe.lang.StringExt.split(s, "&gt;").@join(">"), "&lt;").@join("<"), "&quot;").@join("\""), "&#039;").@join("\'"), "&amp;").@join("&");
		}
	}
	
	
	public static   bool startsWith(string s, string start)
	{
		unchecked 
		{
			return s.StartsWith(start);
		}
	}
	
	
	public static   bool endsWith(string s, string end)
	{
		unchecked 
		{
			return s.EndsWith(end);
		}
	}
	
	
	public static   bool isSpace(string s, int pos)
	{
		unchecked 
		{
			global::haxe.lang.Null<int> c = global::haxe.lang.StringExt.charCodeAt(s, pos);
			return ( ( ( c.@value >= 9 ) && ( c.@value <= 13 ) ) || global::haxe.lang.Runtime.eq((c).toDynamic(), 32) );
		}
	}
	
	
	public static   string ltrim(string s)
	{
		unchecked 
		{
			return s.TrimStart();
		}
	}
	
	
	public static   string rtrim(string s)
	{
		unchecked 
		{
			return s.TrimEnd();
		}
	}
	
	
	public static   string trim(string s)
	{
		unchecked 
		{
			return global::haxe.lang.Runtime.toString(global::haxe.lang.Runtime.callField(s, "Trim", 937216258, default(global::Array)));
		}
	}
	
	
	public static   string lpad(string s, string c, int l)
	{
		unchecked 
		{
			if (( c.Length <= 0 )) 
			{
				return s;
			}
			
			while (( s.Length < l ))
			{
				s = global::haxe.lang.Runtime.concat(c, s);
			}
			
			return s;
		}
	}
	
	
	public static   string rpad(string s, string c, int l)
	{
		unchecked 
		{
			if (( c.Length <= 0 )) 
			{
				return s;
			}
			
			while (( s.Length < l ))
			{
				s = global::haxe.lang.Runtime.concat(s, c);
			}
			
			return s;
		}
	}
	
	
	public static   string replace(string s, string sub, string @by)
	{
		unchecked 
		{
			return s.Replace(sub, @by);
		}
	}
	
	
	public static   string hex(int n, global::haxe.lang.Null<int> digits)
	{
		unchecked 
		{
			string s = "";
			string hexChars = "0123456789ABCDEF";
			do 
			{
				s = global::haxe.lang.Runtime.concat(global::haxe.lang.StringExt.charAt(hexChars, ( n & 15 )), s);
				n = ((int) (( ((uint) (n) ) >> 4 )) );
			}
			while (( n > 0 ));
			if (( ! ( ! (digits.hasValue) ) )) 
			{
				while (( s.Length < digits.@value ))
				{
					s = global::haxe.lang.Runtime.concat("0", s);
				}
				
			}
			
			return s;
		}
	}
	
	
	public static   int fastCodeAt(string s, int index)
	{
		unchecked 
		{
			return ( (( ((uint) (index) ) < s.Length )) ? (((int) (global::haxe.lang.Runtime.toInt(s[index])) )) : (-1) );
		}
	}
	
	
	public static   bool isEof(int c)
	{
		unchecked 
		{
			return ( c == -1 );
		}
	}
	
	
	public static  new object __hx_createEmpty()
	{
		unchecked 
		{
			return new global::StringTools(global::haxe.lang.EmptyObject.EMPTY);
		}
	}
	
	
	public static  new object __hx_create(global::Array arr)
	{
		unchecked 
		{
			return new global::StringTools();
		}
	}
	
	
	public    StringTools(global::haxe.lang.EmptyObject empty) : base()
	{
		unchecked 
		{
		}
	}
	
	
}


