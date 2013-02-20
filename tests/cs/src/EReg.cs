
public  class EReg : global::haxe.lang.HxObject 
{
	public    EReg(string r, string opt) : base()
	{
		unchecked 
		{
			global::EReg.__hx_ctor(this, r, opt);
		}
	}
	
	
	public static   void __hx_ctor(global::EReg __temp_me7, string r, string opt)
	{
		unchecked 
		{
			int opts = ((int) (global::haxe.lang.Runtime.toInt(((object) (global::System.Text.RegularExpressions.RegexOptions.CultureInvariant) ))) );
			{
				int _g1 = 0;
				int _g = opt.Length;
				while (( _g1 < _g ))
				{
					int i = _g1++;
					{
						int _g2 = ((int) (opt[i]) );
						switch (_g2)
						{
							case 105:
							{
								opts |= ((int) (global::haxe.lang.Runtime.toInt(((object) (global::System.Text.RegularExpressions.RegexOptions.IgnoreCase) ))) );
								break;
							}
							
							
							case 103:
							{
								__temp_me7.isGlobal = true;
								break;
							}
							
							
							case 109:
							{
								opts |= ((int) (global::haxe.lang.Runtime.toInt(((object) (global::System.Text.RegularExpressions.RegexOptions.Multiline) ))) );
								break;
							}
							
							
							case 99:
							{
								opts |= ((int) (global::haxe.lang.Runtime.toInt(((object) (global::System.Text.RegularExpressions.RegexOptions.Compiled) ))) );
								break;
							}
							
							
						}
						
					}
					
				}
				
			}
			
			__temp_me7.regex = new global::System.Text.RegularExpressions.Regex(r, ((global::System.Text.RegularExpressions.RegexOptions) (((object) (opts) )) ));
		}
	}
	
	
	public static  new object __hx_createEmpty()
	{
		unchecked 
		{
			return new global::EReg(global::haxe.lang.EmptyObject.EMPTY);
		}
	}
	
	
	public static  new object __hx_create(global::Array arr)
	{
		unchecked 
		{
			return new global::EReg(global::haxe.lang.Runtime.toString(arr[0]), global::haxe.lang.Runtime.toString(arr[1]));
		}
	}
	
	
	public    EReg(global::haxe.lang.EmptyObject empty) : base()
	{
		unchecked 
		{
		}
	}
	
	
	public virtual   string map(string s, global::haxe.lang.Function f)
	{
		unchecked 
		{
			int offset = 0;
			global::StringBuf buf = new global::StringBuf();
			do 
			{
				if (( offset >= s.Length )) 
				{
					break;
				}
				 else 
				{
					if ( ! (this.matchSub(s, offset, default(global::haxe.lang.Null<int>))) ) 
					{
						buf.b.Append(global::Std.@string(global::haxe.lang.StringExt.substr(s, offset, default(global::haxe.lang.Null<int>))));
						break;
					}
					
				}
				
				object p = this.matchedPos();
				buf.b.Append(global::Std.@string(global::haxe.lang.StringExt.substr(s, offset, new global::haxe.lang.Null<int>(( ((int) (global::haxe.lang.Runtime.getField_f(p, "pos", 5594516, true)) ) - ((int) (offset) ) ), true))));
				buf.b.Append(global::Std.@string(global::haxe.lang.Runtime.toString(f.__hx_invoke1_o(default(double), this))));
				if (( ((int) (global::haxe.lang.Runtime.getField_f(p, "len", 5393365, true)) ) == 0 )) 
				{
					buf.b.Append(global::Std.@string(global::haxe.lang.StringExt.substr(s, ((int) (global::haxe.lang.Runtime.getField_f(p, "pos", 5594516, true)) ), new global::haxe.lang.Null<int>(1, true))));
					offset = ( ((int) (global::haxe.lang.Runtime.getField_f(p, "pos", 5594516, true)) ) + 1 );
				}
				 else 
				{
					offset = ( ((int) (global::haxe.lang.Runtime.getField_f(p, "pos", 5594516, true)) ) + ((int) (global::haxe.lang.Runtime.getField_f(p, "len", 5393365, true)) ) );
				}
				
			}
			while (this.isGlobal);
			if ((  ! (this.isGlobal)  && ( offset < s.Length ) )) 
			{
				buf.b.Append(global::Std.@string(global::haxe.lang.StringExt.substr(s, offset, default(global::haxe.lang.Null<int>))));
			}
			
			return buf.toString();
		}
	}
	
	
	public virtual   string replace(string s, string @by)
	{
		unchecked 
		{
			if (this.isGlobal) 
			{
				return this.regex.Replace(s, @by);
			}
			
			global::System.Text.RegularExpressions.Match m = this.regex.Match(s);
			return global::haxe.lang.Runtime.concat(global::haxe.lang.Runtime.concat(s.Substring(0, m.Index), @by), s.Substring(( m.Index + m.Length )));
		}
	}
	
	
	public virtual   global::Array<object> split(string s)
	{
		unchecked 
		{
			if (this.isGlobal) 
			{
				return global::cs.Lib.array<object>(((object[]) (this.regex.Split(s)) ));
			}
			
			global::System.Text.RegularExpressions.Match m = this.regex.Match(s);
			return new global::Array<object>(new object[]{s.Substring(0, m.Index), s.Substring(( m.Index + m.Length ))});
		}
	}
	
	
	public virtual   bool matchSub(string s, int pos, global::haxe.lang.Null<int> __temp_len6)
	{
		unchecked 
		{
			int len = ( ( ! (__temp_len6.hasValue) ) ? (((int) (-1) )) : (__temp_len6.@value) );
			string s2 = ( (( len < 0 )) ? (global::haxe.lang.StringExt.substr(s, pos, default(global::haxe.lang.Null<int>))) : (global::haxe.lang.StringExt.substr(s, pos, new global::haxe.lang.Null<int>(len, true))) );
			this.sub = pos;
			this.m = this.regex.Match(s2);
			this.cur = s;
			return this.m.Success;
		}
	}
	
	
	public virtual   object matchedPos()
	{
		unchecked 
		{
			return new global::haxe.lang.DynamicObject(new global::Array<int>(new int[]{}), new global::Array<object>(new object[]{}), new global::Array<int>(new int[]{5393365, 5594516}), new global::Array<double>(new double[]{((double) (this.m.Length) ), ((double) (( this.sub + this.m.Index )) )}));
		}
	}
	
	
	public virtual   string matchedRight()
	{
		unchecked 
		{
			return this.cur.Substring(( ( this.sub + this.m.Index ) + this.m.Length ));
		}
	}
	
	
	public virtual   string matchedLeft()
	{
		unchecked 
		{
			return this.cur.Substring(0, ( this.sub + this.m.Index ));
		}
	}
	
	
	public virtual   string matched(int n)
	{
		unchecked 
		{
			if (( ( this.m == default(global::System.Text.RegularExpressions.Match) ) || ( ((uint) (n) ) > this.m.Groups.Count ) )) 
			{
				throw global::haxe.lang.HaxeException.wrap("EReg::matched");
			}
			
			return this.m.Groups[n].Value;
		}
	}
	
	
	public virtual   bool match(string s)
	{
		unchecked 
		{
			this.sub = 0;
			this.m = this.regex.Match(s);
			this.cur = s;
			return this.m.Success;
		}
	}
	
	
	public  int sub;
	
	public  string cur;
	
	public  bool isGlobal;
	
	public  global::System.Text.RegularExpressions.Match m;
	
	public  global::System.Text.RegularExpressions.Regex regex;
	
	public override   double __hx_setField_f(string field, int hash, double @value, bool handleProperties)
	{
		unchecked 
		{
			switch (hash)
			{
				case 5745024:
				{
					this.sub = ((int) (@value) );
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
				case 1723805383:
				{
					this.regex = ((global::System.Text.RegularExpressions.Regex) (@value) );
					return @value;
				}
				
				
				case 109:
				{
					this.m = ((global::System.Text.RegularExpressions.Match) (@value) );
					return @value;
				}
				
				
				case 1821933:
				{
					this.isGlobal = ((bool) (@value) );
					return @value;
				}
				
				
				case 4949376:
				{
					this.cur = global::haxe.lang.Runtime.toString(@value);
					return @value;
				}
				
				
				case 5745024:
				{
					this.sub = ((int) (global::haxe.lang.Runtime.toInt(@value)) );
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
				case 1723805383:
				{
					return this.regex;
				}
				
				
				case 109:
				{
					return this.m;
				}
				
				
				case 1821933:
				{
					return this.isGlobal;
				}
				
				
				case 4949376:
				{
					return this.cur;
				}
				
				
				case 5745024:
				{
					return this.sub;
				}
				
				
				case 52644165:
				{
					return new global::haxe.lang.Closure(this, "match", 52644165);
				}
				
				
				case 159136996:
				{
					return new global::haxe.lang.Closure(this, "matched", 159136996);
				}
				
				
				case 2083500811:
				{
					return new global::haxe.lang.Closure(this, "matchedLeft", 2083500811);
				}
				
				
				case 614073432:
				{
					return new global::haxe.lang.Closure(this, "matchedRight", 614073432);
				}
				
				
				case 1271070480:
				{
					return new global::haxe.lang.Closure(this, "matchedPos", 1271070480);
				}
				
				
				case 1126920507:
				{
					return new global::haxe.lang.Closure(this, "matchSub", 1126920507);
				}
				
				
				case 24046298:
				{
					return new global::haxe.lang.Closure(this, "split", 24046298);
				}
				
				
				case 724060212:
				{
					return new global::haxe.lang.Closure(this, "replace", 724060212);
				}
				
				
				case 5442204:
				{
					return new global::haxe.lang.Closure(this, "map", 5442204);
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
				case 5745024:
				{
					return ((double) (this.sub) );
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
				case 52644165:
				{
					return this.match(global::haxe.lang.Runtime.toString(dynargs[0]));
				}
				
				
				case 159136996:
				{
					return this.matched(((int) (global::haxe.lang.Runtime.toInt(dynargs[0])) ));
				}
				
				
				case 2083500811:
				{
					return this.matchedLeft();
				}
				
				
				case 614073432:
				{
					return this.matchedRight();
				}
				
				
				case 1271070480:
				{
					return this.matchedPos();
				}
				
				
				case 1126920507:
				{
					return this.matchSub(global::haxe.lang.Runtime.toString(dynargs[0]), ((int) (global::haxe.lang.Runtime.toInt(dynargs[1])) ), global::haxe.lang.Null<object>.ofDynamic<int>(dynargs[2]));
				}
				
				
				case 24046298:
				{
					return this.split(global::haxe.lang.Runtime.toString(dynargs[0]));
				}
				
				
				case 724060212:
				{
					return this.replace(global::haxe.lang.Runtime.toString(dynargs[0]), global::haxe.lang.Runtime.toString(dynargs[1]));
				}
				
				
				case 5442204:
				{
					return this.map(global::haxe.lang.Runtime.toString(dynargs[0]), ((global::haxe.lang.Function) (dynargs[1]) ));
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
			baseArr.push("regex");
			baseArr.push("m");
			baseArr.push("isGlobal");
			baseArr.push("cur");
			baseArr.push("sub");
			{
				base.__hx_getFields(baseArr);
			}
			
		}
	}
	
	
}


