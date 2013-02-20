#include <hxcpp.h>

#ifndef INCLUDED_haxe_crypto_Sha1
#include <haxe/crypto/Sha1.h>
#endif
#ifndef INCLUDED_haxe_io_Bytes
#include <haxe/io/Bytes.h>
#endif
namespace haxe{
namespace crypto{

Void Sha1_obj::__construct()
{
HX_STACK_PUSH("Sha1::new","/Users/Cristi/Documents/haxecompiler/haxe/std/haxe/crypto/Sha1.hx",63);
{
}
;
	return null();
}

Sha1_obj::~Sha1_obj() { }

Dynamic Sha1_obj::__CreateEmpty() { return  new Sha1_obj; }
hx::ObjectPtr< Sha1_obj > Sha1_obj::__new()
{  hx::ObjectPtr< Sha1_obj > result = new Sha1_obj();
	result->__construct();
	return result;}

Dynamic Sha1_obj::__Create(hx::DynamicArray inArgs)
{  hx::ObjectPtr< Sha1_obj > result = new Sha1_obj();
	result->__construct();
	return result;}

::String Sha1_obj::hex( Array< int > a){
	HX_STACK_PUSH("Sha1::hex","/Users/Cristi/Documents/haxecompiler/haxe/std/haxe/crypto/Sha1.hx",176);
	HX_STACK_THIS(this);
	HX_STACK_ARG(a,"a");
	HX_STACK_LINE(177)
	::String str = HX_CSTRING("");		HX_STACK_VAR(str,"str");
	HX_STACK_LINE(178)
	::String hex_chr = HX_CSTRING("0123456789abcdef");		HX_STACK_VAR(hex_chr,"hex_chr");
	HX_STACK_LINE(179)
	{
		HX_STACK_LINE(179)
		int _g = (int)0;		HX_STACK_VAR(_g,"_g");
		HX_STACK_LINE(179)
		while(((_g < a->length))){
			HX_STACK_LINE(179)
			int num = a->__get(_g);		HX_STACK_VAR(num,"num");
			HX_STACK_LINE(179)
			++(_g);
			HX_STACK_LINE(180)
			int j = (int)7;		HX_STACK_VAR(j,"j");
			HX_STACK_LINE(181)
			while(((j >= (int)0))){
				HX_STACK_LINE(182)
				hx::AddEq(str,hex_chr.charAt((int(hx::UShr(num,((int(j) << int((int)2))))) & int((int)15))));
				HX_STACK_LINE(183)
				(j)--;
			}
		}
	}
	HX_STACK_LINE(186)
	return str;
}


HX_DEFINE_DYNAMIC_FUNC1(Sha1_obj,hex,return )

int Sha1_obj::kt( int t){
	HX_STACK_PUSH("Sha1::kt","/Users/Cristi/Documents/haxecompiler/haxe/std/haxe/crypto/Sha1.hx",166);
	HX_STACK_THIS(this);
	HX_STACK_ARG(t,"t");
	HX_STACK_LINE(167)
	if (((t < (int)20))){
		HX_STACK_LINE(168)
		return (int)1518500249;
	}
	HX_STACK_LINE(169)
	if (((t < (int)40))){
		HX_STACK_LINE(170)
		return (int)1859775393;
	}
	HX_STACK_LINE(171)
	if (((t < (int)60))){
		HX_STACK_LINE(172)
		return (int)-1894007588;
	}
	HX_STACK_LINE(173)
	return (int)-899497514;
}


HX_DEFINE_DYNAMIC_FUNC1(Sha1_obj,kt,return )

int Sha1_obj::ft( int t,int b,int c,int d){
	HX_STACK_PUSH("Sha1::ft","/Users/Cristi/Documents/haxecompiler/haxe/std/haxe/crypto/Sha1.hx",156);
	HX_STACK_THIS(this);
	HX_STACK_ARG(t,"t");
	HX_STACK_ARG(b,"b");
	HX_STACK_ARG(c,"c");
	HX_STACK_ARG(d,"d");
	HX_STACK_LINE(157)
	if (((t < (int)20))){
		HX_STACK_LINE(157)
		return (int((int(b) & int(c))) | int((int(~(int)(b)) & int(d))));
	}
	HX_STACK_LINE(158)
	if (((t < (int)40))){
		HX_STACK_LINE(158)
		return (int((int(b) ^ int(c))) ^ int(d));
	}
	HX_STACK_LINE(159)
	if (((t < (int)60))){
		HX_STACK_LINE(159)
		return (int((int((int(b) & int(c))) | int((int(b) & int(d))))) | int((int(c) & int(d))));
	}
	HX_STACK_LINE(160)
	return (int((int(b) ^ int(c))) ^ int(d));
}


HX_DEFINE_DYNAMIC_FUNC4(Sha1_obj,ft,return )

int Sha1_obj::rol( int num,int cnt){
	HX_STACK_PUSH("Sha1::rol","/Users/Cristi/Documents/haxecompiler/haxe/std/haxe/crypto/Sha1.hx",149);
	HX_STACK_THIS(this);
	HX_STACK_ARG(num,"num");
	HX_STACK_ARG(cnt,"cnt");
	HX_STACK_LINE(149)
	return (int((int(num) << int(cnt))) | int(hx::UShr(num,((int)32 - cnt))));
}


HX_DEFINE_DYNAMIC_FUNC2(Sha1_obj,rol,return )

Array< int > Sha1_obj::doEncode( Array< int > x){
	HX_STACK_PUSH("Sha1::doEncode","/Users/Cristi/Documents/haxecompiler/haxe/std/haxe/crypto/Sha1.hx",66);
	HX_STACK_THIS(this);
	HX_STACK_ARG(x,"x");
	HX_STACK_LINE(67)
	Array< int > w = Array_obj< int >::__new();		HX_STACK_VAR(w,"w");
	HX_STACK_LINE(69)
	int a = (int)1732584193;		HX_STACK_VAR(a,"a");
	HX_STACK_LINE(70)
	int b = (int)-271733879;		HX_STACK_VAR(b,"b");
	HX_STACK_LINE(71)
	int c = (int)-1732584194;		HX_STACK_VAR(c,"c");
	HX_STACK_LINE(72)
	int d = (int)271733878;		HX_STACK_VAR(d,"d");
	HX_STACK_LINE(73)
	int e = (int)-1009589776;		HX_STACK_VAR(e,"e");
	HX_STACK_LINE(75)
	int i = (int)0;		HX_STACK_VAR(i,"i");
	HX_STACK_LINE(76)
	while(((i < x->length))){
		HX_STACK_LINE(77)
		int olda = a;		HX_STACK_VAR(olda,"olda");
		HX_STACK_LINE(78)
		int oldb = b;		HX_STACK_VAR(oldb,"oldb");
		HX_STACK_LINE(79)
		int oldc = c;		HX_STACK_VAR(oldc,"oldc");
		HX_STACK_LINE(80)
		int oldd = d;		HX_STACK_VAR(oldd,"oldd");
		HX_STACK_LINE(81)
		int olde = e;		HX_STACK_VAR(olde,"olde");
		HX_STACK_LINE(83)
		int j = (int)0;		HX_STACK_VAR(j,"j");
		HX_STACK_LINE(84)
		while(((j < (int)80))){
			HX_STACK_LINE(85)
			if (((j < (int)16))){
				HX_STACK_LINE(86)
				w[j] = x->__get((i + j));
			}
			else{
				struct _Function_4_1{
					inline static int Block( Array< int > &w,int &j){
						HX_STACK_PUSH("*::closure","/Users/Cristi/Documents/haxecompiler/haxe/std/haxe/crypto/Sha1.hx",88);
						{
							HX_STACK_LINE(88)
							int num = (int((int((int(w->__get((j - (int)3))) ^ int(w->__get((j - (int)8))))) ^ int(w->__get((j - (int)14))))) ^ int(w->__get((j - (int)16))));		HX_STACK_VAR(num,"num");
							HX_STACK_LINE(88)
							return (int((int(num) << int((int)1))) | int(hx::UShr(num,(int)31)));
						}
						return null();
					}
				};
				HX_STACK_LINE(88)
				w[j] = _Function_4_1::Block(w,j);
			}
			HX_STACK_LINE(89)
			int t = ((((((int((int(a) << int((int)5))) | int(hx::UShr(a,(int)27)))) + this->ft(j,b,c,d)) + e) + w->__get(j)) + this->kt(j));		HX_STACK_VAR(t,"t");
			HX_STACK_LINE(90)
			e = d;
			HX_STACK_LINE(91)
			d = c;
			HX_STACK_LINE(92)
			c = (int((int(b) << int((int)30))) | int(hx::UShr(b,(int)2)));
			HX_STACK_LINE(93)
			b = a;
			HX_STACK_LINE(94)
			a = t;
			HX_STACK_LINE(95)
			(j)++;
		}
		HX_STACK_LINE(97)
		hx::AddEq(a,olda);
		HX_STACK_LINE(98)
		hx::AddEq(b,oldb);
		HX_STACK_LINE(99)
		hx::AddEq(c,oldc);
		HX_STACK_LINE(100)
		hx::AddEq(d,oldd);
		HX_STACK_LINE(101)
		hx::AddEq(e,olde);
		HX_STACK_LINE(102)
		hx::AddEq(i,(int)16);
	}
	HX_STACK_LINE(104)
	return Array_obj< int >::__new().Add(a).Add(b).Add(c).Add(d).Add(e);
}


HX_DEFINE_DYNAMIC_FUNC1(Sha1_obj,doEncode,return )

::String Sha1_obj::encode( ::String s){
	HX_STACK_PUSH("Sha1::encode","/Users/Cristi/Documents/haxecompiler/haxe/std/haxe/crypto/Sha1.hx",26);
	HX_STACK_ARG(s,"s");
	HX_STACK_LINE(38)
	::haxe::crypto::Sha1 sh = ::haxe::crypto::Sha1_obj::__new();		HX_STACK_VAR(sh,"sh");
	HX_STACK_LINE(39)
	Array< int > h = sh->doEncode(::haxe::crypto::Sha1_obj::str2blks(s));		HX_STACK_VAR(h,"h");
	HX_STACK_LINE(40)
	return sh->hex(h);
}


STATIC_HX_DEFINE_DYNAMIC_FUNC1(Sha1_obj,encode,return )

::haxe::io::Bytes Sha1_obj::make( ::haxe::io::Bytes b){
	HX_STACK_PUSH("Sha1::make","/Users/Cristi/Documents/haxecompiler/haxe/std/haxe/crypto/Sha1.hx",44);
	HX_STACK_ARG(b,"b");
	HX_STACK_LINE(48)
	Array< int > h = ::haxe::crypto::Sha1_obj::__new()->doEncode(::haxe::crypto::Sha1_obj::bytes2blks(b));		HX_STACK_VAR(h,"h");
	HX_STACK_LINE(49)
	::haxe::io::Bytes out = ::haxe::io::Bytes_obj::alloc((int)20);		HX_STACK_VAR(out,"out");
	HX_STACK_LINE(50)
	int p = (int)0;		HX_STACK_VAR(p,"p");
	HX_STACK_LINE(51)
	{
		HX_STACK_LINE(51)
		int _g = (int)0;		HX_STACK_VAR(_g,"_g");
		HX_STACK_LINE(51)
		while(((_g < (int)5))){
			HX_STACK_LINE(51)
			int i = (_g)++;		HX_STACK_VAR(i,"i");
			HX_STACK_LINE(52)
			out->b[(p)++] = hx::UShr(h->__get(i),(int)24);
			HX_STACK_LINE(53)
			out->b[(p)++] = (int((int(h->__get(i)) >> int((int)16))) & int((int)255));
			HX_STACK_LINE(54)
			out->b[(p)++] = (int((int(h->__get(i)) >> int((int)8))) & int((int)255));
			HX_STACK_LINE(55)
			out->b[(p)++] = (int(h->__get(i)) & int((int)255));
		}
	}
	HX_STACK_LINE(57)
	return out;
}


STATIC_HX_DEFINE_DYNAMIC_FUNC1(Sha1_obj,make,return )

Array< int > Sha1_obj::str2blks( ::String s){
	HX_STACK_PUSH("Sha1::str2blks","/Users/Cristi/Documents/haxecompiler/haxe/std/haxe/crypto/Sha1.hx",112);
	HX_STACK_ARG(s,"s");
	HX_STACK_LINE(113)
	int nblk = (((int((s.length + (int)8)) >> int((int)6))) + (int)1);		HX_STACK_VAR(nblk,"nblk");
	HX_STACK_LINE(114)
	Array< int > blks = Array_obj< int >::__new();		HX_STACK_VAR(blks,"blks");
	HX_STACK_LINE(116)
	{
		HX_STACK_LINE(116)
		int _g1 = (int)0;		HX_STACK_VAR(_g1,"_g1");
		int _g = (nblk * (int)16);		HX_STACK_VAR(_g,"_g");
		HX_STACK_LINE(116)
		while(((_g1 < _g))){
			HX_STACK_LINE(116)
			int i = (_g1)++;		HX_STACK_VAR(i,"i");
			HX_STACK_LINE(117)
			blks[i] = (int)0;
		}
	}
	HX_STACK_LINE(118)
	{
		HX_STACK_LINE(118)
		int _g1 = (int)0;		HX_STACK_VAR(_g1,"_g1");
		int _g = s.length;		HX_STACK_VAR(_g,"_g");
		HX_STACK_LINE(118)
		while(((_g1 < _g))){
			HX_STACK_LINE(118)
			int i = (_g1)++;		HX_STACK_VAR(i,"i");
			HX_STACK_LINE(119)
			int p = (int(i) >> int((int)2));		HX_STACK_VAR(p,"p");
			HX_STACK_LINE(120)
			hx::OrEq(blks[p],(int(s.charCodeAt(i)) << int(((int)24 - ((int(((int(i) & int((int)3)))) << int((int)3)))))));
		}
	}
	HX_STACK_LINE(122)
	int i = s.length;		HX_STACK_VAR(i,"i");
	HX_STACK_LINE(123)
	int p = (int(i) >> int((int)2));		HX_STACK_VAR(p,"p");
	HX_STACK_LINE(124)
	hx::OrEq(blks[p],(int((int)128) << int(((int)24 - ((int(((int(i) & int((int)3)))) << int((int)3)))))));
	HX_STACK_LINE(125)
	blks[((nblk * (int)16) - (int)1)] = (s.length * (int)8);
	HX_STACK_LINE(126)
	return blks;
}


STATIC_HX_DEFINE_DYNAMIC_FUNC1(Sha1_obj,str2blks,return )

Array< int > Sha1_obj::bytes2blks( ::haxe::io::Bytes b){
	HX_STACK_PUSH("Sha1::bytes2blks","/Users/Cristi/Documents/haxecompiler/haxe/std/haxe/crypto/Sha1.hx",129);
	HX_STACK_ARG(b,"b");
	HX_STACK_LINE(130)
	int nblk = (((int((b->length + (int)8)) >> int((int)6))) + (int)1);		HX_STACK_VAR(nblk,"nblk");
	HX_STACK_LINE(131)
	Array< int > blks = Array_obj< int >::__new();		HX_STACK_VAR(blks,"blks");
	HX_STACK_LINE(133)
	{
		HX_STACK_LINE(133)
		int _g1 = (int)0;		HX_STACK_VAR(_g1,"_g1");
		int _g = (nblk * (int)16);		HX_STACK_VAR(_g,"_g");
		HX_STACK_LINE(133)
		while(((_g1 < _g))){
			HX_STACK_LINE(133)
			int i = (_g1)++;		HX_STACK_VAR(i,"i");
			HX_STACK_LINE(134)
			blks[i] = (int)0;
		}
	}
	HX_STACK_LINE(135)
	{
		HX_STACK_LINE(135)
		int _g1 = (int)0;		HX_STACK_VAR(_g1,"_g1");
		int _g = b->length;		HX_STACK_VAR(_g,"_g");
		HX_STACK_LINE(135)
		while(((_g1 < _g))){
			HX_STACK_LINE(135)
			int i = (_g1)++;		HX_STACK_VAR(i,"i");
			HX_STACK_LINE(136)
			int p = (int(i) >> int((int)2));		HX_STACK_VAR(p,"p");
			HX_STACK_LINE(137)
			hx::OrEq(blks[p],(int(b->b->__get(i)) << int(((int)24 - ((int(((int(i) & int((int)3)))) << int((int)3)))))));
		}
	}
	HX_STACK_LINE(139)
	int i = b->length;		HX_STACK_VAR(i,"i");
	HX_STACK_LINE(140)
	int p = (int(i) >> int((int)2));		HX_STACK_VAR(p,"p");
	HX_STACK_LINE(141)
	hx::OrEq(blks[p],(int((int)128) << int(((int)24 - ((int(((int(i) & int((int)3)))) << int((int)3)))))));
	HX_STACK_LINE(142)
	blks[((nblk * (int)16) - (int)1)] = (b->length * (int)8);
	HX_STACK_LINE(143)
	return blks;
}


STATIC_HX_DEFINE_DYNAMIC_FUNC1(Sha1_obj,bytes2blks,return )


Sha1_obj::Sha1_obj()
{
}

void Sha1_obj::__Mark(HX_MARK_PARAMS)
{
	HX_MARK_BEGIN_CLASS(Sha1);
	HX_MARK_END_CLASS();
}

void Sha1_obj::__Visit(HX_VISIT_PARAMS)
{
}

Dynamic Sha1_obj::__Field(const ::String &inName,bool inCallProp)
{
	switch(inName.length) {
	case 2:
		if (HX_FIELD_EQ(inName,"kt") ) { return kt_dyn(); }
		if (HX_FIELD_EQ(inName,"ft") ) { return ft_dyn(); }
		break;
	case 3:
		if (HX_FIELD_EQ(inName,"hex") ) { return hex_dyn(); }
		if (HX_FIELD_EQ(inName,"rol") ) { return rol_dyn(); }
		break;
	case 4:
		if (HX_FIELD_EQ(inName,"make") ) { return make_dyn(); }
		break;
	case 6:
		if (HX_FIELD_EQ(inName,"encode") ) { return encode_dyn(); }
		break;
	case 8:
		if (HX_FIELD_EQ(inName,"str2blks") ) { return str2blks_dyn(); }
		if (HX_FIELD_EQ(inName,"doEncode") ) { return doEncode_dyn(); }
		break;
	case 10:
		if (HX_FIELD_EQ(inName,"bytes2blks") ) { return bytes2blks_dyn(); }
	}
	return super::__Field(inName,inCallProp);
}

Dynamic Sha1_obj::__SetField(const ::String &inName,const Dynamic &inValue,bool inCallProp)
{
	return super::__SetField(inName,inValue,inCallProp);
}

void Sha1_obj::__GetFields(Array< ::String> &outFields)
{
	super::__GetFields(outFields);
};

static ::String sStaticFields[] = {
	HX_CSTRING("encode"),
	HX_CSTRING("make"),
	HX_CSTRING("str2blks"),
	HX_CSTRING("bytes2blks"),
	String(null()) };

static ::String sMemberFields[] = {
	HX_CSTRING("hex"),
	HX_CSTRING("kt"),
	HX_CSTRING("ft"),
	HX_CSTRING("rol"),
	HX_CSTRING("doEncode"),
	String(null()) };

static void sMarkStatics(HX_MARK_PARAMS) {
	HX_MARK_MEMBER_NAME(Sha1_obj::__mClass,"__mClass");
};

static void sVisitStatics(HX_VISIT_PARAMS) {
	HX_VISIT_MEMBER_NAME(Sha1_obj::__mClass,"__mClass");
};

Class Sha1_obj::__mClass;

void Sha1_obj::__register()
{
	hx::Static(__mClass) = hx::RegisterClass(HX_CSTRING("haxe.crypto.Sha1"), hx::TCanCast< Sha1_obj> ,sStaticFields,sMemberFields,
	&__CreateEmpty, &__Create,
	&super::__SGetClass(), 0, sMarkStatics, sVisitStatics);
}

void Sha1_obj::__boot()
{
}

} // end namespace haxe
} // end namespace crypto
