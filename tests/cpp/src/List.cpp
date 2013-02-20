#include <hxcpp.h>

#ifndef INCLUDED_List
#include <List.h>
#endif
#ifndef INCLUDED_Std
#include <Std.h>
#endif
#ifndef INCLUDED_StringBuf
#include <StringBuf.h>
#endif

Void List_obj::__construct()
{
HX_STACK_PUSH("List::new","/Users/Cristi/Documents/haxecompiler/haxe/std/List.hx",40);
{
	HX_STACK_LINE(40)
	this->length = (int)0;
}
;
	return null();
}

List_obj::~List_obj() { }

Dynamic List_obj::__CreateEmpty() { return  new List_obj; }
hx::ObjectPtr< List_obj > List_obj::__new()
{  hx::ObjectPtr< List_obj > result = new List_obj();
	result->__construct();
	return result;}

Dynamic List_obj::__Create(hx::DynamicArray inArgs)
{  hx::ObjectPtr< List_obj > result = new List_obj();
	result->__construct();
	return result;}

::List List_obj::map( Dynamic f){
	HX_STACK_PUSH("List::map","/Users/Cristi/Documents/haxecompiler/haxe/std/List.hx",242);
	HX_STACK_THIS(this);
	HX_STACK_ARG(f,"f");
	HX_STACK_LINE(243)
	::List b = ::List_obj::__new();		HX_STACK_VAR(b,"b");
	HX_STACK_LINE(244)
	Dynamic l = this->h;		HX_STACK_VAR(l,"l");
	HX_STACK_LINE(245)
	while(((l != null()))){
		HX_STACK_LINE(246)
		Dynamic v = l->__GetItem((int)0);		HX_STACK_VAR(v,"v");
		HX_STACK_LINE(247)
		l = l->__GetItem((int)1);
		HX_STACK_LINE(248)
		b->add(f(v));
	}
	HX_STACK_LINE(250)
	return b;
}


HX_DEFINE_DYNAMIC_FUNC1(List_obj,map,return )

::List List_obj::filter( Dynamic f){
	HX_STACK_PUSH("List::filter","/Users/Cristi/Documents/haxecompiler/haxe/std/List.hx",226);
	HX_STACK_THIS(this);
	HX_STACK_ARG(f,"f");
	HX_STACK_LINE(227)
	::List l2 = ::List_obj::__new();		HX_STACK_VAR(l2,"l2");
	HX_STACK_LINE(228)
	Dynamic l = this->h;		HX_STACK_VAR(l,"l");
	HX_STACK_LINE(229)
	while(((l != null()))){
		HX_STACK_LINE(230)
		Dynamic v = l->__GetItem((int)0);		HX_STACK_VAR(v,"v");
		HX_STACK_LINE(231)
		l = l->__GetItem((int)1);
		HX_STACK_LINE(232)
		if ((f(v).Cast< bool >())){
			HX_STACK_LINE(233)
			l2->add(v);
		}
	}
	HX_STACK_LINE(235)
	return l2;
}


HX_DEFINE_DYNAMIC_FUNC1(List_obj,filter,return )

::String List_obj::join( ::String sep){
	HX_STACK_PUSH("List::join","/Users/Cristi/Documents/haxecompiler/haxe/std/List.hx",207);
	HX_STACK_THIS(this);
	HX_STACK_ARG(sep,"sep");
	HX_STACK_LINE(208)
	::StringBuf s = ::StringBuf_obj::__new();		HX_STACK_VAR(s,"s");
	HX_STACK_LINE(209)
	bool first = true;		HX_STACK_VAR(first,"first");
	HX_STACK_LINE(210)
	Dynamic l = this->h;		HX_STACK_VAR(l,"l");
	HX_STACK_LINE(211)
	while(((l != null()))){
		HX_STACK_LINE(212)
		if ((first)){
			HX_STACK_LINE(213)
			first = false;
		}
		else{
			HX_STACK_LINE(215)
			hx::IndexRef((s->b).mPtr,s->b->__Field(HX_CSTRING("length"),true)) = sep;
		}
		HX_STACK_LINE(216)
		hx::IndexRef((s->b).mPtr,s->b->__Field(HX_CSTRING("length"),true)) = l->__GetItem((int)0);
		HX_STACK_LINE(217)
		l = l->__GetItem((int)1);
	}
	HX_STACK_LINE(219)
	return s->b->__Field(HX_CSTRING("join"),true)(HX_CSTRING(""));
}


HX_DEFINE_DYNAMIC_FUNC1(List_obj,join,return )

::String List_obj::toString( ){
	HX_STACK_PUSH("List::toString","/Users/Cristi/Documents/haxecompiler/haxe/std/List.hx",187);
	HX_STACK_THIS(this);
	HX_STACK_LINE(188)
	::StringBuf s = ::StringBuf_obj::__new();		HX_STACK_VAR(s,"s");
	HX_STACK_LINE(189)
	bool first = true;		HX_STACK_VAR(first,"first");
	HX_STACK_LINE(190)
	Dynamic l = this->h;		HX_STACK_VAR(l,"l");
	HX_STACK_LINE(191)
	hx::IndexRef((s->b).mPtr,s->b->__Field(HX_CSTRING("length"),true)) = HX_CSTRING("{");
	HX_STACK_LINE(192)
	while(((l != null()))){
		HX_STACK_LINE(193)
		if ((first)){
			HX_STACK_LINE(194)
			first = false;
		}
		else{
			HX_STACK_LINE(196)
			hx::IndexRef((s->b).mPtr,s->b->__Field(HX_CSTRING("length"),true)) = HX_CSTRING(", ");
		}
		HX_STACK_LINE(197)
		hx::IndexRef((s->b).mPtr,s->b->__Field(HX_CSTRING("length"),true)) = ::Std_obj::string(l->__GetItem((int)0));
		HX_STACK_LINE(198)
		l = l->__GetItem((int)1);
	}
	HX_STACK_LINE(200)
	hx::IndexRef((s->b).mPtr,s->b->__Field(HX_CSTRING("length"),true)) = HX_CSTRING("}");
	HX_STACK_LINE(201)
	return s->b->__Field(HX_CSTRING("join"),true)(HX_CSTRING(""));
}


HX_DEFINE_DYNAMIC_FUNC0(List_obj,toString,return )

Dynamic List_obj::iterator( ){
	HX_STACK_PUSH("List::iterator","/Users/Cristi/Documents/haxecompiler/haxe/std/List.hx",148);
	HX_STACK_THIS(this);
	struct _Function_1_1{
		inline static Dynamic Block( ::List_obj *__this){
			HX_STACK_PUSH("*::closure","/Users/Cristi/Documents/haxecompiler/haxe/std/List.hx",166);
			{
				hx::Anon __result = hx::Anon_obj::Create();
				__result->Add(HX_CSTRING("h") , __this->h,false);

				HX_BEGIN_LOCAL_FUNC_S0(hx::LocalThisFunc,_Function_2_1)
				Dynamic run(){
					HX_STACK_PUSH("*::_Function_2_1","/Users/Cristi/Documents/haxecompiler/haxe/std/List.hx",168);
					HX_STACK_THIS(__this.mPtr);
					{
						HX_STACK_LINE(168)
						return (__this->__Field(HX_CSTRING("h"),true) != null());
					}
					return null();
				}
				HX_END_LOCAL_FUNC0(return)

				__result->Add(HX_CSTRING("hasNext") ,  Dynamic(new _Function_2_1()),true);

				HX_BEGIN_LOCAL_FUNC_S0(hx::LocalThisFunc,_Function_2_2)
				Dynamic run(){
					HX_STACK_PUSH("*::_Function_2_2","/Users/Cristi/Documents/haxecompiler/haxe/std/List.hx",171);
					HX_STACK_THIS(__this.mPtr);
					{
						HX_STACK_LINE(173)
						if (((__this->__Field(HX_CSTRING("h"),true) == null()))){
							HX_STACK_LINE(174)
							return null();
						}
						HX_STACK_LINE(175)
						Dynamic x = __this->__Field(HX_CSTRING("h"),true)->__GetItem((int)0);		HX_STACK_VAR(x,"x");
						HX_STACK_LINE(176)
						__this->__FieldRef(HX_CSTRING("h")) = __this->__Field(HX_CSTRING("h"),true)->__GetItem((int)1);
						HX_STACK_LINE(177)
						return x;
					}
					return null();
				}
				HX_END_LOCAL_FUNC0(return)

				__result->Add(HX_CSTRING("next") ,  Dynamic(new _Function_2_2()),true);
				return __result;
			}
			return null();
		}
	};
	HX_STACK_LINE(148)
	return _Function_1_1::Block(this);
}


HX_DEFINE_DYNAMIC_FUNC0(List_obj,iterator,return )

bool List_obj::remove( Dynamic v){
	HX_STACK_PUSH("List::remove","/Users/Cristi/Documents/haxecompiler/haxe/std/List.hx",125);
	HX_STACK_THIS(this);
	HX_STACK_ARG(v,"v");
	HX_STACK_LINE(126)
	Dynamic prev = null();		HX_STACK_VAR(prev,"prev");
	HX_STACK_LINE(127)
	Dynamic l = this->h;		HX_STACK_VAR(l,"l");
	HX_STACK_LINE(128)
	while(((l != null()))){
		HX_STACK_LINE(129)
		if (((l->__GetItem((int)0) == v))){
			HX_STACK_LINE(130)
			if (((prev == null()))){
				HX_STACK_LINE(131)
				this->h = l->__GetItem((int)1);
			}
			else{
				HX_STACK_LINE(133)
				hx::IndexRef((prev).mPtr,(int)1) = l->__GetItem((int)1);
			}
			HX_STACK_LINE(134)
			if (((this->q == l))){
				HX_STACK_LINE(135)
				this->q = prev;
			}
			HX_STACK_LINE(136)
			(this->length)--;
			HX_STACK_LINE(137)
			return true;
		}
		HX_STACK_LINE(139)
		prev = l;
		HX_STACK_LINE(140)
		l = l->__GetItem((int)1);
	}
	HX_STACK_LINE(142)
	return false;
}


HX_DEFINE_DYNAMIC_FUNC1(List_obj,remove,return )

Void List_obj::clear( ){
{
		HX_STACK_PUSH("List::clear","/Users/Cristi/Documents/haxecompiler/haxe/std/List.hx",115);
		HX_STACK_THIS(this);
		HX_STACK_LINE(116)
		this->h = null();
		HX_STACK_LINE(117)
		this->q = null();
		HX_STACK_LINE(118)
		this->length = (int)0;
	}
return null();
}


HX_DEFINE_DYNAMIC_FUNC0(List_obj,clear,(void))

bool List_obj::isEmpty( ){
	HX_STACK_PUSH("List::isEmpty","/Users/Cristi/Documents/haxecompiler/haxe/std/List.hx",108);
	HX_STACK_THIS(this);
	HX_STACK_LINE(108)
	return (this->h == null());
}


HX_DEFINE_DYNAMIC_FUNC0(List_obj,isEmpty,return )

Dynamic List_obj::pop( ){
	HX_STACK_PUSH("List::pop","/Users/Cristi/Documents/haxecompiler/haxe/std/List.hx",94);
	HX_STACK_THIS(this);
	HX_STACK_LINE(95)
	if (((this->h == null()))){
		HX_STACK_LINE(96)
		return null();
	}
	HX_STACK_LINE(97)
	Dynamic x = this->h->__GetItem((int)0);		HX_STACK_VAR(x,"x");
	HX_STACK_LINE(98)
	this->h = this->h->__GetItem((int)1);
	HX_STACK_LINE(99)
	if (((this->h == null()))){
		HX_STACK_LINE(100)
		this->q = null();
	}
	HX_STACK_LINE(101)
	(this->length)--;
	HX_STACK_LINE(102)
	return x;
}


HX_DEFINE_DYNAMIC_FUNC0(List_obj,pop,return )

Dynamic List_obj::last( ){
	HX_STACK_PUSH("List::last","/Users/Cristi/Documents/haxecompiler/haxe/std/List.hx",84);
	HX_STACK_THIS(this);
	HX_STACK_LINE(84)
	return (  (((this->q == null()))) ? Dynamic(null()) : Dynamic(this->q->__GetItem((int)0)) );
}


HX_DEFINE_DYNAMIC_FUNC0(List_obj,last,return )

Dynamic List_obj::first( ){
	HX_STACK_PUSH("List::first","/Users/Cristi/Documents/haxecompiler/haxe/std/List.hx",76);
	HX_STACK_THIS(this);
	HX_STACK_LINE(76)
	return (  (((this->h == null()))) ? Dynamic(null()) : Dynamic(this->h->__GetItem((int)0)) );
}


HX_DEFINE_DYNAMIC_FUNC0(List_obj,first,return )

Void List_obj::push( Dynamic item){
{
		HX_STACK_PUSH("List::push","/Users/Cristi/Documents/haxecompiler/haxe/std/List.hx",60);
		HX_STACK_THIS(this);
		HX_STACK_ARG(item,"item");
		HX_STACK_LINE(61)
		Dynamic x = Dynamic( Array_obj<Dynamic>::__new().Add(item).Add(this->h));		HX_STACK_VAR(x,"x");
		HX_STACK_LINE(66)
		this->h = x;
		HX_STACK_LINE(67)
		if (((this->q == null()))){
			HX_STACK_LINE(68)
			this->q = x;
		}
		HX_STACK_LINE(69)
		(this->length)++;
	}
return null();
}


HX_DEFINE_DYNAMIC_FUNC1(List_obj,push,(void))

Void List_obj::add( Dynamic item){
{
		HX_STACK_PUSH("List::add","/Users/Cristi/Documents/haxecompiler/haxe/std/List.hx",47);
		HX_STACK_THIS(this);
		HX_STACK_ARG(item,"item");
		HX_STACK_LINE(48)
		Dynamic x = Dynamic( Array_obj<Dynamic>::__new().Add(item));		HX_STACK_VAR(x,"x");
		HX_STACK_LINE(49)
		if (((this->h == null()))){
			HX_STACK_LINE(50)
			this->h = x;
		}
		else{
			HX_STACK_LINE(52)
			hx::IndexRef((this->q).mPtr,(int)1) = x;
		}
		HX_STACK_LINE(53)
		this->q = x;
		HX_STACK_LINE(54)
		(this->length)++;
	}
return null();
}


HX_DEFINE_DYNAMIC_FUNC1(List_obj,add,(void))


List_obj::List_obj()
{
}

void List_obj::__Mark(HX_MARK_PARAMS)
{
	HX_MARK_BEGIN_CLASS(List);
	HX_MARK_MEMBER_NAME(length,"length");
	HX_MARK_MEMBER_NAME(q,"q");
	HX_MARK_MEMBER_NAME(h,"h");
	HX_MARK_END_CLASS();
}

void List_obj::__Visit(HX_VISIT_PARAMS)
{
	HX_VISIT_MEMBER_NAME(length,"length");
	HX_VISIT_MEMBER_NAME(q,"q");
	HX_VISIT_MEMBER_NAME(h,"h");
}

Dynamic List_obj::__Field(const ::String &inName,bool inCallProp)
{
	switch(inName.length) {
	case 1:
		if (HX_FIELD_EQ(inName,"q") ) { return q; }
		if (HX_FIELD_EQ(inName,"h") ) { return h; }
		break;
	case 3:
		if (HX_FIELD_EQ(inName,"map") ) { return map_dyn(); }
		if (HX_FIELD_EQ(inName,"pop") ) { return pop_dyn(); }
		if (HX_FIELD_EQ(inName,"add") ) { return add_dyn(); }
		break;
	case 4:
		if (HX_FIELD_EQ(inName,"join") ) { return join_dyn(); }
		if (HX_FIELD_EQ(inName,"last") ) { return last_dyn(); }
		if (HX_FIELD_EQ(inName,"push") ) { return push_dyn(); }
		break;
	case 5:
		if (HX_FIELD_EQ(inName,"clear") ) { return clear_dyn(); }
		if (HX_FIELD_EQ(inName,"first") ) { return first_dyn(); }
		break;
	case 6:
		if (HX_FIELD_EQ(inName,"filter") ) { return filter_dyn(); }
		if (HX_FIELD_EQ(inName,"remove") ) { return remove_dyn(); }
		if (HX_FIELD_EQ(inName,"length") ) { return length; }
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

Dynamic List_obj::__SetField(const ::String &inName,const Dynamic &inValue,bool inCallProp)
{
	switch(inName.length) {
	case 1:
		if (HX_FIELD_EQ(inName,"q") ) { q=inValue.Cast< Dynamic >(); return inValue; }
		if (HX_FIELD_EQ(inName,"h") ) { h=inValue.Cast< Dynamic >(); return inValue; }
		break;
	case 6:
		if (HX_FIELD_EQ(inName,"length") ) { length=inValue.Cast< int >(); return inValue; }
	}
	return super::__SetField(inName,inValue,inCallProp);
}

void List_obj::__GetFields(Array< ::String> &outFields)
{
	outFields->push(HX_CSTRING("length"));
	outFields->push(HX_CSTRING("q"));
	outFields->push(HX_CSTRING("h"));
	super::__GetFields(outFields);
};

static ::String sStaticFields[] = {
	String(null()) };

static ::String sMemberFields[] = {
	HX_CSTRING("map"),
	HX_CSTRING("filter"),
	HX_CSTRING("join"),
	HX_CSTRING("toString"),
	HX_CSTRING("iterator"),
	HX_CSTRING("remove"),
	HX_CSTRING("clear"),
	HX_CSTRING("isEmpty"),
	HX_CSTRING("pop"),
	HX_CSTRING("last"),
	HX_CSTRING("first"),
	HX_CSTRING("push"),
	HX_CSTRING("add"),
	HX_CSTRING("length"),
	HX_CSTRING("q"),
	HX_CSTRING("h"),
	String(null()) };

static void sMarkStatics(HX_MARK_PARAMS) {
	HX_MARK_MEMBER_NAME(List_obj::__mClass,"__mClass");
};

static void sVisitStatics(HX_VISIT_PARAMS) {
	HX_VISIT_MEMBER_NAME(List_obj::__mClass,"__mClass");
};

Class List_obj::__mClass;

void List_obj::__register()
{
	hx::Static(__mClass) = hx::RegisterClass(HX_CSTRING("List"), hx::TCanCast< List_obj> ,sStaticFields,sMemberFields,
	&__CreateEmpty, &__Create,
	&super::__SGetClass(), 0, sMarkStatics, sVisitStatics);
}

void List_obj::__boot()
{
}

