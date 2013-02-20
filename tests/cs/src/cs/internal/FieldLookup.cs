
namespace haxe.lang
{
	public  class FieldLookup : global::haxe.lang.HxObject 
	{
		public    FieldLookup() : base()
		{
			unchecked 
			{
			}
		}
		
		
		public static  global::Array<int> fieldIds = new global::Array<int>(new int[]{97, 98, 104, 109, 113, 115, 22349, 22350, 22848, 22862, 23072, 23296, 23515, 23520, 23977, 24422, 1821933, 4745537, 4846113, 4947588, 4949376, 5046829, 5097222, 5144726, 5194459, 5393365, 5442204, 5594513, 5594516, 5693967, 5695307, 5741474, 5745024, 5790298, 10319920, 24046298, 42740551, 52644165, 76061764, 87367608, 141066352, 142301684, 159136996, 174079859, 198748919, 207609411, 234584065, 260725187, 260725188, 302979532, 314540543, 328878574, 380872667, 380872668, 380872669, 407283053, 452737314, 474209209, 480756972, 501039929, 520590566, 520665567, 575099699, 589000550, 589796196, 614073432, 636645899, 707030723, 708429200, 724060212, 727985871, 855935792, 899506181, 922671056, 937216258, 943492076, 946786476, 995006396, 1036392305, 1036441609, 1036639397, 1040412140, 1041537810, 1067353468, 1071652316, 1103412149, 1113806382, 1113807511, 1126920507, 1158359328, 1165048321, 1167448992, 1169898256, 1177789281, 1179185267, 1181037546, 1191633396, 1202522710, 1204816148, 1211807040, 1213952397, 1224901875, 1247875546, 1247983110, 1253604246, 1256563152, 1267255098, 1271070480, 1280549057, 1280845662, 1281093634, 1282943179, 1313416818, 1346074668, 1352786672, 1395555037, 1407096607, 1486298884, 1496841747, 1519236735, 1532710347, 1537812987, 1547539107, 1584238566, 1620824029, 1621420777, 1639293562, 1648581351, 1705629508, 1723805383, 1744813180, 1773435129, 1836776262, 1843721375, 1855040487, 1894423562, 1895567566, 1915412854, 1916009602, 1955029599, 1981972957, 2022294396, 2025055113, 2048392659, 2050424089, 2082663554, 2083500811, 2084789794, 2102626213, 2107737873, 2127021138});
		
		public static  global::Array<object> fields = new global::Array<object>(new object[]{"a", "b", "h", "m", "q", "s", "d1", "d2", "ff", "ft", "gg", "hh", "id", "ii", "kt", "ms", "isGlobal", "__a", "add", "cmn", "cur", "elt", "foo", "get", "hex", "len", "map", "pop", "pos", "rol", "run", "set", "sub", "tag", "first", "split", "flags", "match", "remove", "filter", "minus", "resize", "matched", "enumToInt", "methodInTests2", "isEmpty", "doEncode", "interfaceVar1", "interfaceVar2", "methodName", "testWhile", "iterator", "optionalArguments1", "optionalArguments2", "optionalArguments3", "hasNext", "reverse", "addme", "nOccupied", "insert", "length", "addSub", "testCrypto", "getDay", "getTag", "matchedRight", "testReflect", "testString", "getWidth", "replace", "hours", "bitOR", "testVariables", "cachedIndex", "Trim", "testOverload", "toString", "hashes", "testStd", "testTry", "testXml", "testFrameworksImport", "index", "splice", "exists", "copy", "date", "days", "matchSub", "head", "functionToRedefine", "testDate", "init", "testEReg", "testEnum", "join", "keys", "last", "concat", "testHash", "clear", "next", "push", "width", "optionalArguments", "testList", "testMath", "matchedPos", "size", "sort", "stop", "quicksort", "vals", "testType", "spliceVoid", "cachedKey", "minutes", "setWidth", "testTimer", "seconds", "concatNative", "nBuckets", "className", "testSwitch", "__unsafe_get", "__unsafe_set", "lookup", "fileName", "toDynamic", "regex", "constructs", "testLambda", "params", "callLotsOfArguments", "testArray", "bitAND", "bitXOR", "__get", "__set", "Equals", "lineNumber", "upperBound", "unshift", "_keys", "testingFor", "shift", "matchedLeft", "__hx_createEmpty", "printHello", "functionToRedefine2", "slice"});
		
		public static   int doHash(string s)
		{
			unchecked 
			{
				int acc = 0;
				{
					int _g1 = 0;
					int _g = s.Length;
					while (( _g1 < _g ))
					{
						int i = _g1++;
						acc = ( ( ( 223 * (( acc >> 1 )) ) + global::haxe.lang.StringExt.charCodeAt(s, i).@value ) << 1 );
					}
					
				}
				
				return ((int) (( ((uint) (acc) ) >> 1 )) );
			}
		}
		
		
		public static   string lookupHash(int key)
		{
			unchecked 
			{
				global::Array<int> ids = global::haxe.lang.FieldLookup.fieldIds;
				int min = 0;
				int max = ids.length;
				while (( min < max ))
				{
					int mid = ( min + ( (( max - min )) / 2 ) );
					int imid = ids[mid];
					if (( key < imid )) 
					{
						max = mid;
					}
					 else 
					{
						if (( key > imid )) 
						{
							min = ( mid + 1 );
						}
						 else 
						{
							return global::haxe.lang.Runtime.toString(global::haxe.lang.FieldLookup.fields[mid]);
						}
						
					}
					
				}
				
				throw global::haxe.lang.HaxeException.wrap(global::haxe.lang.Runtime.concat("Field not found for hash ", global::haxe.lang.Runtime.toString(key)));
			}
		}
		
		
		public static   int hash(string s)
		{
			unchecked 
			{
				if (string.Equals(s, default(string))) 
				{
					return 0;
				}
				
				int key = default(int);
				{
					int acc = 0;
					{
						int _g1 = 0;
						int _g = s.Length;
						while (( _g1 < _g ))
						{
							int i = _g1++;
							acc = ( ( ( 223 * (( acc >> 1 )) ) + global::haxe.lang.StringExt.charCodeAt(s, i).@value ) << 1 );
						}
						
					}
					
					key = ((int) (( ((uint) (acc) ) >> 1 )) );
				}
				
				global::Array<int> ids = global::haxe.lang.FieldLookup.fieldIds;
				int min = 0;
				int max = ids.length;
				while (( min < max ))
				{
					int mid = ((int) (( min + ( ((double) ((( max - min ))) ) / 2 ) )) );
					int imid = ids[mid];
					if (( key < imid )) 
					{
						max = mid;
					}
					 else 
					{
						if (( key > imid )) 
						{
							min = ( mid + 1 );
						}
						 else 
						{
							string field = global::haxe.lang.Runtime.toString(global::haxe.lang.FieldLookup.fields[mid]);
							if ( ! (string.Equals(field, s)) ) 
							{
								return  ~ (key) ;
							}
							
							return key;
						}
						
					}
					
				}
				
				ids.insert(min, key);
				global::haxe.lang.FieldLookup.fields.insert(min, s);
				return key;
			}
		}
		
		
		public static   int findHash(int hash, global::Array<int> hashs)
		{
			unchecked 
			{
				int min = 0;
				int max = hashs.length;
				while (( min < max ))
				{
					int mid = ( (( max + min )) / 2 );
					int imid = hashs[mid];
					if (( hash < imid )) 
					{
						max = mid;
					}
					 else 
					{
						if (( hash > imid )) 
						{
							min = ( mid + 1 );
						}
						 else 
						{
							return mid;
						}
						
					}
					
				}
				
				return  ~ (min) ;
			}
		}
		
		
		public static  new object __hx_createEmpty()
		{
			unchecked 
			{
				return new global::haxe.lang.FieldLookup(global::haxe.lang.EmptyObject.EMPTY);
			}
		}
		
		
		public static  new object __hx_create(global::Array arr)
		{
			unchecked 
			{
				return new global::haxe.lang.FieldLookup();
			}
		}
		
		
		public    FieldLookup(global::haxe.lang.EmptyObject empty) : base()
		{
			unchecked 
			{
			}
		}
		
		
	}
}


