#include <hxcpp.h>

#ifndef INCLUDED_cpp_FastIterator_Int
#include <cpp/FastIterator_Int.h>
#endif
#ifndef INCLUDED_haxe_FastCell_Int
#include <haxe/FastCell_Int.h>
#endif
#ifndef INCLUDED_haxe_FastList_Int
#include <haxe/FastList_Int.h>
#endif
#ifndef INCLUDED_haxe__FastList_FastListIterator_Int
#include <haxe/_FastList/FastListIterator_Int.h>
#endif
namespace haxe{

Void FastList_Int_obj::__construct()
{
HX_STACK_PUSH("FastList_Int::new","/Users/Cristi/Documents/haxecompiler/haxe/std/haxe/FastList.hx",60);
{
}
;
	return null();
}

FastList_Int_obj::~FastList_Int_obj() { }

Dynamic FastList_Int_obj::__CreateEmpty() { return  new FastList_Int_obj; }
hx::ObjectPtr< FastList_Int_obj > FastList_Int_obj::__new()
{  hx::ObjectPtr< FastList_Int_obj > result = new FastList_Int_obj();
	result->__construct();
	return result;}

Dynamic FastList_Int_obj::__Create(hx::DynamicArray inArgs)
{  hx::ObjectPtr< FastList_Int_obj > result = new FastList_Int_obj();
	result->__construct();
	return result;}

::String FastList_Int_obj::toString( ){
	HX_STACK_PUSH("FastList_Int::toString","/Users/Cristi/Documents/haxecompiler/haxe/std/haxe/FastList.hx",153);
	HX_STACK_THIS(this);
	HX_STACK_LINE(154)
	Array< int > a = Array_obj< int >::__new();		HX_STACK_VAR(a,"a");
	HX_STACK_LINE(155)
	::haxe::FastCell_Int l = this->head;		HX_STACK_VAR(l,"l");
	HX_STACK_LINE(156)
	while(((l != null()))){
		HX_STACK_LINE(157)
		a->push(l->elt);
		HX_STACK_LINE(158)
		l = l->next;
	}
	HX_STACK_LINE(160)
	return ((HX_CSTRING("{") + a->join(HX_CSTRING(","))) + HX_CSTRING("}"));
}


HX_DEFINE_DYNAMIC_FUNC0(FastList_Int_obj,toString,return )

Dynamic FastList_Int_obj::iterator( ){
	HX_STACK_PUSH("FastList_Int::iterator","/Users/Cristi/Documents/haxecompiler/haxe/std/haxe/FastList.hx",126);
	HX_STACK_THIS(this);
	HX_STACK_LINE(126)
	return ::haxe::_FastList::FastListIterator_Int_obj::__new(this->head);
}


HX_DEFINE_DYNAMIC_FUNC0(FastList_Int_obj,iterator,return )

bool FastList_Int_obj::remove( int v){
	HX_STACK_PUSH("FastList_Int::remove","/Users/Cristi/Documents/haxecompiler/haxe/std/haxe/FastList.hx",104);
	HX_STACK_THIS(this);
	HX_STACK_ARG(v,"v");
	HX_STACK_LINE(105)
	Dynamic prev = null();		HX_STACK_VAR(prev,"prev");
	HX_STACK_LINE(106)
	::haxe::FastCell_Int l = this->head;		HX_STACK_VAR(l,"l");
	HX_STACK_LINE(107)
	while(((l != null()))){
		HX_STACK_LINE(108)
		if (((l->elt == v))){
			HX_STACK_LINE(109)
			if (((prev == null()))){
				HX_STACK_LINE(110)
				this->head = l->next;
			}
			else{
				HX_STACK_LINE(112)
				prev->__FieldRef(HX_CSTRING("next")) = l->next;
			}
			HX_STACK_LINE(113)
			break;
		}
		HX_STACK_LINE(115)
		prev = l;
		HX_STACK_LINE(116)
		l = l->next;
	}
	HX_STACK_LINE(118)
	return (l != null());
}


HX_DEFINE_DYNAMIC_FUNC1(FastList_Int_obj,remove,return )

bool FastList_Int_obj::isEmpty( ){
	HX_STACK_PUSH("FastList_Int::isEmpty","/Users/Cristi/Documents/haxecompiler/haxe/std/haxe/FastList.hx",96);
	HX_STACK_THIS(this);
	HX_STACK_LINE(96)
	return (this->head == null());
}


HX_DEFINE_DYNAMIC_FUNC0(FastList_Int_obj,isEmpty,return )

Dynamic FastList_Int_obj::pop( ){
	HX_STACK_PUSH("FastList_Int::pop","/Users/Cristi/Documents/haxecompiler/haxe/std/haxe/FastList.hx",83);
	HX_STACK_THIS(this);
	HX_STACK_LINE(84)
	::haxe::FastCell_Int k = this->head;		HX_STACK_VAR(k,"k");
	HX_STACK_LINE(85)
	if (((k == null()))){
		HX_STACK_LINE(86)
		return null();
	}
	else{
		HX_STACK_LINE(88)
		this->head = k->next;
		HX_STACK_LINE(89)
		return k->elt;
	}
	HX_STACK_LINE(85)
	return (int)0;
}


HX_DEFINE_DYNAMIC_FUNC0(FastList_Int_obj,pop,return )

Dynamic FastList_Int_obj::first( ){
	HX_STACK_PUSH("FastList_Int::first","/Users/Cristi/Documents/haxecompiler/haxe/std/haxe/FastList.hx",74);
	HX_STACK_THIS(this);
	HX_STACK_LINE(74)
	return (  (((this->head == null()))) ? Dynamic(null()) : Dynamic(this->head->elt) );
}


HX_DEFINE_DYNAMIC_FUNC0(FastList_Int_obj,first,return )

Void FastList_Int_obj::add( int item){
{
		HX_STACK_PUSH("FastList_Int::add","/Users/Cristi/Documents/haxecompiler/haxe/std/haxe/FastList.hx",66);
		HX_STACK_THIS(this);
		HX_STACK_ARG(item,"item");
		HX_STACK_LINE(66)
		this->head = ::haxe::FastCell_Int_obj::__new(item,this->head);
	}
return null();
}


HX_DEFINE_DYNAMIC_FUNC1(FastList_Int_obj,add,(void))


FastList_Int_obj::FastList_Int_obj()
{
}

void FastList_Int_obj::__Mark(HX_MARK_PARAMS)
{
	HX_MARK_BEGIN_CLASS(FastList_Int);
	HX_MARK_MEMBER_NAME(head,"head");
	HX_MARK_END_CLASS();
}

void FastList_Int_obj::__Visit(HX_VISIT_PARAMS)
{
	HX_VISIT_MEMBER_NAME(head,"head");
}

Dynamic FastList_Int_obj::__Field(const ::String &inName,bool inCallProp)
{
	switch(inName.length) {
	case 3:
		if (HX_FIELD_EQ(inName,"pop") ) { return pop_dyn(); }
		if (HX_FIELD_EQ(inName,"add") ) { return add_dyn(); }
		break;
	case 4:
		if (HX_FIELD_EQ(inName,"head") ) { return head; }
		break;
	case 5:
		if (HX_FIELD_EQ(inName,"first") ) { return first_dyn(); }
		break;
	case 6:
		if (HX_FIELD_EQ(inName,"remove") ) { return remove_dyn(); }
		break;
	case 7:
		if (HX_FIELD_EQ(inName,"isEmpty") ) { return isEmpty_dyn(); }
		break;
	case 8:
		if (HX_FIELD_EQ(inName,"toString") ) { return toString_dyn(); }
		if (HX_FIELD_EQ(inName,"iterator") ) { return iterator_dyn(); }
	}
	return super::__Field(inName,inCallProp);
}

Dynamic FastList_Int_obj::__SetField(const ::String &inName,const Dynamic &inValue,bool inCallProp)
{
	switch(inName.length) {
	case 4:
		if (HX_FIELD_EQ(inName,"head") ) { head=inValue.Cast< ::haxe::FastCell_Int >(); return inValue; }
	}
	return super::__SetField(inName,inValue,inCallProp);
}

void FastList_Int_obj::__GetFields(Array< ::String> &outFields)
{
	outFields->push(HX_CSTRING("head"));
	super::__GetFields(outFields);
};

static ::String sStaticFields[] = {
	String(null()) };

static ::String sMemberFields[] = {
	HX_CSTRING("toString"),
	HX_CSTRING("iterator"),
	HX_CSTRING("remove"),
	HX_CSTRING("isEmpty"),
	HX_CSTRING("pop"),
	HX_CSTRING("first"),
	HX_CSTRING("add"),
	HX_CSTRING("head"),
	String(null()) };

static void sMarkStatics(HX_MARK_PARAMS) {
	HX_MARK_MEMBER_NAME(FastList_Int_obj::__mClass,"__mClass");
};

static void sVisitStatics(HX_VISIT_PARAMS) {
	HX_VISIT_MEMBER_NAME(FastList_Int_obj::__mClass,"__mClass");
};

Class FastList_Int_obj::__mClass;

void FastList_Int_obj::__register()
{
	hx::Static(__mClass) = hx::RegisterClass(HX_CSTRING("haxe.FastList_Int"), hx::TCanCast< FastList_Int_obj> ,sStaticFields,sMemberFields,
	&__CreateEmpty, &__Create,
	&super::__SGetClass(), 0, sMarkStatics, sVisitStatics);
}

void FastList_Int_obj::__boot()
{
}

} // end namespace haxe
