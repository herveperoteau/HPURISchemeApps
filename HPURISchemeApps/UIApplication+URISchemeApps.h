//
//  UIApplication+URISchemeApps.h
//  HPURISchemeApps
//
//  Created by Hervé PEROTEAU on 07/12/2013.
//  Copyright (c) 2013 Hervé PEROTEAU. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIApplication (URISchemeApps)

-(NSString *) schemeWithIdentifier:(NSString *)identifier;

-(BOOL) canOpenAppTweetbot;
-(void) openTweetbot_Timeline:(NSString *)screenname;
-(void) openTweetbot_Timeline:(NSString *)screenname WithCallBackURL:(NSString *)callBackURL;

-(BOOL) canOpenAppTwitter;
-(void) openTwitter_Timeline:(NSString *)screenname;

-(BOOL) canOpenAppChromeHttp;
-(void) openChromeHttp:(NSString *)url;
-(void) openChromeHttp:(NSString *)url
       WithCallBackURL:(NSString *)callBackURL
       AndCallBackName:(NSString *)nameApp;

-(BOOL) canOpenAppChromeHttps;
-(void) openChromeHttps:(NSString *)url;
-(void) openChromeHttps:(NSString *)url
        WithCallBackURL:(NSString *)callBackURL
        AndCallBackName:(NSString *)nameApp;

-(BOOL) canOpenAppSafariHttp;
-(void) openSafariHttp:(NSString *)url;

-(BOOL) canOpenAppSafariHttps;
-(void) openSafariHttps:(NSString *)url;

@end
