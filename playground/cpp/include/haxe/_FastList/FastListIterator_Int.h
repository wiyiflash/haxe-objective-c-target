#ifndef INCLUDED_haxe__FastList_FastListIterator_Int
#define INCLUDED_haxe__FastList_FastListIterator_Int

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

#include <cpp/FastIterator_Int.h>
HX_DECLARE_CLASS1(cpp,FastIterator_Int)
HX_DECLARE_CLASS1(haxe,FastCell_Int)
HX_DECLARE_CLASS2(haxe,_FastList,FastListIterator_Int)
namespace haxe{
namespace _FastList{


class FastListIterator_Int_obj extends public ::cpp::FastIterator_Int_obj{
	public:
		typedef ::cpp::FastIterator_Int_obj super;
		typedef FastListIterator_Int_obj OBJ_;
		FastListIterator_Int_obj();
		Void __construct(::haxe::FastCell_Int head);

	public:
		static hx::ObjectPtr< FastListIterator_Int_obj > __new(::haxe::FastCell_Int head);
		static Dynamic __CreateEmpty();
		static Dynamic __Create(hx::DynamicArray inArgs);
		~FastListIterator_Int_obj();

		HX_DO_RTTI;
		static void __boot();
		static void __register();
		void __Mark(HX_MARK_PARAMS);
		void __Visit(HX_VISIT_PARAMS);
		::String __ToString() const { return HX_CSTRING("FastListIterator_Int"); }

		virtual int next( );
		Dynamic next_dyn();

		virtual bool hasNext( );
		Dynamic hasNext_dyn();

		::haxe::FastCell_Int current;
};

} // end namespace haxe
} // end namespace _FastList

#endif /* INCLUDED_haxe__FastList_FastListIterator_Int */ 
