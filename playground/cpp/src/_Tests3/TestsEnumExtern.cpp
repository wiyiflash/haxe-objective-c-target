#include <hxcpp.h>

#ifndef INCLUDED__Tests3_TestsEnumExtern
#include <_Tests3/TestsEnumExtern.h>
#endif
namespace _Tests3{

::_Tests3::TestsEnumExtern TestsEnumExtern_obj::ExternEnumValue1;

::_Tests3::TestsEnumExtern TestsEnumExtern_obj::ExternEnumValue2;

::_Tests3::TestsEnumExtern TestsEnumExtern_obj::ExternEnumValue3;

HX_DEFINE_CREATE_ENUM(TestsEnumExtern_obj)

int TestsEnumExtern_obj::__FindIndex(::String inName)
{
	if (inName==HX_CSTRING("ExternEnumValue1")) return 0;
	if (inName==HX_CSTRING("ExternEnumValue2")) return 1;
	if (inName==HX_CSTRING("ExternEnumValue3")) return 2;
	return super::__FindIndex(inName);
}

int TestsEnumExtern_obj::__FindArgCount(::String inName)
{
	if (inName==HX_CSTRING("ExternEnumValue1")) return 0;
	if (inName==HX_CSTRING("ExternEnumValue2")) return 0;
	if (inName==HX_CSTRING("ExternEnumValue3")) return 0;
	return super::__FindArgCount(inName);
}

Dynamic TestsEnumExtern_obj::__Field(const ::String &inName,bool inCallProp)
{
	if (inName==HX_CSTRING("ExternEnumValue1")) return ExternEnumValue1;
	if (inName==HX_CSTRING("ExternEnumValue2")) return ExternEnumValue2;
	if (inName==HX_CSTRING("ExternEnumValue3")) return ExternEnumValue3;
	return super::__Field(inName,inCallProp);
}

static ::String sStaticFields[] = {
	HX_CSTRING("ExternEnumValue1"),
	HX_CSTRING("ExternEnumValue2"),
	HX_CSTRING("ExternEnumValue3"),
	::String(null()) };

static void sMarkStatics(HX_MARK_PARAMS) {
	HX_MARK_MEMBER_NAME(TestsEnumExtern_obj::ExternEnumValue1,"ExternEnumValue1");
	HX_MARK_MEMBER_NAME(TestsEnumExtern_obj::ExternEnumValue2,"ExternEnumValue2");
	HX_MARK_MEMBER_NAME(TestsEnumExtern_obj::ExternEnumValue3,"ExternEnumValue3");
};

static void sVisitStatic(HX_VISIT_PARAMS) {
	HX_VISIT_MEMBER_NAME(TestsEnumExtern_obj::__mClass,"__mClass");
	HX_VISIT_MEMBER_NAME(TestsEnumExtern_obj::ExternEnumValue1,"ExternEnumValue1");
	HX_VISIT_MEMBER_NAME(TestsEnumExtern_obj::ExternEnumValue2,"ExternEnumValue2");
	HX_VISIT_MEMBER_NAME(TestsEnumExtern_obj::ExternEnumValue3,"ExternEnumValue3");
};

static ::String sMemberFields[] = { ::String(null()) };
Class TestsEnumExtern_obj::__mClass;

Dynamic __Create_TestsEnumExtern_obj() { return new TestsEnumExtern_obj; }

void TestsEnumExtern_obj::__register()
{

hx::Static(__mClass) = hx::RegisterClass(HX_CSTRING("_Tests3.TestsEnumExtern"), hx::TCanCast< TestsEnumExtern_obj >,sStaticFields,sMemberFields,
	&__Create_TestsEnumExtern_obj, &__Create,
	&super::__SGetClass(), &CreateTestsEnumExtern_obj, sMarkStatics, sVisitStatic);
}

void TestsEnumExtern_obj::__boot()
{
hx::Static(ExternEnumValue1) = hx::CreateEnum< TestsEnumExtern_obj >(HX_CSTRING("ExternEnumValue1"),0);
hx::Static(ExternEnumValue2) = hx::CreateEnum< TestsEnumExtern_obj >(HX_CSTRING("ExternEnumValue2"),1);
hx::Static(ExternEnumValue3) = hx::CreateEnum< TestsEnumExtern_obj >(HX_CSTRING("ExternEnumValue3"),2);
}


} // end namespace _Tests3
