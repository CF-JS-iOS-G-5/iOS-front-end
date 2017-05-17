//
//  BusinessTimeAPI.m
//  businessTime
//
//  Created by Eve Denison on 5/17/17.
//  Copyright © 2017 A Cahn. All rights reserved.
//

#import "BusinessTimeAPI.h"

@implementation BusinessTimeAPI

+(void)fetchAllMeetupsForLanguage:(NSString *)language andZip:(NSString *)zip andCompletion:(MeetupCompletion)completion {

    NSString *urlString = [NSString stringWithFormat:@"https://api.meetup.com/find/events?text='%@'", language];
    
    NSURL *databaseURL = [NSURL URLWithString:urlString];
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration ephemeralSessionConfiguration]];
    
    [[session dataTaskWithURL:databaseURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSError *APIerror;
        
        NSArray *rootObject = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&APIerror];
        
        NSMutableArray *allMeetups = [[NSMutableArray alloc] init];
        
        for (NSDictionary *meetup in rootObject) {
            //GET MEETUPS HERE
        }
        
        if (APIerror) {
            NSLog(@"Error with rootObject: %@", APIerror.localizedDescription);
        } else {
            NSLog(@"Success fetching meetups!");
        }
        
    
        
    }] resume];
}

+(void)postCloudKitID:(NSString *)cloudKitId andCompletion:(CloudKitCompletion)completion{

    NSString *urlString = [NSString stringWithFormat:@"https://businesstime.herokuapp.com/api/user?id=%@", cloudKitId];
    
    NSURL *databaseURL = [NSURL URLWithString:urlString];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:databaseURL];
    request.HTTPMethod = @"POST";
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration ephemeralSessionConfiguration]];
    
    [[session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"Error sending cloudkit id: %@", error.localizedDescription);
        } else {
            NSLog(@"Success posting cloudkit id!");
        }
    }] resume];
}

+(void)postUUID:(NSString *)UUID andCompletion:(UUIDCompletion)completion {

    NSString *urlString = [NSString stringWithFormat:@"https://businesstime.herokuapp.com/api/user"];
    
    NSURL *databaseURL = [NSURL URLWithString:urlString];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:databaseURL];
    request.HTTPMethod = @"POST";
    
    NSData *data = [NSJSONSerialization dataWithJSONObject:@{@"userID": UUID} options:0 error:nil];
    
    request.HTTPBody = data;
    
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration ephemeralSessionConfiguration]];
    
    NSError *UUIDError;
    
    [[session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) {
            NSLog(@"Error sending UUID: %@", error.localizedDescription);
        } else {
            NSLog(@"Success posting uuid!");
        }
        
    }] resume];
    
}
@end
