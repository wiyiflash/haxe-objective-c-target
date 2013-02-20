
public  class Hash<T> : global::haxe.lang.HxObject, global::Hash 
{
	public    Hash() : base()
	{
		unchecked 
		{
			global::Hash<object>.__hx_ctor<T>(this);
		}
	}
	
	
	public static   void __hx_ctor<T2>(global::Hash<T2> __temp_me11)
	{
		unchecked 
		{
			__temp_me11.cachedIndex = -1;
		}
	}
	
	
	public static  new object __hx_createEmpty()
	{
		unchecked 
		{
			return new global::Hash<object>(global::haxe.lang.EmptyObject.EMPTY);
		}
	}
	
	
	public static  new object __hx_create(global::Array arr)
	{
		unchecked 
		{
			return new global::Hash<object>();
		}
	}
	
	
	public    Hash(global::haxe.lang.EmptyObject empty) : base()
	{
		unchecked 
		{
		}
	}
	
	
	   object Hash.cast<T1>()
	{
		unchecked 
		{
			if (global::haxe.lang.Runtime.eq(typeof(T), typeof(T1))) 
			{
				return this;
			}
			
			global::Hash<T1> new_me = new global::Hash<T1>(global::haxe.lang.EmptyObject.EMPTY);
			{
				object __temp_iterator35 = global::Reflect.fields(this).iterator();
				while (((bool) (global::haxe.lang.Runtime.callField(__temp_iterator35, "hasNext", 407283053, default(global::Array))) ))
				{
					string field = global::haxe.lang.Runtime.toString(global::haxe.lang.Runtime.callField(__temp_iterator35, "next", 1224901875, default(global::Array)));
					switch (field)
					{
						case "vals":
						{
							{
								T1[] __temp_new_arr8 = new T1[this.vals.Length];
								int __temp_i9 = -1;
								while ((  ++ __temp_i9 < this.vals.Length ))
								{
									object __temp_obj10 = ((object) (this.vals[__temp_i9]) );
									if ( ! (( __temp_obj10 == default(T[]) )) ) 
									{
										__temp_new_arr8[__temp_i9] = global::haxe.lang.Runtime.genericCast<T1>(__temp_obj10);
									}
									
								}
								
								new_me.vals = __temp_new_arr8;
							}
							
							break;
						}
						
						
						default:
						{
							global::Reflect.setField(new_me, field, ((object) (global::Reflect.field(this, field)) ));
							break;
						}
						
					}
					
				}
				
			}
			
			return new_me;
		}
	}
	
	
	public virtual   string toString()
	{
		unchecked 
		{
			global::StringBuf s = new global::StringBuf();
			s.b.Append("{");
			object it = this.keys();
			{
				object __temp_iterator36 = it;
				while (((bool) (global::haxe.lang.Runtime.callField(__temp_iterator36, "hasNext", 407283053, default(global::Array))) ))
				{
					string i = global::haxe.lang.Runtime.toString(global::haxe.lang.Runtime.callField(__temp_iterator36, "next", 1224901875, default(global::Array)));
					s.b.Append(global::Std.@string(i));
					s.b.Append(" => ");
					s.b.Append(global::Std.@string(global::Std.@string((this.@get(i)).toDynamic())));
					if (((bool) (global::haxe.lang.Runtime.callField(it, "hasNext", 407283053, default(global::Array))) )) 
					{
						s.b.Append(", ");
					}
					
				}
				
			}
			
			s.b.Append("}");
			return s.toString();
		}
	}
	
	
	public virtual   object iterator()
	{
		unchecked 
		{
			global::Array<object> _g1 = new global::Array<object>(new object[]{this});
			global::Array<int> i = new global::Array<int>(new int[]{0});
			global::Array<int> len = new global::Array<int>(new int[]{this.nBuckets});
			{
				global::haxe.lang.Function __temp_odecl50 = new global::Fun_355744e8<T>(i, len, _g1);
				global::haxe.lang.Function __temp_odecl51 = new global::Fun_b691e737<T>(_g1, i);
				return new global::haxe.lang.DynamicObject(new global::Array<int>(new int[]{407283053, 1224901875}), new global::Array<object>(new object[]{__temp_odecl50, __temp_odecl51}), new global::Array<int>(new int[]{}), new global::Array<double>(new double[]{}));
			}
			
		}
	}
	
	
	public virtual   object keys()
	{
		unchecked 
		{
			global::Array<object> _g1 = new global::Array<object>(new object[]{this});
			global::Array<int> i = new global::Array<int>(new int[]{0});
			global::Array<int> len = new global::Array<int>(new int[]{this.nBuckets});
			{
				global::haxe.lang.Function __temp_odecl52 = new global::Fun_0559788f<T>(i, len, _g1);
				global::haxe.lang.Function __temp_odecl53 = new global::Fun_4a4cdb9e<T>(_g1, i);
				return new global::haxe.lang.DynamicObject(new global::Array<int>(new int[]{407283053, 1224901875}), new global::Array<object>(new object[]{__temp_odecl52, __temp_odecl53}), new global::Array<int>(new int[]{}), new global::Array<double>(new double[]{}));
			}
			
		}
	}
	
	
	public virtual   bool @remove(string key)
	{
		unchecked 
		{
			int idx = -1;
			if ( ! ((( string.Equals(this.cachedKey, key) && ( (idx = this.cachedIndex) != -1 ) ))) ) 
			{
				idx = this.lookup(key);
			}
			
			if (( idx == -1 )) 
			{
				return false;
			}
			 else 
			{
				if (string.Equals(this.cachedKey, key)) 
				{
					this.cachedIndex = -1;
				}
				
				this.hashes[idx] = 0;
				this._keys[idx] = default(string);
				this.vals[idx] = default(T);
				 -- this.size;
				return true;
			}
			
		}
	}
	
	
	public virtual   bool exists(string key)
	{
		unchecked 
		{
			int idx = -1;
			if (( string.Equals(this.cachedKey, key) && ( (idx = this.cachedIndex) != -1 ) )) 
			{
				return true;
			}
			
			idx = this.lookup(key);
			if (( idx != -1 )) 
			{
				this.cachedKey = key;
				this.cachedIndex = idx;
				return true;
			}
			
			return false;
		}
	}
	
	
	public virtual   global::haxe.lang.Null<T> @get(string key)
	{
		unchecked 
		{
			int idx = -1;
			if (( string.Equals(this.cachedKey, key) && ( (idx = this.cachedIndex) != -1 ) )) 
			{
				return new global::haxe.lang.Null<T>(this.vals[idx], true);
			}
			
			idx = this.lookup(key);
			if (( idx != -1 )) 
			{
				this.cachedKey = key;
				this.cachedIndex = idx;
				return new global::haxe.lang.Null<T>(this.vals[idx], true);
			}
			
			return default(global::haxe.lang.Null<T>);
		}
	}
	
	
	public   void resize(int newNBuckets)
	{
		unchecked 
		{
			int[] newHash = default(int[]);
			int j = 1;
			{
				{
					int x = newNBuckets;
					 -- x;
					x |= ((int) (( ((uint) (x) ) >> 1 )) );
					x |= ((int) (( ((uint) (x) ) >> 2 )) );
					x |= ((int) (( ((uint) (x) ) >> 4 )) );
					x |= ((int) (( ((uint) (x) ) >> 8 )) );
					x |= ((int) (( ((uint) (x) ) >> 16 )) );
					newNBuckets =  ++ x;
				}
				
				if (( newNBuckets < 4 )) 
				{
					newNBuckets = 4;
				}
				
				if (( this.size >= ( ( newNBuckets * 0.77 ) + 0.5 ) )) 
				{
					j = 0;
				}
				 else 
				{
					int nfSize = newNBuckets;
					newHash = new int[nfSize];
					if (( this.nBuckets < newNBuckets )) 
					{
						string[] k = new string[newNBuckets];
						if (( this._keys != default(string[]) )) 
						{
							global::System.Array.Copy(this._keys, 0, k, 0, this.nBuckets);
						}
						
						this._keys = k;
						T[] v = new T[newNBuckets];
						if (( this.vals != default(T[]) )) 
						{
							global::System.Array.Copy(this.vals, 0, v, 0, this.nBuckets);
						}
						
						this.vals = v;
					}
					
				}
				
			}
			
			if (( j != 0 )) 
			{
				this.cachedKey = default(string);
				this.cachedIndex = -1;
				j = -1;
				int nBuckets = this.nBuckets;
				string[] _keys = this._keys;
				T[] vals = this.vals;
				int[] hashes = this.hashes;
				int newMask = ( newNBuckets - 1 );
				while ((  ++ j < nBuckets ))
				{
					int k1;
					if ( ! ((( (( (k1 = hashes[j]) & -2 )) == 0 ))) ) 
					{
						string key = _keys[j];
						T val = vals[j];
						hashes[j] = 1;
						while (true)
						{
							int nProbes = 0;
							int i = ( k1 & newMask );
							while ( ! ((( newHash[i] == 0 ))) )
							{
								i = ( ( i +  ++ nProbes ) & newMask );
							}
							
							newHash[i] = k1;
							if (( ( i < nBuckets ) &&  ! ((( (( (k1 = hashes[i]) & -2 )) == 0 )))  )) 
							{
								{
									string tmp = _keys[i];
									_keys[i] = key;
									key = tmp;
								}
								
								{
									T tmp1 = vals[i];
									vals[i] = val;
									val = tmp1;
								}
								
								hashes[i] = 1;
							}
							 else 
							{
								_keys[i] = key;
								vals[i] = val;
								break;
							}
							
						}
						
					}
					
				}
				
				if (( nBuckets > newNBuckets )) 
				{
					{
						string[] k2 = new string[newNBuckets];
						global::System.Array.Copy(_keys, 0, k2, 0, newNBuckets);
						this._keys = k2;
					}
					
					{
						T[] v1 = new T[newNBuckets];
						global::System.Array.Copy(vals, 0, v1, 0, newNBuckets);
						this.vals = v1;
					}
					
				}
				
				this.hashes = newHash;
				this.nBuckets = newNBuckets;
				this.nOccupied = this.size;
				this.upperBound = ((int) (( ( newNBuckets * 0.77 ) + .5 )) );
			}
			
		}
	}
	
	
	public   int lookup(string key)
	{
		unchecked 
		{
			if (( this.nBuckets != 0 )) 
			{
				int[] hashes = this.hashes;
				string[] keys = this._keys;
				int mask = ( this.nBuckets - 1 );
				int hash = default(int);
				{
					int k = key.GetHashCode();
					k = ( ( k + 2127912214 ) + (( k << 12 )) );
					k = ( ( k ^ -949894596 ) ^ ( k >> 19 ) );
					k = ( ( k + 374761393 ) + (( k << 5 )) );
					k = ( ( k + -744332180 ) ^ ( k << 9 ) );
					k = ( ( k + -42973499 ) + (( k << 3 )) );
					k = ( ( k ^ -1252372727 ) ^ ( k >> 16 ) );
					int ret = k;
					if (( (( ret & -2 )) == 0 )) 
					{
						if (( ret == 0 )) 
						{
							ret = 2;
						}
						 else 
						{
							ret = -1;
						}
						
					}
					
					hash = ret;
				}
				
				int k1 = hash;
				int nProbes = 0;
				int i = ( k1 & mask );
				int last = i;
				int flag;
				while ((  ! ((( (flag = hashes[i]) == 0 )))  && (( ( ( flag == 1 ) || ( flag != k1 ) ) ||  ! (string.Equals(keys[i], key))  )) ))
				{
					i = ( ( i +  ++ nProbes ) & mask );
				}
				
				return ( (( (( flag & -2 )) == 0 )) ? (-1) : (i) );
			}
			
			return -1;
		}
	}
	
	
	public virtual   void @set(string key, T @value)
	{
		unchecked 
		{
			int x;
			int k;
			if (( this.nOccupied >= this.upperBound )) 
			{
				if (( this.nBuckets > ( this.size << 1 ) )) 
				{
					this.resize(( this.nBuckets - 1 ));
				}
				 else 
				{
					this.resize(( this.nBuckets + 2 ));
				}
				
			}
			
			int[] hashes = this.hashes;
			string[] keys = this._keys;
			int[] hashes1 = hashes;
			{
				int mask = ( (( this.nBuckets == 0 )) ? (0) : (( this.nBuckets - 1 )) );
				int site = x = this.nBuckets;
				{
					int k1 = key.GetHashCode();
					k1 = ( ( k1 + 2127912214 ) + (( k1 << 12 )) );
					k1 = ( ( k1 ^ -949894596 ) ^ ( k1 >> 19 ) );
					k1 = ( ( k1 + 374761393 ) + (( k1 << 5 )) );
					k1 = ( ( k1 + -744332180 ) ^ ( k1 << 9 ) );
					k1 = ( ( k1 + -42973499 ) + (( k1 << 3 )) );
					k1 = ( ( k1 ^ -1252372727 ) ^ ( k1 >> 16 ) );
					int ret = k1;
					if (( (( ret & -2 )) == 0 )) 
					{
						if (( ret == 0 )) 
						{
							ret = 2;
						}
						 else 
						{
							ret = -1;
						}
						
					}
					
					k = ret;
				}
				
				int i = ( k & mask );
				int nProbes = 0;
				if (( (( hashes1[i] & -2 )) == 0 )) 
				{
					x = i;
				}
				 else 
				{
					int last = i;
					int flag;
					while ( ! ((( ( (( (flag = hashes1[i]) & -2 )) == 0 ) || ( ( flag == k ) && string.Equals(this._keys[i], key) ) ))) )
					{
						i = ( ( i +  ++ nProbes ) & mask );
					}
					
					x = i;
				}
				
			}
			
			int flag1 = hashes1[x];
			if (( flag1 == 0 )) 
			{
				keys[x] = key;
				this.vals[x] = @value;
				hashes1[x] = k;
				this.size++;
				this.nOccupied++;
			}
			 else 
			{
				if (( flag1 == 1 )) 
				{
					keys[x] = key;
					this.vals[x] = @value;
					hashes1[x] = k;
					this.size++;
				}
				 else 
				{
					this.vals[x] = @value;
				}
				
			}
			
			this.cachedIndex = x;
			this.cachedKey = key;
		}
	}
	
	
	public  int cachedIndex;
	
	public  string cachedKey;
	
	public  int upperBound;
	
	public  int nOccupied;
	
	public  int size;
	
	public  int nBuckets;
	
	public  T[] vals;
	
	public  string[] _keys;
	
	public  int[] hashes;
	
	public override   double __hx_setField_f(string field, int hash, double @value, bool handleProperties)
	{
		unchecked 
		{
			switch (hash)
			{
				case 1537812987:
				{
					this.nBuckets = ((int) (@value) );
					return @value;
				}
				
				
				case 1280549057:
				{
					this.size = ((int) (@value) );
					return @value;
				}
				
				
				case 480756972:
				{
					this.nOccupied = ((int) (@value) );
					return @value;
				}
				
				
				case 2022294396:
				{
					this.upperBound = ((int) (@value) );
					return @value;
				}
				
				
				case 922671056:
				{
					this.cachedIndex = ((int) (@value) );
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
				case 995006396:
				{
					this.hashes = ((int[]) (@value) );
					return @value;
				}
				
				
				case 2048392659:
				{
					this._keys = ((string[]) (@value) );
					return @value;
				}
				
				
				case 1313416818:
				{
					this.vals = ((T[]) (@value) );
					return @value;
				}
				
				
				case 1537812987:
				{
					this.nBuckets = ((int) (global::haxe.lang.Runtime.toInt(@value)) );
					return @value;
				}
				
				
				case 1280549057:
				{
					this.size = ((int) (global::haxe.lang.Runtime.toInt(@value)) );
					return @value;
				}
				
				
				case 480756972:
				{
					this.nOccupied = ((int) (global::haxe.lang.Runtime.toInt(@value)) );
					return @value;
				}
				
				
				case 2022294396:
				{
					this.upperBound = ((int) (global::haxe.lang.Runtime.toInt(@value)) );
					return @value;
				}
				
				
				case 1395555037:
				{
					this.cachedKey = global::haxe.lang.Runtime.toString(@value);
					return @value;
				}
				
				
				case 922671056:
				{
					this.cachedIndex = ((int) (global::haxe.lang.Runtime.toInt(@value)) );
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
				case 995006396:
				{
					return this.hashes;
				}
				
				
				case 2048392659:
				{
					return this._keys;
				}
				
				
				case 1313416818:
				{
					return this.vals;
				}
				
				
				case 1537812987:
				{
					return this.nBuckets;
				}
				
				
				case 1280549057:
				{
					return this.size;
				}
				
				
				case 480756972:
				{
					return this.nOccupied;
				}
				
				
				case 2022294396:
				{
					return this.upperBound;
				}
				
				
				case 1395555037:
				{
					return this.cachedKey;
				}
				
				
				case 922671056:
				{
					return this.cachedIndex;
				}
				
				
				case 5741474:
				{
					return new global::haxe.lang.Closure(this, "set", 5741474);
				}
				
				
				case 1639293562:
				{
					return new global::haxe.lang.Closure(this, "lookup", 1639293562);
				}
				
				
				case 142301684:
				{
					return new global::haxe.lang.Closure(this, "resize", 142301684);
				}
				
				
				case 5144726:
				{
					return new global::haxe.lang.Closure(this, "get", 5144726);
				}
				
				
				case 1071652316:
				{
					return new global::haxe.lang.Closure(this, "exists", 1071652316);
				}
				
				
				case 76061764:
				{
					return new global::haxe.lang.Closure(this, "remove", 76061764);
				}
				
				
				case 1191633396:
				{
					return new global::haxe.lang.Closure(this, "keys", 1191633396);
				}
				
				
				case 328878574:
				{
					return new global::haxe.lang.Closure(this, "iterator", 328878574);
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
	
	
	public override   double __hx_getField_f(string field, int hash, bool throwErrors, bool handleProperties)
	{
		unchecked 
		{
			switch (hash)
			{
				case 1537812987:
				{
					return ((double) (this.nBuckets) );
				}
				
				
				case 1280549057:
				{
					return ((double) (this.size) );
				}
				
				
				case 480756972:
				{
					return ((double) (this.nOccupied) );
				}
				
				
				case 2022294396:
				{
					return ((double) (this.upperBound) );
				}
				
				
				case 922671056:
				{
					return ((double) (this.cachedIndex) );
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
				case 5741474:
				{
					this.@set(global::haxe.lang.Runtime.toString(dynargs[0]), global::haxe.lang.Runtime.genericCast<T>(dynargs[1]));
					break;
				}
				
				
				case 1639293562:
				{
					return this.lookup(global::haxe.lang.Runtime.toString(dynargs[0]));
				}
				
				
				case 142301684:
				{
					this.resize(((int) (global::haxe.lang.Runtime.toInt(dynargs[0])) ));
					break;
				}
				
				
				case 5144726:
				{
					return (this.@get(global::haxe.lang.Runtime.toString(dynargs[0]))).toDynamic();
				}
				
				
				case 1071652316:
				{
					return this.exists(global::haxe.lang.Runtime.toString(dynargs[0]));
				}
				
				
				case 76061764:
				{
					return this.@remove(global::haxe.lang.Runtime.toString(dynargs[0]));
				}
				
				
				case 1191633396:
				{
					return this.keys();
				}
				
				
				case 328878574:
				{
					return this.iterator();
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
			baseArr.push("hashes");
			baseArr.push("_keys");
			baseArr.push("vals");
			baseArr.push("nBuckets");
			baseArr.push("size");
			baseArr.push("nOccupied");
			baseArr.push("upperBound");
			baseArr.push("cachedKey");
			baseArr.push("cachedIndex");
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



public  class Fun_355744e8<T> : global::haxe.lang.Function 
{
	public    Fun_355744e8(global::Array<int> i, global::Array<int> len, global::Array<object> _g1) : base(0, 0)
	{
		unchecked 
		{
			this.i = i;
			this.len = len;
			this._g1 = _g1;
		}
	}
	
	
	public override   object __hx_invoke0_o()
	{
		unchecked 
		{
			{
				int _g = this.i[0];
				while (( _g < ((int) (this.len[0]) ) ))
				{
					int j = _g++;
					if ( ! ((( (( ((global::Hash<T>) (((global::Hash) (this._g1[0]) ).cast<T>()) ).hashes[j] & -2 )) == 0 ))) ) 
					{
						this.i[0] = j;
						return true;
					}
					
				}
				
			}
			
			return false;
		}
	}
	
	
	public  global::Array<int> i;
	
	public  global::Array<int> len;
	
	public  global::Array<object> _g1;
	
}



public  class Fun_b691e737<T> : global::haxe.lang.Function 
{
	public    Fun_b691e737(global::Array<object> _g1, global::Array<int> i) : base(0, 0)
	{
		unchecked 
		{
			this._g1 = _g1;
			this.i = i;
		}
	}
	
	
	public override   object __hx_invoke0_o()
	{
		unchecked 
		{
			T ret = ((global::Hash<T>) (((global::Hash) (this._g1[0]) ).cast<T>()) ).vals[this.i[0]];
			this.i[0] = ( this.i[0] + 1 );
			return ret;
		}
	}
	
	
	public  global::Array<object> _g1;
	
	public  global::Array<int> i;
	
}



public  class Fun_0559788f<T> : global::haxe.lang.Function 
{
	public    Fun_0559788f(global::Array<int> i, global::Array<int> len, global::Array<object> _g1) : base(0, 0)
	{
		unchecked 
		{
			this.i = i;
			this.len = len;
			this._g1 = _g1;
		}
	}
	
	
	public override   object __hx_invoke0_o()
	{
		unchecked 
		{
			{
				int _g = this.i[0];
				while (( _g < ((int) (this.len[0]) ) ))
				{
					int j = _g++;
					if ( ! ((( (( ((global::Hash<T>) (((global::Hash) (this._g1[0]) ).cast<T>()) ).hashes[j] & -2 )) == 0 ))) ) 
					{
						this.i[0] = j;
						return true;
					}
					
				}
				
			}
			
			return false;
		}
	}
	
	
	public  global::Array<int> i;
	
	public  global::Array<int> len;
	
	public  global::Array<object> _g1;
	
}



public  class Fun_4a4cdb9e<T> : global::haxe.lang.Function 
{
	public    Fun_4a4cdb9e(global::Array<object> _g1, global::Array<int> i) : base(0, 0)
	{
		unchecked 
		{
			this._g1 = _g1;
			this.i = i;
		}
	}
	
	
	public override   object __hx_invoke0_o()
	{
		unchecked 
		{
			string ret = ((global::Hash<T>) (((global::Hash) (this._g1[0]) ).cast<T>()) )._keys[this.i[0]];
			((global::Hash<T>) (((global::Hash) (this._g1[0]) ).cast<T>()) ).cachedIndex = this.i[0];
			((global::Hash<T>) (((global::Hash) (this._g1[0]) ).cast<T>()) ).cachedKey = ret;
			this.i[0] = ( this.i[0] + 1 );
			return ret;
		}
	}
	
	
	public  global::Array<object> _g1;
	
	public  global::Array<int> i;
	
}



public  interface Hash : global::haxe.lang.IHxObject, global::haxe.lang.IGenericObject 
{
	   object cast<T1>();
	
}


