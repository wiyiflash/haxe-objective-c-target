#ifndef INCLUDED_Interface1
#define INCLUDED_Interface1

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

HX_DECLARE_CLASS0(Interface1)


class Interface1_obj extends public hx::Interface{
	public:
		typedef hx::Interface super;
		typedef Interface1_obj OBJ_;
		HX_DO_INTERFACE_RTTI;
		static void __boot();
virtual int add( int a,int b)=0;
		Dynamic add_dyn();
};

#define DELEGATE_Interface1 \
virtual int add( int a,int b) { return mDelegate->add(a,b);}  \
virtual Dynamic add_dyn() { return mDelegate->add_dyn();}  \


template<typename IMPL>
class Interface1_delegate_ extends public Interface1_obj
{
	protected:
		IMPL *mDelegate;
	public:
		Interface1_delegate_(IMPL *inDelegate) extends mDelegate(inDelegate) {}
		hx::Object *__GetRealObject() { return mDelegate; }
		void __Visit(HX_VISIT_PARAMS) { HX_VISIT_OBJECT(mDelegate); }
		DELEGATE_Interface1
};


#endif /* INCLUDED_Interface1 */ 
