#ifndef INCLUDED_haxe_crypto_Md5
#define INCLUDED_haxe_crypto_Md5

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

HX_DECLARE_CLASS2(haxe,crypto,Md5)
HX_DECLARE_CLASS2(haxe,io,Bytes)
namespace haxe{
namespace crypto{


class Md5_obj extends public hx::Object{
	public:
		typedef hx::Object super;
		typedef Md5_obj OBJ_;
		Md5_obj();
		Void __construct();

	public:
		static hx::ObjectPtr< Md5_obj > __new();
		static Dynamic __CreateEmpty();
		static Dynamic __Create(hx::DynamicArray inArgs);
		~Md5_obj();

		HX_DO_RTTI;
		static void __boot();
		static void __register();
		void __Mark(HX_MARK_PARAMS);
		void __Visit(HX_VISIT_PARAMS);
		::String __ToString() const { return HX_CSTRING("Md5"); }

		virtual Array< int > doEncode( Array< int > x);
		Dynamic doEncode_dyn();

		virtual int ii( int a,int b,int c,int d,int x,int s,int t);
		Dynamic ii_dyn();

		virtual int hh( int a,int b,int c,int d,int x,int s,int t);
		Dynamic hh_dyn();

		virtual int gg( int a,int b,int c,int d,int x,int s,int t);
		Dynamic gg_dyn();

		virtual int ff( int a,int b,int c,int d,int x,int s,int t);
		Dynamic ff_dyn();

		virtual int cmn( int q,int a,int b,int x,int s,int t);
		Dynamic cmn_dyn();

		virtual int rol( int num,int cnt);
		Dynamic rol_dyn();

		virtual ::String hex( Array< int > a);
		Dynamic hex_dyn();

		virtual int addme( int x,int y);
		Dynamic addme_dyn();

		virtual int bitAND( int a,int b);
		Dynamic bitAND_dyn();

		virtual int bitXOR( int a,int b);
		Dynamic bitXOR_dyn();

		virtual int bitOR( int a,int b);
		Dynamic bitOR_dyn();

		static ::String encode( ::String s);
		static Dynamic encode_dyn();

		static ::haxe::io::Bytes make( ::haxe::io::Bytes b);
		static Dynamic make_dyn();

		static Array< int > bytes2blks( ::haxe::io::Bytes b);
		static Dynamic bytes2blks_dyn();

		static Array< int > str2blks( ::String str);
		static Dynamic str2blks_dyn();

};

} // end namespace haxe
} // end namespace crypto

#endif /* INCLUDED_haxe_crypto_Md5 */ 
