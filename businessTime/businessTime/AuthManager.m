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
    //authenticate
    NSURL *baseURL = [NSURL URLWithString:@"https://secure.meetup.com/oauth2/authorize"];
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc]initWithBaseURL:baseURL];
    AFOAuth2Manager *OAuth2Manager = [[AFOAuth2Manager alloc]initWithBaseURL:baseURL clientID: CLIENT_ID secret:CONSUMER_SECRET];
    [OAuth2Manager authenticateUsingOAuthWithURLString:@"/oauth/access" scope:@"basic" success:^(AFOAuthCredential * _Nonnull credential) {
        
        NSLog(@"Token:%@", credential.accessToken);
        //authorize
        [manager.requestSerializer setAuthorizationHeaderFieldWithCredential:credential];
        
        //retrieving credentials
        [AFOAuthCredential retrieveCredentialWithIdentifier:CLIENT_ID];
        
        //storing credentials
        [AFOAuthCredential storeCredential:credential
                            withIdentifier:CLIENT_ID];
        
        //authorize
        [manager GET:@"/path/to/protected/resource"
          parameters:nil
            progress:nil
             success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                 NSLog(@"Success: %@", responseObject);
             }
             failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                 NSLog(@"Failure: %@", error);
             }];
        
    } failure:^(NSError * _Nonnull error) {
        NSLog(@"Error: %@", error.localizedDescription);
    }];
};
    
    

  

@end
