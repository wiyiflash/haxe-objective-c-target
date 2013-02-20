#ifndef INCLUDED_haxe_FastList_Int
#define INCLUDED_haxe_FastList_Int

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

HX_DECLARE_CLASS1(haxe,FastCell_Int)
HX_DECLARE_CLASS1(haxe,FastList_Int)
namespace haxe{


class FastList_Int_obj extends public hx::Object{
	public:
		typedef hx::Object super;
		typedef FastList_Int_obj OBJ_;
		FastList_Int_obj();
		Void __construct();

	public:
		static hx::ObjectPtr< FastList_Int_obj > __new();
		static Dynamic __CreateEmpty();
		static Dynamic __Create(hx::DynamicArray inArgs);
		~FastList_Int_obj();

		HX_DO_RTTI;
		static void __boot();
		static void __register();
		void __Mark(HX_MARK_PARAMS);
		void __Visit(HX_VISIT_PARAMS);
		::String __ToString() const { return HX_CSTRING("FastList_Int"); }

		virtual ::String toString( );
		Dynamic toString_dyn();

		virtual Dynamic iterator( );
		Dynamic iterator_dyn();

		virtual bool remove( int v);
		Dynamic remove_dyn();

		virtual bool isEmpty( );
		Dynamic isEmpty_dyn();

		virtual Dynamic pop( );
		Dynamic pop_dyn();

		virtual Dynamic first( );
		Dynamic first_dyn();

		virtual Void add( int item);
		Dynamic add_dyn();

		::haxe::FastCell_Int head;
};

} // end namespace haxe

#endif /* INCLUDED_haxe_FastList_Int */ 
