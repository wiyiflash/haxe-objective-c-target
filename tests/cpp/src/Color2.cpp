#include <hxcpp.h>

#ifndef INCLUDED_Color2
#include <Color2.h>
#endif

::Color2 Color2_obj::Blue2;

::Color2 Color2_obj::Green2;

::Color2 Color2_obj::Red2;

HX_DEFINE_CREATE_ENUM(Color2_obj)

int Color2_obj::__FindIndex(::String inName)
{
	if (inName==HX_CSTRING("Blue2")) return 2;
	if (inName==HX_CSTRING("Green2")) return 1;
	if (inName==HX_CSTRING("Red2")) return 0;
	return super::__FindIndex(inName);
}

int Color2_obj::__FindArgCount(::String inName)
{
	if (inName==HX_CSTRING("Blue2")) return 0;
	if (inName==HX_CSTRING("Green2")) return 0;
	if (inName==HX_CSTRING("Red2")) return 0;
	return super::__FindArgCount(inName);
}

Dynamic Color2_obj::__Field(const ::String &inName,bool inCallProp)
{
	if (inName==HX_CSTRING("Blue2")) return Blue2;
	if (inName==HX_CSTRING("Green2")) return Green2;
	if (inName==HX_CSTRING("Red2")) return Red2;
	return super::__Field(inName,inCallProp);
}

static ::String sStaticFields[] = {
	HX_CSTRING("Red2"),
	HX_CSTRING("Green2"),
	HX_CSTRING("Blue2"),
	::String(null()) };

static void sMarkStatics(HX_MARK_PARAMS) {
	HX_MARK_MEMBER_NAME(Color2_obj::Blue2,"Blue2");
	HX_MARK_MEMBER_NAME(Color2_obj::Green2,"Green2");
	HX_MARK_MEMBER_NAME(Color2_obj::Red2,"Red2");
};

static void sVisitStatic(HX_VISIT_PARAMS) {
	HX_VISIT_MEMBER_NAME(Color2_obj::__mClass,"__mClass");
	HX_VISIT_MEMBER_NAME(Color2_obj::Blue2,"Blue2");
	HX_VISIT_MEMBER_NAME(Color2_obj::Green2,"Green2");
	HX_VISIT_MEMBER_NAME(Color2_obj::Red2,"Red2");
};

static ::String sMemberFields[] = { ::String(null()) };
Class Color2_obj::__mClass;

Dynamic __Create_Color2_obj() { return new Color2_obj; }

void Color2_obj::__register()
{

hx::Static(__mClass) = hx::RegisterClass(HX_CSTRING("Color2"), hx::TCanCast< Color2_obj >,sStaticFields,sMemberFields,
	&__Create_Color2_obj, &__Create,
	&super::__SGetClass(), &CreateColor2_obj, sMarkStatics, sVisitStatic);
}

void Color2_obj::__boot()
{
hx::Static(Blue2) = hx::CreateEnum< Color2_obj >(HX_CSTRING("Blue2"),2);
hx::Static(Green2) = hx::CreateEnum< Color2_obj >(HX_CSTRING("Green2"),1);
hx::Static(Red2) = hx::CreateEnum< Color2_obj >(HX_CSTRING("Red2"),0);
}


