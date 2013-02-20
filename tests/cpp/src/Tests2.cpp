#include <hxcpp.h>

#ifndef INCLUDED_Tests2
#include <Tests2.h>
#endif
#ifndef INCLUDED_haxe_Log
#include <haxe/Log.h>
#endif

Void Tests2_obj::__construct()
{
HX_STACK_PUSH("Tests2::new","Tests.hx",616);
{
	HX_STACK_LINE(617)
	this->d1 = (int)34;
	HX_STACK_LINE(618)
	Array< int > arr = Array_obj< int >::__new().Add(this->d1).Add(this->d1).Add((int)50);		HX_STACK_VAR(arr,"arr");
}
;
	return null();
}

Tests2_obj::~Tests2_obj() { }

Dynamic Tests2_obj::__CreateEmpty() { return  new Tests2_obj; }
hx::ObjectPtr< Tests2_obj > Tests2_obj::__new()
{  hx::ObjectPtr< Tests2_obj > result = new Tests2_obj();
	result->__construct();
	return result;}

Dynamic Tests2_obj::__Create(hx::DynamicArray inArgs)
{  hx::ObjectPtr< Tests2_obj > result = new Tests2_obj();
	result->__construct();
	return result;}

HX_BEGIN_DEFAULT_FUNC(__default_functionToRedefine2,Tests2_obj)
Void run(int param1,::String param2){
{
		HX_STACK_PUSH("Tests2::functionToRedefine2","Tests.hx",628);
		HX_STACK_THIS(this);
		HX_STACK_ARG(param1,"param1");
		HX_STACK_ARG(param2,"param2");
	}
return null();
}
HX_END_LOCAL_FUNC2((void))
HX_END_DEFAULT_FUNC

HX_BEGIN_DEFAULT_FUNC(__default_functionToRedefine,Tests2_obj)
Void run(){
{
		HX_STACK_PUSH("Tests2::functionToRedefine","Tests.hx",625);
		HX_STACK_THIS(this);
		HX_STACK_LINE(625)
		::haxe::Log_obj::trace(HX_CSTRING("originally do something"),hx::SourceInfo(HX_CSTRING("Tests.hx"),626,HX_CSTRING("Tests2"),HX_CSTRING("functionToRedefine")));
	}
return null();
}
HX_END_LOCAL_FUNC0((void))
HX_END_DEFAULT_FUNC

Void Tests2_obj::methodInTests2( ){
{
		HX_STACK_PUSH("Tests2::methodInTests2","Tests.hx",621);
		HX_STACK_THIS(this);
		HX_STACK_LINE(622)
		this->functionToRedefine();
		HX_STACK_LINE(623)
		this->functionToRedefine2((int)0,HX_CSTRING("00"));
	}
return null();
}


HX_DEFINE_DYNAMIC_FUNC0(Tests2_obj,methodInTests2,(void))


Tests2_obj::Tests2_obj()
{
	functionToRedefine2 = new __default_functionToRedefine2(this);
	functionToRedefine = new __default_functionToRedefine(this);
}

void Tests2_obj::__Mark(HX_MARK_PARAMS)
{
	HX_MARK_BEGIN_CLASS(Tests2);
	HX_MARK_MEMBER_NAME(functionToRedefine2,"functionToRedefine2");
	HX_MARK_MEMBER_NAME(functionToRedefine,"functionToRedefine");
	HX_MARK_MEMBER_NAME(d1,"d1");
	HX_MARK_END_CLASS();
}

void Tests2_obj::__Visit(HX_VISIT_PARAMS)
{
	HX_VISIT_MEMBER_NAME(functionToRedefine2,"functionToRedefine2");
	HX_VISIT_MEMBER_NAME(functionToRedefine,"functionToRedefine");
	HX_VISIT_MEMBER_NAME(d1,"d1");
}

Dynamic Tests2_obj::__Field(const ::String &inName,bool inCallProp)
{
	switch(inName.length) {
	case 2:
		if (HX_FIELD_EQ(inName,"d1") ) { return d1; }
		break;
	case 14:
		if (HX_FIELD_EQ(inName,"methodInTests2") ) { return methodInTests2_dyn(); }
		break;
	case 18:
		if (HX_FIELD_EQ(inName,"functionToRedefine") ) { return functionToRedefine; }
		break;
	case 19:
		if (HX_FIELD_EQ(inName,"functionToRedefine2") ) { return functionToRedefine2; }
	}
	return super::__Field(inName,inCallProp);
}

Dynamic Tests2_obj::__SetField(const ::String &inName,const Dynamic &inValue,bool inCallProp)
{
	switch(inName.length) {
	case 2:
		if (HX_FIELD_EQ(inName,"d1") ) { d1=inValue.Cast< int >(); return inValue; }
		break;
	case 18:
		if (HX_FIELD_EQ(inName,"functionToRedefine") ) { functionToRedefine=inValue.Cast< Dynamic >(); return inValue; }
		break;
	case 19:
		if (HX_FIELD_EQ(inName,"functionToRedefine2") ) { functionToRedefine2=inValue.Cast< Dynamic >(); return inValue; }
	}
	return super::__SetField(inName,inValue,inCallProp);
}

void Tests2_obj::__GetFields(Array< ::String> &outFields)
{
	outFields->push(HX_CSTRING("d1"));
	super::__GetFields(outFields);
};

static ::String sStaticFields[] = {
	String(null()) };

static ::String sMemberFields[] = {
	HX_CSTRING("functionToRedefine2"),
	HX_CSTRING("functionToRedefine"),
	HX_CSTRING("methodInTests2"),
	HX_CSTRING("d1"),
	String(null()) };

static void sMarkStatics(HX_MARK_PARAMS) {
	HX_MARK_MEMBER_NAME(Tests2_obj::__mClass,"__mClass");
};

static void sVisitStatics(HX_VISIT_PARAMS) {
	HX_VISIT_MEMBER_NAME(Tests2_obj::__mClass,"__mClass");
};

Class Tests2_obj::__mClass;

void Tests2_obj::__register()
{
	hx::Static(__mClass) = hx::RegisterClass(HX_CSTRING("Tests2"), hx::TCanCast< Tests2_obj> ,sStaticFields,sMemberFields,
	&__CreateEmpty, &__Create,
	&super::__SGetClass(), 0, sMarkStatics, sVisitStatics);
}

void Tests2_obj::__boot()
{
}

