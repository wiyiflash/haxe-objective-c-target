#include <hxcpp.h>

#ifndef INCLUDED_StringBuf
#include <StringBuf.h>
#endif
#ifndef INCLUDED_haxe_io_Bytes
#include <haxe/io/Bytes.h>
#endif
#ifndef INCLUDED_haxe_io_Error
#include <haxe/io/Error.h>
#endif
namespace haxe{
namespace io{

Void Bytes_obj::__construct(int length,Array< unsigned char > b)
{
HX_STACK_PUSH("Bytes::new","/Users/Cristi/Documents/haxecompiler/haxe/std/haxe/io/Bytes.hx",29);
{
	HX_STACK_LINE(30)
	this->length = length;
	HX_STACK_LINE(31)
	this->b = b;
}
;
	return null();
}

Bytes_obj::~Bytes_obj() { }

Dynamic Bytes_obj::__CreateEmpty() { return  new Bytes_obj; }
hx::ObjectPtr< Bytes_obj > Bytes_obj::__new(int length,Array< unsigned char > b)
{  hx::ObjectPtr< Bytes_obj > result = new Bytes_obj();
	result->__construct(length,b);
	return result;}

Dynamic Bytes_obj::__Create(hx::DynamicArray inArgs)
{  hx::ObjectPtr< Bytes_obj > result = new Bytes_obj();
	result->__construct(inArgs[0],inArgs[1]);
	return result;}

Array< unsigned char > Bytes_obj::getData( ){
	HX_STACK_PUSH("Bytes::getData","/Users/Cristi/Documents/haxecompiler/haxe/std/haxe/io/Bytes.hx",252);
	HX_STACK_THIS(this);
	HX_STACK_LINE(252)
	return this->b;
}


HX_DEFINE_DYNAMIC_FUNC0(Bytes_obj,getData,return )

::String Bytes_obj::toHex( ){
	HX_STACK_PUSH("Bytes::toHex","/Users/Cristi/Documents/haxecompiler/haxe/std/haxe/io/Bytes.hx",238);
	HX_STACK_THIS(this);
	HX_STACK_LINE(239)
	::StringBuf s = ::StringBuf_obj::__new();		HX_STACK_VAR(s,"s");
	HX_STACK_LINE(240)
	Array< Dynamic > chars = Array_obj< Dynamic >::__new();		HX_STACK_VAR(chars,"chars");
	HX_STACK_LINE(241)
	::String str = HX_CSTRING("0123456789abcdef");		HX_STACK_VAR(str,"str");
	HX_STACK_LINE(242)
	{
		HX_STACK_LINE(242)
		int _g1 = (int)0;		HX_STACK_VAR(_g1,"_g1");
		int _g = str.length;		HX_STACK_VAR(_g,"_g");
		HX_STACK_LINE(242)
		while(((_g1 < _g))){
			HX_STACK_LINE(242)
			int i = (_g1)++;		HX_STACK_VAR(i,"i");
			HX_STACK_LINE(243)
			chars->push(str.charCodeAt(i));
		}
	}
	HX_STACK_LINE(244)
	{
		HX_STACK_LINE(244)
		int _g1 = (int)0;		HX_STACK_VAR(_g1,"_g1");
		int _g = this->length;		HX_STACK_VAR(_g,"_g");
		HX_STACK_LINE(244)
		while(((_g1 < _g))){
			HX_STACK_LINE(244)
			int i = (_g1)++;		HX_STACK_VAR(i,"i");
			HX_STACK_LINE(245)
			int c = this->b->__get(i);		HX_STACK_VAR(c,"c");
			HX_STACK_LINE(246)
			{
				HX_STACK_LINE(246)
				int c1 = chars->__get((int(c) >> int((int)4)));		HX_STACK_VAR(c1,"c1");
				HX_STACK_LINE(246)
				hx::IndexRef((s->b).mPtr,s->b->__Field(HX_CSTRING("length"),true)) = ::String::fromCharCode(c1);
			}
			HX_STACK_LINE(247)
			{
				HX_STACK_LINE(247)
				int c1 = chars->__get((int(c) & int((int)15)));		HX_STACK_VAR(c1,"c1");
				HX_STACK_LINE(247)
				hx::IndexRef((s->b).mPtr,s->b->__Field(HX_CSTRING("length"),true)) = ::String::fromCharCode(c1);
			}
		}
	}
	HX_STACK_LINE(249)
	return s->b->__Field(HX_CSTRING("join"),true)(HX_CSTRING(""));
}


HX_DEFINE_DYNAMIC_FUNC0(Bytes_obj,toHex,return )

::String Bytes_obj::toString( ){
	HX_STACK_PUSH("Bytes::toString","/Users/Cristi/Documents/haxecompiler/haxe/std/haxe/io/Bytes.hx",215);
	HX_STACK_THIS(this);
	HX_STACK_LINE(215)
	return this->readString((int)0,this->length);
}


HX_DEFINE_DYNAMIC_FUNC0(Bytes_obj,toString,return )

::String Bytes_obj::readString( int pos,int len){
	HX_STACK_PUSH("Bytes::readString","/Users/Cristi/Documents/haxecompiler/haxe/std/haxe/io/Bytes.hx",165);
	HX_STACK_THIS(this);
	HX_STACK_ARG(pos,"pos");
	HX_STACK_ARG(len,"len");
	HX_STACK_LINE(167)
	if (((bool((bool((pos < (int)0)) || bool((len < (int)0)))) || bool(((pos + len) > this->length))))){
		HX_STACK_LINE(167)
		hx::Throw (::haxe::io::Error_obj::OutsideBounds);
	}
	HX_STACK_LINE(179)
	::String result = HX_CSTRING("");		HX_STACK_VAR(result,"result");
	HX_STACK_LINE(180)
	::__hxcpp_string_of_bytes(this->b,result,pos,len);
	HX_STACK_LINE(181)
	return result;
}


HX_DEFINE_DYNAMIC_FUNC2(Bytes_obj,readString,return )

int Bytes_obj::compare( ::haxe::io::Bytes other){
	HX_STACK_PUSH("Bytes::compare","/Users/Cristi/Documents/haxecompiler/haxe/std/haxe/io/Bytes.hx",127);
	HX_STACK_THIS(this);
	HX_STACK_ARG(other,"other");
	HX_STACK_LINE(151)
	Array< unsigned char > b1 = this->b;		HX_STACK_VAR(b1,"b1");
	HX_STACK_LINE(152)
	Array< unsigned char > b2 = other->b;		HX_STACK_VAR(b2,"b2");
	HX_STACK_LINE(153)
	int len = (  (((this->length < other->length))) ? int(this->length) : int(other->length) );		HX_STACK_VAR(len,"len");
	HX_STACK_LINE(154)
	{
		HX_STACK_LINE(154)
		int _g = (int)0;		HX_STACK_VAR(_g,"_g");
		HX_STACK_LINE(154)
		while(((_g < len))){
			HX_STACK_LINE(154)
			int i = (_g)++;		HX_STACK_VAR(i,"i");
			HX_STACK_LINE(155)
			if (((b1->__get(i) != b2->__get(i)))){
				HX_STACK_LINE(157)
				return (b1->__get(i) - b2->__get(i));
			}
		}
	}
	HX_STACK_LINE(161)
	return (this->length - other->length);
}


HX_DEFINE_DYNAMIC_FUNC1(Bytes_obj,compare,return )

::haxe::io::Bytes Bytes_obj::sub( int pos,int len){
	HX_STACK_PUSH("Bytes::sub","/Users/Cristi/Documents/haxecompiler/haxe/std/haxe/io/Bytes.hx",100);
	HX_STACK_THIS(this);
	HX_STACK_ARG(pos,"pos");
	HX_STACK_ARG(len,"len");
	HX_STACK_LINE(102)
	if (((bool((bool((pos < (int)0)) || bool((len < (int)0)))) || bool(((pos + len) > this->length))))){
		HX_STACK_LINE(102)
		hx::Throw (::haxe::io::Error_obj::OutsideBounds);
	}
	HX_STACK_LINE(123)
	return ::haxe::io::Bytes_obj::__new(len,this->b->slice(pos,(pos + len)));
}


HX_DEFINE_DYNAMIC_FUNC2(Bytes_obj,sub,return )

Void Bytes_obj::blit( int pos,::haxe::io::Bytes src,int srcpos,int len){
{
		HX_STACK_PUSH("Bytes::blit","/Users/Cristi/Documents/haxecompiler/haxe/std/haxe/io/Bytes.hx",68);
		HX_STACK_THIS(this);
		HX_STACK_ARG(pos,"pos");
		HX_STACK_ARG(src,"src");
		HX_STACK_ARG(srcpos,"srcpos");
		HX_STACK_ARG(len,"len");
		HX_STACK_LINE(70)
		if (((bool((bool((bool((bool((pos < (int)0)) || bool((srcpos < (int)0)))) || bool((len < (int)0)))) || bool(((pos + len) > this->length)))) || bool(((srcpos + len) > src->length))))){
			HX_STACK_LINE(70)
			hx::Throw (::haxe::io::Error_obj::OutsideBounds);
		}
		HX_STACK_LINE(85)
		Array< unsigned char > b1 = this->b;		HX_STACK_VAR(b1,"b1");
		HX_STACK_LINE(86)
		Array< unsigned char > b2 = src->b;		HX_STACK_VAR(b2,"b2");
		HX_STACK_LINE(87)
		if (((bool((b1 == b2)) && bool((pos > srcpos))))){
			HX_STACK_LINE(88)
			int i = len;		HX_STACK_VAR(i,"i");
			HX_STACK_LINE(89)
			while(((i > (int)0))){
				HX_STACK_LINE(90)
				(i)--;
				HX_STACK_LINE(91)
				b1[(i + pos)] = b2->__get((i + srcpos));
			}
			HX_STACK_LINE(93)
			return null();
		}
		HX_STACK_LINE(95)
		{
			HX_STACK_LINE(95)
			int _g = (int)0;		HX_STACK_VAR(_g,"_g");
			HX_STACK_LINE(95)
			while(((_g < len))){
				HX_STACK_LINE(95)
				int i = (_g)++;		HX_STACK_VAR(i,"i");
				HX_STACK_LINE(96)
				b1[(i + pos)] = b2->__get((i + srcpos));
			}
		}
	}
return null();
}


HX_DEFINE_DYNAMIC_FUNC4(Bytes_obj,blit,(void))

Void Bytes_obj::set( int pos,int v){
{
		HX_STACK_PUSH("Bytes::set","/Users/Cristi/Documents/haxecompiler/haxe/std/haxe/io/Bytes.hx",50);
		HX_STACK_THIS(this);
		HX_STACK_ARG(pos,"pos");
		HX_STACK_ARG(v,"v");
		HX_STACK_LINE(50)
		this->b[pos] = v;
	}
return null();
}


HX_DEFINE_DYNAMIC_FUNC2(Bytes_obj,set,(void))

int Bytes_obj::get( int pos){
	HX_STACK_PUSH("Bytes::get","/Users/Cristi/Documents/haxecompiler/haxe/std/haxe/io/Bytes.hx",34);
	HX_STACK_THIS(this);
	HX_STACK_ARG(pos,"pos");
	HX_STACK_LINE(34)
	return this->b->__get(pos);
}


HX_DEFINE_DYNAMIC_FUNC1(Bytes_obj,get,return )

::haxe::io::Bytes Bytes_obj::alloc( int length){
	HX_STACK_PUSH("Bytes::alloc","/Users/Cristi/Documents/haxecompiler/haxe/std/haxe/io/Bytes.hx",256);
	HX_STACK_ARG(length,"length");
	HX_STACK_LINE(273)
	Array< unsigned char > a = Array_obj< unsigned char >::__new();		HX_STACK_VAR(a,"a");
	HX_STACK_LINE(274)
	if (((length > (int)0))){
		HX_STACK_LINE(274)
		a[(length - (int)1)] = (int)0;
	}
	HX_STACK_LINE(275)
	return ::haxe::io::Bytes_obj::__new(length,a);
}


STATIC_HX_DEFINE_DYNAMIC_FUNC1(Bytes_obj,alloc,return )

::haxe::io::Bytes Bytes_obj::ofString( ::String s){
	HX_STACK_PUSH("Bytes::ofString","/Users/Cristi/Documents/haxecompiler/haxe/std/haxe/io/Bytes.hx",288);
	HX_STACK_ARG(s,"s");
	HX_STACK_LINE(299)
	Array< unsigned char > a = Array_obj< unsigned char >::__new();		HX_STACK_VAR(a,"a");
	HX_STACK_LINE(300)
	::__hxcpp_bytes_of_string(a,s);
	HX_STACK_LINE(301)
	return ::haxe::io::Bytes_obj::__new(a->length,a);
}


STATIC_HX_DEFINE_DYNAMIC_FUNC1(Bytes_obj,ofString,return )

::haxe::io::Bytes Bytes_obj::ofData( Array< unsigned char > b){
	HX_STACK_PUSH("Bytes::ofData","/Users/Cristi/Documents/haxecompiler/haxe/std/haxe/io/Bytes.hx",337);
	HX_STACK_ARG(b,"b");
	HX_STACK_LINE(337)
	return ::haxe::io::Bytes_obj::__new(b->length,b);
}


STATIC_HX_DEFINE_DYNAMIC_FUNC1(Bytes_obj,ofData,return )

int Bytes_obj::fastGet( Array< unsigned char > b,int pos){
	HX_STACK_PUSH("Bytes::fastGet","/Users/Cristi/Documents/haxecompiler/haxe/std/haxe/io/Bytes.hx",355);
	HX_STACK_ARG(b,"b");
	HX_STACK_ARG(pos,"pos");
	HX_STACK_LINE(355)
	return b->__get(pos);
}


STATIC_HX_DEFINE_DYNAMIC_FUNC2(Bytes_obj,fastGet,return )


Bytes_obj::Bytes_obj()
{
}

void Bytes_obj::__Mark(HX_MARK_PARAMS)
{
	HX_MARK_BEGIN_CLASS(Bytes);
	HX_MARK_MEMBER_NAME(b,"b");
	HX_MARK_MEMBER_NAME(length,"length");
	HX_MARK_END_CLASS();
}

void Bytes_obj::__Visit(HX_VISIT_PARAMS)
{
	HX_VISIT_MEMBER_NAME(b,"b");
	HX_VISIT_MEMBER_NAME(length,"length");
}

Dynamic Bytes_obj::__Field(const ::String &inName,bool inCallProp)
{
	switch(inName.length) {
	case 1:
		if (HX_FIELD_EQ(inName,"b") ) { return b; }
		break;
	case 3:
		if (HX_FIELD_EQ(inName,"sub") ) { return sub_dyn(); }
		if (HX_FIELD_EQ(inName,"set") ) { return set_dyn(); }
		if (HX_FIELD_EQ(inName,"get") ) { return get_dyn(); }
		break;
	case 4:
		if (HX_FIELD_EQ(inName,"blit") ) { return blit_dyn(); }
		break;
	case 5:
		if (HX_FIELD_EQ(inName,"alloc") ) { return alloc_dyn(); }
		if (HX_FIELD_EQ(inName,"toHex") ) { return toHex_dyn(); }
		break;
	case 6:
		if (HX_FIELD_EQ(inName,"ofData") ) { return ofData_dyn(); }
		if (HX_FIELD_EQ(inName,"length") ) { return length; }
		break;
	case 7:
		if (HX_FIELD_EQ(inName,"fastGet") ) { return fastGet_dyn(); }
		if (HX_FIELD_EQ(inName,"getData") ) { return getData_dyn(); }
		if (HX_FIELD_EQ(inName,"compare") ) { return compare_dyn(); }
		break;
	case 8:
		if (HX_FIELD_EQ(inName,"ofString") ) { return ofString_dyn(); }
		if (HX_FIELD_EQ(inName,"toString") ) { return toString_dyn(); }
		break;
	case 10:
		if (HX_FIELD_EQ(inName,"readString") ) { return readString_dyn(); }
	}
	return super::__Field(inName,inCallProp);
}

Dynamic Bytes_obj::__SetField(const ::String &inName,const Dynamic &inValue,bool inCallProp)
{
	switch(inName.length) {
	case 1:
		if (HX_FIELD_EQ(inName,"b") ) { b=inValue.Cast< Array< unsigned char > >(); return inValue; }
		break;
	case 6:
		if (HX_FIELD_EQ(inName,"length") ) { length=inValue.Cast< int >(); return inValue; }
	}
	return super::__SetField(inName,inValue,inCallProp);
}

void Bytes_obj::__GetFields(Array< ::String> &outFields)
{
	outFields->push(HX_CSTRING("b"));
	outFields->push(HX_CSTRING("length"));
	super::__GetFields(outFields);
};

static ::String sStaticFields[] = {
	HX_CSTRING("alloc"),
	HX_CSTRING("ofString"),
	HX_CSTRING("ofData"),
	HX_CSTRING("fastGet"),
	String(null()) };

static ::String sMemberFields[] = {
	HX_CSTRING("getData"),
	HX_CSTRING("toHex"),
	HX_CSTRING("toString"),
	HX_CSTRING("readString"),
	HX_CSTRING("compare"),
	HX_CSTRING("sub"),
	HX_CSTRING("blit"),
	HX_CSTRING("set"),
	HX_CSTRING("get"),
	HX_CSTRING("b"),
	HX_CSTRING("length"),
	String(null()) };

static void sMarkStatics(HX_MARK_PARAMS) {
	HX_MARK_MEMBER_NAME(Bytes_obj::__mClass,"__mClass");
};

static void sVisitStatics(HX_VISIT_PARAMS) {
	HX_VISIT_MEMBER_NAME(Bytes_obj::__mClass,"__mClass");
};

Class Bytes_obj::__mClass;

void Bytes_obj::__register()
{
	hx::Static(__mClass) = hx::RegisterClass(HX_CSTRING("haxe.io.Bytes"), hx::TCanCast< Bytes_obj> ,sStaticFields,sMemberFields,
	&__CreateEmpty, &__Create,
	&super::__SGetClass(), 0, sMarkStatics, sVisitStatics);
}

void Bytes_obj::__boot()
{
}

} // end namespace haxe
} // end namespace io
