
namespace sys.io
{
	public  class Process : haxe.lang.HxObject 
	{
		public    Process(string cmd, Array<object> args) : base()
		{
			unchecked 
			{
				sys.io.Process.__hx_ctor(this, cmd, args);
			}
		}
		
		
		public static   void __hx_ctor(sys.io.Process __temp_me37, string cmd, Array<object> args)
		{
			unchecked 
			{
				__temp_me37.native = new System.Diagnostics.Process();
				__temp_me37.native.StartInfo.FileName = cmd;
				StringBuf buf = new StringBuf();
				{
					int _g = 0;
					while (( _g < args.length ))
					{
						string arg = haxe.lang.Runtime.toString(args[_g]);
						 ++ _g;
						buf.b.Append("\"");
						buf.b.Append(Std.@string(arg.Replace("\"", "\\\"")));
						buf.b.Append("\" ");
					}
					
				}
				
				__temp_me37.native.StartInfo.Arguments = buf.toString();
				__temp_me37.native.StartInfo.RedirectStandardError = __temp_me37.native.StartInfo.RedirectStandardInput = __temp_me37.native.StartInfo.RedirectStandardOutput = true;
				__temp_me37.native.StartInfo.UseShellExecute = false;
				__temp_me37.native.Start();
				__temp_me37.stdout = new cs.io.NativeInput(__temp_me37.native.StandardOutput.BaseStream);
				__temp_me37.stderr = new cs.io.NativeInput(__temp_me37.native.StandardError.BaseStream);
				__temp_me37.stdin = new cs.io.NativeOutput(__temp_me37.native.StandardInput.BaseStream);
			}
		}
		
		
		public static   object __hx_createEmpty()
		{
			unchecked 
			{
				return new sys.io.Process(haxe.lang.EmptyObject.EMPTY);
			}
		}
		
		
		public static   object __hx_create(Array arr)
		{
			unchecked 
			{
				return new sys.io.Process(haxe.lang.Runtime.toString(arr[0]), ((Array<object>) (((Array) (arr[1]) ).cast<object>()) ));
			}
		}
		
		
		public    Process(haxe.lang.EmptyObject empty) : base()
		{
			unchecked 
			{
			}
		}
		
		
		public virtual   void kill()
		{
			unchecked 
			{
				this.native.Kill();
			}
		}
		
		
		public virtual   void close()
		{
			unchecked 
			{
				this.native.Close();
			}
		}
		
		
		public virtual   int exitCode()
		{
			unchecked 
			{
				this.native.WaitForExit();
				return this.native.ExitCode;
			}
		}
		
		
		public virtual   int getPid()
		{
			unchecked 
			{
				return this.native.Id;
			}
		}
		
		
		public  System.Diagnostics.Process native;
		
		public  haxe.io.Output stdin;
		
		public  haxe.io.Input stderr;
		
		public  haxe.io.Input stdout;
		
		public override   object __hx_setField(string field, int hash, object @value, bool handleProperties)
		{
			unchecked 
			{
				switch (hash)
				{
					case 133414859:
					{
						this.stdout = ((haxe.io.Input) (@value) );
						return @value;
					}
					
					
					case 132916898:
					{
						this.stderr = ((haxe.io.Input) (@value) );
						return @value;
					}
					
					
					case 68006728:
					{
						this.stdin = ((haxe.io.Output) (@value) );
						return @value;
					}
					
					
					case 572311959:
					{
						this.native = ((System.Diagnostics.Process) (@value) );
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
					case 133414859:
					{
						return this.stdout;
					}
					
					
					case 132916898:
					{
						return this.stderr;
					}
					
					
					case 68006728:
					{
						return this.stdin;
					}
					
					
					case 572311959:
					{
						return this.native;
					}
					
					
					case 589599061:
					{
						return new haxe.lang.Closure(this, "getPid", 589599061);
					}
					
					
					case 25738091:
					{
						return new haxe.lang.Closure(this, "exitCode", 25738091);
					}
					
					
					case 1214453688:
					{
						return new haxe.lang.Closure(this, "close", 1214453688);
					}
					
					
					case 1191829406:
					{
						return new haxe.lang.Closure(this, "kill", 1191829406);
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
					case 589599061:
					{
						return this.getPid();
					}
					
					
					case 25738091:
					{
						return this.exitCode();
					}
					
					
					case 1214453688:
					{
						this.close();
						return default(object);
					}
					
					
					case 1191829406:
					{
						this.kill();
						return default(object);
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
				baseArr.push("stdout");
				baseArr.push("stderr");
				baseArr.push("stdin");
				baseArr.push("native");
				{
					base.__hx_getFields(baseArr);
				}
				
			}
		}
		
		
	}
}


