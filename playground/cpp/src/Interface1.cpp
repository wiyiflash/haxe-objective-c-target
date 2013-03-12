#include <hxcpp.h>

#ifndef INCLUDED_Interface1
#include <Interface1.h>
#endif

HX_DEFINE_DYNAMIC_FUNC2(Interface1_obj,add,return )


static void sMarkStatics(HX_MARK_PARAMS) {
	HX_MARK_MEMBER_NAME(Interface1_obj::__mClass,"__mClass");
};

static void sVisitStatics(HX_VISIT_PARAMS) {
	HX_VISIT_MEMBER_NAME(Interface1_obj::__mClass,"__mClass");
};

Class Interface1_obj::__mClass;

void Interface1_obj::__register()
{
	hx::Static(__mClass) = hx::RegisterClass(HX_CSTRING("Interface1"), hx::TCanCast< Interface1_obj> ,0,0,
	0, 0,
	&super::__SGetClass(), 0, sMarkStatics, sVisitStatics);
}

void Interface1_obj::__boot()
{
}

