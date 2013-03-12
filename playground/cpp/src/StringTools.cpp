#include <hxcpp.h>

#ifndef INCLUDED_StringTools
#include <StringTools.h>
#endif

Void StringTools_obj::__construct()
{
	return null();
}

StringTools_obj::~StringTools_obj() { }

Dynamic StringTools_obj::__CreateEmpty() { return  new StringTools_obj; }
hx::ObjectPtr< StringTools_obj > StringTools_obj::__new()
{  hx::ObjectPtr< StringTools_obj > result = new StringTools_obj();
	result->__construct();
	return result;}

Dynamic StringTools_obj::__Create(hx::DynamicArray inArgs)
{  hx::ObjectPtr< StringTools_obj > result = new StringTools_obj();
	result->__construct();
	return result;}

::String StringTools_obj::urlEncode( ::String s){
	HX_STACK_PUSH("StringTools::urlEncode","/Users/Cristi/Documents/haxecompiler/haxe/std/StringTools.hx",37);
	HX_STACK_ARG(s,"s");
	HX_STACK_LINE(37)
	return s.__URLEncode();
}


STATIC_HX_DEFINE_DYNAMIC_FUNC1(StringTools_obj,urlEncode,return )

::String StringTools_obj::urlDecode( ::String s){
	HX_STACK_PUSH("StringTools::urlDecode","/Users/Cristi/Documents/haxecompiler/haxe/std/StringTools.hx",64);
	HX_STACK_ARG(s,"s");
	HX_STACK_LINE(64)
	return s.__URLDecode();
}


STATIC_HX_DEFINE_DYNAMIC_FUNC1(StringTools_obj,urlDecode,return )

::String StringTools_obj::htmlEscape( ::String s,Dynamic quotes){
	HX_STACK_PUSH("StringTools::htmlEscape","/Users/Cristi/Documents/haxecompiler/haxe/std/StringTools.hx",99);
	HX_STACK_ARG(s,"s");
	HX_STACK_ARG(quotes,"quotes");
	HX_STACK_LINE(100)
	s = s.split(HX_CSTRING("&"))->join(HX_CSTRING("&amp;")).split(HX_CSTRING("<"))->join(HX_CSTRING("&lt;")).split(HX_CSTRING(">"))->join(HX_CSTRING("&gt;"));
	HX_STACK_LINE(101)
	return (  ((quotes)) ? ::String(s.split(HX_CSTRING("\""))->join(HX_CSTRING("&quot;")).split(HX_CSTRING("'"))->join(HX_CSTRING("&#039;"))) : ::String(s) );
}


STATIC_HX_DEFINE_DYNAMIC_FUNC2(StringTools_obj,htmlEscape,return )

::String StringTools_obj::htmlUnescape( ::String s){
	HX_STACK_PUSH("StringTools::htmlUnescape","/Users/Cristi/Documents/haxecompiler/haxe/std/StringTools.hx",117);
	HX_STACK_ARG(s,"s");
	HX_STACK_LINE(117)
	return s.split(HX_CSTRING("&gt;"))->join(HX_CSTRING(">")).split(HX_CSTRING("&lt;"))->join(HX_CSTRING("<")).split(HX_CSTRING("&quot;"))->join(HX_CSTRING("\"")).split(HX_CSTRING("&#039;"))->join(HX_CSTRING("'")).split(HX_CSTRING("&amp;"))->join(HX_CSTRING("&"));
}


STATIC_HX_DEFINE_DYNAMIC_FUNC1(StringTools_obj,htmlUnescape,return )

bool StringTools_obj::startsWith( ::String s,::String start){
	HX_STACK_PUSH("StringTools::startsWith","/Users/Cristi/Documents/haxecompiler/haxe/std/StringTools.hx",128);
	HX_STACK_ARG(s,"s");
	HX_STACK_ARG(start,"start");
	HX_STACK_LINE(128)
	return (bool((s.length >= start.length)) && bool((s.substr((int)0,start.length) == start)));
}


STATIC_HX_DEFINE_DYNAMIC_FUNC2(StringTools_obj,startsWith,return )

bool StringTools_obj::endsWith( ::String s,::String end){
	HX_STACK_PUSH("StringTools::endsWith","/Users/Cristi/Documents/haxecompiler/haxe/std/StringTools.hx",145);
	HX_STACK_ARG(s,"s");
	HX_STACK_ARG(end,"end");
	HX_STACK_LINE(151)
	int elen = end.length;		HX_STACK_VAR(elen,"elen");
	HX_STACK_LINE(152)
	int slen = s.length;		HX_STACK_VAR(slen,"slen");
	HX_STACK_LINE(153)
	return (bool((slen >= elen)) && bool((s.substr((slen - elen),elen) == end)));
}


STATIC_HX_DEFINE_DYNAMIC_FUNC2(StringTools_obj,endsWith,return )

bool StringTools_obj::isSpace( ::String s,int pos){
	HX_STACK_PUSH("StringTools::isSpace","/Users/Cristi/Documents/haxecompiler/haxe/std/StringTools.hx",166);
	HX_STACK_ARG(s,"s");
	HX_STACK_ARG(pos,"pos");
	HX_STACK_LINE(167)
	Dynamic c = s.charCodeAt(pos);		HX_STACK_VAR(c,"c");
	HX_STACK_LINE(168)
	return (bool((bool((c >= (int)9)) && bool((c <= (int)13)))) || bool((c == (int)32)));
}


STATIC_HX_DEFINE_DYNAMIC_FUNC2(StringTools_obj,isSpace,return )

::String StringTools_obj::ltrim( ::String s){
	HX_STACK_PUSH("StringTools::ltrim","/Users/Cristi/Documents/haxecompiler/haxe/std/StringTools.hx",180);
	HX_STACK_ARG(s,"s");
	HX_STACK_LINE(184)
	int l = s.length;		HX_STACK_VAR(l,"l");
	HX_STACK_LINE(185)
	int r = (int)0;		HX_STACK_VAR(r,"r");
	HX_STACK_LINE(186)
	while(((bool((r < l)) && bool(::StringTools_obj::isSpace(s,r))))){
		HX_STACK_LINE(186)
		(r)++;
	}
	HX_STACK_LINE(189)
	if (((r > (int)0))){
		HX_STACK_LINE(190)
		return s.substr(r,(l - r));
	}
	else{
		HX_STACK_LINE(192)
		return s;
	}
	HX_STACK_LINE(189)
	return null();
}


STATIC_HX_DEFINE_DYNAMIC_FUNC1(StringTools_obj,ltrim,return )

::String StringTools_obj::rtrim( ::String s){
	HX_STACK_PUSH("StringTools::rtrim","/Users/Cristi/Documents/haxecompiler/haxe/std/StringTools.hx",205);
	HX_STACK_ARG(s,"s");
	HX_STACK_LINE(209)
	int l = s.length;		HX_STACK_VAR(l,"l");
	HX_STACK_LINE(210)
	int r = (int)0;		HX_STACK_VAR(r,"r");
	HX_STACK_LINE(211)
	while(((bool((r < l)) && bool(::StringTools_obj::isSpace(s,((l - r) - (int)1)))))){
		HX_STACK_LINE(211)
		(r)++;
	}
	HX_STACK_LINE(214)
	if (((r > (int)0))){
		HX_STACK_LINE(214)
		return s.substr((int)0,(l - r));
	}
	else{
		HX_STACK_LINE(216)
		return s;
	}
	HX_STACK_LINE(214)
	return null();
}


STATIC_HX_DEFINE_DYNAMIC_FUNC1(StringTools_obj,rtrim,return )

::String StringTools_obj::trim( ::String s){
	HX_STACK_PUSH("StringTools::trim","/Users/Cristi/Documents/haxecompiler/haxe/std/StringTools.hx",227);
	HX_STACK_ARG(s,"s");
	HX_STACK_LINE(227)
	return ::StringTools_obj::ltrim(::StringTools_obj::rtrim(s));
}


STATIC_HX_DEFINE_DYNAMIC_FUNC1(StringTools_obj,trim,return )

::String StringTools_obj::lpad( ::String s,::String c,int l){
	HX_STACK_PUSH("StringTools::lpad","/Users/Cristi/Documents/haxecompiler/haxe/std/StringTools.hx",249);
	HX_STACK_ARG(s,"s");
	HX_STACK_ARG(c,"c");
	HX_STACK_ARG(l,"l");
	HX_STACK_LINE(250)
	if (((c.length <= (int)0))){
		HX_STACK_LINE(251)
		return s;
	}
	HX_STACK_LINE(253)
	while(((s.length < l))){
		HX_STACK_LINE(253)
		s = (c + s);
	}
	HX_STACK_LINE(256)
	return s;
}


STATIC_HX_DEFINE_DYNAMIC_FUNC3(StringTools_obj,lpad,return )

::String StringTools_obj::rpad( ::String s,::String c,int l){
	HX_STACK_PUSH("StringTools::rpad","/Users/Cristi/Documents/haxecompiler/haxe/std/StringTools.hx",271);
	HX_STACK_ARG(s,"s");
	HX_STACK_ARG(c,"c");
	HX_STACK_ARG(l,"l");
	HX_STACK_LINE(272)
	if (((c.length <= (int)0))){
		HX_STACK_LINE(273)
		return s;
	}
	HX_STACK_LINE(275)
	while(((s.length < l))){
		HX_STACK_LINE(275)
		s = (s + c);
	}
	HX_STACK_LINE(278)
	return s;
}


STATIC_HX_DEFINE_DYNAMIC_FUNC3(StringTools_obj,rpad,return )

::String StringTools_obj::replace( ::String s,::String sub,::String by){
	HX_STACK_PUSH("StringTools::replace","/Users/Cristi/Documents/haxecompiler/haxe/std/StringTools.hx",292);
	HX_STACK_ARG(s,"s");
	HX_STACK_ARG(sub,"sub");
	HX_STACK_ARG(by,"by");
	HX_STACK_LINE(292)
	return s.split(sub)->join(by);
}


STATIC_HX_DEFINE_DYNAMIC_FUNC3(StringTools_obj,replace,return )

::String StringTools_obj::hex( int n,Dynamic digits){
	HX_STACK_PUSH("StringTools::hex","/Users/Cristi/Documents/haxecompiler/haxe/std/StringTools.hx",310);
	HX_STACK_ARG(n,"n");
	HX_STACK_ARG(digits,"digits");
	HX_STACK_LINE(316)
	::String s = HX_CSTRING("");		HX_STACK_VAR(s,"s");
	HX_STACK_LINE(317)
	::String hexChars = HX_CSTRING("0123456789ABCDEF");		HX_STACK_VAR(hexChars,"hexChars");
	HX_STACK_LINE(318)
	do{
		HX_STACK_LINE(319)
		s = (hexChars.charAt((int(n) & int((int)15))) + s);
		HX_STACK_LINE(320)
		hx::UShrEq(n,(int)4);
	}
while(((n > (int)0)));
	HX_STACK_LINE(323)
	if (((digits != null()))){
		HX_STACK_LINE(324)
		while(((s.length < digits))){
			HX_STACK_LINE(325)
			s = (HX_CSTRING("0") + s);
		}
	}
	HX_STACK_LINE(326)
	return s;
}


STATIC_HX_DEFINE_DYNAMIC_FUNC2(StringTools_obj,hex,return )

int StringTools_obj::fastCodeAt( ::String s,int index){
	HX_STACK_PUSH("StringTools::fastCodeAt","/Users/Cristi/Documents/haxecompiler/haxe/std/StringTools.hx",339);
	HX_STACK_ARG(s,"s");
	HX_STACK_ARG(index,"index");
	HX_STACK_LINE(339)
	return s.cca(index);
}


STATIC_HX_DEFINE_DYNAMIC_FUNC2(StringTools_obj,fastCodeAt,return )

bool StringTools_obj::isEof( int c){
	HX_STACK_PUSH("StringTools::isEof","/Users/Cristi/Documents/haxecompiler/haxe/std/StringTools.hx",368);
	HX_STACK_ARG(c,"c");
	HX_STACK_LINE(368)
	return (c == (int)0);
}


STATIC_HX_DEFINE_DYNAMIC_FUNC1(StringTools_obj,isEof,return )


StringTools_obj::StringTools_obj()
{
}

void StringTools_obj::__Mark(HX_MARK_PARAMS)
{
	HX_MARK_BEGIN_CLASS(StringTools);
	HX_MARK_END_CLASS();
}

void StringTools_obj::__Visit(HX_VISIT_PARAMS)
{
}

Dynamic StringTools_obj::__Field(const ::String &inName,bool inCallProp)
{
	switch(inName.length) {
	case 3:
		if (HX_FIELD_EQ(inName,"hex") ) { return hex_dyn(); }
		break;
	case 4:
		if (HX_FIELD_EQ(inName,"trim") ) { return trim_dyn(); }
		if (HX_FIELD_EQ(inName,"lpad") ) { return lpad_dyn(); }
		if (HX_FIELD_EQ(inName,"rpad") ) { return rpad_dyn(); }
		break;
	case 5:
		if (HX_FIELD_EQ(inName,"ltrim") ) { return ltrim_dyn(); }
		if (HX_FIELD_EQ(inName,"rtrim") ) { return rtrim_dyn(); }
		if (HX_FIELD_EQ(inName,"isEof") ) { return isEof_dyn(); }
		break;
	case 7:
		if (HX_FIELD_EQ(inName,"isSpace") ) { return isSpace_dyn(); }
		if (HX_FIELD_EQ(inName,"replace") ) { return replace_dyn(); }
		break;
	case 8:
		if (HX_FIELD_EQ(inName,"endsWith") ) { return endsWith_dyn(); }
		break;
	case 9:
		if (HX_FIELD_EQ(inName,"urlEncode") ) { return urlEncode_dyn(); }
		if (HX_FIELD_EQ(inName,"urlDecode") ) { return urlDecode_dyn(); }
		break;
	case 10:
		if (HX_FIELD_EQ(inName,"htmlEscape") ) { return htmlEscape_dyn(); }
		if (HX_FIELD_EQ(inName,"startsWith") ) { return startsWith_dyn(); }
		if (HX_FIELD_EQ(inName,"fastCodeAt") ) { return fastCodeAt_dyn(); }
		break;
	case 12:
		if (HX_FIELD_EQ(inName,"htmlUnescape") ) { return htmlUnescape_dyn(); }
	}
	return super::__Field(inName,inCallProp);
}

Dynamic StringTools_obj::__SetField(const ::String &inName,const Dynamic &inValue,bool inCallProp)
{
	return super::__SetField(inName,inValue,inCallProp);
}

void StringTools_obj::__GetFields(Array< ::String> &outFields)
{
	super::__GetFields(outFields);
};

static ::String sStaticFields[] = {
	HX_CSTRING("urlEncode"),
	HX_CSTRING("urlDecode"),
	HX_CSTRING("htmlEscape"),
	HX_CSTRING("htmlUnescape"),
	HX_CSTRING("startsWith"),
	HX_CSTRING("endsWith"),
	HX_CSTRING("isSpace"),
	HX_CSTRING("ltrim"),
	HX_CSTRING("rtrim"),
	HX_CSTRING("trim"),
	HX_CSTRING("lpad"),
	HX_CSTRING("rpad"),
	HX_CSTRING("replace"),
	HX_CSTRING("hex"),
	HX_CSTRING("fastCodeAt"),
	HX_CSTRING("isEof"),
	String(null()) };

static ::String sMemberFields[] = {
	String(null()) };

static void sMarkStatics(HX_MARK_PARAMS) {
	HX_MARK_MEMBER_NAME(StringTools_obj::__mClass,"__mClass");
};

static void sVisitStatics(HX_VISIT_PARAMS) {
	HX_VISIT_MEMBER_NAME(StringTools_obj::__mClass,"__mClass");
};

Class StringTools_obj::__mClass;

void StringTools_obj::__register()
{
	hx::Static(__mClass) = hx::RegisterClass(HX_CSTRING("StringTools"), hx::TCanCast< StringTools_obj> ,sStaticFields,sMemberFields,
	&__CreateEmpty, &__Create,
	&super::__SGetClass(), 0, sMarkStatics, sVisitStatics);
}

void StringTools_obj::__boot()
{
}

