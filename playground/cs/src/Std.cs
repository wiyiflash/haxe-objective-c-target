
public  class Std 
{
	public static   bool @is(object v, object t)
	{
		unchecked 
		{
			if (( v == default(object) )) 
			{
				return global::haxe.lang.Runtime.eq(t, typeof(object));
			}
			
			if (( t == default(object) )) 
			{
				return false;
			}
			
			global::System.Type clt = ((global::System.Type) (t) );
			if (global::haxe.lang.Runtime.typeEq(clt, default(global::System.Type))) 
			{
				return false;
			}
			
			string name = global::haxe.lang.Runtime.toString(clt);
			switch (name)
			{
				case "System.Double":
				{
					return v is double || v is int;
				}
				
				
				case "System.Int32":
				{
					return haxe.lang.Runtime.isInt(v);
				}
				
				
				case "System.Boolean":
				{
					return v is bool;
				}
				
				
				case "System.Object":
				{
					return true;
				}
				
				
			}
			
			global::System.Type clv = v.GetType();
			return clt.IsAssignableFrom(clv);
		}
	}
	
	
	public static   string @string(object s)
	{
		unchecked 
		{
			if (( s == default(object) )) 
			{
				return "null";
			}
			
			if (( s is bool )) 
			{
				return ( (((bool) (s) )) ? ("true") : ("false") );
			}
			
			return global::haxe.lang.Runtime.toString(s.ToString());
		}
	}
	
	
	public static   global::haxe.lang.Null<int> parseInt(string x)
	{
		unchecked 
		{
			if (string.Equals(x, default(string))) 
			{
				return default(global::haxe.lang.Null<int>);
			}
			
			int ret = 0;
			int @base = 10;
			int i = -1;
			int len = x.Length;
			if (( x.StartsWith("0") && ( len > 2 ) )) 
			{
				int c = ((int) (global::haxe.lang.Runtime.toInt(x[1])) );
				if (( ( c == 120 ) || ( c == 88 ) )) 
				{
					i = 1;
					@base = 16;
				}
				
			}
			
			bool foundAny = false;
			bool isNeg = false;
			while ((  ++ i < len ))
			{
				int c1 = ((int) (global::haxe.lang.Runtime.toInt(x[i])) );
				if ( ! (foundAny) ) 
				{
					switch (c1)
					{
						case 45:
						{
							isNeg = true;
							continue;
						}
						
						
						case 32:case 9:case 10:case 13:
						{
							if (isNeg) 
							{
								return default(global::haxe.lang.Null<int>);
							}
							
							continue;
						}
						
						
					}
					
				}
				
				if (( ( c1 >= 48 ) && ( c1 <= 57 ) )) 
				{
					if ((  ! (foundAny)  && ( c1 == 48 ) )) 
					{
						foundAny = true;
						continue;
					}
					
					ret *= @base;
					foundAny = true;
					ret += ( c1 - 48 );
				}
				 else 
				{
					if (( @base == 16 )) 
					{
						if (( ( c1 >= 97 ) && ( c1 <= 102 ) )) 
						{
							ret *= @base;
							foundAny = true;
							ret += ( ( c1 - 97 ) + 10 );
						}
						 else 
						{
							if (( ( c1 >= 65 ) && ( c1 <= 70 ) )) 
							{
								ret *= @base;
								foundAny = true;
								ret += ( ( c1 - 65 ) + 10 );
							}
							 else 
							{
								break;
							}
							
						}
						
					}
					 else 
					{
						break;
					}
					
				}
				
			}
			
			if (foundAny) 
			{
				return new global::haxe.lang.Null<int>(( (isNeg) ? ( - (ret) ) : (ret) ), true);
			}
			 else 
			{
				return default(global::haxe.lang.Null<int>);
			}
			
		}
	}
	
	
	public static   double parseFloat(string x)
	{
		unchecked 
		{
			if (string.Equals(x, default(string))) 
			{
				return global::Math.NaN;
			}
			
			x = x.TrimStart();
			double ret = 0.0;
			double div = 0.0;
			double e = 0.0;
			int len = x.Length;
			bool foundAny = false;
			bool isNeg = false;
			int i = -1;
			while ((  ++ i < len ))
			{
				int c = ((int) (global::haxe.lang.Runtime.toInt(x[i])) );
				if ( ! (foundAny) ) 
				{
					switch (c)
					{
						case 45:
						{
							isNeg = true;
							continue;
						}
						
						
						case 32:case 9:case 10:case 13:
						{
							if (isNeg) 
							{
								return global::Math.NaN;
							}
							
							continue;
						}
						
						
					}
					
				}
				
				if (( c == 46 )) 
				{
					if (( div != 0.0 )) 
					{
						break;
					}
					
					div = 1.0;
					continue;
				}
				
				if (( ( c >= 48 ) && ( c <= 57 ) )) 
				{
					if ((  ! (foundAny)  && ( c == 48 ) )) 
					{
						foundAny = true;
						continue;
					}
					
					ret *= ((double) (10) );
					foundAny = true;
					div *= ((double) (10) );
					ret += ((double) (( c - 48 )) );
				}
				 else 
				{
					if (( foundAny && (( ( c == 101 ) || ( c == 69 ) )) )) 
					{
						bool eNeg = false;
						bool eFoundAny = false;
						if (( ( i + 1 ) < len )) 
						{
							int next = ((int) (x[( i + 1 )]) );
							if (( next == 45 )) 
							{
								eNeg = true;
								i++;
							}
							 else 
							{
								if (( next == 43 )) 
								{
									i++;
								}
								
							}
							
						}
						
						while ((  ++ i < len ))
						{
							c = ((int) (x[i]) );
							if (( ( c >= 48 ) && ( c <= 57 ) )) 
							{
								if ((  ! (eFoundAny)  && ( c == 48 ) )) 
								{
									continue;
								}
								
								eFoundAny = true;
								e *= ((double) (10) );
								e += ((double) (( c - 48 )) );
							}
							 else 
							{
								break;
							}
							
						}
						
						if (eNeg) 
						{
							e =  - (e) ;
						}
						
					}
					 else 
					{
						break;
					}
					
				}
				
			}
			
			if (( div == 0.0 )) 
			{
				div = 1.0;
			}
			
			if (foundAny) 
			{
				ret = ( (isNeg) ? ( - ((( ret / div ))) ) : (( ret / div )) );
				if (( e != 0.0 )) 
				{
					return ( ret * global::System.Math.Pow(10.0, e) );
				}
				 else 
				{
					return ret;
				}
				
			}
			 else 
			{
				return global::Math.NaN;
			}
			
		}
	}
	
	
	public static   int random(int x)
	{
		unchecked 
		{
			if (( x <= 0 )) 
			{
				return 0;
			}
			
			return global::Math.rand.Next(x);
		}
	}
	
	
}


