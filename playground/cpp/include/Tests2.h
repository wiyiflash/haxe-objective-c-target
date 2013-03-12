#ifndef INCLUDED_Tests2
#define INCLUDED_Tests2

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

HX_DECLARE_CLASS0(Tests2)


class Tests2_obj extends public hx::Object{
	public:
		typedef hx::Object super;
		typedef Tests2_obj OBJ_;
		Tests2_obj();
		Void __construct();

	public:
		static hx::ObjectPtr< Tests2_obj > __new();
		static Dynamic __CreateEmpty();
		static Dynamic __Create(hx::DynamicArray inArgs);
		~Tests2_obj();

		HX_DO_RTTI;
		static void __boot();
		static void __register();
		void __Mark(HX_MARK_PARAMS);
		void __Visit(HX_VISIT_PARAMS);
		::String __ToString() const { return HX_CSTRING("Tests2"); }

		Dynamic functionToRedefine2;
		inline Dynamic &functionToRedefine2_dyn() {return functionToRedefine2; }

		Dynamic functionToRedefine;
		inline Dynamic &functionToRedefine_dyn() {return functionToRedefine; }

		virtual Void methodInTests2( );
		Dynamic methodInTests2_dyn();

		int d1;
};


#endif /* INCLUDED_Tests2 */ 
