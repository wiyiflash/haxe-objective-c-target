#include <hxcpp.h>

#ifndef INCLUDED_haxe_FastCell_Int
#include <haxe/FastCell_Int.h>
#endif
namespace haxe{

Void FastCell_Int_obj::__construct(int elt,::haxe::FastCell_Int next)
{
HX_STACK_PUSH("FastCell_Int::new","/Users/Cristi/Documents/haxecompiler/haxe/std/haxe/FastList.hx",30);
{
	HX_STACK_LINE(30)
	this->elt = elt;
	HX_STACK_LINE(30)
	this->next = next;
}
;
	return null();
}

FastCell_Int_obj::~FastCell_Int_obj() { }

Dynamic FastCell_Int_obj::__CreateEmpty() { return  new FastCell_Int_obj; }
hx::ObjectPtr< FastCell_Int_obj > FastCell_Int_obj::__new(int elt,::haxe::FastCell_Int next)
{  hx::ObjectPtr< FastCell_Int_obj > result = new FastCell_Int_obj();
	result->__construct(elt,next);
	return result;}

Dynamic FastCell_Int_obj::__Create(hx::DynamicArray inArgs)
{  hx::ObjectPtr< FastCell_Int_obj > result = new FastCell_Int_obj();
	result->__construct(inArgs[0],inArgs[1]);
	return result;}


FastCell_Int_obj::FastCell_Int_obj()
{
}

void FastCell_Int_obj::__Mark(HX_MARK_PARAMS)
{
	HX_MARK_BEGIN_CLASS(FastCell_Int);
	HX_MARK_MEMBER_NAME(next,"next");
	HX_MARK_MEMBER_NAME(elt,"elt");
	HX_MARK_END_CLASS();
}

void FastCell_Int_obj::__Visit(HX_VISIT_PARAMS)
{
	HX_VISIT_MEMBER_NAME(next,"next");
	HX_VISIT_MEMBER_NAME(elt,"elt");
}

Dynamic FastCell_Int_obj::__Field(const ::String &inName,bool inCallProp)
{
	switch(inName.length) {
	case 3:
		if (HX_FIELD_EQ(inName,"elt") ) { return elt; }
		break;
	case 4:
		if (HX_FIELD_EQ(inName,"next") ) { return next; }
	}
	return super::__Field(inName,inCallProp);
}

Dynamic FastCell_Int_obj::__SetField(const ::String &inName,const Dynamic &inValue,bool inCallProp)
{
	switch(inName.length) {
	case 3:
		if (HX_FIELD_EQ(inName,"elt") ) { elt=inValue.Cast< int >(); return inValue; }
		break;
	case 4:
		if (HX_FIELD_EQ(inName,"next") ) { next=inValue.Cast< ::haxe::FastCell_Int >(); return inValue; }
	}
	return super::__SetField(inName,inValue,inCallProp);
}

void FastCell_Int_obj::__GetFields(Array< ::String> &outFields)
{
	outFields->push(HX_CSTRING("next"));
	outFields->push(HX_CSTRING("elt"));
	super::__GetFields(outFields);
};

static ::String sStaticFields[] = {
	String(null()) };

static ::String sMemberFields[] = {
	HX_CSTRING("next"),
	HX_CSTRING("elt"),
	String(null()) };

static void sMarkStatics(HX_MARK_PARAMS) {
	HX_MARK_MEMBER_NAME(FastCell_Int_obj::__mClass,"__mClass");
};

static void sVisitStatics(HX_VISIT_PARAMS) {
	HX_VISIT_MEMBER_NAME(FastCell_Int_obj::__mClass,"__mClass");
};

Class FastCell_Int_obj::__mClass;

void FastCell_Int_obj::__register()
{
	hx::Static(__mClass) = hx::RegisterClass(HX_CSTRING("haxe.FastCell_Int"), hx::TCanCast< FastCell_Int_obj> ,sStaticFields,sMemberFields,
	&__CreateEmpty, &__Create,
	&super::__SGetClass(), 0, sMarkStatics, sVisitStatics);
}

void FastCell_Int_obj::__boot()
{
}

} // end namespace haxe
