#include <hxcpp.h>

#ifndef INCLUDED__Tests3_Color
#include <_Tests3/Color.h>
#endif
namespace _Tests3{

::_Tests3::Color Color_obj::Blue;

::_Tests3::Color Color_obj::Green;

::_Tests3::Color Color_obj::Red;

HX_DEFINE_CREATE_ENUM(Color_obj)

int Color_obj::__FindIndex(::String inName)
{
	if (inName==HX_CSTRING("Blue")) return 2;
	if (inName==HX_CSTRING("Green")) return 1;
	if (inName==HX_CSTRING("Red")) return 0;
	return super::__FindIndex(inName);
}

int Color_obj::__FindArgCount(::String inName)
{
	if (inName==HX_CSTRING("Blue")) return 0;
	if (inName==HX_CSTRING("Green")) return 0;
	if (inName==HX_CSTRING("Red")) return 0;
	return super::__FindArgCount(inName);
}

Dynamic Color_obj::__Field(const ::String &inName,bool inCallProp)
{
	if (inName==HX_CSTRING("Blue")) return Blue;
	if (inName==HX_CSTRING("Green")) return Green;
	if (inName==HX_CSTRING("Red")) return Red;
	return super::__Field(inName,inCallProp);
}

static ::String sStaticFields[] = {
	HX_CSTRING("Red"),
	HX_CSTRING("Green"),
	HX_CSTRING("Blue"),
	::String(null()) };

static void sMarkStatics(HX_MARK_PARAMS) {
	HX_MARK_MEMBER_NAME(Color_obj::Blue,"Blue");
	HX_MARK_MEMBER_NAME(Color_obj::Green,"Green");
	HX_MARK_MEMBER_NAME(Color_obj::Red,"Red");
};

static void sVisitStatic(HX_VISIT_PARAMS) {
	HX_VISIT_MEMBER_NAME(Color_obj::__mClass,"__mClass");
	HX_VISIT_MEMBER_NAME(Color_obj::Blue,"Blue");
	HX_VISIT_MEMBER_NAME(Color_obj::Green,"Green");
	HX_VISIT_MEMBER_NAME(Color_obj::Red,"Red");
};

static ::String sMemberFields[] = { ::String(null()) };
Class Color_obj::__mClass;

Dynamic __Create_Color_obj() { return new Color_obj; }

void Color_obj::__register()
{

hx::Static(__mClass) = hx::RegisterClass(HX_CSTRING("_Tests3.Color"), hx::TCanCast< Color_obj >,sStaticFields,sMemberFields,
	&__Create_Color_obj, &__Create,
	&super::__SGetClass(), &CreateColor_obj, sMarkStatics, sVisitStatic);
}

void Color_obj::__boot()
{
hx::Static(Blue) = hx::CreateEnum< Color_obj >(HX_CSTRING("Blue"),2);
hx::Static(Green) = hx::CreateEnum< Color_obj >(HX_CSTRING("Green"),1);
hx::Static(Red) = hx::CreateEnum< Color_obj >(HX_CSTRING("Red"),0);
}


} // end namespace _Tests3
