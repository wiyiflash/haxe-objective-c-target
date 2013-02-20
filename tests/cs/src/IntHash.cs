
public  class IntHash<T> : global::haxe.lang.HxObject, global::IntHash 
{
	public    IntHash() : base()
	{
		unchecked 
		{
			global::IntHash<object>.__hx_ctor<T>(this);
		}
	}
	
	
	public static   void __hx_ctor<T2>(global::IntHash<T2> __temp_me15)
	{
		unchecked 
		{
			__temp_me15.cachedIndex = -1;
		}
	}
	
	
	public static  new object __hx_createEmpty()
	{
		unchecked 
		{
			return new global::IntHash<object>(global::haxe.lang.EmptyObject.EMPTY);
		}
	}
	
	
	public static  new object __hx_create(global::Array arr)
	{
		unchecked 
		{
			return new global::IntHash<object>();
		}
	}
	
	
	public    IntHash(global::haxe.lang.EmptyObject empty) : base()
	{
		unchecked 
		{
		}
	}
	
	
	   object IntHash.cast<T1>()
	{
		unchecked 
		{
			if (global::haxe.lang.Runtime.eq(typeof(T), typeof(T1))) 
			{
				return this;
			}
			
			global::IntHash<T1> new_me = new global::IntHash<T1>(global::haxe.lang.EmptyObject.EMPTY);
			{
				object __temp_iterator37 = global::Reflect.fields(this).iterator();
				while (((bool) (global::haxe.lang.Runtime.callField(__temp_iterator37, "hasNext", 407283053, default(global::Array))) ))
				{
					string field = global::haxe.lang.Runtime.toString(global::haxe.lang.Runtime.callField(__temp_iterator37, "next", 1224901875, default(global::Array)));
					switch (field)
					{
						case "vals":
						{
							{
								T1[] __temp_new_arr12 = new T1[this.vals.Length];
								int __temp_i13 = -1;
								while ((  ++ __temp_i13 < this.vals.Length ))
								{
									object __temp_obj14 = ((object) (this.vals[__temp_i13]) );
									if ( ! (( __temp_obj14 == default(T[]) )) ) 
									{
										__temp_new_arr12[__temp_i13] = global::haxe.lang.Runtime.genericCast<T1>(__temp_obj14);
									}
									
								}
								
								new_me.vals = __temp_new_arr12;
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
				object __temp_iterator38 = it;
				while (((bool) (global::haxe.lang.Runtime.callField(__temp_iterator38, "hasNext", 407283053, default(global::Array))) ))
				{
					int i = ((int) (global::haxe.lang.Runtime.toInt(global::haxe.lang.Runtime.callField(__temp_iterator38, "next", 1224901875, default(global::Array)))) );
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
				global::haxe.lang.Function __temp_odecl54 = new global::Fun_837ce278<T>(i, len, _g1);
				global::haxe.lang.Function __temp_odecl55 = new global::Fun_a250c005<T>(_g1, i);
				return new global::haxe.lang.DynamicObject(new global::Array<int>(new int[]{407283053, 1224901875}), new global::Array<object>(new object[]{__temp_odecl54, __temp_odecl55}), new global::Array<int>(new int[]{}), new global::Array<double>(new double[]{}));
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
				global::haxe.lang.Function __temp_odecl56 = new global::Fun_f353a146<T>(i, len, _g1);
				global::haxe.lang.Function __temp_odecl57 = new global::Fun_72c496d0<T>(_g1, i);
				return new global::haxe.lang.DynamicObject(new global::Array<int>(new int[]{407283053, 1224901875}), new global::Array<object>(new object[]{__temp_odecl56, __temp_odecl57}), new global::Array<int>(new int[]{}), new global::Array<double>(new double[]{}));
			}
			
		}
	}
	
	
	public   void resize(int newNBuckets)
	{
		unchecked 
		{
			int[] newFlags = default(int[]);
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
				
				if (( this.size >= ( ( newNBuckets * 0.7 ) + 0.5 ) )) 
				{
					j = 0;
				}
				 else 
				{
					int nfSize = ( (( newNBuckets < 16 )) ? (1) : (( newNBuckets >> 4 )) );
					newFlags = new int[nfSize];
					{
						int _g = 0;
						while (( _g < ((int) (nfSize) ) ))
						{
							int i = _g++;
							newFlags[i] = -1431655766;
						}
						
					}
					
					if (( this.nBuckets < newNBuckets )) 
					{
						int[] k = new int[newNBuckets];
						if (( this._keys != default(int[]) )) 
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
				this.cachedKey = 0;
				this.cachedIndex = -1;
				j = -1;
				int nBuckets = this.nBuckets;
				int[] _keys = this._keys;
				T[] vals = this.vals;
				int[] flags = this.flags;
				int newMask = ( newNBuckets - 1 );
				while ((  ++ j < nBuckets ))
				{
					if ( ! ((( (( ((int) (( ((uint) (flags[( j >> 4 )]) ) >> (( (( j & 15 )) << 1 )) )) ) & 3 )) != 0 ))) ) 
					{
						int key = _keys[j];
						T val = vals[j];
						flags[( j >> 4 )] |= ( 1 << (( (( j & 15 )) << 1 )) );
						while (true)
						{
							int k1 = key;
							int inc = ( (( ( ( k1 >> 3 ) ^ ( k1 << 3 ) ) | 1 )) & newMask );
							int i1 = ( k1 & newMask );
							while ( ! ((( (( ((int) (( ((uint) (newFlags[( i1 >> 4 )]) ) >> (( (( i1 & 15 )) << 1 )) )) ) & 2 )) != 0 ))) )
							{
								i1 = ( ( i1 + inc ) & newMask );
							}
							
							newFlags[( i1 >> 4 )] &=  ~ ((( 2 << (( (( i1 & 15 )) << 1 )) ))) ;
							if (( ( i1 < nBuckets ) &&  ! ((( (( ((int) (( ((uint) (flags[( i1 >> 4 )]) ) >> (( (( i1 & 15 )) << 1 )) )) ) & 3 )) != 0 )))  )) 
							{
								{
									int tmp = _keys[i1];
									_keys[i1] = key;
									key = tmp;
								}
								
								{
									T tmp1 = vals[i1];
									vals[i1] = val;
									val = tmp1;
								}
								
								flags[( i1 >> 4 )] |= ( 1 << (( (( i1 & 15 )) << 1 )) );
							}
							 else 
							{
								_keys[i1] = key;
								vals[i1] = val;
								break;
							}
							
						}
						
					}
					
				}
				
				if (( nBuckets > newNBuckets )) 
				{
					{
						int[] k2 = new int[newNBuckets];
						global::System.Array.Copy(_keys, 0, k2, 0, newNBuckets);
						this._keys = k2;
					}
					
					{
						T[] v1 = new T[newNBuckets];
						global::System.Array.Copy(vals, 0, v1, 0, newNBuckets);
						this.vals = v1;
					}
					
				}
				
				this.flags = newFlags;
				this.nBuckets = newNBuckets;
				this.nOccupied = this.size;
				this.upperBound = ((int) (( ( newNBuckets * 0.7 ) + .5 )) );
			}
			
		}
	}
	
	
	public virtual   bool @remove(int key)
	{
		unchecked 
		{
			int idx = -1;
			if ( ! ((( ( this.cachedKey == key ) && ( (idx = this.cachedIndex) != -1 ) ))) ) 
			{
				idx = this.lookup(key);
			}
			
			if (( idx == -1 )) 
			{
				return false;
			}
			 else 
			{
				if (( this.cachedKey == key )) 
				{
					this.cachedIndex = -1;
				}
				
				if ( ! ((( (( ((int) (( ((uint) (this.flags[( idx >> 4 )]) ) >> (( (( idx & 15 )) << 1 )) )) ) & 3 )) != 0 ))) ) 
				{
					this.flags[( idx >> 4 )] |= ( 1 << (( (( idx & 15 )) << 1 )) );
					 -- this.size;
					this.vals[idx] = default(T);
					this._keys[idx] = 0;
				}
				
				return true;
			}
			
		}
	}
	
	
	public virtual   bool exists(int key)
	{
		unchecked 
		{
			int idx = -1;
			if (( ( this.cachedKey == key ) && ( (idx = this.cachedIndex) != -1 ) )) 
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
	
	
	public virtual   global::haxe.lang.Null<T> @get(int key)
	{
		unchecked 
		{
			int idx = -1;
			if (( ( this.cachedKey == key ) && ( (idx = this.cachedIndex) != -1 ) )) 
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
	
	
	public   int lookup(int key)
	{
		unchecked 
		{
			if (( this.nBuckets != 0 )) 
			{
				int[] flags = this.flags;
				int[] _keys = this._keys;
				int mask = ( this.nBuckets - 1 );
				int k = key;
				int i = ( k & mask );
				int inc = ( (( ( ( k >> 3 ) ^ ( k << 3 ) ) | 1 )) & mask );
				int last = i;
				while ((  ! ((( (( ((int) (( ((uint) (flags[( i >> 4 )]) ) >> (( (( i & 15 )) << 1 )) )) ) & 2 )) != 0 )))  && (( ( (( ((int) (( ((uint) (flags[( i >> 4 )]) ) >> (( (( i & 15 )) << 1 )) )) ) & 1 )) != 0 ) || ( _keys[i] != key ) )) ))
				{
					i = ( ( i + inc ) & mask );
					if (( i == last )) 
					{
						return -1;
					}
					
				}
				
				return ( (( (( ((int) (( ((uint) (flags[( i >> 4 )]) ) >> (( (( i & 15 )) << 1 )) )) ) & 3 )) != 0 )) ? (-1) : (i) );
			}
			
			return -1;
		}
	}
	
	
	public virtual   void @set(int key, T @value)
	{
		unchecked 
		{
			int x;
			if (( this.nOccupied >= this.upperBound )) 
			{
				if (( this.nBuckets > ( this.size << 1 ) )) 
				{
					this.resize(( this.nBuckets - 1 ));
				}
				 else 
				{
					this.resize(( this.nBuckets + 1 ));
				}
				
			}
			
			int[] flags = this.flags;
			int[] _keys = this._keys;
			{
				int mask = ( this.nBuckets - 1 );
				int site = x = this.nBuckets;
				int k = key;
				int i = ( k & mask );
				if (( (( ((int) (( ((uint) (flags[( i >> 4 )]) ) >> (( (( i & 15 )) << 1 )) )) ) & 2 )) != 0 )) 
				{
					x = i;
				}
				 else 
				{
					int inc = ( (( ( ( k >> 3 ) ^ ( k << 3 ) ) | 1 )) & mask );
					int last = i;
					while ( ! ((( ( (( ((int) (( ((uint) (flags[( i >> 4 )]) ) >> (( (( i & 15 )) << 1 )) )) ) & 3 )) != 0 ) || ( _keys[i] == key ) ))) )
					{
						i = ( ( i + inc ) & mask );
					}
					
					x = i;
				}
				
			}
			
			if (( (( ((int) (( ((uint) (flags[( x >> 4 )]) ) >> (( (( x & 15 )) << 1 )) )) ) & 2 )) != 0 )) 
			{
				_keys[x] = key;
				this.vals[x] = @value;
				flags[( x >> 4 )] &=  ~ ((( 3 << (( (( x & 15 )) << 1 )) ))) ;
				this.size++;
				this.nOccupied++;
			}
			 else 
			{
				if (( (( ((int) (( ((uint) (flags[( x >> 4 )]) ) >> (( (( x & 15 )) << 1 )) )) ) & 1 )) != 0 )) 
				{
					_keys[x] = key;
					this.vals[x] = @value;
					flags[( x >> 4 )] &=  ~ ((( 3 << (( (( x & 15 )) << 1 )) ))) ;
					this.size++;
				}
				 else 
				{
					this.vals[x] = @value;
				}
				
			}
			
		}
	}
	
	
	public  int cachedIndex;
	
	public  int cachedKey;
	
	public  int upperBound;
	
	public  int nOccupied;
	
	public  int size;
	
	public  int nBuckets;
	
	public  T[] vals;
	
	public  int[] _keys;
	
	public  int[] flags;
	
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
				
				
				case 1395555037:
				{
					this.cachedKey = ((int) (@value) );
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
				case 42740551:
				{
					this.flags = ((int[]) (@value) );
					return @value;
				}
				
				
				case 2048392659:
				{
					this._keys = ((int[]) (@value) );
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
					this.cachedKey = ((int) (global::haxe.lang.Runtime.toInt(@value)) );
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
				case 42740551:
				{
					return this.flags;
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
				
				
				case 142301684:
				{
					return new global::haxe.lang.Closure(this, "resize", 142301684);
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
				
				
				case 1395555037:
				{
					return ((double) (this.cachedKey) );
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
					this.@set(((int) (global::haxe.lang.Runtime.toInt(dynargs[0])) ), global::haxe.lang.Runtime.genericCast<T>(dynargs[1]));
					break;
				}
				
				
				case 1639293562:
				{
					return this.lookup(((int) (global::haxe.lang.Runtime.toInt(dynargs[0])) ));
				}
				
				
				case 5144726:
				{
					return (this.@get(((int) (global::haxe.lang.Runtime.toInt(dynargs[0])) ))).toDynamic();
				}
				
				
				case 1071652316:
				{
					return this.exists(((int) (global::haxe.lang.Runtime.toInt(dynargs[0])) ));
				}
				
				
				case 76061764:
				{
					return this.@remove(((int) (global::haxe.lang.Runtime.toInt(dynargs[0])) ));
				}
				
				
				case 142301684:
				{
					this.resize(((int) (global::haxe.lang.Runtime.toInt(dynargs[0])) ));
					break;
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
			baseArr.push("flags");
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



public  class Fun_837ce278<T> : global::haxe.lang.Function 
{
	public    Fun_837ce278(global::Array<int> i, global::Array<int> len, global::Array<object> _g1) : base(0, 0)
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
					if ( ! ((( (( ((int) (( ((uint) (((global::IntHash<T>) (((global::IntHash) (this._g1[0]) ).cast<T>()) ).flags[( j >> 4 )]) ) >> (( (( j & 15 )) << 1 )) )) ) & 3 )) != 0 ))) ) 
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



public  class Fun_a250c005<T> : global::haxe.lang.Function 
{
	public    Fun_a250c005(global::Array<object> _g1, global::Array<int> i) : base(0, 0)
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
			T ret = ((global::IntHash<T>) (((global::IntHash) (this._g1[0]) ).cast<T>()) ).vals[this.i[0]];
			this.i[0] = ( this.i[0] + 1 );
			return ret;
		}
	}
	
	
	public  global::Array<object> _g1;
	
	public  global::Array<int> i;
	
}



public  class Fun_f353a146<T> : global::haxe.lang.Function 
{
	public    Fun_f353a146(global::Array<int> i, global::Array<int> len, global::Array<object> _g1) : base(0, 0)
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
					if ( ! ((( (( ((int) (( ((uint) (((global::IntHash<T>) (((global::IntHash) (this._g1[0]) ).cast<T>()) ).flags[( j >> 4 )]) ) >> (( (( j & 15 )) << 1 )) )) ) & 3 )) != 0 ))) ) 
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



public  class Fun_72c496d0<T> : global::haxe.lang.Function 
{
	public    Fun_72c496d0(global::Array<object> _g1, global::Array<int> i) : base(0, 1)
	{
		unchecked 
		{
			this._g1 = _g1;
			this.i = i;
		}
	}
	
	
	public override   double __hx_invoke0_f()
	{
		unchecked 
		{
			int ret = ((global::IntHash<T>) (((global::IntHash) (this._g1[0]) ).cast<T>()) )._keys[this.i[0]];
			((global::IntHash<T>) (((global::IntHash) (this._g1[0]) ).cast<T>()) ).cachedIndex = this.i[0];
			((global::IntHash<T>) (((global::IntHash) (this._g1[0]) ).cast<T>()) ).cachedKey = ret;
			this.i[0] = ( this.i[0] + 1 );
			return ((double) (ret) );
		}
	}
	
	
	public  global::Array<object> _g1;
	
	public  global::Array<int> i;
	
}



public  interface IntHash : global::haxe.lang.IHxObject, global::haxe.lang.IGenericObject 
{
	   object cast<T1>();
	
}


