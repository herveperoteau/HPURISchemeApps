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

-(BOOL) canOpenAppTweetbot {
    
    return [self canOpenAppWithScheme:@"tweetbot"];
}

-(void) openTweetbot_Timeline:(NSString *)screenname {
    
    [self openAppWithScheme:@"tweetbot"
                  withValue:[NSString stringWithFormat:@"/user_profile/%@", screenname]];
}

-(BOOL) canOpenAppTwitter {
    
    return [self canOpenAppType:SSAppURLTypeTwitter];
}

-(void) openTwitter_Timeline:(NSString *)screenname {
    
    [self openAppType:SSAppURLTypeTwitter
            withValue:[NSString stringWithFormat:@"user?screen_name=%@", screenname]];
}


@end
