#ifndef INCLUDED__Tests3_TestsEnumExtern
#define INCLUDED__Tests3_TestsEnumExtern

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

HX_DECLARE_CLASS1(_Tests3,TestsEnumExtern)
namespace _Tests3{


class TestsEnumExtern_obj extends public hx::EnumBase_obj
{
	typedef hx::EnumBase_obj super;
		typedef TestsEnumExtern_obj OBJ_;

	public:
		TestsEnumExtern_obj() {};
		HX_DO_ENUM_RTTI;
		static void __boot();
		static void __register();
		::String GetEnumName( ) const { return HX_CSTRING("_Tests3.TestsEnumExtern"); }
		::String __ToString() const { return HX_CSTRING("TestsEnumExtern.") + tag; }

		static ::_Tests3::TestsEnumExtern ExternEnumValue1;
		static inline ::_Tests3::TestsEnumExtern ExternEnumValue1_dyn() { return ExternEnumValue1; }
		static ::_Tests3::TestsEnumExtern ExternEnumValue2;
		static inline ::_Tests3::TestsEnumExtern ExternEnumValue2_dyn() { return ExternEnumValue2; }
		static ::_Tests3::TestsEnumExtern ExternEnumValue3;
		static inline ::_Tests3::TestsEnumExtern ExternEnumValue3_dyn() { return ExternEnumValue3; }
};

} // end namespace _Tests3

#endif /* INCLUDED__Tests3_TestsEnumExtern */ 
