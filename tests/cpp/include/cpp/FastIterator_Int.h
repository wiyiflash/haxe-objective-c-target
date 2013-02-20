#ifndef INCLUDED_cpp_FastIterator_Int
#define INCLUDED_cpp_FastIterator_Int

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

HX_DECLARE_CLASS1(cpp,FastIterator_Int)
namespace cpp{


class FastIterator_Int_obj extends public hx::Object{
	public:
		typedef hx::Object super;
		typedef FastIterator_Int_obj OBJ_;
		FastIterator_Int_obj();
		Void __construct();

	public:
		static hx::ObjectPtr< FastIterator_Int_obj > __new();
		static Dynamic __CreateEmpty();
		static Dynamic __Create(hx::DynamicArray inArgs);
		~FastIterator_Int_obj();

		HX_DO_RTTI;
		static void __boot();
		static void __register();
		void __Mark(HX_MARK_PARAMS);
		void __Visit(HX_VISIT_PARAMS);
		::String __ToString() const { return HX_CSTRING("FastIterator_Int"); }

		Dynamic next;
		Dynamic &next_dyn() { return next;}
		Dynamic hasNext;
		Dynamic &hasNext_dyn() { return hasNext;}
};

} // end namespace cpp

#endif /* INCLUDED_cpp_FastIterator_Int */ 
