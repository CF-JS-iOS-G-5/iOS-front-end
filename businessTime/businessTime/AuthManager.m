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


+ (void)processOAuthStep1Response: (NSURL *)url {
    NSLog(@"%@", url);
    NSURLComponents *components = [NSURLComponents componentsWithURL:url resolvingAgainstBaseURL:NO];
    NSString *code;
    NSArray *queryItems = components.queryItems;
    for (NSURLQueryItem *queryItem in queryItems) {
        if ([queryItem.name.lowercaseString  isEqual: @"code"]) {
            code = queryItem.value;
        }
    }
    NSLog(@"%@", code);
    
}
  

@end
