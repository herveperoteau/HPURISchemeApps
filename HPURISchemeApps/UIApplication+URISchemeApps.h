//
//  UIApplication+URISchemeApps.h
//  HPURISchemeApps
//
//  Created by Hervé PEROTEAU on 07/12/2013.
//  Copyright (c) 2013 Hervé PEROTEAU. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIApplication (URISchemeApps)

-(BOOL) canOpenAppTweetbot;
-(void) openTweetbot_Timeline:(NSString *)screenname;

-(BOOL) canOpenAppTwitter;
-(void) openTwitter_Timeline:(NSString *)screenname;

@end
