//
//  Meetup.h
//  businessTime
//
//  Created by Eve Denison on 5/15/17.
//  Copyright © 2017 A Cahn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Meetup : NSObject

@property(strong,nonatomic)NSString *eventName;
@property(strong,nonatomic)NSString *eventDate;
@property(strong,nonatomic)NSString *eventDescription;
@property(strong, nonatomic)NSString *zip;

@end
