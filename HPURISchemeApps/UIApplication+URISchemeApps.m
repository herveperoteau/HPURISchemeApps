//
//  UIApplication+URISchemeApps.m
//  HPURISchemeApps
//
//  Created by Hervé PEROTEAU on 07/12/2013.
//  Copyright (c) 2013 Hervé PEROTEAU. All rights reserved.
//

#import "UIApplication+URISchemeApps.h"

#import "UIApplication+SSAppURLs.h"

@implementation UIApplication (URISchemeApps)

-(NSString *) schemeWithIdentifier:(NSString *)identifier {

    /** plist
    <key>CFBundleURLTypes</key>
	<array>
     <dict>
        <key>CFBundleTypeRole</key>
        <string>None</string>
        <key>CFBundleURLName</key>
        <string>com.peroteau.herve.MusicBox</string>
        <key>CFBundleURLSchemes</key>
        <array>
            <string>musicboxhp</string>
        </array>
     </dict>
	</array>
 
     */
    
    __block NSString *result = nil;
    
    NSDictionary *infoPList = [[NSBundle mainBundle] infoDictionary];
    
    NSArray *urlTypes = infoPList[@"CFBundleURLTypes"];
    
    [urlTypes enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        
        NSDictionary *urlType = obj;
        
        NSString *urlName = urlType[@"CFBundleURLName"];
        
        if ([urlName isEqualToString:identifier]) {

            NSArray *schemes = urlType[@"CFBundleURLSchemes"];
            
            result = schemes[0];
            
            *stop = YES;
        }
    }];

    NSAssert(result!=nil, @"Echec recup scheme with identifier %@", identifier);
    
    NSLog(@"schemeWithIdentifier:%@ = %@", identifier, result);
    
    return result;
}

-(BOOL) canOpenAppTweetbot {
    
    return [self canOpenAppWithScheme:@"tweetbot"];
}

-(void) openTweetbot_Timeline:(NSString *)screenname {
    
    return [self openTweetbot_Timeline:screenname WithCallBackURL:nil];
}

-(void) openTweetbot_Timeline:(NSString *)screenname WithCallBackURL:(NSString *)callBackURL{
    
    //* tweetbot://<screenname>/user_profile/<screenname|user_id>?callback_url=<url>
    NSURL *urlTweetbot;
    
    if (callBackURL.length > 0) {
    
        urlTweetbot = [NSURL URLWithString:[NSString stringWithFormat:@"tweetbot:///user_profile/%@?callback_url=%@", screenname, callBackURL]];
    }
    else {
        
        urlTweetbot = [NSURL URLWithString:[NSString stringWithFormat:@"tweetbot:///user_profile/%@", screenname]];
    }
    
    NSLog(@"urlTweetbot=%@", urlTweetbot);

    [self openURL:urlTweetbot];
}

-(BOOL) canOpenAppTwitter {
    
    return [self canOpenAppType:SSAppURLTypeTwitter];
}

-(void) openTwitter_Timeline:(NSString *)screenname {
    
    [self openAppType:SSAppURLTypeTwitter
            withValue:[NSString stringWithFormat:@"user?screen_name=%@", screenname]];
}

-(BOOL) canOpenAppChromeHttp {
    
    return [self canOpenAppType:SSAppURLTypeChromeHTTP];
}

-(void) openChromeHttp:(NSString *)url {
    
    [self openAppType:SSAppURLTypeChromeHTTP withValue:url];
}

-(void) openChromeHttp:(NSString *)url WithCallBackURL:(NSString *)callBackURL AndCallBackName:(NSString *)nameApp {
    
    NSString *chromeURLString = [NSString stringWithFormat:
                                     @"googlechrome-x-callback://x-callback-url/open/?x-source=%@&x-success=%@&url=http://%@",
                                     [self urlEncoded:nameApp],
                                     [self urlEncoded:callBackURL],
                                     [self urlEncoded:url]];

    NSLog(@"chromeURLString=%@", chromeURLString);

    NSURL *chromeURL = [NSURL URLWithString:chromeURLString];

    NSLog(@"chromeURL=%@", [chromeURL description]);
    
    // Open the URL with Google Chrome.
    [[UIApplication sharedApplication] openURL:chromeURL];
    
}

-(BOOL) canOpenAppChromeHttps {
    
    return [self canOpenAppType:SSAppURLTypeChromeHTTPS];
}

-(void) openChromeHttps:(NSString *)url {
    
    [self openAppType:SSAppURLTypeChromeHTTPS withValue:url];
}

-(void) openChromeHttps:(NSString *)url
        WithCallBackURL:(NSString *)callBackURL
        AndCallBackName:(NSString *)nameApp {
    
    NSString *chromeURLString = [NSString stringWithFormat:
                                 @"googlechrome-x-callback://x-callback-url/open/?x-source=%@&x-success=%@&url=https://%@",
                                 [self urlEncoded:nameApp],
                                 [self urlEncoded:callBackURL],
                                 [self urlEncoded:url]];
    
    NSLog(@"openChromeHttps chromeURLString=%@", chromeURLString);
    NSURL *chromeURL = [NSURL URLWithString:chromeURLString];
    NSLog(@"openChromeHttps chromeURL=%@", [chromeURL description]);
    
    // Open the URL with Google Chrome.
    [[UIApplication sharedApplication] openURL:chromeURL];
}

-(BOOL) canOpenAppSafariHttp {
    
    return [self canOpenAppType:SSAppURLTypeSafariHTTP];
}

-(void) openSafariHttp:(NSString *)url {
    
    [self openAppType:SSAppURLTypeSafariHTTP withValue:url];
}

-(BOOL) canOpenAppSafariHttps {

    return [self canOpenAppType:SSAppURLTypeSafariHTTPS];
}

-(void) openSafariHttps:(NSString *)url {

    [self openAppType:SSAppURLTypeSafariHTTPS withValue:url];
}

#pragma mark - private

// Method to escape parameters in the URL.
-(NSString *) urlEncoded:(NSString *)url
{
    CFStringRef encodedCfStringRef = CFURLCreateStringByAddingPercentEscapes(NULL,(CFStringRef)url,NULL,(CFStringRef)@"!*'\"();@+$,%#[]% ",kCFStringEncodingUTF8 );
    NSString *endcodedString = (NSString *)CFBridgingRelease(encodedCfStringRef);
    return endcodedString;
}

@end
