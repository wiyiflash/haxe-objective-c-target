#ifndef INCLUDED__Tests3_Color
#define INCLUDED__Tests3_Color

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

HX_DECLARE_CLASS1(_Tests3,Color)
namespace _Tests3{


class Color_obj extends public hx::EnumBase_obj
{
	typedef hx::EnumBase_obj super;
		typedef Color_obj OBJ_;

	public:
		Color_obj() {};
		HX_DO_ENUM_RTTI;
		static void __boot();
		static void __register();
		::String GetEnumName( ) const { return HX_CSTRING("_Tests3.Color"); }
		::String __ToString() const { return HX_CSTRING("Color.") + tag; }

		static ::_Tests3::Color Blue;
		static inline ::_Tests3::Color Blue_dyn() { return Blue; }
		static ::_Tests3::Color Green;
		static inline ::_Tests3::Color Green_dyn() { return Green; }
		static ::_Tests3::Color Red;
		static inline ::_Tests3::Color Red_dyn() { return Red; }
};

} // end namespace _Tests3

#endif /* INCLUDED__Tests3_Color */ 
