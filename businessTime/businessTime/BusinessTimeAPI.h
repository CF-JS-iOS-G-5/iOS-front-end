//
//  BusinessTimeAPI.h
//  businessTime
//
//  Created by Eve Denison on 5/17/17.
//  Copyright © 2017 A Cahn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Meetup.h"
#import "User.h"
#import "MyCards.h"

typedef void(^MeetupCompletion)(NSArray <Meetup *> *allMeetups);
typedef void(^CardCompletion)(NSURLResponse *response);
typedef void(^CloudKitCompletion)(User *user);
typedef void(^GetCardsCompletion)(NSArray<MyCards *> *cards);
typedef void(^DeleteCardCompletion)(MyCards *cardToDelete);

@interface BusinessTimeAPI : NSObject


+(void)fetchAllMeetupsForLanguage:(NSString *)language andZip:(NSString *)zip andCompletion:(MeetupCompletion)completion;

+(void)postCard:(MyCards *)card andCompletion:(CardCompletion)completion;

+(void)postCloudKitID:(NSString *)cloudKitId andCompletion:(CloudKitCompletion)completion;

+(void)getAllCardsForUser:(NSString *)userId andCompletion:(GetCardsCompletion)completion;

+(void)deleteCard:(MyCards *)card andCompletion:(DeleteCardCompletion)completion;

@end
