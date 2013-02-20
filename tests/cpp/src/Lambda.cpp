#include <hxcpp.h>

#ifndef INCLUDED_Lambda
#include <Lambda.h>
#endif
#ifndef INCLUDED_List
#include <List.h>
#endif

Void Lambda_obj::__construct()
{
	return null();
}

Lambda_obj::~Lambda_obj() { }

Dynamic Lambda_obj::__CreateEmpty() { return  new Lambda_obj; }
hx::ObjectPtr< Lambda_obj > Lambda_obj::__new()
{  hx::ObjectPtr< Lambda_obj > result = new Lambda_obj();
	result->__construct();
	return result;}

Dynamic Lambda_obj::__Create(hx::DynamicArray inArgs)
{  hx::ObjectPtr< Lambda_obj > result = new Lambda_obj();
	result->__construct();
	return result;}

Dynamic Lambda_obj::array( Dynamic it){
	HX_STACK_PUSH("Lambda::array","/Users/Cristi/Documents/haxecompiler/haxe/std/Lambda.hx",31);
	HX_STACK_ARG(it,"it");
	HX_STACK_LINE(32)
	Dynamic a = Dynamic( Array_obj<Dynamic>::__new() );		HX_STACK_VAR(a,"a");
	HX_STACK_LINE(33)
	for(::cpp::FastIterator_obj< Dynamic > *__it = ::cpp::CreateFastIterator< Dynamic >(it->__Field(HX_CSTRING("iterator"),true)());  __it->hasNext(); ){
		Dynamic i = __it->next();
		a->__Field(HX_CSTRING("push"),true)(i);
	}
	HX_STACK_LINE(35)
	return a;
}


STATIC_HX_DEFINE_DYNAMIC_FUNC1(Lambda_obj,array,return )

::List Lambda_obj::list( Dynamic it){
	HX_STACK_PUSH("Lambda::list","/Users/Cristi/Documents/haxecompiler/haxe/std/Lambda.hx",41);
	HX_STACK_ARG(it,"it");
	HX_STACK_LINE(42)
	::List l = ::List_obj::__new();		HX_STACK_VAR(l,"l");
	HX_STACK_LINE(43)
	for(::cpp::FastIterator_obj< Dynamic > *__it = ::cpp::CreateFastIterator< Dynamic >(it->__Field(HX_CSTRING("iterator"),true)());  __it->hasNext(); ){
		Dynamic i = __it->next();
		l->add(i);
	}
	HX_STACK_LINE(45)
	return l;
}


STATIC_HX_DEFINE_DYNAMIC_FUNC1(Lambda_obj,list,return )

::List Lambda_obj::map( Dynamic it,Dynamic f){
	HX_STACK_PUSH("Lambda::map","/Users/Cristi/Documents/haxecompiler/haxe/std/Lambda.hx",52);
	HX_STACK_ARG(it,"it");
	HX_STACK_ARG(f,"f");
	HX_STACK_LINE(53)
	::List l = ::List_obj::__new();		HX_STACK_VAR(l,"l");
	HX_STACK_LINE(54)
	for(::cpp::FastIterator_obj< Dynamic > *__it = ::cpp::CreateFastIterator< Dynamic >(it->__Field(HX_CSTRING("iterator"),true)());  __it->hasNext(); ){
		Dynamic x = __it->next();
		l->add(f(x));
	}
	HX_STACK_LINE(56)
	return l;
}


STATIC_HX_DEFINE_DYNAMIC_FUNC2(Lambda_obj,map,return )

::List Lambda_obj::mapi( Dynamic it,Dynamic f){
	HX_STACK_PUSH("Lambda::mapi","/Users/Cristi/Documents/haxecompiler/haxe/std/Lambda.hx",62);
	HX_STACK_ARG(it,"it");
	HX_STACK_ARG(f,"f");
	HX_STACK_LINE(63)
	::List l = ::List_obj::__new();		HX_STACK_VAR(l,"l");
	HX_STACK_LINE(64)
	int i = (int)0;		HX_STACK_VAR(i,"i");
	HX_STACK_LINE(65)
	for(::cpp::FastIterator_obj< Dynamic > *__it = ::cpp::CreateFastIterator< Dynamic >(it->__Field(HX_CSTRING("iterator"),true)());  __it->hasNext(); ){
		Dynamic x = __it->next();
		l->add(f((i)++,x));
	}
	HX_STACK_LINE(67)
	return l;
}


STATIC_HX_DEFINE_DYNAMIC_FUNC2(Lambda_obj,mapi,return )

bool Lambda_obj::has( Dynamic it,Dynamic elt,Dynamic cmp){
	HX_STACK_PUSH("Lambda::has","/Users/Cristi/Documents/haxecompiler/haxe/std/Lambda.hx",77);
	HX_STACK_ARG(it,"it");
	HX_STACK_ARG(elt,"elt");
	HX_STACK_ARG(cmp,"cmp");
	HX_STACK_LINE(78)
	if (((cmp == null()))){
		HX_STACK_LINE(78)
		for(::cpp::FastIterator_obj< Dynamic > *__it = ::cpp::CreateFastIterator< Dynamic >(it->__Field(HX_CSTRING("iterator"),true)());  __it->hasNext(); ){
			Dynamic x = __it->next();
			if (((x == elt))){
				HX_STACK_LINE(81)
				return true;
			}
;
		}
	}
	else{
		HX_STACK_LINE(82)
		for(::cpp::FastIterator_obj< Dynamic > *__it = ::cpp::CreateFastIterator< Dynamic >(it->__Field(HX_CSTRING("iterator"),true)());  __it->hasNext(); ){
			Dynamic x = __it->next();
			if ((cmp(x,elt).Cast< bool >())){
				HX_STACK_LINE(85)
				return true;
			}
;
		}
	}
	HX_STACK_LINE(87)
	return false;
}


STATIC_HX_DEFINE_DYNAMIC_FUNC3(Lambda_obj,has,return )

bool Lambda_obj::exists( Dynamic it,Dynamic f){
	HX_STACK_PUSH("Lambda::exists","/Users/Cristi/Documents/haxecompiler/haxe/std/Lambda.hx",93);
	HX_STACK_ARG(it,"it");
	HX_STACK_ARG(f,"f");
	HX_STACK_LINE(94)
	for(::cpp::FastIterator_obj< Dynamic > *__it = ::cpp::CreateFastIterator< Dynamic >(it->__Field(HX_CSTRING("iterator"),true)());  __it->hasNext(); ){
		Dynamic x = __it->next();
		if ((f(x).Cast< bool >())){
			HX_STACK_LINE(96)
			return true;
		}
;
	}
	HX_STACK_LINE(97)
	return false;
}


STATIC_HX_DEFINE_DYNAMIC_FUNC2(Lambda_obj,exists,return )

bool Lambda_obj::foreach( Dynamic it,Dynamic f){
	HX_STACK_PUSH("Lambda::foreach","/Users/Cristi/Documents/haxecompiler/haxe/std/Lambda.hx",103);
	HX_STACK_ARG(it,"it");
	HX_STACK_ARG(f,"f");
	HX_STACK_LINE(104)
	for(::cpp::FastIterator_obj< Dynamic > *__it = ::cpp::CreateFastIterator< Dynamic >(it->__Field(HX_CSTRING("iterator"),true)());  __it->hasNext(); ){
		Dynamic x = __it->next();
		if ((!(f(x).Cast< bool >()))){
			HX_STACK_LINE(106)
			return false;
		}
;
	}
	HX_STACK_LINE(107)
	return true;
}


STATIC_HX_DEFINE_DYNAMIC_FUNC2(Lambda_obj,foreach,return )

Void Lambda_obj::iter( Dynamic it,Dynamic f){
{
		HX_STACK_PUSH("Lambda::iter","/Users/Cristi/Documents/haxecompiler/haxe/std/Lambda.hx",113);
		HX_STACK_ARG(it,"it");
		HX_STACK_ARG(f,"f");
		HX_STACK_LINE(113)
		for(::cpp::FastIterator_obj< Dynamic > *__it = ::cpp::CreateFastIterator< Dynamic >(it->__Field(HX_CSTRING("iterator"),true)());  __it->hasNext(); ){
			Dynamic x = __it->next();
			f(x).Cast< Void >();
		}
	}
return null();
}


STATIC_HX_DEFINE_DYNAMIC_FUNC2(Lambda_obj,iter,(void))

::List Lambda_obj::filter( Dynamic it,Dynamic f){
	HX_STACK_PUSH("Lambda::filter","/Users/Cristi/Documents/haxecompiler/haxe/std/Lambda.hx",121);
	HX_STACK_ARG(it,"it");
	HX_STACK_ARG(f,"f");
	HX_STACK_LINE(122)
	::List l = ::List_obj::__new();		HX_STACK_VAR(l,"l");
	HX_STACK_LINE(123)
	for(::cpp::FastIterator_obj< Dynamic > *__it = ::cpp::CreateFastIterator< Dynamic >(it->__Field(HX_CSTRING("iterator"),true)());  __it->hasNext(); ){
		Dynamic x = __it->next();
		if ((f(x).Cast< bool >())){
			HX_STACK_LINE(125)
			l->add(x);
		}
;
	}
	HX_STACK_LINE(126)
	return l;
}


STATIC_HX_DEFINE_DYNAMIC_FUNC2(Lambda_obj,filter,return )

Dynamic Lambda_obj::fold( Dynamic it,Dynamic f,Dynamic first){
	HX_STACK_PUSH("Lambda::fold","/Users/Cristi/Documents/haxecompiler/haxe/std/Lambda.hx",132);
	HX_STACK_ARG(it,"it");
	HX_STACK_ARG(f,"f");
	HX_STACK_ARG(first,"first");
	HX_STACK_LINE(133)
	for(::cpp::FastIterator_obj< Dynamic > *__it = ::cpp::CreateFastIterator< Dynamic >(it->__Field(HX_CSTRING("iterator"),true)());  __it->hasNext(); ){
		Dynamic x = __it->next();
		first = f(x,first);
	}
	HX_STACK_LINE(135)
	return first;
}


STATIC_HX_DEFINE_DYNAMIC_FUNC3(Lambda_obj,fold,return )

int Lambda_obj::count( Dynamic it,Dynamic pred){
	HX_STACK_PUSH("Lambda::count","/Users/Cristi/Documents/haxecompiler/haxe/std/Lambda.hx",141);
	HX_STACK_ARG(it,"it");
	HX_STACK_ARG(pred,"pred");
	HX_STACK_LINE(142)
	int n = (int)0;		HX_STACK_VAR(n,"n");
	HX_STACK_LINE(143)
	if (((pred == null()))){
		HX_STACK_LINE(144)
		for(::cpp::FastIterator_obj< Dynamic > *__it = ::cpp::CreateFastIterator< Dynamic >(it->__Field(HX_CSTRING("iterator"),true)());  __it->hasNext(); ){
			Dynamic _ = __it->next();
			(n)++;
		}
	}
	else{
		HX_STACK_LINE(147)
		for(::cpp::FastIterator_obj< Dynamic > *__it = ::cpp::CreateFastIterator< Dynamic >(it->__Field(HX_CSTRING("iterator"),true)());  __it->hasNext(); ){
			Dynamic x = __it->next();
			if ((pred(x).Cast< bool >())){
				HX_STACK_LINE(149)
				(n)++;
			}
;
		}
	}
	HX_STACK_LINE(150)
	return n;
}


STATIC_HX_DEFINE_DYNAMIC_FUNC2(Lambda_obj,count,return )

bool Lambda_obj::empty( Dynamic it){
	HX_STACK_PUSH("Lambda::empty","/Users/Cristi/Documents/haxecompiler/haxe/std/Lambda.hx",156);
	HX_STACK_ARG(it,"it");
	HX_STACK_LINE(156)
	return !(it->__Field(HX_CSTRING("iterator"),true)()->__Field(HX_CSTRING("hasNext"),true)());
}


STATIC_HX_DEFINE_DYNAMIC_FUNC1(Lambda_obj,empty,return )

int Lambda_obj::indexOf( Dynamic it,Dynamic v){
	HX_STACK_PUSH("Lambda::indexOf","/Users/Cristi/Documents/haxecompiler/haxe/std/Lambda.hx",164);
	HX_STACK_ARG(it,"it");
	HX_STACK_ARG(v,"v");
	HX_STACK_LINE(165)
	int i = (int)0;		HX_STACK_VAR(i,"i");
	HX_STACK_LINE(166)
	for(::cpp::FastIterator_obj< Dynamic > *__it = ::cpp::CreateFastIterator< Dynamic >(it->__Field(HX_CSTRING("iterator"),true)());  __it->hasNext(); ){
		Dynamic v2 = __it->next();
		{
			HX_STACK_LINE(167)
			if (((v == v2))){
				HX_STACK_LINE(168)
				return i;
			}
			HX_STACK_LINE(169)
			(i)++;
		}
;
	}
	HX_STACK_LINE(171)
	return (int)-1;
}


STATIC_HX_DEFINE_DYNAMIC_FUNC2(Lambda_obj,indexOf,return )

::List Lambda_obj::concat( Dynamic a,Dynamic b){
	HX_STACK_PUSH("Lambda::concat","/Users/Cristi/Documents/haxecompiler/haxe/std/Lambda.hx",177);
	HX_STACK_ARG(a,"a");
	HX_STACK_ARG(b,"b");
	HX_STACK_LINE(178)
	::List l = ::List_obj::__new();		HX_STACK_VAR(l,"l");
	HX_STACK_LINE(179)
	for(::cpp::FastIterator_obj< Dynamic > *__it = ::cpp::CreateFastIterator< Dynamic >(a->__Field(HX_CSTRING("iterator"),true)());  __it->hasNext(); ){
		Dynamic x = __it->next();
		l->add(x);
	}
	HX_STACK_LINE(181)
	for(::cpp::FastIterator_obj< Dynamic > *__it = ::cpp::CreateFastIterator< Dynamic >(b->__Field(HX_CSTRING("iterator"),true)());  __it->hasNext(); ){
		Dynamic x = __it->next();
		l->add(x);
	}
	HX_STACK_LINE(183)
	return l;
}


STATIC_HX_DEFINE_DYNAMIC_FUNC2(Lambda_obj,concat,return )


Lambda_obj::Lambda_obj()
{
}

void Lambda_obj::__Mark(HX_MARK_PARAMS)
{
	HX_MARK_BEGIN_CLASS(Lambda);
	HX_MARK_END_CLASS();
}

void Lambda_obj::__Visit(HX_VISIT_PARAMS)
{
}

Dynamic Lambda_obj::__Field(const ::String &inName,bool inCallProp)
{
	switch(inName.length) {
	case 3:
		if (HX_FIELD_EQ(inName,"map") ) { return map_dyn(); }
		if (HX_FIELD_EQ(inName,"has") ) { return has_dyn(); }
		break;
	case 4:
		if (HX_FIELD_EQ(inName,"list") ) { return list_dyn(); }
		if (HX_FIELD_EQ(inName,"mapi") ) { return mapi_dyn(); }
		if (HX_FIELD_EQ(inName,"iter") ) { return iter_dyn(); }
		if (HX_FIELD_EQ(inName,"fold") ) { return fold_dyn(); }
		break;
	case 5:
		if (HX_FIELD_EQ(inName,"array") ) { return array_dyn(); }
		if (HX_FIELD_EQ(inName,"count") ) { return count_dyn(); }
		if (HX_FIELD_EQ(inName,"empty") ) { return empty_dyn(); }
		break;
	case 6:
		if (HX_FIELD_EQ(inName,"exists") ) { return exists_dyn(); }
		if (HX_FIELD_EQ(inName,"filter") ) { return filter_dyn(); }
		if (HX_FIELD_EQ(inName,"concat") ) { return concat_dyn(); }
		break;
	case 7:
		if (HX_FIELD_EQ(inName,"foreach") ) { return foreach_dyn(); }
		if (HX_FIELD_EQ(inName,"indexOf") ) { return indexOf_dyn(); }
	}
	return super::__Field(inName,inCallProp);
}

Dynamic Lambda_obj::__SetField(const ::String &inName,const Dynamic &inValue,bool inCallProp)
{
	return super::__SetField(inName,inValue,inCallProp);
}

void Lambda_obj::__GetFields(Array< ::String> &outFields)
{
	super::__GetFields(outFields);
};

static ::String sStaticFields[] = {
	HX_CSTRING("array"),
	HX_CSTRING("list"),
	HX_CSTRING("map"),
	HX_CSTRING("mapi"),
	HX_CSTRING("has"),
	HX_CSTRING("exists"),
	HX_CSTRING("foreach"),
	HX_CSTRING("iter"),
	HX_CSTRING("filter"),
	HX_CSTRING("fold"),
	HX_CSTRING("count"),
	HX_CSTRING("empty"),
	HX_CSTRING("indexOf"),
	HX_CSTRING("concat"),
	String(null()) };

static ::String sMemberFields[] = {
	String(null()) };

static void sMarkStatics(HX_MARK_PARAMS) {
	HX_MARK_MEMBER_NAME(Lambda_obj::__mClass,"__mClass");
};

static void sVisitStatics(HX_VISIT_PARAMS) {
	HX_VISIT_MEMBER_NAME(Lambda_obj::__mClass,"__mClass");
};

Class Lambda_obj::__mClass;

void Lambda_obj::__register()
{
	hx::Static(__mClass) = hx::RegisterClass(HX_CSTRING("Lambda"), hx::TCanCast< Lambda_obj> ,sStaticFields,sMemberFields,
	&__CreateEmpty, &__Create,
	&super::__SGetClass(), 0, sMarkStatics, sVisitStatics);
}

void Lambda_obj::__boot()
{
}

