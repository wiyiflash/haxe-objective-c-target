#ifndef INCLUDED_IntIterator
#define INCLUDED_IntIterator

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

HX_DECLARE_CLASS0(IntIterator)


class IntIterator_obj extends public hx::Object{
	public:
		typedef hx::Object super;
		typedef IntIterator_obj OBJ_;
		IntIterator_obj();
		Void __construct(int min,int max);

	public:
		static hx::ObjectPtr< IntIterator_obj > __new(int min,int max);
		static Dynamic __CreateEmpty();
		static Dynamic __Create(hx::DynamicArray inArgs);
		~IntIterator_obj();

		HX_DO_RTTI;
		static void __boot();
		static void __register();
		void __Mark(HX_MARK_PARAMS);
		void __Visit(HX_VISIT_PARAMS);
		::String __ToString() const { return HX_CSTRING("IntIterator"); }

		virtual int next( );
		Dynamic next_dyn();

		virtual bool hasNext( );
		Dynamic hasNext_dyn();

		int max;
		int min;
};


#endif /* INCLUDED_IntIterator */ 
