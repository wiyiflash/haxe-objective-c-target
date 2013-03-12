#include <hxcpp.h>

#ifndef INCLUDED_Color
#include <Color.h>
#endif

::Color  Color_obj::Alpha(int a,::Color col)
	{ return hx::CreateEnum< Color_obj >(HX_CSTRING("Alpha"),5,hx::DynamicArray(0,2).Add(a).Add(col)); }

::Color Color_obj::Blue;

::Color Color_obj::Green;

::Color  Color_obj::Grey(int v)
	{ return hx::CreateEnum< Color_obj >(HX_CSTRING("Grey"),3,hx::DynamicArray(0,1).Add(v)); }

::Color Color_obj::Red;

::Color  Color_obj::Rgb(int r,int g,int b)
	{ return hx::CreateEnum< Color_obj >(HX_CSTRING("Rgb"),4,hx::DynamicArray(0,3).Add(r).Add(g).Add(b)); }

HX_DEFINE_CREATE_ENUM(Color_obj)

int Color_obj::__FindIndex(::String inName)
{
	if (inName==HX_CSTRING("Alpha")) return 5;
	if (inName==HX_CSTRING("Blue")) return 2;
	if (inName==HX_CSTRING("Green")) return 1;
	if (inName==HX_CSTRING("Grey")) return 3;
	if (inName==HX_CSTRING("Red")) return 0;
	if (inName==HX_CSTRING("Rgb")) return 4;
	return super::__FindIndex(inName);
}

STATIC_HX_DEFINE_DYNAMIC_FUNC2(Color_obj,Alpha,return)

STATIC_HX_DEFINE_DYNAMIC_FUNC1(Color_obj,Grey,return)

STATIC_HX_DEFINE_DYNAMIC_FUNC3(Color_obj,Rgb,return)

int Color_obj::__FindArgCount(::String inName)
{
	if (inName==HX_CSTRING("Alpha")) return 2;
	if (inName==HX_CSTRING("Blue")) return 0;
	if (inName==HX_CSTRING("Green")) return 0;
	if (inName==HX_CSTRING("Grey")) return 1;
	if (inName==HX_CSTRING("Red")) return 0;
	if (inName==HX_CSTRING("Rgb")) return 3;
	return super::__FindArgCount(inName);
}

Dynamic Color_obj::__Field(const ::String &inName,bool inCallProp)
{
	if (inName==HX_CSTRING("Alpha")) return Alpha_dyn();
	if (inName==HX_CSTRING("Blue")) return Blue;
	if (inName==HX_CSTRING("Green")) return Green;
	if (inName==HX_CSTRING("Grey")) return Grey_dyn();
	if (inName==HX_CSTRING("Red")) return Red;
	if (inName==HX_CSTRING("Rgb")) return Rgb_dyn();
	return super::__Field(inName,inCallProp);
}

static ::String sStaticFields[] = {
	HX_CSTRING("Red"),
	HX_CSTRING("Green"),
	HX_CSTRING("Blue"),
	HX_CSTRING("Grey"),
	HX_CSTRING("Rgb"),
	HX_CSTRING("Alpha"),
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

hx::Static(__mClass) = hx::RegisterClass(HX_CSTRING("Color"), hx::TCanCast< Color_obj >,sStaticFields,sMemberFields,
	&__Create_Color_obj, &__Create,
	&super::__SGetClass(), &CreateColor_obj, sMarkStatics, sVisitStatic);
}

void Color_obj::__boot()
{
hx::Static(Blue) = hx::CreateEnum< Color_obj >(HX_CSTRING("Blue"),2);
hx::Static(Green) = hx::CreateEnum< Color_obj >(HX_CSTRING("Green"),1);
hx::Static(Red) = hx::CreateEnum< Color_obj >(HX_CSTRING("Red"),0);
}


