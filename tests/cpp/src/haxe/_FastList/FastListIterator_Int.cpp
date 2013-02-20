#include <hxcpp.h>

#ifndef INCLUDED_cpp_FastIterator_Int
#include <cpp/FastIterator_Int.h>
#endif
#ifndef INCLUDED_haxe_FastCell_Int
#include <haxe/FastCell_Int.h>
#endif
#ifndef INCLUDED_haxe__FastList_FastListIterator_Int
#include <haxe/_FastList/FastListIterator_Int.h>
#endif
namespace haxe{
namespace _FastList{

Void FastListIterator_Int_obj::__construct(::haxe::FastCell_Int head)
{
HX_STACK_PUSH("FastListIterator_Int::new","/Users/Cristi/Documents/haxecompiler/haxe/std/haxe/FastList.hx",42);
{
	HX_STACK_LINE(42)
	this->current = head;
}
;
	return null();
}

FastListIterator_Int_obj::~FastListIterator_Int_obj() { }

Dynamic FastListIterator_Int_obj::__CreateEmpty() { return  new FastListIterator_Int_obj; }
hx::ObjectPtr< FastListIterator_Int_obj > FastListIterator_Int_obj::__new(::haxe::FastCell_Int head)
{  hx::ObjectPtr< FastListIterator_Int_obj > result = new FastListIterator_Int_obj();
	result->__construct(head);
	return result;}

Dynamic FastListIterator_Int_obj::__Create(hx::DynamicArray inArgs)
{  hx::ObjectPtr< FastListIterator_Int_obj > result = new FastListIterator_Int_obj();
	result->__construct(inArgs[0]);
	return result;}

int FastListIterator_Int_obj::next( ){
	HX_STACK_PUSH("FastListIterator_Int::next","/Users/Cristi/Documents/haxecompiler/haxe/std/haxe/FastList.hx",40);
	HX_STACK_THIS(this);
	HX_STACK_LINE(40)
	int result = this->current->elt;		HX_STACK_VAR(result,"result");
	HX_STACK_LINE(40)
	this->current = this->current->next;
	HX_STACK_LINE(40)
	return result;
}


HX_DEFINE_DYNAMIC_FUNC0(FastListIterator_Int_obj,next,return )

bool FastListIterator_Int_obj::hasNext( ){
	HX_STACK_PUSH("FastListIterator_Int::hasNext","/Users/Cristi/Documents/haxecompiler/haxe/std/haxe/FastList.hx",39);
	HX_STACK_THIS(this);
	HX_STACK_LINE(39)
	return (this->current != null());
}


HX_DEFINE_DYNAMIC_FUNC0(FastListIterator_Int_obj,hasNext,return )


FastListIterator_Int_obj::FastListIterator_Int_obj()
{
}

void FastListIterator_Int_obj::__Mark(HX_MARK_PARAMS)
{
	HX_MARK_BEGIN_CLASS(FastListIterator_Int);
	HX_MARK_MEMBER_NAME(current,"current");
	super::__Mark(HX_MARK_ARG);
	HX_MARK_END_CLASS();
}

void FastListIterator_Int_obj::__Visit(HX_VISIT_PARAMS)
{
	HX_VISIT_MEMBER_NAME(current,"current");
	super::__Visit(HX_VISIT_ARG);
}

Dynamic FastListIterator_Int_obj::__Field(const ::String &inName,bool inCallProp)
{
	switch(inName.length) {
	case 4:
		if (HX_FIELD_EQ(inName,"next") ) { return next_dyn(); }
		break;
	case 7:
		if (HX_FIELD_EQ(inName,"hasNext") ) { return hasNext_dyn(); }
		if (HX_FIELD_EQ(inName,"current") ) { return current; }
	}
	return super::__Field(inName,inCallProp);
}

Dynamic FastListIterator_Int_obj::__SetField(const ::String &inName,const Dynamic &inValue,bool inCallProp)
{
	switch(inName.length) {
	case 7:
		if (HX_FIELD_EQ(inName,"current") ) { current=inValue.Cast< ::haxe::FastCell_Int >(); return inValue; }
	}
	return super::__SetField(inName,inValue,inCallProp);
}

void FastListIterator_Int_obj::__GetFields(Array< ::String> &outFields)
{
	outFields->push(HX_CSTRING("current"));
	super::__GetFields(outFields);
};

static ::String sStaticFields[] = {
	String(null()) };

static ::String sMemberFields[] = {
	HX_CSTRING("next"),
	HX_CSTRING("hasNext"),
	HX_CSTRING("current"),
	String(null()) };

static void sMarkStatics(HX_MARK_PARAMS) {
	HX_MARK_MEMBER_NAME(FastListIterator_Int_obj::__mClass,"__mClass");
};

static void sVisitStatics(HX_VISIT_PARAMS) {
	HX_VISIT_MEMBER_NAME(FastListIterator_Int_obj::__mClass,"__mClass");
};

Class FastListIterator_Int_obj::__mClass;

void FastListIterator_Int_obj::__register()
{
	hx::Static(__mClass) = hx::RegisterClass(HX_CSTRING("haxe._FastList.FastListIterator_Int"), hx::TCanCast< FastListIterator_Int_obj> ,sStaticFields,sMemberFields,
	&__CreateEmpty, &__Create,
	&super::__SGetClass(), 0, sMarkStatics, sVisitStatics);
}

void FastListIterator_Int_obj::__boot()
{
}

} // end namespace haxe
} // end namespace _FastList
