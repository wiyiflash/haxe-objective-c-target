#ifndef INCLUDED_DateTools
#define INCLUDED_DateTools

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

HX_DECLARE_CLASS0(Date)
HX_DECLARE_CLASS0(DateTools)


class DateTools_obj extends public hx::Object{
	public:
		typedef hx::Object super;
		typedef DateTools_obj OBJ_;
		DateTools_obj();
		Void __construct();

	public:
		static hx::ObjectPtr< DateTools_obj > __new();
		static Dynamic __CreateEmpty();
		static Dynamic __Create(hx::DynamicArray inArgs);
		~DateTools_obj();

		HX_DO_RTTI;
		static void __boot();
		static void __register();
		void __Mark(HX_MARK_PARAMS);
		void __Visit(HX_VISIT_PARAMS);
		::String __ToString() const { return HX_CSTRING("DateTools"); }

		static ::String __format_get( ::Date d,::String e);
		static Dynamic __format_get_dyn();

		static ::String __format( ::Date d,::String f);
		static Dynamic __format_dyn();

		static ::String format( ::Date d,::String f);
		static Dynamic format_dyn();

		static ::Date delta( ::Date d,Float t);
		static Dynamic delta_dyn();

		static Array< int > DAYS_OF_MONTH;
		static int getMonthDays( ::Date d);
		static Dynamic getMonthDays_dyn();

		static Float seconds( Float n);
		static Dynamic seconds_dyn();

		static Float minutes( Float n);
		static Dynamic minutes_dyn();

		static Float hours( Float n);
		static Dynamic hours_dyn();

		static Float days( Float n);
		static Dynamic days_dyn();

		static Dynamic parse( Float t);
		static Dynamic parse_dyn();

		static Float make( Dynamic o);
		static Dynamic make_dyn();

};


#endif /* INCLUDED_DateTools */ 
