#include <hxcpp.h>

#ifndef INCLUDED_Date
#include <Date.h>
#endif
#ifndef INCLUDED_DateTools
#include <DateTools.h>
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

Void DateTools_obj::__construct()
{
	return null();
}

DateTools_obj::~DateTools_obj() { }

Dynamic DateTools_obj::__CreateEmpty() { return  new DateTools_obj; }
hx::ObjectPtr< DateTools_obj > DateTools_obj::__new()
{  hx::ObjectPtr< DateTools_obj > result = new DateTools_obj();
	result->__construct();
	return result;}

Dynamic DateTools_obj::__Create(hx::DynamicArray inArgs)
{  hx::ObjectPtr< DateTools_obj > result = new DateTools_obj();
	result->__construct();
	return result;}

::String DateTools_obj::__format_get( ::Date d,::String e){
	HX_STACK_PUSH("DateTools::__format_get","/Users/Cristi/Documents/haxecompiler/haxe/std/DateTools.hx",34);
	HX_STACK_ARG(d,"d");
	HX_STACK_ARG(e,"e");
	struct _Function_1_1{
		inline static ::String Block( ::String &e,::Date &d){
			HX_STACK_PUSH("*::closure","/Users/Cristi/Documents/haxecompiler/haxe/std/DateTools.hx",35);
			{
				HX_STACK_LINE(35)
				::String _switch_1 = (e);
				if (  ( _switch_1==HX_CSTRING("%"))){
					HX_STACK_LINE(36)
					return HX_CSTRING("%");
				}
				else if (  ( _switch_1==HX_CSTRING("C"))){
					HX_STACK_LINE(38)
					return ::StringTools_obj::lpad(::Std_obj::string(::Std_obj::_int((Float(d->getFullYear()) / Float((int)100)))),HX_CSTRING("0"),(int)2);
				}
				else if (  ( _switch_1==HX_CSTRING("d"))){
					HX_STACK_LINE(40)
					return ::StringTools_obj::lpad(::Std_obj::string(d->getDate()),HX_CSTRING("0"),(int)2);
				}
				else if (  ( _switch_1==HX_CSTRING("D"))){
					HX_STACK_LINE(42)
					return ::DateTools_obj::__format(d,HX_CSTRING("%m/%d/%y"));
				}
				else if (  ( _switch_1==HX_CSTRING("e"))){
					HX_STACK_LINE(44)
					return ::Std_obj::string(d->getDate());
				}
				else if (  ( _switch_1==HX_CSTRING("H")) ||  ( _switch_1==HX_CSTRING("k"))){
					HX_STACK_LINE(46)
					return ::StringTools_obj::lpad(::Std_obj::string(d->getHours()),(  (((e == HX_CSTRING("H")))) ? ::String(HX_CSTRING("0")) : ::String(HX_CSTRING(" ")) ),(int)2);
				}
				else if (  ( _switch_1==HX_CSTRING("I")) ||  ( _switch_1==HX_CSTRING("l"))){
					HX_STACK_LINE(49)
					int hour = hx::Mod(d->getHours(),(int)12);		HX_STACK_VAR(hour,"hour");
					HX_STACK_LINE(50)
					return ::StringTools_obj::lpad(::Std_obj::string((  (((hour == (int)0))) ? int((int)12) : int(hour) )),(  (((e == HX_CSTRING("I")))) ? ::String(HX_CSTRING("0")) : ::String(HX_CSTRING(" ")) ),(int)2);
				}
				else if (  ( _switch_1==HX_CSTRING("m"))){
					HX_STACK_LINE(51)
					return ::StringTools_obj::lpad(::Std_obj::string((d->getMonth() + (int)1)),HX_CSTRING("0"),(int)2);
				}
				else if (  ( _switch_1==HX_CSTRING("M"))){
					HX_STACK_LINE(53)
					return ::StringTools_obj::lpad(::Std_obj::string(d->getMinutes()),HX_CSTRING("0"),(int)2);
				}
				else if (  ( _switch_1==HX_CSTRING("n"))){
					HX_STACK_LINE(55)
					return HX_CSTRING("\n");
				}
				else if (  ( _switch_1==HX_CSTRING("p"))){
					HX_STACK_LINE(57)
					return (  (((d->getHours() > (int)11))) ? ::String(HX_CSTRING("PM")) : ::String(HX_CSTRING("AM")) );
				}
				else if (  ( _switch_1==HX_CSTRING("r"))){
					HX_STACK_LINE(59)
					return ::DateTools_obj::__format(d,HX_CSTRING("%I:%M:%S %p"));
				}
				else if (  ( _switch_1==HX_CSTRING("R"))){
					HX_STACK_LINE(61)
					return ::DateTools_obj::__format(d,HX_CSTRING("%H:%M"));
				}
				else if (  ( _switch_1==HX_CSTRING("s"))){
					HX_STACK_LINE(63)
					return ::Std_obj::string(::Std_obj::_int((Float(d->getTime()) / Float((int)1000))));
				}
				else if (  ( _switch_1==HX_CSTRING("S"))){
					HX_STACK_LINE(65)
					return ::StringTools_obj::lpad(::Std_obj::string(d->getSeconds()),HX_CSTRING("0"),(int)2);
				}
				else if (  ( _switch_1==HX_CSTRING("t"))){
					HX_STACK_LINE(67)
					return HX_CSTRING("\t");
				}
				else if (  ( _switch_1==HX_CSTRING("T"))){
					HX_STACK_LINE(69)
					return ::DateTools_obj::__format(d,HX_CSTRING("%H:%M:%S"));
				}
				else if (  ( _switch_1==HX_CSTRING("u"))){
					HX_STACK_LINE(73)
					int t = d->getDay();		HX_STACK_VAR(t,"t");
					HX_STACK_LINE(74)
					return (  (((t == (int)0))) ? ::String(HX_CSTRING("7")) : ::String(::Std_obj::string(t)) );
				}
				else if (  ( _switch_1==HX_CSTRING("w"))){
					HX_STACK_LINE(76)
					return ::Std_obj::string(d->getDay());
				}
				else if (  ( _switch_1==HX_CSTRING("y"))){
					HX_STACK_LINE(78)
					return ::StringTools_obj::lpad(::Std_obj::string(hx::Mod(d->getFullYear(),(int)100)),HX_CSTRING("0"),(int)2);
				}
				else if (  ( _switch_1==HX_CSTRING("Y"))){
					HX_STACK_LINE(80)
					return ::Std_obj::string(d->getFullYear());
				}
				else  {
					HX_STACK_LINE(82)
					return hx::Throw (((HX_CSTRING("Date.format %") + e) + HX_CSTRING("- not implemented yet.")));
				}
;
;
			}
			return null();
		}
	};
	HX_STACK_LINE(34)
	return _Function_1_1::Block(e,d);
}


STATIC_HX_DEFINE_DYNAMIC_FUNC2(DateTools_obj,__format_get,return )

::String DateTools_obj::__format( ::Date d,::String f){
	HX_STACK_PUSH("DateTools::__format","/Users/Cristi/Documents/haxecompiler/haxe/std/DateTools.hx",87);
	HX_STACK_ARG(d,"d");
	HX_STACK_ARG(f,"f");
	HX_STACK_LINE(88)
	::StringBuf r = ::StringBuf_obj::__new();		HX_STACK_VAR(r,"r");
	HX_STACK_LINE(89)
	int p = (int)0;		HX_STACK_VAR(p,"p");
	HX_STACK_LINE(90)
	while((true)){
		HX_STACK_LINE(91)
		int np = f.indexOf(HX_CSTRING("%"),p);		HX_STACK_VAR(np,"np");
		HX_STACK_LINE(92)
		if (((np < (int)0))){
			HX_STACK_LINE(93)
			break;
		}
		HX_STACK_LINE(95)
		hx::IndexRef((r->b).mPtr,r->b->__Field(HX_CSTRING("length"),true)) = f.substr(p,(np - p));
		HX_STACK_LINE(96)
		hx::IndexRef((r->b).mPtr,r->b->__Field(HX_CSTRING("length"),true)) = ::DateTools_obj::__format_get(d,f.substr((np + (int)1),(int)1));
		HX_STACK_LINE(98)
		p = (np + (int)2);
	}
	HX_STACK_LINE(100)
	hx::IndexRef((r->b).mPtr,r->b->__Field(HX_CSTRING("length"),true)) = f.substr(p,(f.length - p));
	HX_STACK_LINE(101)
	return r->b->__Field(HX_CSTRING("join"),true)(HX_CSTRING(""));
}


STATIC_HX_DEFINE_DYNAMIC_FUNC2(DateTools_obj,__format,return )

::String DateTools_obj::format( ::Date d,::String f){
	HX_STACK_PUSH("DateTools::format","/Users/Cristi/Documents/haxecompiler/haxe/std/DateTools.hx",112);
	HX_STACK_ARG(d,"d");
	HX_STACK_ARG(f,"f");
	HX_STACK_LINE(112)
	return ::DateTools_obj::__format(d,f);
}


STATIC_HX_DEFINE_DYNAMIC_FUNC2(DateTools_obj,format,return )

::Date DateTools_obj::delta( ::Date d,Float t){
	HX_STACK_PUSH("DateTools::delta","/Users/Cristi/Documents/haxecompiler/haxe/std/DateTools.hx",125);
	HX_STACK_ARG(d,"d");
	HX_STACK_ARG(t,"t");
	HX_STACK_LINE(125)
	return ::Date_obj::fromTime((d->getTime() + t));
}


STATIC_HX_DEFINE_DYNAMIC_FUNC2(DateTools_obj,delta,return )

Array< int > DateTools_obj::DAYS_OF_MONTH;

int DateTools_obj::getMonthDays( ::Date d){
	HX_STACK_PUSH("DateTools::getMonthDays","/Users/Cristi/Documents/haxecompiler/haxe/std/DateTools.hx",134);
	HX_STACK_ARG(d,"d");
	HX_STACK_LINE(135)
	int month = d->getMonth();		HX_STACK_VAR(month,"month");
	HX_STACK_LINE(136)
	int year = d->getFullYear();		HX_STACK_VAR(year,"year");
	HX_STACK_LINE(138)
	if (((month != (int)1))){
		HX_STACK_LINE(139)
		return ::DateTools_obj::DAYS_OF_MONTH->__get(month);
	}
	HX_STACK_LINE(141)
	bool isB = (bool((bool((hx::Mod(year,(int)4) == (int)0)) && bool((hx::Mod(year,(int)100) != (int)0)))) || bool((hx::Mod(year,(int)400) == (int)0)));		HX_STACK_VAR(isB,"isB");
	HX_STACK_LINE(142)
	return (  ((isB)) ? int((int)29) : int((int)28) );
}


STATIC_HX_DEFINE_DYNAMIC_FUNC1(DateTools_obj,getMonthDays,return )

Float DateTools_obj::seconds( Float n){
	HX_STACK_PUSH("DateTools::seconds","/Users/Cristi/Documents/haxecompiler/haxe/std/DateTools.hx",148);
	HX_STACK_ARG(n,"n");
	HX_STACK_LINE(148)
	return (n * 1000.0);
}


STATIC_HX_DEFINE_DYNAMIC_FUNC1(DateTools_obj,seconds,return )

Float DateTools_obj::minutes( Float n){
	HX_STACK_PUSH("DateTools::minutes","/Users/Cristi/Documents/haxecompiler/haxe/std/DateTools.hx",155);
	HX_STACK_ARG(n,"n");
	HX_STACK_LINE(155)
	return ((n * 60.0) * 1000.0);
}


STATIC_HX_DEFINE_DYNAMIC_FUNC1(DateTools_obj,minutes,return )

Float DateTools_obj::hours( Float n){
	HX_STACK_PUSH("DateTools::hours","/Users/Cristi/Documents/haxecompiler/haxe/std/DateTools.hx",162);
	HX_STACK_ARG(n,"n");
	HX_STACK_LINE(162)
	return (((n * 60.0) * 60.0) * 1000.0);
}


STATIC_HX_DEFINE_DYNAMIC_FUNC1(DateTools_obj,hours,return )

Float DateTools_obj::days( Float n){
	HX_STACK_PUSH("DateTools::days","/Users/Cristi/Documents/haxecompiler/haxe/std/DateTools.hx",169);
	HX_STACK_ARG(n,"n");
	HX_STACK_LINE(169)
	return ((((n * 24.0) * 60.0) * 60.0) * 1000.0);
}


STATIC_HX_DEFINE_DYNAMIC_FUNC1(DateTools_obj,days,return )

Dynamic DateTools_obj::parse( Float t){
	HX_STACK_PUSH("DateTools::parse","/Users/Cristi/Documents/haxecompiler/haxe/std/DateTools.hx",176);
	HX_STACK_ARG(t,"t");
	HX_STACK_LINE(177)
	Float s = (Float(t) / Float((int)1000));		HX_STACK_VAR(s,"s");
	HX_STACK_LINE(178)
	Float m = (Float(s) / Float((int)60));		HX_STACK_VAR(m,"m");
	HX_STACK_LINE(179)
	Float h = (Float(m) / Float((int)60));		HX_STACK_VAR(h,"h");
	struct _Function_1_1{
		inline static Dynamic Block( Float &t,Float &h,Float &s,Float &m){
			HX_STACK_PUSH("*::closure","/Users/Cristi/Documents/haxecompiler/haxe/std/DateTools.hx",180);
			{
				hx::Anon __result = hx::Anon_obj::Create();
				__result->Add(HX_CSTRING("ms") , hx::Mod(t,(int)1000),false);
				__result->Add(HX_CSTRING("seconds") , ::Std_obj::_int(hx::Mod(s,(int)60)),false);
				__result->Add(HX_CSTRING("minutes") , ::Std_obj::_int(hx::Mod(m,(int)60)),false);
				__result->Add(HX_CSTRING("hours") , ::Std_obj::_int(hx::Mod(h,(int)24)),false);
				__result->Add(HX_CSTRING("days") , ::Std_obj::_int((Float(h) / Float((int)24))),false);
				return __result;
			}
			return null();
		}
	};
	HX_STACK_LINE(180)
	return _Function_1_1::Block(t,h,s,m);
}


STATIC_HX_DEFINE_DYNAMIC_FUNC1(DateTools_obj,parse,return )

Float DateTools_obj::make( Dynamic o){
	HX_STACK_PUSH("DateTools::make","/Users/Cristi/Documents/haxecompiler/haxe/std/DateTools.hx",192);
	HX_STACK_ARG(o,"o");
	HX_STACK_LINE(192)
	return (o->__Field(HX_CSTRING("ms"),true) + (1000.0 * ((o->__Field(HX_CSTRING("seconds"),true) + (60.0 * ((o->__Field(HX_CSTRING("minutes"),true) + (60.0 * ((o->__Field(HX_CSTRING("hours"),true) + (24.0 * o->__Field(HX_CSTRING("days"),true))))))))))));
}


STATIC_HX_DEFINE_DYNAMIC_FUNC1(DateTools_obj,make,return )


DateTools_obj::DateTools_obj()
{
}

void DateTools_obj::__Mark(HX_MARK_PARAMS)
{
	HX_MARK_BEGIN_CLASS(DateTools);
	HX_MARK_END_CLASS();
}

void DateTools_obj::__Visit(HX_VISIT_PARAMS)
{
}

Dynamic DateTools_obj::__Field(const ::String &inName,bool inCallProp)
{
	switch(inName.length) {
	case 4:
		if (HX_FIELD_EQ(inName,"days") ) { return days_dyn(); }
		if (HX_FIELD_EQ(inName,"make") ) { return make_dyn(); }
		break;
	case 5:
		if (HX_FIELD_EQ(inName,"delta") ) { return delta_dyn(); }
		if (HX_FIELD_EQ(inName,"hours") ) { return hours_dyn(); }
		if (HX_FIELD_EQ(inName,"parse") ) { return parse_dyn(); }
		break;
	case 6:
		if (HX_FIELD_EQ(inName,"format") ) { return format_dyn(); }
		break;
	case 7:
		if (HX_FIELD_EQ(inName,"seconds") ) { return seconds_dyn(); }
		if (HX_FIELD_EQ(inName,"minutes") ) { return minutes_dyn(); }
		break;
	case 8:
		if (HX_FIELD_EQ(inName,"__format") ) { return __format_dyn(); }
		break;
	case 12:
		if (HX_FIELD_EQ(inName,"__format_get") ) { return __format_get_dyn(); }
		if (HX_FIELD_EQ(inName,"getMonthDays") ) { return getMonthDays_dyn(); }
		break;
	case 13:
		if (HX_FIELD_EQ(inName,"DAYS_OF_MONTH") ) { return DAYS_OF_MONTH; }
	}
	return super::__Field(inName,inCallProp);
}

Dynamic DateTools_obj::__SetField(const ::String &inName,const Dynamic &inValue,bool inCallProp)
{
	switch(inName.length) {
	case 13:
		if (HX_FIELD_EQ(inName,"DAYS_OF_MONTH") ) { DAYS_OF_MONTH=inValue.Cast< Array< int > >(); return inValue; }
	}
	return super::__SetField(inName,inValue,inCallProp);
}

void DateTools_obj::__GetFields(Array< ::String> &outFields)
{
	super::__GetFields(outFields);
};

static ::String sStaticFields[] = {
	HX_CSTRING("__format_get"),
	HX_CSTRING("__format"),
	HX_CSTRING("format"),
	HX_CSTRING("delta"),
	HX_CSTRING("DAYS_OF_MONTH"),
	HX_CSTRING("getMonthDays"),
	HX_CSTRING("seconds"),
	HX_CSTRING("minutes"),
	HX_CSTRING("hours"),
	HX_CSTRING("days"),
	HX_CSTRING("parse"),
	HX_CSTRING("make"),
	String(null()) };

static ::String sMemberFields[] = {
	String(null()) };

static void sMarkStatics(HX_MARK_PARAMS) {
	HX_MARK_MEMBER_NAME(DateTools_obj::__mClass,"__mClass");
	HX_MARK_MEMBER_NAME(DateTools_obj::DAYS_OF_MONTH,"DAYS_OF_MONTH");
};

static void sVisitStatics(HX_VISIT_PARAMS) {
	HX_VISIT_MEMBER_NAME(DateTools_obj::__mClass,"__mClass");
	HX_VISIT_MEMBER_NAME(DateTools_obj::DAYS_OF_MONTH,"DAYS_OF_MONTH");
};

Class DateTools_obj::__mClass;

void DateTools_obj::__register()
{
	hx::Static(__mClass) = hx::RegisterClass(HX_CSTRING("DateTools"), hx::TCanCast< DateTools_obj> ,sStaticFields,sMemberFields,
	&__CreateEmpty, &__Create,
	&super::__SGetClass(), 0, sMarkStatics, sVisitStatics);
}

void DateTools_obj::__boot()
{
	DAYS_OF_MONTH= Array_obj< int >::__new().Add((int)31).Add((int)28).Add((int)31).Add((int)30).Add((int)31).Add((int)30).Add((int)31).Add((int)31).Add((int)30).Add((int)31).Add((int)30).Add((int)31);
}

