//
//  AuthManager.m
//  businessTime
//
//  Created by Eve Denison on 5/15/17.
//  Copyright © 2017 A Cahn. All rights reserved.
//

#import "AuthManager.h"
#import "MeetupToken.h"
#import <AFNetworking/AFNetworking.h>
#import <AFOAuth2Manager/AFOAuth2Manager.h>


@implementation AuthManager

+(void)getMeetupToken {
    NSURL *baseURL = [NSURL URLWithString:@"https://secure.meetup.com/oauth2/authorize"];

    AFOAuth2Manager *OAuth2Manager = [[AFOAuth2Manager alloc]initWithBaseURL:baseURL clientID: CLIENT_ID secret:CONSUMER_SECRET];
    [OAuth2Manager authenticateUsingOAuthWithURLString:@"/oauth/access" scope:@"basic" success:^(AFOAuthCredential * _Nonnull credential) {
        
        NSLog(@"Token:%@", credential.accessToken);
    } failure:^(NSError * _Nonnull error) {
        NSLog(@"Error: %@", error.localizedDescription);
    }];
};

@end
