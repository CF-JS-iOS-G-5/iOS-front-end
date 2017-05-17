//
//  User.m
//  businessTime
//
//  Created by A Cahn on 5/15/17.
//  Copyright © 2017 A Cahn. All rights reserved.
//

#import "User.h"

@implementation User

+(instancetype)initWithDictionary:(NSDictionary *)jsonDictionary {
    self = [super init];
    
    if (self) {
        _userId = jsonDictionary[@"userId"];
        _name = jsonDictionary[@"userId"];
        _bio = jsonDictionary[@"userId"];
        _latitude = jsonDictionary[@"userId"];
        _longitude = jsonDictionary[@"userId"];
        _city = jsonDictionary[@"userId"];
        _state = jsonDictionary[@"userId"];
        _countryName = jsonDictionary[@"userId"];

    }
    return self;
}

@end
