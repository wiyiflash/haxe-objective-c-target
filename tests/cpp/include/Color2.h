#ifndef INCLUDED_Color2
#define INCLUDED_Color2

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

HX_DECLARE_CLASS0(Color2)


class Color2_obj extends public hx::EnumBase_obj
{
	typedef hx::EnumBase_obj super;
		typedef Color2_obj OBJ_;

	public:
		Color2_obj() {};
		HX_DO_ENUM_RTTI;
		static void __boot();
		static void __register();
		::String GetEnumName( ) const { return HX_CSTRING("Color2"); }
		::String __ToString() const { return HX_CSTRING("Color2.") + tag; }

		static ::Color2 Blue2;
		static inline ::Color2 Blue2_dyn() { return Blue2; }
		static ::Color2 Green2;
		static inline ::Color2 Green2_dyn() { return Green2; }
		static ::Color2 Red2;
		static inline ::Color2 Red2_dyn() { return Red2; }
};


#endif /* INCLUDED_Color2 */ 
