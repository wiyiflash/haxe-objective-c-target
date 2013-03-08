import ios.ui.UIApplicationMain;
import ios.ui.UIApplicationDelegate;
import ios.ui.UIResponder;
import ios.ui.UIImageView;
import ios.ui.UIImage;
import ios.ui.UILabel;
import ios.ui.UIWindow;
import ios.ui.UIScreen;
import ios.ui.UIView;
import ios.ui.UIButton;
import ios.ui.UIControl;
import ios.ui.UIViewController;
import ios.ui.UIApplication;
import ios.ui.UIColor;
import ios.ui.UIFont;
import ios.ui.NSText;
import objc.foundation.NSDictionary;
import objc.graphics.CGGeometry;


class PiratePig extends UIResponder implements UIApplicationDelegate {
	
	public var window :UIWindow;
	public var viewController :UIViewController;
	public var view :UIView;
	
	var background :UIImageView;
	var footer :UIImageView;
	var game :PiratePigGame;
	
	
	public function application (application:UIApplication, didFinishLaunchingWithOptions:NSDictionary) :Bool {
		
		trace("Start");
		
		window = new UIWindow();
		var screen = UIScreen.mainScreen();
		window.frame = screen.bounds;
		
		view = new UIView();
		view.frame = new CGRect(0, 0, window.frame.size.width, window.frame.size.height);
		view.autoresizesSubviews = true;
		view.autoresizingMask = untyped UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
		view.backgroundColor = UIColor.whiteColor();
		
		background = new UIImageView().initWithImage ( UIImage.imageNamed("background_tile.png") );
		var bs = background.frame;
		bs.size.width = window.frame.size.width;
		background.frame = bs;
		background.alpha = 0.5;
		footer = new UIImageView().initWithImage ( UIImage.imageNamed("center_bottom.png"));
		var bs = footer.frame;
		bs.origin.x = window.frame.size.width/2 - bs.size.width/2;
		bs.origin.y = window.frame.size.height - bs.size.height;
		footer.frame = bs;
		game = new PiratePigGame ();
		game.frame = view.frame;
		//game.resize (320, 480);
		view.addSubview (background);
		view.addSubview (footer);
		view.addSubview (game);
		
		viewController = new UIViewController();
		viewController.view = view;
		window.rootViewController = viewController;
		window.makeKeyAndVisible();
		
		//untyped __objc__("self.view.transform = CGAffineTransformScale(self.view.transform, 0.5, 0.5)");
		
		return true;
	}
	private function initialize ():Void {
		
	}
	private function construct ():Void {
		
	}
	
	public function applicationDidBecomeActive (application:UIApplication) :Void {}
	public function applicationWillResignActive (application:UIApplication) :Void {}
	
	
	

	public static function main() {
		return new UIApplicationMain ( PiratePig );
	}
}