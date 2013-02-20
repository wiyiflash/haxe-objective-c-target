#include <hxcpp.h>

#ifndef INCLUDED_Tests3
#include <Tests3.h>
#endif

Void Tests3_obj::__construct()
{
HX_STACK_PUSH("Tests3::new","Tests3.hx",12);
{
	HX_STACK_LINE(13)
	this->d1 = (int)34;
}
;
	return null();
}

Tests3_obj::~Tests3_obj() { }

Dynamic Tests3_obj::__CreateEmpty() { return  new Tests3_obj; }
hx::ObjectPtr< Tests3_obj > Tests3_obj::__new()
{  hx::ObjectPtr< Tests3_obj > result = new Tests3_obj();
	result->__construct();
	return result;}

Dynamic Tests3_obj::__Create(hx::DynamicArray inArgs)
{  hx::ObjectPtr< Tests3_obj > result = new Tests3_obj();
	result->__construct();
	return result;}


Tests3_obj::Tests3_obj()
{
}

void Tests3_obj::__Mark(HX_MARK_PARAMS)
{
	HX_MARK_BEGIN_CLASS(Tests3);
	HX_MARK_MEMBER_NAME(d1,"d1");
	HX_MARK_END_CLASS();
}

void Tests3_obj::__Visit(HX_VISIT_PARAMS)
{
	HX_VISIT_MEMBER_NAME(d1,"d1");
}

Dynamic Tests3_obj::__Field(const ::String &inName,bool inCallProp)
{
	switch(inName.length) {
	case 2:
		if (HX_FIELD_EQ(inName,"d1") ) { return d1; }
	}
	return super::__Field(inName,inCallProp);
}

Dynamic Tests3_obj::__SetField(const ::String &inName,const Dynamic &inValue,bool inCallProp)
{
	switch(inName.length) {
	case 2:
		if (HX_FIELD_EQ(inName,"d1") ) { d1=inValue.Cast< int >(); return inValue; }
	}
	return super::__SetField(inName,inValue,inCallProp);
}

void Tests3_obj::__GetFields(Array< ::String> &outFields)
{
	outFields->push(HX_CSTRING("d1"));
	super::__GetFields(outFields);
};

static ::String sStaticFields[] = {
	String(null()) };

static ::String sMemberFields[] = {
	HX_CSTRING("d1"),
	String(null()) };

static void sMarkStatics(HX_MARK_PARAMS) {
	HX_MARK_MEMBER_NAME(Tests3_obj::__mClass,"__mClass");
};

static void sVisitStatics(HX_VISIT_PARAMS) {
	HX_VISIT_MEMBER_NAME(Tests3_obj::__mClass,"__mClass");
};

Class Tests3_obj::__mClass;

void Tests3_obj::__register()
{
	hx::Static(__mClass) = hx::RegisterClass(HX_CSTRING("Tests3"), hx::TCanCast< Tests3_obj> ,sStaticFields,sMemberFields,
	&__CreateEmpty, &__Create,
	&super::__SGetClass(), 0, sMarkStatics, sVisitStatics);
}

void Tests3_obj::__boot()
{
}

