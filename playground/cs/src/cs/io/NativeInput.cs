
namespace cs.io
{
	public  class NativeInput : haxe.io.Input 
	{
		public    NativeInput(System.IO.Stream stream) : base(haxe.lang.EmptyObject.EMPTY)
		{
			unchecked 
			{
				cs.io.NativeInput.__hx_ctor(this, stream);
			}
		}
		
		
		public static   void __hx_ctor(cs.io.NativeInput __temp_me27, System.IO.Stream stream)
		{
			unchecked 
			{
				__temp_me27.stream = stream;
				if ( ! (stream.CanRead) ) 
				{
					throw haxe.lang.HaxeException.wrap("Write-only stream");
				}
				
			}
		}
		
		
		public static   object __hx_createEmpty()
		{
			unchecked 
			{
				return new cs.io.NativeInput(haxe.lang.EmptyObject.EMPTY);
			}
		}
		
		
		public static   object __hx_create(Array arr)
		{
			unchecked 
			{
				return new cs.io.NativeInput(((System.IO.Stream) (arr[0]) ));
			}
		}
		
		
		public    NativeInput(haxe.lang.EmptyObject empty) : base(haxe.lang.EmptyObject.EMPTY)
		{
			unchecked 
			{
			}
		}
		
		
		public virtual   bool eof()
		{
			unchecked 
			{
				return ( this.stream.Position == this.stream.Length );
			}
		}
		
		
		public virtual   int tell()
		{
			unchecked 
			{
				return ((int) (this.stream.Position) );
			}
		}
		
		
		public virtual   void seek(int p, sys.io.FileSeek pos)
		{
			unchecked 
			{
				System.IO.SeekOrigin p1 = default(System.IO.SeekOrigin);
				switch (haxe.lang.Runtime.toInt(((object) ((pos)) )))
				{
					case 0:
					{
						p1 = System.IO.SeekOrigin.Begin;
						break;
					}
					
					
					case 1:
					{
						p1 = System.IO.SeekOrigin.Current;
						break;
					}
					
					
					case 2:
					{
						p1 = System.IO.SeekOrigin.End;
						break;
					}
					
					
				}
				
				this.stream.Seek(((long) (haxe.lang.Runtime.toInt(p1)) ), p1);
			}
		}
		
		
		public virtual   bool get_canSeek()
		{
			unchecked 
			{
				return this.stream.CanSeek;
			}
		}
		
		
		public override   void close()
		{
			unchecked 
			{
				this.stream.Close();
			}
		}
		
		
		public override   int readBytes(haxe.io.Bytes s, int pos, int len)
		{
			unchecked 
			{
				if (( ( ( pos < 0 ) || ( len < 0 ) ) || ( ( pos + len ) > s.length ) )) 
				{
					throw haxe.lang.HaxeException.wrap(haxe.io.Error.OutsideBounds);
				}
				
				int ret = this.stream.Read(s.b, pos, len);
				if (( ret == 0 )) 
				{
					throw haxe.lang.HaxeException.wrap(new haxe.io.Eof());
				}
				
				return ret;
			}
		}
		
		
		public override   int readByte()
		{
			unchecked 
			{
				int ret = this.stream.ReadByte();
				if (( ret == -1 )) 
				{
					throw haxe.lang.HaxeException.wrap(new haxe.io.Eof());
				}
				
				return ret;
			}
		}
		
		
		public  System.IO.Stream stream;
		
		public  bool canSeek;
		
		public override   object __hx_setField(string field, int hash, object @value, bool handleProperties)
		{
			unchecked 
			{
				switch (hash)
				{
					case 1789423016:
					{
						this.canSeek = ((bool) (@value) );
						return @value;
					}
					
					
					case 288167040:
					{
						this.stream = ((System.IO.Stream) (@value) );
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
					case 1789423016:
					{
						bool __temp_stmt100 = default(bool);
						if (handleProperties) 
						{
							return this.get_canSeek();
						}
						 else 
						{
							__temp_stmt100 = this.canSeek;
						}
						
						return __temp_stmt100;
					}
					
					
					case 288167040:
					{
						return this.stream;
					}
					
					
					case 1763375486:
					{
						return new haxe.lang.Closure(this, "readByte", 1763375486);
					}
					
					
					case 243225909:
					{
						return new haxe.lang.Closure(this, "readBytes", 243225909);
					}
					
					
					case 1214453688:
					{
						return new haxe.lang.Closure(this, "close", 1214453688);
					}
					
					
					case 1889717695:
					{
						return new haxe.lang.Closure(this, "get_canSeek", 1889717695);
					}
					
					
					case 1280345464:
					{
						return new haxe.lang.Closure(this, "seek", 1280345464);
					}
					
					
					case 1291436593:
					{
						return new haxe.lang.Closure(this, "tell", 1291436593);
					}
					
					
					case 5047484:
					{
						return new haxe.lang.Closure(this, "eof", 5047484);
					}
					
					
					default:
					{
						return base.__hx_getField(field, hash, throwErrors, isCheck, handleProperties);
					}
					
				}
				
			}
		}
		
		
		public override   object __hx_invokeField(string field, int hash, Array dynargs)
		{
			unchecked 
			{
				switch (hash)
				{
					case 1214453688:case 243225909:case 1763375486:
					{
						return haxe.lang.Runtime.slowCallField(this, field, dynargs);
					}
					
					
					case 1889717695:
					{
						return this.get_canSeek();
					}
					
					
					case 1280345464:
					{
						this.seek(haxe.lang.Runtime.toInt(dynargs[0]), ((sys.io.FileSeek) (dynargs[1]) ));
						return default(object);
					}
					
					
					case 1291436593:
					{
						return this.tell();
					}
					
					
					case 5047484:
					{
						return this.eof();
					}
					
					
					default:
					{
						return base.__hx_invokeField(field, hash, dynargs);
					}
					
				}
				
			}
		}
		
		
		public override   void __hx_getFields(Array<object> baseArr)
		{
			unchecked 
			{
				baseArr.push("canSeek");
				baseArr.push("stream");
				{
					base.__hx_getFields(baseArr);
				}
				
			}
		}
		
		
	}
}


