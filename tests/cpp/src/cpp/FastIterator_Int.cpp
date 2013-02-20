#include <hxcpp.h>

#ifndef INCLUDED_cpp_FastIterator_Int
#include <cpp/FastIterator_Int.h>
#endif
namespace cpp{

Void FastIterator_Int_obj::__construct()
{
	return null();
}

FastIterator_Int_obj::~FastIterator_Int_obj() { }

Dynamic FastIterator_Int_obj::__CreateEmpty() { return  new FastIterator_Int_obj; }
hx::ObjectPtr< FastIterator_Int_obj > FastIterator_Int_obj::__new()
{  hx::ObjectPtr< FastIterator_Int_obj > result = new FastIterator_Int_obj();
	result->__construct();
	return result;}

Dynamic FastIterator_Int_obj::__Create(hx::DynamicArray inArgs)
{  hx::ObjectPtr< FastIterator_Int_obj > result = new FastIterator_Int_obj();
	result->__construct();
	return result;}


FastIterator_Int_obj::FastIterator_Int_obj()
{
}

void FastIterator_Int_obj::__Mark(HX_MARK_PARAMS)
{
	HX_MARK_BEGIN_CLASS(FastIterator_Int);
	HX_MARK_MEMBER_NAME(next,"next");
	HX_MARK_MEMBER_NAME(hasNext,"hasNext");
	HX_MARK_END_CLASS();
}

void FastIterator_Int_obj::__Visit(HX_VISIT_PARAMS)
{
	HX_VISIT_MEMBER_NAME(next,"next");
	HX_VISIT_MEMBER_NAME(hasNext,"hasNext");
}

Dynamic FastIterator_Int_obj::__Field(const ::String &inName,bool inCallProp)
{
	switch(inName.length) {
	case 4:
		if (HX_FIELD_EQ(inName,"next") ) { return next; }
		break;
	case 7:
		if (HX_FIELD_EQ(inName,"hasNext") ) { return hasNext; }
	}
	return super::__Field(inName,inCallProp);
}

Dynamic FastIterator_Int_obj::__SetField(const ::String &inName,const Dynamic &inValue,bool inCallProp)
{
	switch(inName.length) {
	case 4:
		if (HX_FIELD_EQ(inName,"next") ) { next=inValue.Cast< Dynamic >(); return inValue; }
		break;
	case 7:
		if (HX_FIELD_EQ(inName,"hasNext") ) { hasNext=inValue.Cast< Dynamic >(); return inValue; }
	}
	return super::__SetField(inName,inValue,inCallProp);
}

void FastIterator_Int_obj::__GetFields(Array< ::String> &outFields)
{
	super::__GetFields(outFields);
};

static ::String sStaticFields[] = {
	String(null()) };

static ::String sMemberFields[] = {
	HX_CSTRING("next"),
	HX_CSTRING("hasNext"),
	String(null()) };

static void sMarkStatics(HX_MARK_PARAMS) {
	HX_MARK_MEMBER_NAME(FastIterator_Int_obj::__mClass,"__mClass");
};

static void sVisitStatics(HX_VISIT_PARAMS) {
	HX_VISIT_MEMBER_NAME(FastIterator_Int_obj::__mClass,"__mClass");
};

Class FastIterator_Int_obj::__mClass;

void FastIterator_Int_obj::__register()
{
	hx::Static(__mClass) = hx::RegisterClass(HX_CSTRING("cpp.FastIterator_Int"), hx::TCanCast< FastIterator_Int_obj> ,sStaticFields,sMemberFields,
	&__CreateEmpty, &__Create,
	&super::__SGetClass(), 0, sMarkStatics, sVisitStatics);
}

void FastIterator_Int_obj::__boot()
{
}

} // end namespace cpp
