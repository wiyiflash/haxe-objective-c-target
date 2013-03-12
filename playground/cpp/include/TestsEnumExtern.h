#ifndef INCLUDED_TestsEnumExtern
#define INCLUDED_TestsEnumExtern

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

HX_DECLARE_CLASS0(TestsEnumExtern)


class TestsEnumExtern_obj extends public hx::EnumBase_obj
{
	typedef hx::EnumBase_obj super;
		typedef TestsEnumExtern_obj OBJ_;

	public:
		TestsEnumExtern_obj() {};
		HX_DO_ENUM_RTTI;
		static void __boot();
		static void __register();
		::String GetEnumName( ) const { return HX_CSTRING("TestsEnumExtern"); }
		::String __ToString() const { return HX_CSTRING("TestsEnumExtern.") + tag; }

		static ::TestsEnumExtern ExternEnumValue1;
		static inline ::TestsEnumExtern ExternEnumValue1_dyn() { return ExternEnumValue1; }
		static ::TestsEnumExtern ExternEnumValue2;
		static inline ::TestsEnumExtern ExternEnumValue2_dyn() { return ExternEnumValue2; }
		static ::TestsEnumExtern ExternEnumValue3;
		static inline ::TestsEnumExtern ExternEnumValue3_dyn() { return ExternEnumValue3; }
};


#endif /* INCLUDED_TestsEnumExtern */ 
