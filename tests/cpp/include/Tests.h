#ifndef INCLUDED_Tests
#define INCLUDED_Tests

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

#include <Interface2.h>
#include <Interface1.h>
HX_DECLARE_CLASS0(Color)
HX_DECLARE_CLASS0(Interface1)
HX_DECLARE_CLASS0(Interface2)
HX_DECLARE_CLASS0(Tests)
HX_DECLARE_CLASS0(TestsEnumExtern)


class Tests_obj extends public hx::Object{
	public:
		typedef hx::Object super;
		typedef Tests_obj OBJ_;
		Tests_obj();
		Void __construct();

	public:
		static hx::ObjectPtr< Tests_obj > __new();
		static Dynamic __CreateEmpty();
		static Dynamic __Create(hx::DynamicArray inArgs);
		~Tests_obj();

		HX_DO_RTTI;
		static void __boot();
		static void __register();
		void __Mark(HX_MARK_PARAMS);
		void __Visit(HX_VISIT_PARAMS);
		inline operator ::Interface2_obj *()
			{ return new ::Interface2_delegate_< Tests_obj >(this); }
		inline operator ::Interface1_obj *()
			{ return new ::Interface1_delegate_< Tests_obj >(this); }
		hx::Object *__ToInterface(const type_info &inType);
		::String __ToString() const { return HX_CSTRING("Tests"); }

		virtual Void functionToRedefine2( int param1,::String param2);
		Dynamic functionToRedefine2_dyn();

		virtual Void functionToRedefine( );
		Dynamic functionToRedefine_dyn();

		virtual Void printHello( );
		Dynamic printHello_dyn();

		virtual Void init( );
		Dynamic init_dyn();

		virtual Void optionalArguments3( int arg1,hx::Null< int >  arg2,Dynamic arg3,Dynamic arg4);
		Dynamic optionalArguments3_dyn();

		virtual Void optionalArguments2( int arg1,Dynamic arg2,Dynamic arg3,int arg4);
		Dynamic optionalArguments2_dyn();

		virtual Void optionalArguments1( int arg1,int arg2,int arg3,hx::Null< int >  arg4);
		Dynamic optionalArguments1_dyn();

		virtual Void optionalArguments( int arg1,int arg2,int arg3,Dynamic arg4);
		Dynamic optionalArguments_dyn();

		virtual Void callLotsOfArguments( int arg1,int arg2,int arg3,int arg4);
		Dynamic callLotsOfArguments_dyn();

		virtual int minus( int a,int b);
		Dynamic minus_dyn();

		virtual int add( int a,int b);
		Dynamic add_dyn();

		virtual int setWidth( int v);
		Dynamic setWidth_dyn();

		virtual int getWidth( );
		Dynamic getWidth_dyn();

		virtual Void testFrameworksImport( );
		Dynamic testFrameworksImport_dyn();

		virtual Void testOverload( );
		Dynamic testOverload_dyn();

		virtual Void foo( );
		Dynamic foo_dyn();

		virtual Void testCrypto( );
		Dynamic testCrypto_dyn();

		virtual Void testXml( );
		Dynamic testXml_dyn();

		virtual Void testType( );
		Dynamic testType_dyn();

		virtual Void testString( );
		Dynamic testString_dyn();

		virtual Void testStd( );
		Dynamic testStd_dyn();

		virtual Void testReflect( );
		Dynamic testReflect_dyn();

		virtual Void testMath( );
		Dynamic testMath_dyn();

		virtual Void testList( );
		Dynamic testList_dyn();

		virtual Void testLambda( );
		Dynamic testLambda_dyn();

		virtual Void testHash( );
		Dynamic testHash_dyn();

		virtual Void testEReg( );
		Dynamic testEReg_dyn();

		virtual Void testEnum( ::TestsEnumExtern v);
		Dynamic testEnum_dyn();

		virtual int enumToInt( ::Color c);
		Dynamic enumToInt_dyn();

		virtual Void testDate( );
		Dynamic testDate_dyn();

		virtual Void testArray( );
		Dynamic testArray_dyn();

		virtual Void testSwitch( );
		Dynamic testSwitch_dyn();

		virtual Void testTry( );
		Dynamic testTry_dyn();

		virtual Void testWhile( );
		Dynamic testWhile_dyn();

		virtual Void testingFor( );
		Dynamic testingFor_dyn();

		virtual Void testVariables( );
		Dynamic testVariables_dyn();

		::String s;
		Float d2;
		int d1;
		int width;
		Float interfaceVar2;
		int interfaceVar1;
		static ::String staticVar1;
		static int staticVar2;
		static int staticVar3;
		static Void main( );
		static Dynamic main_dyn();

};


#endif /* INCLUDED_Tests */ 
