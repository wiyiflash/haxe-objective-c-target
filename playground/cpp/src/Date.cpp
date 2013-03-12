#include <hxcpp.h>

#ifndef INCLUDED_Date
#include <Date.h>
#endif
#ifndef INCLUDED_Std
#include <Std.h>
#endif

Void Date_obj::__construct(int year,int month,int day,int hour,int min,int sec)
{
HX_STACK_PUSH("Date::new","/Users/Cristi/Documents/haxecompiler/haxe/std/cpp/_std/Date.hx",26);
{
	HX_STACK_LINE(26)
	this->mSeconds = ::__hxcpp_new_date(year,month,day,hour,min,sec);
}
;
	return null();
}

Date_obj::~Date_obj() { }

Dynamic Date_obj::__CreateEmpty() { return  new Date_obj; }
hx::ObjectPtr< Date_obj > Date_obj::__new(int year,int month,int day,int hour,int min,int sec)
{  hx::ObjectPtr< Date_obj > result = new Date_obj();
	result->__construct(year,month,day,hour,min,sec);
	return result;}

Dynamic Date_obj::__Create(hx::DynamicArray inArgs)
{  hx::ObjectPtr< Date_obj > result = new Date_obj();
	result->__construct(inArgs[0],inArgs[1],inArgs[2],inArgs[3],inArgs[4],inArgs[5]);
	return result;}

::String Date_obj::toString( ){
	HX_STACK_PUSH("Date::toString","/Users/Cristi/Documents/haxecompiler/haxe/std/cpp/_std/Date.hx",48);
	HX_STACK_THIS(this);
	HX_STACK_LINE(48)
	return ::__hxcpp_to_string(this->mSeconds);
}


HX_DEFINE_DYNAMIC_FUNC0(Date_obj,toString,return )

int Date_obj::getDay( ){
	HX_STACK_PUSH("Date::getDay","/Users/Cristi/Documents/haxecompiler/haxe/std/cpp/_std/Date.hx",46);
	HX_STACK_THIS(this);
	HX_STACK_LINE(46)
	return ::__hxcpp_get_day(this->mSeconds);
}


HX_DEFINE_DYNAMIC_FUNC0(Date_obj,getDay,return )

int Date_obj::getDate( ){
	HX_STACK_PUSH("Date::getDate","/Users/Cristi/Documents/haxecompiler/haxe/std/cpp/_std/Date.hx",44);
	HX_STACK_THIS(this);
	HX_STACK_LINE(44)
	return ::__hxcpp_get_date(this->mSeconds);
}


HX_DEFINE_DYNAMIC_FUNC0(Date_obj,getDate,return )

int Date_obj::getMonth( ){
	HX_STACK_PUSH("Date::getMonth","/Users/Cristi/Documents/haxecompiler/haxe/std/cpp/_std/Date.hx",42);
	HX_STACK_THIS(this);
	HX_STACK_LINE(42)
	return ::__hxcpp_get_month(this->mSeconds);
}


HX_DEFINE_DYNAMIC_FUNC0(Date_obj,getMonth,return )

int Date_obj::getFullYear( ){
	HX_STACK_PUSH("Date::getFullYear","/Users/Cristi/Documents/haxecompiler/haxe/std/cpp/_std/Date.hx",40);
	HX_STACK_THIS(this);
	HX_STACK_LINE(40)
	return ::__hxcpp_get_year(this->mSeconds);
}


HX_DEFINE_DYNAMIC_FUNC0(Date_obj,getFullYear,return )

int Date_obj::getSeconds( ){
	HX_STACK_PUSH("Date::getSeconds","/Users/Cristi/Documents/haxecompiler/haxe/std/cpp/_std/Date.hx",38);
	HX_STACK_THIS(this);
	HX_STACK_LINE(38)
	return ::__hxcpp_get_seconds(this->mSeconds);
}


HX_DEFINE_DYNAMIC_FUNC0(Date_obj,getSeconds,return )

int Date_obj::getMinutes( ){
	HX_STACK_PUSH("Date::getMinutes","/Users/Cristi/Documents/haxecompiler/haxe/std/cpp/_std/Date.hx",36);
	HX_STACK_THIS(this);
	HX_STACK_LINE(36)
	return ::__hxcpp_get_minutes(this->mSeconds);
}


HX_DEFINE_DYNAMIC_FUNC0(Date_obj,getMinutes,return )

int Date_obj::getHours( ){
	HX_STACK_PUSH("Date::getHours","/Users/Cristi/Documents/haxecompiler/haxe/std/cpp/_std/Date.hx",34);
	HX_STACK_THIS(this);
	HX_STACK_LINE(34)
	return ::__hxcpp_get_hours(this->mSeconds);
}


HX_DEFINE_DYNAMIC_FUNC0(Date_obj,getHours,return )

Float Date_obj::getTime( ){
	HX_STACK_PUSH("Date::getTime","/Users/Cristi/Documents/haxecompiler/haxe/std/cpp/_std/Date.hx",30);
	HX_STACK_THIS(this);
	HX_STACK_LINE(30)
	return (this->mSeconds * 1000.0);
}


HX_DEFINE_DYNAMIC_FUNC0(Date_obj,getTime,return )

::Date Date_obj::now( ){
	HX_STACK_PUSH("Date::now","/Users/Cristi/Documents/haxecompiler/haxe/std/cpp/_std/Date.hx",50);
	HX_STACK_LINE(50)
	return ::Date_obj::fromTime((::__hxcpp_date_now() * 1000.0));
}


STATIC_HX_DEFINE_DYNAMIC_FUNC0(Date_obj,now,return )

::Date Date_obj::fromTime( Float t){
	HX_STACK_PUSH("Date::fromTime","/Users/Cristi/Documents/haxecompiler/haxe/std/cpp/_std/Date.hx",54);
	HX_STACK_ARG(t,"t");
	HX_STACK_LINE(55)
	::Date result = ::Date_obj::__new((int)0,(int)0,(int)0,(int)0,(int)0,(int)0);		HX_STACK_VAR(result,"result");
	HX_STACK_LINE(56)
	result->mSeconds = (t * 0.001);
	HX_STACK_LINE(57)
	return result;
}


STATIC_HX_DEFINE_DYNAMIC_FUNC1(Date_obj,fromTime,return )

::Date Date_obj::fromString( ::String s){
	HX_STACK_PUSH("Date::fromString","/Users/Cristi/Documents/haxecompiler/haxe/std/cpp/_std/Date.hx",60);
	HX_STACK_ARG(s,"s");
	HX_STACK_LINE(61)
	switch( (int)(s.length)){
		case (int)8: {
			HX_STACK_LINE(63)
			Array< ::String > k = s.split(HX_CSTRING(":"));		HX_STACK_VAR(k,"k");
			HX_STACK_LINE(64)
			::Date d = ::Date_obj::__new((int)0,(int)0,(int)0,::Std_obj::parseInt(k->__get((int)0)),::Std_obj::parseInt(k->__get((int)1)),::Std_obj::parseInt(k->__get((int)2)));		HX_STACK_VAR(d,"d");
			HX_STACK_LINE(65)
			return d;
		}
		;break;
		case (int)10: {
			HX_STACK_LINE(67)
			Array< ::String > k = s.split(HX_CSTRING("-"));		HX_STACK_VAR(k,"k");
			HX_STACK_LINE(68)
			return ::Date_obj::__new(::Std_obj::parseInt(k->__get((int)0)),(::Std_obj::parseInt(k->__get((int)1)) - (int)1),::Std_obj::parseInt(k->__get((int)2)),(int)0,(int)0,(int)0);
		}
		;break;
		case (int)19: {
			HX_STACK_LINE(70)
			Array< ::String > k = s.split(HX_CSTRING(" "));		HX_STACK_VAR(k,"k");
			HX_STACK_LINE(71)
			Array< ::String > y = k->__get((int)0).split(HX_CSTRING("-"));		HX_STACK_VAR(y,"y");
			HX_STACK_LINE(72)
			Array< ::String > t = k->__get((int)1).split(HX_CSTRING(":"));		HX_STACK_VAR(t,"t");
			HX_STACK_LINE(73)
			return ::Date_obj::__new(::Std_obj::parseInt(y->__get((int)0)),(::Std_obj::parseInt(y->__get((int)1)) - (int)1),::Std_obj::parseInt(y->__get((int)2)),::Std_obj::parseInt(t->__get((int)0)),::Std_obj::parseInt(t->__get((int)1)),::Std_obj::parseInt(t->__get((int)2)));
		}
		;break;
		default: {
			HX_STACK_LINE(75)
			hx::Throw ((HX_CSTRING("Invalid date format : ") + s));
		}
	}
	HX_STACK_LINE(78)
	return null();
}


STATIC_HX_DEFINE_DYNAMIC_FUNC1(Date_obj,fromString,return )


Date_obj::Date_obj()
{
}

void Date_obj::__Mark(HX_MARK_PARAMS)
{
	HX_MARK_BEGIN_CLASS(Date);
	HX_MARK_MEMBER_NAME(mSeconds,"mSeconds");
	HX_MARK_END_CLASS();
}

void Date_obj::__Visit(HX_VISIT_PARAMS)
{
	HX_VISIT_MEMBER_NAME(mSeconds,"mSeconds");
}

Dynamic Date_obj::__Field(const ::String &inName,bool inCallProp)
{
	switch(inName.length) {
	case 3:
		if (HX_FIELD_EQ(inName,"now") ) { return now_dyn(); }
		break;
	case 6:
		if (HX_FIELD_EQ(inName,"getDay") ) { return getDay_dyn(); }
		break;
	case 7:
		if (HX_FIELD_EQ(inName,"getDate") ) { return getDate_dyn(); }
		if (HX_FIELD_EQ(inName,"getTime") ) { return getTime_dyn(); }
		break;
	case 8:
		if (HX_FIELD_EQ(inName,"fromTime") ) { return fromTime_dyn(); }
		if (HX_FIELD_EQ(inName,"toString") ) { return toString_dyn(); }
		if (HX_FIELD_EQ(inName,"getMonth") ) { return getMonth_dyn(); }
		if (HX_FIELD_EQ(inName,"getHours") ) { return getHours_dyn(); }
		if (HX_FIELD_EQ(inName,"mSeconds") ) { return mSeconds; }
		break;
	case 10:
		if (HX_FIELD_EQ(inName,"fromString") ) { return fromString_dyn(); }
		if (HX_FIELD_EQ(inName,"getSeconds") ) { return getSeconds_dyn(); }
		if (HX_FIELD_EQ(inName,"getMinutes") ) { return getMinutes_dyn(); }
		break;
	case 11:
		if (HX_FIELD_EQ(inName,"getFullYear") ) { return getFullYear_dyn(); }
	}
	return super::__Field(inName,inCallProp);
}

Dynamic Date_obj::__SetField(const ::String &inName,const Dynamic &inValue,bool inCallProp)
{
	switch(inName.length) {
	case 8:
		if (HX_FIELD_EQ(inName,"mSeconds") ) { mSeconds=inValue.Cast< Float >(); return inValue; }
	}
	return super::__SetField(inName,inValue,inCallProp);
}

void Date_obj::__GetFields(Array< ::String> &outFields)
{
	outFields->push(HX_CSTRING("mSeconds"));
	super::__GetFields(outFields);
};

static ::String sStaticFields[] = {
	HX_CSTRING("now"),
	HX_CSTRING("fromTime"),
	HX_CSTRING("fromString"),
	String(null()) };

static ::String sMemberFields[] = {
	HX_CSTRING("toString"),
	HX_CSTRING("getDay"),
	HX_CSTRING("getDate"),
	HX_CSTRING("getMonth"),
	HX_CSTRING("getFullYear"),
	HX_CSTRING("getSeconds"),
	HX_CSTRING("getMinutes"),
	HX_CSTRING("getHours"),
	HX_CSTRING("getTime"),
	HX_CSTRING("mSeconds"),
	String(null()) };

static void sMarkStatics(HX_MARK_PARAMS) {
	HX_MARK_MEMBER_NAME(Date_obj::__mClass,"__mClass");
};

static void sVisitStatics(HX_VISIT_PARAMS) {
	HX_VISIT_MEMBER_NAME(Date_obj::__mClass,"__mClass");
};

Class Date_obj::__mClass;

void Date_obj::__register()
{
	hx::Static(__mClass) = hx::RegisterClass(HX_CSTRING("Date"), hx::TCanCast< Date_obj> ,sStaticFields,sMemberFields,
	&__CreateEmpty, &__Create,
	&super::__SGetClass(), 0, sMarkStatics, sVisitStatics);
}

void Date_obj::__boot()
{
}

