#ifndef INCLUDED_Tests3
#define INCLUDED_Tests3

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

HX_DECLARE_CLASS0(Tests3)


class Tests3_obj extends public hx::Object{
	public:
		typedef hx::Object super;
		typedef Tests3_obj OBJ_;
		Tests3_obj();
		Void __construct();

	public:
		static hx::ObjectPtr< Tests3_obj > __new();
		static Dynamic __CreateEmpty();
		static Dynamic __Create(hx::DynamicArray inArgs);
		~Tests3_obj();

		HX_DO_RTTI;
		static void __boot();
		static void __register();
		void __Mark(HX_MARK_PARAMS);
		void __Visit(HX_VISIT_PARAMS);
		::String __ToString() const { return HX_CSTRING("Tests3"); }

		int d1;
};


#endif /* INCLUDED_Tests3 */ 
