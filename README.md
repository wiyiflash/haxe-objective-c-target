## Overview

Objective-C target can build Xcode projects with pure objective-c code from Haxe. The target can use Cocoa and CocoaTouch frameworks to build iPhone and Mac applications

> NOTE:  this is still work in progress and is not good for real life applications, but if you want to have fun and try it, go for it:

## Compiling Haxe

Clone the ObjC target from git somewhere in your computer, it contains also the entire haxe compiler sources. I keep the Haxe svn sources update once in few days usually

	git clone git@github.com:ralcr/haxe-objective-c-target.git
	
You now need to hardcode the path to the new std lib. In main.ml file at line 816 change the first path to match yours:

	com.class_path <- ["/Users/Cristi/Documents/haxecompiler/haxe/std/";"/usr/lib/haxe/std/";"/usr/local/lib/haxe/std/";"/usr/lib/haxe/std/libs/";"/usr/local/lib/haxe/std/libs/";"";"/"]

Navigate to haxe directory:

	cd haxe

Build Haxe with:

	make haxe

Or build Haxe and the tools with:

	make

On Mac you can run the build.sh script that will compile Haxe but will build the demos as well:

	./build.sh
	
In some cases, first time you compile Haxe i think, you should run first a:

	make clean

## Getting started with iOS

The starting point of your app is not very flexible, it should be like this, everything else is ignored:

	public static function main() {
		return new UIApplicationMain ( AppDelegate );
	}

And the AppDelegate.hx should conform with the UIApplicationDelegate. The main entry point is:

	class AppDelegate extends UIResponder implements UIApplicationDelegate {
		public function application (application:UIApplication, didFinishLaunchingWithOptions:NSDictionary) :Bool {
			// See the demos please
			return true;
		}
	}
	
You should start building your app from this method
