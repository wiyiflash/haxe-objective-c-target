#include <hxcpp.h>

#ifndef INCLUDED_IntIterator
#include <IntIterator.h>
#endif

Void IntIterator_obj::__construct(int min,int max)
{
HX_STACK_PUSH("IntIterator::new","/Users/Cristi/Documents/haxecompiler/haxe/std/IntIterator.hx",34);
{
	HX_STACK_LINE(35)
	this->min = min;
	HX_STACK_LINE(36)
	this->max = max;
}
;
	return null();
}

IntIterator_obj::~IntIterator_obj() { }

Dynamic IntIterator_obj::__CreateEmpty() { return  new IntIterator_obj; }
hx::ObjectPtr< IntIterator_obj > IntIterator_obj::__new(int min,int max)
{  hx::ObjectPtr< IntIterator_obj > result = new IntIterator_obj();
	result->__construct(min,max);
	return result;}

Dynamic IntIterator_obj::__Create(hx::DynamicArray inArgs)
{  hx::ObjectPtr< IntIterator_obj > result = new IntIterator_obj();
	result->__construct(inArgs[0],inArgs[1]);
	return result;}

int IntIterator_obj::next( ){
	HX_STACK_PUSH("IntIterator::next","/Users/Cristi/Documents/haxecompiler/haxe/std/IntIterator.hx",49);
	HX_STACK_THIS(this);
	HX_STACK_LINE(49)
	return (this->min)++;
}


HX_DEFINE_DYNAMIC_FUNC0(IntIterator_obj,next,return )

bool IntIterator_obj::hasNext( ){
	HX_STACK_PUSH("IntIterator::hasNext","/Users/Cristi/Documents/haxecompiler/haxe/std/IntIterator.hx",42);
	HX_STACK_THIS(this);
	HX_STACK_LINE(42)
	return (this->min < this->max);
}


HX_DEFINE_DYNAMIC_FUNC0(IntIterator_obj,hasNext,return )


IntIterator_obj::IntIterator_obj()
{
}

void IntIterator_obj::__Mark(HX_MARK_PARAMS)
{
	HX_MARK_BEGIN_CLASS(IntIterator);
	HX_MARK_MEMBER_NAME(max,"max");
	HX_MARK_MEMBER_NAME(min,"min");
	HX_MARK_END_CLASS();
}

void IntIterator_obj::__Visit(HX_VISIT_PARAMS)
{
	HX_VISIT_MEMBER_NAME(max,"max");
	HX_VISIT_MEMBER_NAME(min,"min");
}

Dynamic IntIterator_obj::__Field(const ::String &inName,bool inCallProp)
{
	switch(inName.length) {
	case 3:
		if (HX_FIELD_EQ(inName,"max") ) { return max; }
		if (HX_FIELD_EQ(inName,"min") ) { return min; }
		break;
	case 4:
		if (HX_FIELD_EQ(inName,"next") ) { return next_dyn(); }
		break;
	case 7:
		if (HX_FIELD_EQ(inName,"hasNext") ) { return hasNext_dyn(); }
	}
	return super::__Field(inName,inCallProp);
}

Dynamic IntIterator_obj::__SetField(const ::String &inName,const Dynamic &inValue,bool inCallProp)
{
	switch(inName.length) {
	case 3:
		if (HX_FIELD_EQ(inName,"max") ) { max=inValue.Cast< int >(); return inValue; }
		if (HX_FIELD_EQ(inName,"min") ) { min=inValue.Cast< int >(); return inValue; }
	}
	return super::__SetField(inName,inValue,inCallProp);
}

void IntIterator_obj::__GetFields(Array< ::String> &outFields)
{
	outFields->push(HX_CSTRING("max"));
	outFields->push(HX_CSTRING("min"));
	super::__GetFields(outFields);
};

static ::String sStaticFields[] = {
	String(null()) };

static ::String sMemberFields[] = {
	HX_CSTRING("next"),
	HX_CSTRING("hasNext"),
	HX_CSTRING("max"),
	HX_CSTRING("min"),
	String(null()) };

static void sMarkStatics(HX_MARK_PARAMS) {
	HX_MARK_MEMBER_NAME(IntIterator_obj::__mClass,"__mClass");
};

static void sVisitStatics(HX_VISIT_PARAMS) {
	HX_VISIT_MEMBER_NAME(IntIterator_obj::__mClass,"__mClass");
};

Class IntIterator_obj::__mClass;

void IntIterator_obj::__register()
{
	hx::Static(__mClass) = hx::RegisterClass(HX_CSTRING("IntIterator"), hx::TCanCast< IntIterator_obj> ,sStaticFields,sMemberFields,
	&__CreateEmpty, &__Create,
	&super::__SGetClass(), 0, sMarkStatics, sVisitStatics);
}

void IntIterator_obj::__boot()
{
}

