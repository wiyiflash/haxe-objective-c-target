//
//  Fb.m
//  Playground
//
//  Created by Baluta Cristian on 06/03/2013.
//  Copyright (c) 2013 Baluta Cristian. All rights reserved.
//

#import "Fb.h"

@implementation Fb



//UIButton *loginB = [[UIButton alloc] initWithFrame:CGRectMake(0, 50, 100, 30)];
//[loginB setTitle:@"Login" forState:UIControlStateNormal];// titleLabel.text = @"Login";//[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
//[loginB addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
//[self.window addSubview:loginB];
//
//UIButton *logoutB = [[UIButton alloc] initWithFrame:CGRectMake(100, 50, 100, 30)];
//[logoutB setTitle:@"Logout" forState:UIControlStateNormal];// titleLabel.text = @"Login";//[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
//[logoutB addTarget:self action:@selector(logout) forControlEvents:UIControlEventTouchUpInside];
//[self.window addSubview:logoutB];



- (void)login{
	NSLog(@"login");
	return;
	UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 80, 320, 500)];
	webView.delegate = self;
	NSURL *url = [[NSURL alloc] initWithString:@"https://graph.facebook.com/oauth/authorize?client_id=456093077787894&redirect_uri=http://www.facebook.com/connect/login_success.html&display=touch&response_type=token"];
	NSURLRequest *req = [[NSURLRequest alloc] initWithURL:url];
	[webView loadRequest:req];
	//[self.window addSubview:webView];
}
-(void)logout {
	NSLog(@"logout");
	[activityIndicator stopAnimating];
	[activityIndicator removeFromSuperview];
	//[activityIndicator release];
	activityIndicator = nil;
	return;
	NSString *str2 = [NSString stringWithFormat:@"https://graph.facebook.com/oauth/authorize_cancel?client_id=456093077787894&redirect_uri=&access_token=%@", token];
	NSURL *url2 = [[NSURL alloc] initWithString:str2];
	NSString *str = [NSString stringWithFormat:@"https://m.facebook.com/logout.php?next=&confirm=1&access_token=%@", token];
	//NSURL *url = [[NSURL alloc] initWithString:str];
	NSURLRequest *req = [NSURLRequest requestWithURL:url2];
	NSLog(@"logout %@", str);
	
	UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 80, 320, 500)];
	//webView.delegate = self;
	[webView loadRequest:req];
	//[self.window addSubview:webView];
	
	NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:req delegate:self startImmediately:YES];
}

-(void) connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    //[receivingData appendData:data];
    //the received data is added to receivingData
}

-(void) connectionDidFinishLoading:(NSURLConnection *)connection
{
	NSLog(@"done logout");
	// NSString *str = [[NSString alloc] initWithData:receivingData encoding:NSUTF8StringEncoding];
    //We make the data a string
    //receivedData = [NSMutableArray arrayWithArray:[str componentsSeparatedByString:@"\n"]];
    //receivedData now has an array with every line of the request
    //You could do something with the data here, store it, or send it to another function
}
-(void)webViewDidFinishLoad:(UIWebView *)webView {
	NSLog(@"load complete at url %@", webView.request.URL);
	//[webView.request.URL.absoluteString cStringUsingEncoding:NSUTF8StringEncoding];
	
	NSArray *arr = [webView.request.URL.absoluteString componentsSeparatedByString:@"access_token="];
	NSArray *arr2 = [[arr lastObject] componentsSeparatedByString:@"&"];
	token = [arr2 objectAtIndex:0];
	NSLog(@"token = %@", token);
	webView.delegate = nil;
	
	//	NSString *str = [NSString stringWithFormat:@"https://graph.facebook.com/me/friends?access_token=%@", token];
	//	NSURL *url = [[NSURL alloc] initWithString:str];
	//	NSURLRequest *req = [[NSURLRequest alloc] initWithURL:url];
	//	[webView loadRequest:req];
	
	
	//NSArray *keys = [NSArray arrayWithObjects:@"access_token",@"app_secret", @"message", nil];
	//NSArray *objects = [NSArray arrayWithObjects:token, @"7a779b67a3182aece3675e9c81fc41de", @"messagegegegege", nil];
	//NSDictionary *dictionary = [NSDictionary dictionaryWithObjects:objects forKeys:keys];
	
	//	RCHttpRequest *req = [[RCHttpRequest alloc] initWithURL:@"https://graph.facebook.com/me/friends" delegate:nil];
	//	RCHttpRequest *req = [[RCHttpRequest alloc] initWithURL:@"https://graph.facebook.com/me/feed" delegate:nil];
	//RCHttpRequest *req = [[RCHttpRequest alloc] initWithURL:[NSString stringWithFormat:@"https://graph.facebook.com/me/friends?access_token=%@", token] delegate:nil];
	//RCHttpRequest *req = [[RCHttpRequest alloc] initWithURL:@"http://ralcr.com/insert.php?" delegate:nil];
	//[req call:@"" variables:dictionary method:@"GET"];
}

@end
