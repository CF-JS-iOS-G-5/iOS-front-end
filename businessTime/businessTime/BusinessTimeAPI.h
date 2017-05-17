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

typedef void(^MeetupCompletion)(NSArray <Meetup *> *allMeetups);
typedef void(^UUIDCompletion)(NSURLResponse *response);
typedef void(^CloudKitCompletion)(User *user);

@interface BusinessTimeAPI : NSObject

+(void)fetchAllMeetupsForLanguage:(NSString *)language andZip:(NSString *)zip andCompletion:(MeetupCompletion)completion;

+(void)postUUID:(NSString *)UUID andCompletion:(UUIDCompletion)completion;

+(void)postCloudKitID:(NSString *)cloudKitId andCompletion:(CloudKitCompletion)completion;

@end
