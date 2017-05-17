//
//  User.h
//  businessTime
//
//  Created by A Cahn on 5/15/17.
//  Copyright © 2017 A Cahn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property(strong, nonatomic)NSNumber *userId;
@property(strong, nonatomic)NSString *name;
@property(strong, nonatomic)NSString *bio;
@property(strong, nonatomic)NSNumber *latitude;
@property(strong, nonatomic)NSNumber *longitude;
@property(strong, nonatomic)NSString *city;
@property(strong, nonatomic)NSString *state;
@property(strong, nonatomic)NSString *countryName;


@end
