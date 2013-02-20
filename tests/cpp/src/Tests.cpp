#include <hxcpp.h>

#ifndef INCLUDED_Color
#include <Color.h>
#endif
#ifndef INCLUDED_Color2
#include <Color2.h>
#endif
#ifndef INCLUDED_Date
#include <Date.h>
#endif
#ifndef INCLUDED_DateTools
#include <DateTools.h>
#endif
#ifndef INCLUDED_EReg
#include <EReg.h>
#endif
#ifndef INCLUDED_Hash
#include <Hash.h>
#endif
#ifndef INCLUDED_IntHash
#include <IntHash.h>
#endif
#ifndef INCLUDED_Interface1
#include <Interface1.h>
#endif
#ifndef INCLUDED_Interface2
#include <Interface2.h>
#endif
#ifndef INCLUDED_Lambda
#include <Lambda.h>
#endif
#ifndef INCLUDED_List
#include <List.h>
#endif
#ifndef INCLUDED_Reflect
#include <Reflect.h>
#endif
#ifndef INCLUDED_Std
#include <Std.h>
#endif
#ifndef INCLUDED_StringBuf
#include <StringBuf.h>
#endif
#ifndef INCLUDED_StringTools
#include <StringTools.h>
#endif
#ifndef INCLUDED_Tests
#include <Tests.h>
#endif
#ifndef INCLUDED_Tests2
#include <Tests2.h>
#endif
#ifndef INCLUDED_TestsEnumExtern
#include <TestsEnumExtern.h>
#endif
#ifndef INCLUDED_Type
#include <Type.h>
#endif
#ifndef INCLUDED_haxe_FastCell_Int
#include <haxe/FastCell_Int.h>
#endif
#ifndef INCLUDED_haxe_FastList_Int
#include <haxe/FastList_Int.h>
#endif
#ifndef INCLUDED_haxe_Log
#include <haxe/Log.h>
#endif
#ifndef INCLUDED_haxe_crypto_Md5
#include <haxe/crypto/Md5.h>
#endif
#ifndef INCLUDED_haxe_crypto_Sha1
#include <haxe/crypto/Sha1.h>
#endif
#ifndef INCLUDED_hxMath
#include <hxMath.h>
#endif

Void Tests_obj::__construct()
{
HX_STACK_PUSH("Tests::new","Tests.hx",25);
{
	HX_STACK_LINE(33)
	this->s = HX_CSTRING("str");
	HX_STACK_LINE(32)
	this->d2 = 4.5;
	HX_STACK_LINE(31)
	this->d1 = (int)34;
	HX_STACK_LINE(598)
	::Tests2 test2 = ::Tests2_obj::__new();		HX_STACK_VAR(test2,"test2");
	HX_STACK_LINE(599)
	test2->functionToRedefine = this->functionToRedefine_dyn();
	HX_STACK_LINE(600)
	test2->functionToRedefine2 = this->functionToRedefine2_dyn();
}
;
	return null();
}

Tests_obj::~Tests_obj() { }

Dynamic Tests_obj::__CreateEmpty() { return  new Tests_obj; }
hx::ObjectPtr< Tests_obj > Tests_obj::__new()
{  hx::ObjectPtr< Tests_obj > result = new Tests_obj();
	result->__construct();
	return result;}

Dynamic Tests_obj::__Create(hx::DynamicArray inArgs)
{  hx::ObjectPtr< Tests_obj > result = new Tests_obj();
	result->__construct();
	return result;}

hx::Object *Tests_obj::__ToInterface(const type_info &inType) {
	if (inType==typeid( ::Interface2_obj)) return operator ::Interface2_obj *();
	if (inType==typeid( ::Interface1_obj)) return operator ::Interface1_obj *();
	return super::__ToInterface(inType);
}

Void Tests_obj::functionToRedefine2( int param1,::String param2){
{
		HX_STACK_PUSH("Tests::functionToRedefine2","Tests.hx",605);
		HX_STACK_THIS(this);
		HX_STACK_ARG(param1,"param1");
		HX_STACK_ARG(param2,"param2");
		HX_STACK_LINE(605)
		int i = param1;		HX_STACK_VAR(i,"i");
	}
return null();
}


HX_DEFINE_DYNAMIC_FUNC2(Tests_obj,functionToRedefine2,(void))

Void Tests_obj::functionToRedefine( ){
{
		HX_STACK_PUSH("Tests::functionToRedefine","Tests.hx",602);
		HX_STACK_THIS(this);
		HX_STACK_LINE(602)
		::haxe::Log_obj::trace(HX_CSTRING("do something else"),hx::SourceInfo(HX_CSTRING("Tests.hx"),603,HX_CSTRING("Tests"),HX_CSTRING("functionToRedefine")));
	}
return null();
}


HX_DEFINE_DYNAMIC_FUNC0(Tests_obj,functionToRedefine,(void))

Void Tests_obj::printHello( ){
{
		HX_STACK_PUSH("Tests::printHello","Tests.hx",592);
		HX_STACK_THIS(this);
		HX_STACK_LINE(592)
		::haxe::Log_obj::trace(HX_CSTRING("Hello from Haxe Objective-C"),hx::SourceInfo(HX_CSTRING("Tests.hx"),593,HX_CSTRING("Tests"),HX_CSTRING("printHello")));
	}
return null();
}


HX_DEFINE_DYNAMIC_FUNC0(Tests_obj,printHello,(void))

Void Tests_obj::init( ){
{
		HX_STACK_PUSH("Tests::init","Tests.hx",585);
		HX_STACK_THIS(this);
		HX_STACK_LINE(586)
		int x = (int)6;		HX_STACK_VAR(x,"x");
		HX_STACK_LINE(587)
		this->s = HX_CSTRING("init");
	}
return null();
}


HX_DEFINE_DYNAMIC_FUNC0(Tests_obj,init,(void))

Void Tests_obj::optionalArguments3( int arg1,hx::Null< int >  __o_arg2,Dynamic __o_arg3,Dynamic arg4){
int arg2 = __o_arg2.Default(6);
Dynamic arg3 = __o_arg3.Default(true);
	HX_STACK_PUSH("Tests::optionalArguments3","Tests.hx",582);
	HX_STACK_THIS(this);
	HX_STACK_ARG(arg1,"arg1");
	HX_STACK_ARG(arg2,"arg2");
	HX_STACK_ARG(arg3,"arg3");
	HX_STACK_ARG(arg4,"arg4");
{
	}
return null();
}


HX_DEFINE_DYNAMIC_FUNC4(Tests_obj,optionalArguments3,(void))

Void Tests_obj::optionalArguments2( int arg1,Dynamic arg2,Dynamic arg3,int arg4){
{
		HX_STACK_PUSH("Tests::optionalArguments2","Tests.hx",581);
		HX_STACK_THIS(this);
		HX_STACK_ARG(arg1,"arg1");
		HX_STACK_ARG(arg2,"arg2");
		HX_STACK_ARG(arg3,"arg3");
		HX_STACK_ARG(arg4,"arg4");
	}
return null();
}


HX_DEFINE_DYNAMIC_FUNC4(Tests_obj,optionalArguments2,(void))

Void Tests_obj::optionalArguments1( int arg1,int arg2,int arg3,hx::Null< int >  __o_arg4){
int arg4 = __o_arg4.Default(5);
	HX_STACK_PUSH("Tests::optionalArguments1","Tests.hx",580);
	HX_STACK_THIS(this);
	HX_STACK_ARG(arg1,"arg1");
	HX_STACK_ARG(arg2,"arg2");
	HX_STACK_ARG(arg3,"arg3");
	HX_STACK_ARG(arg4,"arg4");
{
	}
return null();
}


HX_DEFINE_DYNAMIC_FUNC4(Tests_obj,optionalArguments1,(void))

Void Tests_obj::optionalArguments( int arg1,int arg2,int arg3,Dynamic arg4){
{
		HX_STACK_PUSH("Tests::optionalArguments","Tests.hx",579);
		HX_STACK_THIS(this);
		HX_STACK_ARG(arg1,"arg1");
		HX_STACK_ARG(arg2,"arg2");
		HX_STACK_ARG(arg3,"arg3");
		HX_STACK_ARG(arg4,"arg4");
	}
return null();
}


HX_DEFINE_DYNAMIC_FUNC4(Tests_obj,optionalArguments,(void))

Void Tests_obj::callLotsOfArguments( int arg1,int arg2,int arg3,int arg4){
{
		HX_STACK_PUSH("Tests::callLotsOfArguments","Tests.hx",573);
		HX_STACK_THIS(this);
		HX_STACK_ARG(arg1,"arg1");
		HX_STACK_ARG(arg2,"arg2");
		HX_STACK_ARG(arg3,"arg3");
		HX_STACK_ARG(arg4,"arg4");
		HX_STACK_LINE(574)
		this->optionalArguments((int)0,(int)1,(int)2,null());
		HX_STACK_LINE(575)
		this->optionalArguments1((int)0,(int)1,(int)2,null());
		HX_STACK_LINE(576)
		this->optionalArguments2((int)0,null(),null(),(int)3);
		HX_STACK_LINE(577)
		this->optionalArguments3((int)0,(int)1,null(),null());
	}
return null();
}


HX_DEFINE_DYNAMIC_FUNC4(Tests_obj,callLotsOfArguments,(void))

int Tests_obj::minus( int a,int b){
	HX_STACK_PUSH("Tests::minus","Tests.hx",567);
	HX_STACK_THIS(this);
	HX_STACK_ARG(a,"a");
	HX_STACK_ARG(b,"b");
	HX_STACK_LINE(567)
	return (a - b);
}


HX_DEFINE_DYNAMIC_FUNC2(Tests_obj,minus,return )

int Tests_obj::add( int a,int b){
	HX_STACK_PUSH("Tests::add","Tests.hx",564);
	HX_STACK_THIS(this);
	HX_STACK_ARG(a,"a");
	HX_STACK_ARG(b,"b");
	HX_STACK_LINE(564)
	return (a + b);
}


HX_DEFINE_DYNAMIC_FUNC2(Tests_obj,add,return )

int Tests_obj::setWidth( int v){
	HX_STACK_PUSH("Tests::setWidth","Tests.hx",558);
	HX_STACK_THIS(this);
	HX_STACK_ARG(v,"v");
	HX_STACK_LINE(558)
	return (int)0;
}


HX_DEFINE_DYNAMIC_FUNC1(Tests_obj,setWidth,return )

int Tests_obj::getWidth( ){
	HX_STACK_PUSH("Tests::getWidth","Tests.hx",557);
	HX_STACK_THIS(this);
	HX_STACK_LINE(557)
	return (int)0;
}


HX_DEFINE_DYNAMIC_FUNC0(Tests_obj,getWidth,return )

Void Tests_obj::testFrameworksImport( ){
{
		HX_STACK_PUSH("Tests::testFrameworksImport","Tests.hx",550);
		HX_STACK_THIS(this);
	}
return null();
}


HX_DEFINE_DYNAMIC_FUNC0(Tests_obj,testFrameworksImport,(void))

Void Tests_obj::testOverload( ){
{
		HX_STACK_PUSH("Tests::testOverload","Tests.hx",540);
		HX_STACK_THIS(this);
		HX_STACK_LINE(541)
		this->foo();
		HX_STACK_LINE(542)
		this->foo(HX_CSTRING("bar"));
		HX_STACK_LINE(543)
		this->foo(HX_CSTRING("str"),Array_obj< ::String >::__new().Add(HX_CSTRING("bar1")).Add(HX_CSTRING("bar2")));
		HX_STACK_LINE(544)
		this->foo(Array_obj< Array< ::String > >::__new().Add(Array_obj< ::String >::__new().Add(HX_CSTRING("bar")).Add(HX_CSTRING("1"))).Add(Array_obj< ::String >::__new().Add(HX_CSTRING("bar")).Add(HX_CSTRING("2"))));
	}
return null();
}


HX_DEFINE_DYNAMIC_FUNC0(Tests_obj,testOverload,(void))

Void Tests_obj::foo( ){
{
		HX_STACK_PUSH("Tests::foo","Tests.hx",538);
		HX_STACK_THIS(this);
	}
return null();
}


HX_DEFINE_DYNAMIC_FUNC0(Tests_obj,foo,(void))

Void Tests_obj::testCrypto( ){
{
		HX_STACK_PUSH("Tests::testCrypto","Tests.hx",528);
		HX_STACK_THIS(this);
		HX_STACK_LINE(529)
		::String str1 = ::haxe::crypto::Md5_obj::encode(HX_CSTRING("Hello world"));		HX_STACK_VAR(str1,"str1");
		HX_STACK_LINE(530)
		::String str2 = ::haxe::crypto::Sha1_obj::encode(HX_CSTRING("Hello world"));		HX_STACK_VAR(str2,"str2");
	}
return null();
}


HX_DEFINE_DYNAMIC_FUNC0(Tests_obj,testCrypto,(void))

Void Tests_obj::testXml( ){
{
		HX_STACK_PUSH("Tests::testXml","Tests.hx",506);
		HX_STACK_THIS(this);
	}
return null();
}


HX_DEFINE_DYNAMIC_FUNC0(Tests_obj,testXml,(void))

Void Tests_obj::testType( ){
{
		HX_STACK_PUSH("Tests::testType","Tests.hx",453);
		HX_STACK_THIS(this);
		HX_STACK_LINE(453)
		::Class cl = ::Type_obj::resolveClass(HX_CSTRING("ios.map.MKMapView"));		HX_STACK_VAR(cl,"cl");
	}
return null();
}


HX_DEFINE_DYNAMIC_FUNC0(Tests_obj,testType,(void))

Void Tests_obj::testString( ){
{
		HX_STACK_PUSH("Tests::testString","Tests.hx",370);
		HX_STACK_THIS(this);
		HX_STACK_LINE(372)
		::String string = ::String(HX_CSTRING("abcdefghijklmnopqrstuvwxyz"));		HX_STACK_VAR(string,"string");
		HX_STACK_LINE(373)
		int len = string.length;		HX_STACK_VAR(len,"len");
		HX_STACK_LINE(374)
		::String s = string.charAt((int)5);		HX_STACK_VAR(s,"s");
		HX_STACK_LINE(375)
		Dynamic ch = string.charCodeAt((int)5);		HX_STACK_VAR(ch,"ch");
		HX_STACK_LINE(376)
		int i = string.indexOf(HX_CSTRING("abc"),null());		HX_STACK_VAR(i,"i");
		HX_STACK_LINE(377)
		int i1 = string.indexOf(HX_CSTRING("abc"),(int)2);		HX_STACK_VAR(i1,"i1");
		HX_STACK_LINE(378)
		int li = string.lastIndexOf(HX_CSTRING("abc"),null());		HX_STACK_VAR(li,"li");
		HX_STACK_LINE(379)
		Array< ::String > components = string.split(HX_CSTRING("-"));		HX_STACK_VAR(components,"components");
		HX_STACK_LINE(380)
		::String s2 = string.substr((int)5,null());		HX_STACK_VAR(s2,"s2");
		HX_STACK_LINE(381)
		s2 = string.substr((int)5,len);
		HX_STACK_LINE(382)
		s2 = string.substring((int)5,null());
		HX_STACK_LINE(383)
		s2 = string.substring((int)1,len);
		HX_STACK_LINE(384)
		s2 = string.toLowerCase();
		HX_STACK_LINE(385)
		s2 = string.toUpperCase();
		HX_STACK_LINE(389)
		::String s3 = HX_CSTRING("\t");		HX_STACK_VAR(s3,"s3");
		HX_STACK_LINE(391)
		::StringBuf buf = ::StringBuf_obj::__new();		HX_STACK_VAR(buf,"buf");
		HX_STACK_LINE(392)
		hx::IndexRef((buf->b).mPtr,buf->b->__Field(HX_CSTRING("length"),true)) = HX_CSTRING("abc");
		HX_STACK_LINE(393)
		hx::IndexRef((buf->b).mPtr,buf->b->__Field(HX_CSTRING("length"),true)) = HX_CSTRING("");
		HX_STACK_LINE(394)
		hx::IndexRef((buf->b).mPtr,buf->b->__Field(HX_CSTRING("length"),true)) = HX_CSTRING("abcdefghijklmnopqerstuvwxyz").substr((int)5,null());
		HX_STACK_LINE(395)
		hx::IndexRef((buf->b).mPtr,buf->b->__Field(HX_CSTRING("length"),true)) = HX_CSTRING("abcdefghijklmnopqerstuvwxyz").substr((int)5,(int)10);
		HX_STACK_LINE(396)
		::String strbuf = buf->b->__Field(HX_CSTRING("join"),true)(HX_CSTRING(""));		HX_STACK_VAR(strbuf,"strbuf");
		HX_STACK_LINE(398)
		::String st = ::StringTools_obj::urlEncode(HX_CSTRING("http://imagin.ro/Gorgeous Elena/2"));		HX_STACK_VAR(st,"st");
		HX_STACK_LINE(399)
		st = ::StringTools_obj::urlDecode(HX_CSTRING("http://imagin.ro/Gorgeous Elena/2"));
		HX_STACK_LINE(400)
		st = ::StringTools_obj::htmlEscape(HX_CSTRING("<a href= &>"),null());
		HX_STACK_LINE(401)
		st = ::StringTools_obj::htmlUnescape(HX_CSTRING("<a href= &>"));
		HX_STACK_LINE(402)
		st = ::StringTools_obj::ltrim(HX_CSTRING(" abcdefgh"));
		HX_STACK_LINE(403)
		st = ::StringTools_obj::rtrim(HX_CSTRING("abcdefgh "));
		HX_STACK_LINE(404)
		st = ::StringTools_obj::trim(HX_CSTRING(" abcdefgh "));
		HX_STACK_LINE(405)
		st = ::StringTools_obj::rpad(HX_CSTRING("abcdefgh"),HX_CSTRING("0"),(int)10);
		HX_STACK_LINE(406)
		st = ::StringTools_obj::lpad(HX_CSTRING("abcdefgh"),HX_CSTRING("0"),(int)10);
		HX_STACK_LINE(407)
		st = ::StringTools_obj::replace(HX_CSTRING("abcdefgh"),HX_CSTRING("abc"),HX_CSTRING("_abc"));
		HX_STACK_LINE(408)
		bool b = ::StringTools_obj::startsWith(HX_CSTRING("abcdefg"),HX_CSTRING("abc"));		HX_STACK_VAR(b,"b");
		HX_STACK_LINE(409)
		b = ::StringTools_obj::endsWith(HX_CSTRING("abcdefg"),HX_CSTRING("efg"));
		HX_STACK_LINE(410)
		b = ::StringTools_obj::isSpace(HX_CSTRING("abcdefg"),(int)3);
		HX_STACK_LINE(411)
		::String i2 = ::StringTools_obj::hex((int)345345,(int)10);		HX_STACK_VAR(i2,"i2");
		HX_STACK_LINE(413)
		::String sfin = (strbuf + st);		HX_STACK_VAR(sfin,"sfin");
		HX_STACK_LINE(414)
		sfin = ((strbuf + st) + s2);
		HX_STACK_LINE(415)
		hx::AddEq(sfin,HX_CSTRING("abc"));
		HX_STACK_LINE(416)
		sfin = ((st + HX_CSTRING("abc")) + (int)5);
		HX_STACK_LINE(417)
		sfin = ((int)55 + HX_CSTRING("abc"));
	}
return null();
}


HX_DEFINE_DYNAMIC_FUNC0(Tests_obj,testString,(void))

Void Tests_obj::testStd( ){
{
		HX_STACK_PUSH("Tests::testStd","Tests.hx",358);
		HX_STACK_THIS(this);
		HX_STACK_LINE(359)
		int _int = (int)3;		HX_STACK_VAR(_int,"int");
		HX_STACK_LINE(360)
		bool BOOL = ::Std_obj::is(this->d1,hx::ClassOf< ::Float >());		HX_STACK_VAR(BOOL,"BOOL");
		HX_STACK_LINE(361)
		Float _float = ::Std_obj::parseFloat(HX_CSTRING("55454.65"));		HX_STACK_VAR(_float,"float");
		HX_STACK_LINE(362)
		_int = ::Std_obj::parseInt(HX_CSTRING("435345.23"));
		HX_STACK_LINE(363)
		_int = ::Std_obj::random((int)543);
		HX_STACK_LINE(364)
		::String string = ::Std_obj::string(_int);		HX_STACK_VAR(string,"string");
	}
return null();
}


HX_DEFINE_DYNAMIC_FUNC0(Tests_obj,testStd,(void))

Void Tests_obj::testReflect( ){
{
		HX_STACK_PUSH("Tests::testReflect","Tests.hx",334);
		HX_STACK_THIS(this);
		struct _Function_1_1{
			inline static Dynamic Block( ){
				HX_STACK_PUSH("*::closure","Tests.hx",335);
				{
					hx::Anon __result = hx::Anon_obj::Create();
					__result->Add(HX_CSTRING("a") , HX_CSTRING("aaaaa"),false);
					return __result;
				}
				return null();
			}
		};
		HX_STACK_LINE(335)
		Dynamic obj = _Function_1_1::Block();		HX_STACK_VAR(obj,"obj");
		HX_STACK_LINE(336)
		bool b = ::Reflect_obj::hasField(obj,HX_CSTRING("a"));		HX_STACK_VAR(b,"b");
		HX_STACK_LINE(337)
		Dynamic f = ::Reflect_obj::field(obj,HX_CSTRING("a"));		HX_STACK_VAR(f,"f");
		HX_STACK_LINE(338)
		if (((obj != null()))){
			HX_STACK_LINE(338)
			obj->__SetField(HX_CSTRING("a"),HX_CSTRING("bbbbb"),false);
		}
		HX_STACK_LINE(339)
		this->__SetField(HX_CSTRING("interfaceVar1"),HX_CSTRING("bbbbb"),true);
		HX_STACK_LINE(340)
		Dynamic p = this->__Field(HX_CSTRING("interfaceVar1"),true);		HX_STACK_VAR(p,"p");
		HX_STACK_LINE(341)
		::Reflect_obj::callMethod(hx::ObjectPtr<OBJ_>(this),this->testStd_dyn(),Dynamic( Array_obj<Dynamic>::__new()));
		HX_STACK_LINE(342)
		::Reflect_obj::callMethod(hx::ObjectPtr<OBJ_>(this),this->callLotsOfArguments_dyn(),Dynamic( Array_obj<Dynamic>::__new().Add((int)1).Add((int)2).Add((int)3).Add((int)4)));
		HX_STACK_LINE(343)
		Array< ::String > fs = ::Reflect_obj::fields(obj);		HX_STACK_VAR(fs,"fs");
		HX_STACK_LINE(344)
		bool isf = ::Reflect_obj::isFunction(this->testStd_dyn());		HX_STACK_VAR(isf,"isf");
		HX_STACK_LINE(345)
		int i = ::Reflect_obj::compare((int)1,(int)2);		HX_STACK_VAR(i,"i");
		HX_STACK_LINE(346)
		bool cm = ::Reflect_obj::compareMethods(this->testStd_dyn(),this->testString_dyn());		HX_STACK_VAR(cm,"cm");
		HX_STACK_LINE(347)
		bool isobj = ::Reflect_obj::isObject(obj);		HX_STACK_VAR(isobj,"isobj");
		HX_STACK_LINE(348)
		isobj = ::Reflect_obj::isObject(this->testStd_dyn());
		HX_STACK_LINE(349)
		::Reflect_obj::deleteField(obj,HX_CSTRING("a"));
		HX_STACK_LINE(350)
		Dynamic obj2 = ::Reflect_obj::copy(obj);		HX_STACK_VAR(obj2,"obj2");
	}
return null();
}


HX_DEFINE_DYNAMIC_FUNC0(Tests_obj,testReflect,(void))

Void Tests_obj::testMath( ){
{
		HX_STACK_PUSH("Tests::testMath","Tests.hx",298);
		HX_STACK_THIS(this);
		HX_STACK_LINE(299)
		Float pi = ::Math_obj::PI;		HX_STACK_VAR(pi,"pi");
		HX_STACK_LINE(300)
		Float max = ::Math_obj::NEGATIVE_INFINITY;		HX_STACK_VAR(max,"max");
		HX_STACK_LINE(301)
		Float min = ::Math_obj::POSITIVE_INFINITY;		HX_STACK_VAR(min,"min");
		HX_STACK_LINE(302)
		Float nan = ::Math_obj::NaN;		HX_STACK_VAR(nan,"nan");
		HX_STACK_LINE(304)
		Float x = ::Math_obj::sqrt((int)5);		HX_STACK_VAR(x,"x");
		HX_STACK_LINE(305)
		x = ::Math_obj::abs((int)5);
		HX_STACK_LINE(306)
		x = ::Math_obj::max((int)5,(int)45555);
		HX_STACK_LINE(307)
		x = ::Math_obj::min((int)5,(int)45555);
		HX_STACK_LINE(308)
		x = ::Math_obj::sin((int)5);
		HX_STACK_LINE(309)
		x = ::Math_obj::cos((int)5);
		HX_STACK_LINE(310)
		x = ::Math_obj::atan2((int)5,(int)3);
		HX_STACK_LINE(311)
		x = ::Math_obj::tan((int)5);
		HX_STACK_LINE(312)
		x = ::Math_obj::exp((int)5);
		HX_STACK_LINE(313)
		x = ::Math_obj::log((int)5);
		HX_STACK_LINE(314)
		x = ::Math_obj::sqrt((int)5);
		HX_STACK_LINE(315)
		int xr = ::Math_obj::round((int)5);		HX_STACK_VAR(xr,"xr");
		HX_STACK_LINE(316)
		xr = ::Math_obj::floor((int)5);
		HX_STACK_LINE(317)
		xr = ::Math_obj::ceil((int)5);
		HX_STACK_LINE(318)
		x = ::Math_obj::atan((int)5);
		HX_STACK_LINE(319)
		x = ::Math_obj::asin((int)5);
		HX_STACK_LINE(320)
		x = ::Math_obj::acos((int)5);
		HX_STACK_LINE(321)
		x = ::Math_obj::pow((int)5,(int)4);
		HX_STACK_LINE(322)
		x = (::Math_obj::random() * (int)5);
		HX_STACK_LINE(323)
		bool b = ::Math_obj::isFinite((int)45454);		HX_STACK_VAR(b,"b");
		HX_STACK_LINE(324)
		b = ::Math_obj::isNaN((int)45454);
		HX_STACK_LINE(326)
		Float j = (x + xr);		HX_STACK_VAR(j,"j");
		HX_STACK_LINE(327)
		hx::AddEq(j,x);
		HX_STACK_LINE(328)
		Float k = (  ((b)) ? Float(-(x)) : Float(x) );		HX_STACK_VAR(k,"k");
	}
return null();
}


HX_DEFINE_DYNAMIC_FUNC0(Tests_obj,testMath,(void))

Void Tests_obj::testList( ){
{
		HX_STACK_PUSH("Tests::testList","Tests.hx",272);
		HX_STACK_THIS(this);
		HX_STACK_LINE(273)
		::List l = ::List_obj::__new();		HX_STACK_VAR(l,"l");
		HX_STACK_LINE(274)
		l->add((int)2);
		HX_STACK_LINE(275)
		l->push((int)18);

		HX_BEGIN_LOCAL_FUNC_S0(hx::LocalFunc,_Function_1_1)
		bool run(int i){
			HX_STACK_PUSH("*::_Function_1_1","Tests.hx",276);
			HX_STACK_ARG(i,"i");
			{
				HX_STACK_LINE(276)
				return (i > (int)5);
			}
			return null();
		}
		HX_END_LOCAL_FUNC1(return)

		HX_STACK_LINE(276)
		::List l2 = l->filter( Dynamic(new _Function_1_1()));		HX_STACK_VAR(l2,"l2");
		HX_STACK_LINE(277)
		Dynamic item = l->first();		HX_STACK_VAR(item,"item");
		HX_STACK_LINE(278)
		bool empty = l->isEmpty();		HX_STACK_VAR(empty,"empty");
		HX_STACK_LINE(279)
		Dynamic iter = l->iterator();		HX_STACK_VAR(iter,"iter");
		HX_STACK_LINE(280)
		::String s = l->join(HX_CSTRING(", "));		HX_STACK_VAR(s,"s");
		HX_STACK_LINE(281)
		s = l->toString();
		HX_STACK_LINE(282)
		item = l->last();
		HX_STACK_LINE(283)
		item = l->pop();
		HX_STACK_LINE(284)
		bool r = l->remove((int)5);		HX_STACK_VAR(r,"r");
		HX_STACK_LINE(285)
		::haxe::Log_obj::trace(l->length,hx::SourceInfo(HX_CSTRING("Tests.hx"),285,HX_CSTRING("Tests"),HX_CSTRING("testList")));
		HX_STACK_LINE(286)
		l->clear();
		HX_STACK_LINE(287)
		::haxe::Log_obj::trace(l->length,hx::SourceInfo(HX_CSTRING("Tests.hx"),287,HX_CSTRING("Tests"),HX_CSTRING("testList")));

		HX_BEGIN_LOCAL_FUNC_S0(hx::LocalFunc,_Function_1_2)
		::String run(int i){
			HX_STACK_PUSH("*::_Function_1_2","Tests.hx",289);
			HX_STACK_ARG(i,"i");
			{
				HX_STACK_LINE(289)
				return ::Std_obj::string(i);
			}
			return null();
		}
		HX_END_LOCAL_FUNC1(return)

		HX_STACK_LINE(289)
		::List newList = l->map( Dynamic(new _Function_1_2()));		HX_STACK_VAR(newList,"newList");
		HX_STACK_LINE(291)
		::haxe::FastList_Int fl = ::haxe::FastList_Int_obj::__new();		HX_STACK_VAR(fl,"fl");
		HX_STACK_LINE(292)
		fl->head = ::haxe::FastCell_Int_obj::__new((int)8,fl->head);
	}
return null();
}


HX_DEFINE_DYNAMIC_FUNC0(Tests_obj,testList,(void))

Void Tests_obj::testLambda( ){
{
		HX_STACK_PUSH("Tests::testLambda","Tests.hx",251);
		HX_STACK_THIS(this);
		HX_STACK_LINE(252)
		Array< int > a = ::Lambda_obj::array(Array_obj< int >::__new().Add((int)0).Add((int)1).Add((int)2).Add((int)3));		HX_STACK_VAR(a,"a");
		HX_STACK_LINE(253)
		::List l = ::Lambda_obj::concat(Array_obj< int >::__new().Add((int)0).Add((int)1).Add((int)2).Add((int)3),Array_obj< int >::__new().Add((int)4).Add((int)5));		HX_STACK_VAR(l,"l");
	}
return null();
}


HX_DEFINE_DYNAMIC_FUNC0(Tests_obj,testLambda,(void))

Void Tests_obj::testHash( ){
{
		HX_STACK_PUSH("Tests::testHash","Tests.hx",227);
		HX_STACK_THIS(this);
		HX_STACK_LINE(228)
		::Hash h = ::Hash_obj::__new();		HX_STACK_VAR(h,"h");
		HX_STACK_LINE(229)
		h->set(HX_CSTRING("key"),HX_CSTRING("value"));
		HX_STACK_LINE(230)
		h->get(HX_CSTRING("key"));
		HX_STACK_LINE(231)
		h->remove(HX_CSTRING("key"));
		HX_STACK_LINE(232)
		bool b = h->exists(HX_CSTRING("key"));		HX_STACK_VAR(b,"b");
		HX_STACK_LINE(233)
		Dynamic arr = h->keys();		HX_STACK_VAR(arr,"arr");
		HX_STACK_LINE(234)
		Dynamic iter = h->iterator();		HX_STACK_VAR(iter,"iter");
		HX_STACK_LINE(235)
		::String str = h->toString();		HX_STACK_VAR(str,"str");
		HX_STACK_LINE(237)
		::IntHash hi = ::IntHash_obj::__new();		HX_STACK_VAR(hi,"hi");
		HX_STACK_LINE(238)
		hi->set((int)0,HX_CSTRING("value"));
		HX_STACK_LINE(239)
		hi->get((int)0);
		HX_STACK_LINE(240)
		hi->remove((int)0);
		HX_STACK_LINE(241)
		bool bi = hi->exists((int)0);		HX_STACK_VAR(bi,"bi");
		HX_STACK_LINE(242)
		Dynamic arri = hi->keys();		HX_STACK_VAR(arri,"arri");
		HX_STACK_LINE(243)
		Dynamic iteri = hi->iterator();		HX_STACK_VAR(iteri,"iteri");
		HX_STACK_LINE(244)
		::String stri = hi->toString();		HX_STACK_VAR(stri,"stri");
	}
return null();
}


HX_DEFINE_DYNAMIC_FUNC0(Tests_obj,testHash,(void))

Void Tests_obj::testEReg( ){
{
		HX_STACK_PUSH("Tests::testEReg","Tests.hx",212);
		HX_STACK_THIS(this);
		HX_STACK_LINE(213)
		::EReg ereg = ::EReg_obj::__new(HX_CSTRING("ytrytrevev76"),HX_CSTRING("099"));		HX_STACK_VAR(ereg,"ereg");
		struct _Function_1_1{
			inline static ::String Block( ::EReg &ereg){
				HX_STACK_PUSH("*::closure","Tests.hx",214);
				{
					HX_STACK_LINE(214)
					bool old = ereg->global;		HX_STACK_VAR(old,"old");
					HX_STACK_LINE(214)
					ereg->global = true;

					HX_BEGIN_LOCAL_FUNC_S0(hx::LocalFunc,_Function_2_1)
					::String run(::EReg e){
						HX_STACK_PUSH("*::_Function_2_1","Tests.hx",214);
						HX_STACK_ARG(e,"e");
						{
							HX_STACK_LINE(214)
							return HX_CSTRING("ss");
						}
						return null();
					}
					HX_END_LOCAL_FUNC1(return)

					HX_STACK_LINE(214)
					::String ret = ereg->map(HX_CSTRING("s"), Dynamic(new _Function_2_1()));		HX_STACK_VAR(ret,"ret");
					HX_STACK_LINE(214)
					ereg->global = old;
					HX_STACK_LINE(214)
					return ret;
				}
				return null();
			}
		};
		HX_STACK_LINE(214)
		::String s = _Function_1_1::Block(ereg);		HX_STACK_VAR(s,"s");
		HX_STACK_LINE(215)
		bool b = ereg->match(HX_CSTRING("s"));		HX_STACK_VAR(b,"b");
		HX_STACK_LINE(216)
		s = ereg->matched((int)5);
		HX_STACK_LINE(217)
		s = ereg->matchedLeft();
		HX_STACK_LINE(218)
		Dynamic o = ereg->matchedPos();		HX_STACK_VAR(o,"o");
		HX_STACK_LINE(219)
		s = ereg->matchedRight();
		HX_STACK_LINE(220)
		s = ereg->replace(HX_CSTRING("s"),HX_CSTRING("by"));
		HX_STACK_LINE(221)
		Array< ::String > arr = ereg->split(HX_CSTRING(","));		HX_STACK_VAR(arr,"arr");
	}
return null();
}


HX_DEFINE_DYNAMIC_FUNC0(Tests_obj,testEReg,(void))

Void Tests_obj::testEnum( ::TestsEnumExtern v){
{
		HX_STACK_PUSH("Tests::testEnum","Tests.hx",194);
		HX_STACK_THIS(this);
		HX_STACK_ARG(v,"v");
		struct _Function_1_1{
			inline static int Block( ::TestsEnumExtern &v){
				HX_STACK_PUSH("*::closure","Tests.hx",195);
				{
					HX_STACK_LINE(195)
					{
						::TestsEnumExtern _switch_1 = (v);
						switch((_switch_1)->GetIndex()){
							case 0: {
								HX_STACK_LINE(196)
								return (int)5;
							}
							;break;
							case 1: {
								HX_STACK_LINE(197)
								return (int)6;
							}
							;break;
							case 2: {
								HX_STACK_LINE(198)
								return (int)7;
							}
							;break;
						}
					}
				}
				return null();
			}
		};
		HX_STACK_LINE(195)
		int i = _Function_1_1::Block(v);		HX_STACK_VAR(i,"i");
		HX_STACK_LINE(200)
		::Color2 red = ::Color2_obj::Red2;		HX_STACK_VAR(red,"red");
		struct _Function_1_2{
			inline static int Block( ::Color2 &red){
				HX_STACK_PUSH("*::closure","Tests.hx",201);
				{
					HX_STACK_LINE(201)
					{
						::Color2 _switch_2 = (red);
						switch((_switch_2)->GetIndex()){
							case 0: {
								HX_STACK_LINE(202)
								return (int)5;
							}
							;break;
							case 1: {
								HX_STACK_LINE(203)
								return (int)6;
							}
							;break;
							case 2: {
								HX_STACK_LINE(204)
								return (int)7;
							}
							;break;
						}
					}
				}
				return null();
			}
		};
		HX_STACK_LINE(201)
		int j = _Function_1_2::Block(red);		HX_STACK_VAR(j,"j");
	}
return null();
}


HX_DEFINE_DYNAMIC_FUNC1(Tests_obj,testEnum,(void))

int Tests_obj::enumToInt( ::Color c){
	HX_STACK_PUSH("Tests::enumToInt","Tests.hx",181);
	HX_STACK_THIS(this);
	HX_STACK_ARG(c,"c");
	HX_STACK_LINE(183)
	this->testEnum(::TestsEnumExtern_obj::ExternEnumValue1);
	struct _Function_1_1{
		inline static int Block( ::Color &c,::Tests_obj *__this){
			HX_STACK_PUSH("*::closure","Tests.hx",185);
			{
				HX_STACK_LINE(185)
				{
					::Color _switch_3 = (c);
					switch((_switch_3)->GetIndex()){
						case 0: {
							HX_STACK_LINE(186)
							return (int)16711680;
						}
						;break;
						case 1: {
							HX_STACK_LINE(187)
							return (int)65280;
						}
						;break;
						case 2: {
							HX_STACK_LINE(188)
							return (int)255;
						}
						;break;
						case 3: {
							int c_eGrey_0 = _switch_3->__Param(0);
{
								HX_STACK_LINE(189)
								return (int((int((int(c_eGrey_0) << int((int)16))) | int((int(c_eGrey_0) << int((int)8))))) | int(c_eGrey_0));
							}
						}
						;break;
						case 4: {
							int c_eRgb_2 = _switch_3->__Param(2);
							int c_eRgb_1 = _switch_3->__Param(1);
							int c_eRgb_0 = _switch_3->__Param(0);
{
								HX_STACK_LINE(190)
								return (int((int((int(c_eRgb_0) << int((int)16))) | int((int(c_eRgb_1) << int((int)8))))) | int(c_eRgb_2));
							}
						}
						;break;
						case 5: {
							::Color c_eAlpha_1 = _switch_3->__Param(1);
							int c_eAlpha_0 = _switch_3->__Param(0);
{
								HX_STACK_LINE(191)
								return (int((int(c_eAlpha_0) << int((int)24))) | int((int(__this->enumToInt(c_eAlpha_1)) & int((int)16777215))));
							}
						}
						;break;
					}
				}
			}
			return null();
		}
	};
	HX_STACK_LINE(185)
	return _Function_1_1::Block(c,this);
}


HX_DEFINE_DYNAMIC_FUNC1(Tests_obj,enumToInt,return )

Void Tests_obj::testDate( ){
{
		HX_STACK_PUSH("Tests::testDate","Tests.hx",150);
		HX_STACK_THIS(this);
		HX_STACK_LINE(151)
		::Date d = ::Date_obj::__new((int)2012,(int)11,(int)13,(int)19,(int)30,(int)0);		HX_STACK_VAR(d,"d");
		HX_STACK_LINE(152)
		int _int = d->getDate();		HX_STACK_VAR(_int,"int");
		HX_STACK_LINE(153)
		_int = d->getDay();
		HX_STACK_LINE(154)
		_int = d->getFullYear();
		HX_STACK_LINE(155)
		_int = d->getHours();
		HX_STACK_LINE(156)
		_int = d->getMinutes();
		HX_STACK_LINE(157)
		_int = d->getMonth();
		HX_STACK_LINE(158)
		_int = d->getSeconds();
		HX_STACK_LINE(159)
		Float _float = d->getTime();		HX_STACK_VAR(_float,"float");
		HX_STACK_LINE(160)
		::String str = d->toString();		HX_STACK_VAR(str,"str");
		HX_STACK_LINE(161)
		::Date d2 = ::Date_obj::fromString(HX_CSTRING("2012-12-12 06:40:00"));		HX_STACK_VAR(d2,"d2");
		HX_STACK_LINE(162)
		d2 = ::Date_obj::fromTime((int)120000);
		HX_STACK_LINE(163)
		d2 = ::Date_obj::now();
		HX_STACK_LINE(165)
		int x = ::DateTools_obj::getMonthDays(d2);		HX_STACK_VAR(x,"x");
		HX_STACK_LINE(166)
		_float = ::DateTools_obj::days((int)5);
		HX_STACK_LINE(167)
		::Date d3 = ::DateTools_obj::delta(d,1000.0);		HX_STACK_VAR(d3,"d3");
		HX_STACK_LINE(168)
		str = ::DateTools_obj::format(d,HX_CSTRING("HH:mm"));
		HX_STACK_LINE(169)
		_int = ::DateTools_obj::getMonthDays(d);
		HX_STACK_LINE(170)
		_float = ::DateTools_obj::hours((int)1000);
		struct _Function_1_1{
			inline static Dynamic Block( ){
				HX_STACK_PUSH("*::closure","Tests.hx",171);
				{
					hx::Anon __result = hx::Anon_obj::Create();
					__result->Add(HX_CSTRING("seconds") , (int)0,false);
					__result->Add(HX_CSTRING("ms") , (int)110,false);
					__result->Add(HX_CSTRING("minutes") , (int)6,false);
					__result->Add(HX_CSTRING("hours") , (int)8,false);
					__result->Add(HX_CSTRING("days") , (int)5,false);
					return __result;
				}
				return null();
			}
		};
		HX_STACK_LINE(171)
		_float = ::DateTools_obj::make(_Function_1_1::Block());
		HX_STACK_LINE(172)
		_float = ::DateTools_obj::minutes((int)56);
		HX_STACK_LINE(173)
		Dynamic obj = ::DateTools_obj::parse((int)45546);		HX_STACK_VAR(obj,"obj");
		HX_STACK_LINE(174)
		_float = ::DateTools_obj::seconds((int)1000);
	}
return null();
}


HX_DEFINE_DYNAMIC_FUNC0(Tests_obj,testDate,(void))

Void Tests_obj::testArray( ){
{
		HX_STACK_PUSH("Tests::testArray","Tests.hx",120);
		HX_STACK_THIS(this);
		HX_STACK_LINE(121)
		Array< ::String > as = Array_obj< ::String >::__new();		HX_STACK_VAR(as,"as");
		HX_STACK_LINE(122)
		Array< Float > aa = Array_obj< Float >::__new().Add(1.0).Add((int)2).Add((int)3).Add((int)4).Add((int)5);		HX_STACK_VAR(aa,"aa");
		HX_STACK_LINE(123)
		Float aaa = aa->__get((int)2);		HX_STACK_VAR(aaa,"aaa");
		HX_STACK_LINE(124)
		aa->__get((int)3);
		HX_STACK_LINE(126)
		Array< ::String > concatArray = as->concat(Array_obj< ::String >::__new().Add(HX_CSTRING("5")).Add(HX_CSTRING("6")).Add(HX_CSTRING("7")));		HX_STACK_VAR(concatArray,"concatArray");
		HX_STACK_LINE(127)
		concatArray = as->copy();
		HX_STACK_LINE(128)
		concatArray->insert((int)2,HX_CSTRING("2"));
		HX_STACK_LINE(129)
		Dynamic iter = as->iterator();		HX_STACK_VAR(iter,"iter");
		HX_STACK_LINE(130)
		::String s = concatArray->join(HX_CSTRING(", "));		HX_STACK_VAR(s,"s");
		HX_STACK_LINE(131)
		::String item = as->pop();		HX_STACK_VAR(item,"item");
		HX_STACK_LINE(132)
		as->push(HX_CSTRING("454"));
		HX_STACK_LINE(133)
		bool _bool = as->remove(HX_CSTRING("5"));		HX_STACK_VAR(_bool,"bool");
		HX_STACK_LINE(134)
		as->reverse();
		HX_STACK_LINE(135)
		item = as->shift();
		HX_STACK_LINE(136)
		Array< ::String > sliceArray = as->slice((int)1,(int)3);		HX_STACK_VAR(sliceArray,"sliceArray");

		HX_BEGIN_LOCAL_FUNC_S0(hx::LocalFunc,_Function_1_1)
		int run(::String a,::String b){
			HX_STACK_PUSH("*::_Function_1_1","Tests.hx",137);
			HX_STACK_ARG(a,"a");
			HX_STACK_ARG(b,"b");
			{
				HX_STACK_LINE(137)
				return (int)0;
			}
			return null();
		}
		HX_END_LOCAL_FUNC2(return)

		HX_STACK_LINE(137)
		as->sort( Dynamic(new _Function_1_1()));
		HX_STACK_LINE(138)
		sliceArray = as->splice((int)2,(int)2);
		HX_STACK_LINE(139)
		s = as->toString();
		HX_STACK_LINE(140)
		as->unshift(HX_CSTRING("44"));
		struct _Function_1_2{
			inline static Array< int > Block( ){
				HX_STACK_PUSH("*::closure","Tests.hx",142);
				{
					HX_STACK_LINE(142)
					Array< int > _g = Array_obj< int >::__new();		HX_STACK_VAR(_g,"_g");
					HX_STACK_LINE(142)
					{
						HX_STACK_LINE(142)
						int _g1 = (int)0;		HX_STACK_VAR(_g1,"_g1");
						HX_STACK_LINE(142)
						while(((_g1 < (int)10))){
							HX_STACK_LINE(142)
							int x = (_g1)++;		HX_STACK_VAR(x,"x");
							HX_STACK_LINE(142)
							_g->push(x);
						}
					}
					HX_STACK_LINE(142)
					return _g;
				}
				return null();
			}
		};
		HX_STACK_LINE(142)
		Array< int > a_comprehention = _Function_1_2::Block();		HX_STACK_VAR(a_comprehention,"a_comprehention");
		struct _Function_1_3{
			inline static Array< int > Block( Array< int > &a_comprehention){
				HX_STACK_PUSH("*::closure","Tests.hx",143);
				{
					HX_STACK_LINE(143)
					Array< int > _g1 = Array_obj< int >::__new();		HX_STACK_VAR(_g1,"_g1");
					HX_STACK_LINE(143)
					{
						HX_STACK_LINE(143)
						int _g2 = (int)0;		HX_STACK_VAR(_g2,"_g2");
						HX_STACK_LINE(143)
						while(((_g2 < a_comprehention->length))){
							HX_STACK_LINE(143)
							int x = a_comprehention->__get(_g2);		HX_STACK_VAR(x,"x");
							HX_STACK_LINE(143)
							++(_g2);
							HX_STACK_LINE(143)
							if (((hx::Mod(x,(int)2) == (int)0))){
								HX_STACK_LINE(143)
								_g1->push(x);
							}
						}
					}
					HX_STACK_LINE(143)
					return _g1;
				}
				return null();
			}
		};
		HX_STACK_LINE(143)
		Array< int > b_comprehention = _Function_1_3::Block(a_comprehention);		HX_STACK_VAR(b_comprehention,"b_comprehention");
		struct _Function_1_4{
			inline static Array< int > Block( ){
				HX_STACK_PUSH("*::closure","Tests.hx",144);
				{
					HX_STACK_LINE(144)
					Array< int > _g2 = Array_obj< int >::__new();		HX_STACK_VAR(_g2,"_g2");
					HX_STACK_LINE(144)
					{
						HX_STACK_LINE(144)
						int _g3 = (int)0;		HX_STACK_VAR(_g3,"_g3");
						HX_STACK_LINE(144)
						while(((_g3 < (int)4))){
							HX_STACK_LINE(144)
							int x = (_g3)++;		HX_STACK_VAR(x,"x");
							HX_STACK_LINE(144)
							int _g5 = (int)0;		HX_STACK_VAR(_g5,"_g5");
							int _g4 = (x + (int)1);		HX_STACK_VAR(_g4,"_g4");
							HX_STACK_LINE(144)
							while(((_g5 < _g4))){
								HX_STACK_LINE(144)
								int i = (_g5)++;		HX_STACK_VAR(i,"i");
								HX_STACK_LINE(144)
								_g2->push(i);
							}
						}
					}
					HX_STACK_LINE(144)
					return _g2;
				}
				return null();
			}
		};
		HX_STACK_LINE(144)
		Array< int > c_comprehention = _Function_1_4::Block();		HX_STACK_VAR(c_comprehention,"c_comprehention");
	}
return null();
}


HX_DEFINE_DYNAMIC_FUNC0(Tests_obj,testArray,(void))

Void Tests_obj::testSwitch( ){
{
		HX_STACK_PUSH("Tests::testSwitch","Tests.hx",110);
		HX_STACK_THIS(this);
		HX_STACK_LINE(111)
		bool _g = true;		HX_STACK_VAR(_g,"_g");
		HX_STACK_LINE(111)
		bool _switch_4 = (_g);
		if (  ( _switch_4==true)){
			HX_STACK_LINE(112)
			int x = (int)0;		HX_STACK_VAR(x,"x");
		}
		else if (  ( _switch_4==false)){
			HX_STACK_LINE(113)
			int y = (int)0;		HX_STACK_VAR(y,"y");
		}
	}
return null();
}


HX_DEFINE_DYNAMIC_FUNC0(Tests_obj,testSwitch,(void))

Void Tests_obj::testTry( ){
{
		HX_STACK_PUSH("Tests::testTry","Tests.hx",96);
		HX_STACK_THIS(this);
		HX_STACK_LINE(96)
		try{
			HX_STACK_LINE(97)
			int a = (int)3;		HX_STACK_VAR(a,"a");
		}
		catch(Dynamic __e){
			{
				Dynamic e = __e;{
					HX_STACK_LINE(100)
					::haxe::Log_obj::trace(HX_CSTRING("error"),hx::SourceInfo(HX_CSTRING("Tests.hx"),101,HX_CSTRING("Tests"),HX_CSTRING("testTry")));
				}
			}
		}
	}
return null();
}


HX_DEFINE_DYNAMIC_FUNC0(Tests_obj,testTry,(void))

Void Tests_obj::testWhile( ){
{
		HX_STACK_PUSH("Tests::testWhile","Tests.hx",81);
		HX_STACK_THIS(this);
		HX_STACK_LINE(82)
		int aa = (int)5;		HX_STACK_VAR(aa,"aa");
		HX_STACK_LINE(83)
		do{
			HX_STACK_LINE(84)
			::haxe::Log_obj::trace(HX_CSTRING("do something"),hx::SourceInfo(HX_CSTRING("Tests.hx"),84,HX_CSTRING("Tests"),HX_CSTRING("testWhile")));
			HX_STACK_LINE(85)
			(aa)++;
		}
while(((aa < (int)10)));
		HX_STACK_LINE(89)
		while(((aa > (int)0))){
			HX_STACK_LINE(89)
			(aa)--;
		}
	}
return null();
}


HX_DEFINE_DYNAMIC_FUNC0(Tests_obj,testWhile,(void))

Void Tests_obj::testingFor( ){
{
		HX_STACK_PUSH("Tests::testingFor","Tests.hx",72);
		HX_STACK_THIS(this);
		HX_STACK_LINE(73)
		Array< int > aa = Array_obj< int >::__new().Add((int)1).Add((int)2).Add((int)3).Add((int)4).Add((int)5);		HX_STACK_VAR(aa,"aa");
		HX_STACK_LINE(74)
		{
			HX_STACK_LINE(74)
			int _g = (int)0;		HX_STACK_VAR(_g,"_g");
			HX_STACK_LINE(74)
			while(((_g < (int)5))){
				HX_STACK_LINE(74)
				int i = (_g)++;		HX_STACK_VAR(i,"i");
				HX_STACK_LINE(74)
				aa->push(i);
			}
		}
		HX_STACK_LINE(75)
		{
			HX_STACK_LINE(75)
			int _g1 = (int)0;		HX_STACK_VAR(_g1,"_g1");
			int _g = aa->length;		HX_STACK_VAR(_g,"_g");
			HX_STACK_LINE(75)
			while(((_g1 < _g))){
				HX_STACK_LINE(75)
				int i = (_g1)++;		HX_STACK_VAR(i,"i");
				HX_STACK_LINE(75)
				aa->push(i);
			}
		}
		HX_STACK_LINE(76)
		{
			HX_STACK_LINE(76)
			int _g = (int)0;		HX_STACK_VAR(_g,"_g");
			HX_STACK_LINE(76)
			while(((_g < aa->length))){
				HX_STACK_LINE(76)
				int i = aa->__get(_g);		HX_STACK_VAR(i,"i");
				HX_STACK_LINE(76)
				++(_g);
				HX_STACK_LINE(76)
				aa->push(i);
			}
		}
	}
return null();
}


HX_DEFINE_DYNAMIC_FUNC0(Tests_obj,testingFor,(void))

Void Tests_obj::testVariables( ){
{
		HX_STACK_PUSH("Tests::testVariables","Tests.hx",40);
		HX_STACK_THIS(this);
		HX_STACK_LINE(42)
		Array< ::String > a = Array_obj< ::String >::__new();		HX_STACK_VAR(a,"a");
		HX_STACK_LINE(43)
		int b = (int)5;		HX_STACK_VAR(b,"b");
		HX_STACK_LINE(44)
		Float c = 5.0;		HX_STACK_VAR(c,"c");
		HX_STACK_LINE(45)
		::String d = HX_CSTRING("xyz");		HX_STACK_VAR(d,"d");
		HX_STACK_LINE(46)
		bool e = true;		HX_STACK_VAR(e,"e");
		HX_STACK_LINE(47)
		int f;		HX_STACK_VAR(f,"f");
		HX_STACK_LINE(48)
		int g = hx::TCast< Int >::cast(5.3);		HX_STACK_VAR(g,"g");
		HX_STACK_LINE(49)
		Dynamic g1 = 6.3;		HX_STACK_VAR(g1,"g1");
		HX_STACK_LINE(50)
		Dynamic g2 = a;		HX_STACK_VAR(g2,"g2");
		HX_STACK_LINE(51)
		int xy = a->length;		HX_STACK_VAR(xy,"xy");
		HX_STACK_LINE(52)
		a->push(HX_CSTRING("6"));
		HX_STACK_LINE(54)
		if (((a->length > (int)3))){
			HX_STACK_LINE(54)
			f = (int)3;
		}
		else{
			HX_STACK_LINE(57)
			f = a->length;
		}
		HX_STACK_LINE(60)
		f = (  (((a->length > (int)3))) ? int((int)3) : int(a->length) );
		HX_STACK_LINE(62)
		int x = ::Tests_obj::__new()->add((int)1,(int)1);		HX_STACK_VAR(x,"x");
	}
return null();
}


HX_DEFINE_DYNAMIC_FUNC0(Tests_obj,testVariables,(void))

::String Tests_obj::staticVar1;

int Tests_obj::staticVar2;

int Tests_obj::staticVar3;

Void Tests_obj::main( ){
{
		HX_STACK_PUSH("Tests::main","Tests.hx",611);
	}
return null();
}


STATIC_HX_DEFINE_DYNAMIC_FUNC0(Tests_obj,main,(void))


Tests_obj::Tests_obj()
{
}

void Tests_obj::__Mark(HX_MARK_PARAMS)
{
	HX_MARK_BEGIN_CLASS(Tests);
	HX_MARK_MEMBER_NAME(s,"s");
	HX_MARK_MEMBER_NAME(d2,"d2");
	HX_MARK_MEMBER_NAME(d1,"d1");
	HX_MARK_MEMBER_NAME(width,"width");
	HX_MARK_MEMBER_NAME(interfaceVar2,"interfaceVar2");
	HX_MARK_MEMBER_NAME(interfaceVar1,"interfaceVar1");
	HX_MARK_END_CLASS();
}

void Tests_obj::__Visit(HX_VISIT_PARAMS)
{
	HX_VISIT_MEMBER_NAME(s,"s");
	HX_VISIT_MEMBER_NAME(d2,"d2");
	HX_VISIT_MEMBER_NAME(d1,"d1");
	HX_VISIT_MEMBER_NAME(width,"width");
	HX_VISIT_MEMBER_NAME(interfaceVar2,"interfaceVar2");
	HX_VISIT_MEMBER_NAME(interfaceVar1,"interfaceVar1");
}

Dynamic Tests_obj::__Field(const ::String &inName,bool inCallProp)
{
	switch(inName.length) {
	case 1:
		if (HX_FIELD_EQ(inName,"s") ) { return s; }
		break;
	case 2:
		if (HX_FIELD_EQ(inName,"d2") ) { return d2; }
		if (HX_FIELD_EQ(inName,"d1") ) { return d1; }
		break;
	case 3:
		if (HX_FIELD_EQ(inName,"add") ) { return add_dyn(); }
		if (HX_FIELD_EQ(inName,"foo") ) { return foo_dyn(); }
		break;
	case 4:
		if (HX_FIELD_EQ(inName,"main") ) { return main_dyn(); }
		if (HX_FIELD_EQ(inName,"init") ) { return init_dyn(); }
		break;
	case 5:
		if (HX_FIELD_EQ(inName,"minus") ) { return minus_dyn(); }
		if (HX_FIELD_EQ(inName,"width") ) { return inCallProp ? getWidth() : width; }
		break;
	case 7:
		if (HX_FIELD_EQ(inName,"testXml") ) { return testXml_dyn(); }
		if (HX_FIELD_EQ(inName,"testStd") ) { return testStd_dyn(); }
		if (HX_FIELD_EQ(inName,"testTry") ) { return testTry_dyn(); }
		break;
	case 8:
		if (HX_FIELD_EQ(inName,"setWidth") ) { return setWidth_dyn(); }
		if (HX_FIELD_EQ(inName,"getWidth") ) { return getWidth_dyn(); }
		if (HX_FIELD_EQ(inName,"testType") ) { return testType_dyn(); }
		if (HX_FIELD_EQ(inName,"testMath") ) { return testMath_dyn(); }
		if (HX_FIELD_EQ(inName,"testList") ) { return testList_dyn(); }
		if (HX_FIELD_EQ(inName,"testHash") ) { return testHash_dyn(); }
		if (HX_FIELD_EQ(inName,"testEReg") ) { return testEReg_dyn(); }
		if (HX_FIELD_EQ(inName,"testEnum") ) { return testEnum_dyn(); }
		if (HX_FIELD_EQ(inName,"testDate") ) { return testDate_dyn(); }
		break;
	case 9:
		if (HX_FIELD_EQ(inName,"enumToInt") ) { return enumToInt_dyn(); }
		if (HX_FIELD_EQ(inName,"testArray") ) { return testArray_dyn(); }
		if (HX_FIELD_EQ(inName,"testWhile") ) { return testWhile_dyn(); }
		break;
	case 10:
		if (HX_FIELD_EQ(inName,"staticVar1") ) { return staticVar1; }
		if (HX_FIELD_EQ(inName,"staticVar2") ) { return staticVar2; }
		if (HX_FIELD_EQ(inName,"staticVar3") ) { return staticVar3; }
		if (HX_FIELD_EQ(inName,"printHello") ) { return printHello_dyn(); }
		if (HX_FIELD_EQ(inName,"testCrypto") ) { return testCrypto_dyn(); }
		if (HX_FIELD_EQ(inName,"testString") ) { return testString_dyn(); }
		if (HX_FIELD_EQ(inName,"testLambda") ) { return testLambda_dyn(); }
		if (HX_FIELD_EQ(inName,"testSwitch") ) { return testSwitch_dyn(); }
		if (HX_FIELD_EQ(inName,"testingFor") ) { return testingFor_dyn(); }
		break;
	case 11:
		if (HX_FIELD_EQ(inName,"testReflect") ) { return testReflect_dyn(); }
		break;
	case 12:
		if (HX_FIELD_EQ(inName,"testOverload") ) { return testOverload_dyn(); }
		break;
	case 13:
		if (HX_FIELD_EQ(inName,"testVariables") ) { return testVariables_dyn(); }
		if (HX_FIELD_EQ(inName,"interfaceVar2") ) { return interfaceVar2; }
		if (HX_FIELD_EQ(inName,"interfaceVar1") ) { return interfaceVar1; }
		break;
	case 17:
		if (HX_FIELD_EQ(inName,"optionalArguments") ) { return optionalArguments_dyn(); }
		break;
	case 18:
		if (HX_FIELD_EQ(inName,"functionToRedefine") ) { return functionToRedefine_dyn(); }
		if (HX_FIELD_EQ(inName,"optionalArguments3") ) { return optionalArguments3_dyn(); }
		if (HX_FIELD_EQ(inName,"optionalArguments2") ) { return optionalArguments2_dyn(); }
		if (HX_FIELD_EQ(inName,"optionalArguments1") ) { return optionalArguments1_dyn(); }
		break;
	case 19:
		if (HX_FIELD_EQ(inName,"functionToRedefine2") ) { return functionToRedefine2_dyn(); }
		if (HX_FIELD_EQ(inName,"callLotsOfArguments") ) { return callLotsOfArguments_dyn(); }
		break;
	case 20:
		if (HX_FIELD_EQ(inName,"testFrameworksImport") ) { return testFrameworksImport_dyn(); }
	}
	return super::__Field(inName,inCallProp);
}

Dynamic Tests_obj::__SetField(const ::String &inName,const Dynamic &inValue,bool inCallProp)
{
	switch(inName.length) {
	case 1:
		if (HX_FIELD_EQ(inName,"s") ) { s=inValue.Cast< ::String >(); return inValue; }
		break;
	case 2:
		if (HX_FIELD_EQ(inName,"d2") ) { d2=inValue.Cast< Float >(); return inValue; }
		if (HX_FIELD_EQ(inName,"d1") ) { d1=inValue.Cast< int >(); return inValue; }
		break;
	case 5:
		if (HX_FIELD_EQ(inName,"width") ) { if (inCallProp) return setWidth(inValue);width=inValue.Cast< int >(); return inValue; }
		break;
	case 10:
		if (HX_FIELD_EQ(inName,"staticVar1") ) { staticVar1=inValue.Cast< ::String >(); return inValue; }
		if (HX_FIELD_EQ(inName,"staticVar2") ) { staticVar2=inValue.Cast< int >(); return inValue; }
		if (HX_FIELD_EQ(inName,"staticVar3") ) { staticVar3=inValue.Cast< int >(); return inValue; }
		break;
	case 13:
		if (HX_FIELD_EQ(inName,"interfaceVar2") ) { interfaceVar2=inValue.Cast< Float >(); return inValue; }
		if (HX_FIELD_EQ(inName,"interfaceVar1") ) { interfaceVar1=inValue.Cast< int >(); return inValue; }
	}
	return super::__SetField(inName,inValue,inCallProp);
}

void Tests_obj::__GetFields(Array< ::String> &outFields)
{
	outFields->push(HX_CSTRING("s"));
	outFields->push(HX_CSTRING("d2"));
	outFields->push(HX_CSTRING("d1"));
	outFields->push(HX_CSTRING("width"));
	outFields->push(HX_CSTRING("interfaceVar2"));
	outFields->push(HX_CSTRING("interfaceVar1"));
	super::__GetFields(outFields);
};

static ::String sStaticFields[] = {
	HX_CSTRING("staticVar1"),
	HX_CSTRING("staticVar2"),
	HX_CSTRING("staticVar3"),
	HX_CSTRING("main"),
	String(null()) };

static ::String sMemberFields[] = {
	HX_CSTRING("functionToRedefine2"),
	HX_CSTRING("functionToRedefine"),
	HX_CSTRING("printHello"),
	HX_CSTRING("init"),
	HX_CSTRING("optionalArguments3"),
	HX_CSTRING("optionalArguments2"),
	HX_CSTRING("optionalArguments1"),
	HX_CSTRING("optionalArguments"),
	HX_CSTRING("callLotsOfArguments"),
	HX_CSTRING("minus"),
	HX_CSTRING("add"),
	HX_CSTRING("setWidth"),
	HX_CSTRING("getWidth"),
	HX_CSTRING("testFrameworksImport"),
	HX_CSTRING("testOverload"),
	HX_CSTRING("foo"),
	HX_CSTRING("testCrypto"),
	HX_CSTRING("testXml"),
	HX_CSTRING("testType"),
	HX_CSTRING("testString"),
	HX_CSTRING("testStd"),
	HX_CSTRING("testReflect"),
	HX_CSTRING("testMath"),
	HX_CSTRING("testList"),
	HX_CSTRING("testLambda"),
	HX_CSTRING("testHash"),
	HX_CSTRING("testEReg"),
	HX_CSTRING("testEnum"),
	HX_CSTRING("enumToInt"),
	HX_CSTRING("testDate"),
	HX_CSTRING("testArray"),
	HX_CSTRING("testSwitch"),
	HX_CSTRING("testTry"),
	HX_CSTRING("testWhile"),
	HX_CSTRING("testingFor"),
	HX_CSTRING("testVariables"),
	HX_CSTRING("s"),
	HX_CSTRING("d2"),
	HX_CSTRING("d1"),
	HX_CSTRING("width"),
	HX_CSTRING("interfaceVar2"),
	HX_CSTRING("interfaceVar1"),
	String(null()) };

static void sMarkStatics(HX_MARK_PARAMS) {
	HX_MARK_MEMBER_NAME(Tests_obj::__mClass,"__mClass");
	HX_MARK_MEMBER_NAME(Tests_obj::staticVar1,"staticVar1");
	HX_MARK_MEMBER_NAME(Tests_obj::staticVar2,"staticVar2");
	HX_MARK_MEMBER_NAME(Tests_obj::staticVar3,"staticVar3");
};

static void sVisitStatics(HX_VISIT_PARAMS) {
	HX_VISIT_MEMBER_NAME(Tests_obj::__mClass,"__mClass");
	HX_VISIT_MEMBER_NAME(Tests_obj::staticVar1,"staticVar1");
	HX_VISIT_MEMBER_NAME(Tests_obj::staticVar2,"staticVar2");
	HX_VISIT_MEMBER_NAME(Tests_obj::staticVar3,"staticVar3");
};

Class Tests_obj::__mClass;

void Tests_obj::__register()
{
	hx::Static(__mClass) = hx::RegisterClass(HX_CSTRING("Tests"), hx::TCanCast< Tests_obj> ,sStaticFields,sMemberFields,
	&__CreateEmpty, &__Create,
	&super::__SGetClass(), 0, sMarkStatics, sVisitStatics);
}

void Tests_obj::__boot()
{
	staticVar1= HX_CSTRING("abcd");
	staticVar2= (int)5;
	staticVar3= (int)5;
}

