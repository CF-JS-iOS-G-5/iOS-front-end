//
//  BusinessTimeAPI.m
//  businessTime
//
//  Created by Eve Denison on 5/17/17.
//  Copyright © 2017 A Cahn. All rights reserved.
//

#import "BusinessTimeAPI.h"
#import "MyCards.h"
#import "AppDelegate.h"

@implementation BusinessTimeAPI


+(void)postCloudKitID:(NSString *)cloudKitId andCompletion:(CloudKitCompletion)completion{
    
    NSString *urlString = [NSString stringWithFormat:@"https://business-time-test.herokuapp.com/api/user"];
    
    NSURL *databaseURL = [NSURL URLWithString:urlString];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:databaseURL];
    request.HTTPMethod = @"POST";
    
    NSDictionary *cloudKitToken = @{@"iToken": cloudKitId};
    
    NSError *tokenSerializationError;
    
    NSData *tokenData = [NSJSONSerialization dataWithJSONObject:cloudKitToken options:0 error:&tokenSerializationError];
    
    NSLog(@"TOKEN DATA: %@", tokenData);
    
    
    if (tokenSerializationError) {
        NSLog(@"Error serializing token: %@", tokenSerializationError.localizedDescription);
    }
    
    request.HTTPBody = tokenData;
    
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration ephemeralSessionConfiguration]];
    
    [[session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSError *readingUserError;
        
//        NSLog(@"RESPONSE: %@", response);
        NSLog(@"%@", [[NSString alloc]initWithData:data encoding:kCFStringEncodingUTF8]);
        
        
        NSDictionary *rootObject = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&readingUserError];
        
        User *user = [[User alloc]initWithDictionary:rootObject];
        
        AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        appDelegate.userId = user.userId;
        
//        NSLog(@"ROOT OBJECT: %@", rootObject);
        
        [[NSUserDefaults standardUserDefaults]setObject:rootObject[@"_id"] forKey:@"kUserId"];
        
        if (readingUserError) {
            NSLog(@"Error reading user: %@", readingUserError.localizedDescription);
        }
        
        if (error) {
            NSLog(@"Error sending cloudkit id: %@", error.localizedDescription);
        } else {
            NSLog(@"Success posting cloudkit id!");
        }
        if (completion) {
            dispatch_async(dispatch_get_main_queue(), ^{
                
                completion(user);
            });
        }
    }] resume];
}

+(void)postCard:(MyCards *)card andCompletion:(CardCompletion)completion {
    
    NSString *urlString = [NSString stringWithFormat:@"https://business-time-test.herokuapp.com/api/user/%@/card", [[NSUserDefaults standardUserDefaults] objectForKey:@"kUserId"]];
    
    NSURL *databaseURL = [NSURL URLWithString:urlString];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:databaseURL];
    request.HTTPMethod = @"POST";
    
    NSDictionary *cardDictionary = [[NSDictionary alloc] initWithObjectsAndKeys:card.userId, @"userId",  card.cardJPG, @"picData", nil];
//    NSLog(@"%@", cardDictionary);
    NSData *cardData = [NSJSONSerialization dataWithJSONObject:cardDictionary options:0 error:nil];
    
    request.HTTPBody = cardData;
    
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration ephemeralSessionConfiguration]];
    
    [[session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) {
            NSLog(@"Error sending card: %@", error.localizedDescription);
        } else {
            NSLog(@"Success posting card!");
//            NSLog(@"Response: %@ ", response);
        }
        NSString *str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"STR: %@", str);
        if (completion) {
            dispatch_async(dispatch_get_main_queue(), ^{
                
                completion(response);
            });
        }
    }] resume];
    
}

+(void)getAllCardsForUser:(NSString *)userId andCompletion:(GetCardsCompletion)completion {
    
    NSString *urlString = [NSString stringWithFormat:@"https://business-time-test.herokuapp.com/api/user/%@/card", userId];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString: urlString]];
    [request setHTTPMethod:@"GET"];
    
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
//    NSURL *databaseURL = [NSURL URLWithString:urlString];
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration ephemeralSessionConfiguration]];
    
    [[session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSError *getCardError;
                
        NSArray *rootObject = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&getCardError];
        
        NSMutableArray *cards = [[NSMutableArray alloc] init];
        
        for (NSDictionary *userCard in rootObject) {
            MyCards *card = [[MyCards alloc]initWithDictionary:userCard];
            [cards addObject:card];
            NSLog(@"CARDS.COUNT: %lu", (unsigned long)cards.count);
        }
        
        if (error) {
            NSLog(@"%@", error);
        } else {
            NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *) response;
//            NSLog(@"%@", httpResponse);
        }
        
        if (completion) {
            dispatch_async(dispatch_get_main_queue(), ^{
                completion(cards);
            });
        }
    }] resume];
}

+(void)deleteCard:(MyCards *)card andCompletion:(DeleteCardCompletion)completion{
    NSString *cardId = card.cardId;
    
    NSString *urlString = [NSString stringWithFormat:@"https://business-time-test.herokuapp.com/api/user/%@/card/%@", [[NSUserDefaults standardUserDefaults] objectForKey:@"kUserId"], cardId];
    
    NSURL *databaseURL = [NSURL URLWithString:urlString];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:databaseURL];
    
    request.HTTPMethod = @"DELETE";
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration ephemeralSessionConfiguration]];
    
    [[session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) {
            NSLog(@"%@", error.localizedDescription);
        } else {
            NSLog(@"%@", response);
        }
        
    }] resume];
}


@end
