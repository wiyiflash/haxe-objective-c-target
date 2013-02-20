#ifndef INCLUDED_Color
#define INCLUDED_Color

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

HX_DECLARE_CLASS0(Color)


class Color_obj extends public hx::EnumBase_obj
{
	typedef hx::EnumBase_obj super;
		typedef Color_obj OBJ_;

	public:
		Color_obj() {};
		HX_DO_ENUM_RTTI;
		static void __boot();
		static void __register();
		::String GetEnumName( ) const { return HX_CSTRING("Color"); }
		::String __ToString() const { return HX_CSTRING("Color.") + tag; }

		static ::Color Alpha(int a,::Color col);
		static Dynamic Alpha_dyn();
		static ::Color Blue;
		static inline ::Color Blue_dyn() { return Blue; }
		static ::Color Green;
		static inline ::Color Green_dyn() { return Green; }
		static ::Color Grey(int v);
		static Dynamic Grey_dyn();
		static ::Color Red;
		static inline ::Color Red_dyn() { return Red; }
		static ::Color Rgb(int r,int g,int b);
		static Dynamic Rgb_dyn();
};


#endif /* INCLUDED_Color */ 
