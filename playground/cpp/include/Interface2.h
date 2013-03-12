#ifndef INCLUDED_Interface2
#define INCLUDED_Interface2

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

HX_DECLARE_CLASS0(Interface2)


class Interface2_obj extends public hx::Interface{
	public:
		typedef hx::Interface super;
		typedef Interface2_obj OBJ_;
		HX_DO_INTERFACE_RTTI;
		static void __boot();
virtual int minus( int a,int b)=0;
		Dynamic minus_dyn();
};

#define DELEGATE_Interface2 \
virtual int minus( int a,int b) { return mDelegate->minus(a,b);}  \
virtual Dynamic minus_dyn() { return mDelegate->minus_dyn();}  \


template<typename IMPL>
class Interface2_delegate_ extends public Interface2_obj
{
	protected:
		IMPL *mDelegate;
	public:
		Interface2_delegate_(IMPL *inDelegate) extends mDelegate(inDelegate) {}
		hx::Object *__GetRealObject() { return mDelegate; }
		void __Visit(HX_VISIT_PARAMS) { HX_VISIT_OBJECT(mDelegate); }
		DELEGATE_Interface2
};


#endif /* INCLUDED_Interface2 */ 
