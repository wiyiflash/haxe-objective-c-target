#include <hxcpp.h>

#ifndef INCLUDED_Interface2
#include <Interface2.h>
#endif

HX_DEFINE_DYNAMIC_FUNC2(Interface2_obj,minus,return )


static void sMarkStatics(HX_MARK_PARAMS) {
	HX_MARK_MEMBER_NAME(Interface2_obj::__mClass,"__mClass");
};

static void sVisitStatics(HX_VISIT_PARAMS) {
	HX_VISIT_MEMBER_NAME(Interface2_obj::__mClass,"__mClass");
};

Class Interface2_obj::__mClass;

void Interface2_obj::__register()
{
	hx::Static(__mClass) = hx::RegisterClass(HX_CSTRING("Interface2"), hx::TCanCast< Interface2_obj> ,0,0,
	0, 0,
	&super::__SGetClass(), 0, sMarkStatics, sVisitStatics);
}

void Interface2_obj::__boot()
{
}

