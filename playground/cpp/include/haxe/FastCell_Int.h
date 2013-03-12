#ifndef INCLUDED_haxe_FastCell_Int
#define INCLUDED_haxe_FastCell_Int

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

HX_DECLARE_CLASS1(haxe,FastCell_Int)
namespace haxe{


class FastCell_Int_obj extends public hx::Object{
	public:
		typedef hx::Object super;
		typedef FastCell_Int_obj OBJ_;
		FastCell_Int_obj();
		Void __construct(int elt,::haxe::FastCell_Int next);

	public:
		static hx::ObjectPtr< FastCell_Int_obj > __new(int elt,::haxe::FastCell_Int next);
		static Dynamic __CreateEmpty();
		static Dynamic __Create(hx::DynamicArray inArgs);
		~FastCell_Int_obj();

		HX_DO_RTTI;
		static void __boot();
		static void __register();
		void __Mark(HX_MARK_PARAMS);
		void __Visit(HX_VISIT_PARAMS);
		::String __ToString() const { return HX_CSTRING("FastCell_Int"); }

		::haxe::FastCell_Int next;
		int elt;
};

} // end namespace haxe

#endif /* INCLUDED_haxe_FastCell_Int */ 
