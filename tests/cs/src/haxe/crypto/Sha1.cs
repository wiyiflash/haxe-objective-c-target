
namespace haxe.crypto
{
	public  class Sha1 : global::haxe.lang.HxObject 
	{
		public    Sha1() : base()
		{
			unchecked 
			{
				global::haxe.crypto.Sha1.__hx_ctor(this);
			}
		}
		
		
		public static   void __hx_ctor(global::haxe.crypto.Sha1 __temp_me33)
		{
			unchecked 
			{
				{
				}
				
			}
		}
		
		
		public static   string encode(string s)
		{
			unchecked 
			{
				global::haxe.crypto.Sha1 sh = new global::haxe.crypto.Sha1();
				global::Array<int> h = sh.doEncode(global::haxe.crypto.Sha1.str2blks(s));
				return sh.hex(h);
			}
		}
		
		
		public static   global::Array<int> str2blks(string s)
		{
			unchecked 
			{
				int nblk = ( (( ( s.Length + 8 ) >> 6 )) + 1 );
				global::Array<int> blks = new global::Array<int>();
				{
					int _g1 = 0;
					int _g = ( nblk * 16 );
					while (( _g1 < _g ))
					{
						int i = _g1++;
						blks[i] = 0;
					}
					
				}
				
				{
					int _g11 = 0;
					int _g2 = s.Length;
					while (( _g11 < _g2 ))
					{
						int i1 = _g11++;
						int p = ( i1 >> 2 );
						blks[p] |= ( global::haxe.lang.StringExt.charCodeAt(s, i1).@value << ( 24 - (( (( i1 & 3 )) << 3 )) ) );
					}
					
				}
				
				int i2 = s.Length;
				int p1 = ( i2 >> 2 );
				blks[p1] |= ( 128 << ( 24 - (( (( i2 & 3 )) << 3 )) ) );
				blks[( ( nblk * 16 ) - 1 )] = ( s.Length * 8 );
				return blks;
			}
		}
		
		
		public static  new object __hx_createEmpty()
		{
			unchecked 
			{
				return new global::haxe.crypto.Sha1(global::haxe.lang.EmptyObject.EMPTY);
			}
		}
		
		
		public static  new object __hx_create(global::Array arr)
		{
			unchecked 
			{
				return new global::haxe.crypto.Sha1();
			}
		}
		
		
		public    Sha1(global::haxe.lang.EmptyObject empty) : base()
		{
			unchecked 
			{
			}
		}
		
		
		public virtual   string hex(global::Array<int> a)
		{
			unchecked 
			{
				string str = "";
				string hex_chr = "0123456789abcdef";
				{
					int _g = 0;
					while (( _g < a.length ))
					{
						int num = a[_g];
						 ++ _g;
						int j = 7;
						while (( j >= 0 ))
						{
							str = global::haxe.lang.Runtime.concat(str, global::haxe.lang.StringExt.charAt(hex_chr, ( ((int) (( ((uint) (num) ) >> (( j << 2 )) )) ) & 15 )));
							j--;
						}
						
					}
					
				}
				
				return str;
			}
		}
		
		
		public virtual   int kt(int t)
		{
			unchecked 
			{
				if (( t < 20 )) 
				{
					return 1518500249;
				}
				
				if (( t < 40 )) 
				{
					return 1859775393;
				}
				
				if (( t < 60 )) 
				{
					return -1894007588;
				}
				
				return -899497514;
			}
		}
		
		
		public virtual   int ft(int t, int b, int c, int d)
		{
			unchecked 
			{
				if (( t < 20 )) 
				{
					return ( ( b & c ) | (  ~ (b)  & d ) );
				}
				
				if (( t < 40 )) 
				{
					return ( ( b ^ c ) ^ d );
				}
				
				if (( t < 60 )) 
				{
					return ( ( ( b & c ) | ( b & d ) ) | ( c & d ) );
				}
				
				return ( ( b ^ c ) ^ d );
			}
		}
		
		
		public virtual   global::Array<int> doEncode(global::Array<int> x)
		{
			unchecked 
			{
				global::Array<int> w = new global::Array<int>();
				int a = 1732584193;
				int b = -271733879;
				int c = -1732584194;
				int d = 271733878;
				int e = -1009589776;
				int i = 0;
				while (( i < x.length ))
				{
					int olda = a;
					int oldb = b;
					int oldc = c;
					int oldd = d;
					int olde = e;
					int j = 0;
					while (( j < 80 ))
					{
						if (( j < 16 )) 
						{
							w[j] = x[( i + j )];
						}
						 else 
						{
							{
								int num = ( ( ( w[( j - 3 )] ^ w[( j - 8 )] ) ^ w[( j - 14 )] ) ^ w[( j - 16 )] );
								w[j] = ( ( num << 1 ) | ((int) (( ((uint) (num) ) >> 31 )) ) );
							}
							
						}
						
						int t = ( ( ( ( (( ( a << 5 ) | ((int) (( ((uint) (a) ) >> 27 )) ) )) + this.ft(j, b, c, d) ) + e ) + w[j] ) + this.kt(j) );
						e = d;
						d = c;
						c = ( ( b << 30 ) | ((int) (( ((uint) (b) ) >> 2 )) ) );
						b = a;
						a = t;
						j++;
					}
					
					a += olda;
					b += oldb;
					c += oldc;
					d += oldd;
					e += olde;
					i += 16;
				}
				
				return new global::Array<int>(new int[]{a, b, c, d, e});
			}
		}
		
		
		public override   object __hx_getField(string field, int hash, bool throwErrors, bool isCheck, bool handleProperties)
		{
			unchecked 
			{
				switch (hash)
				{
					case 234584065:
					{
						return new global::haxe.lang.Closure(this, "doEncode", 234584065);
					}
					
					
					case 22862:
					{
						return new global::haxe.lang.Closure(this, "ft", 22862);
					}
					
					
					case 23977:
					{
						return new global::haxe.lang.Closure(this, "kt", 23977);
					}
					
					
					case 5194459:
					{
						return new global::haxe.lang.Closure(this, "hex", 5194459);
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
					case 234584065:
					{
						return this.doEncode(((global::Array<int>) (((global::Array) (dynargs[0]) ).cast<int>()) ));
					}
					
					
					case 22862:
					{
						return this.ft(((int) (global::haxe.lang.Runtime.toInt(dynargs[0])) ), ((int) (global::haxe.lang.Runtime.toInt(dynargs[1])) ), ((int) (global::haxe.lang.Runtime.toInt(dynargs[2])) ), ((int) (global::haxe.lang.Runtime.toInt(dynargs[3])) ));
					}
					
					
					case 23977:
					{
						return this.kt(((int) (global::haxe.lang.Runtime.toInt(dynargs[0])) ));
					}
					
					
					case 5194459:
					{
						return this.hex(((global::Array<int>) (((global::Array) (dynargs[0]) ).cast<int>()) ));
					}
					
					
					default:
					{
						return base.__hx_invokeField(field, hash, dynargs);
					}
					
				}
				
			}
		}
		
		
	}
}


