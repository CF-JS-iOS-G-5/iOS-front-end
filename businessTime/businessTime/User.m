//
//  User.m
//  businessTime
//
//  Created by A Cahn on 5/15/17.
//  Copyright © 2017 A Cahn. All rights reserved.
//

#import "User.h"

@implementation User

-(instancetype)initWithDictionary:(NSDictionary *)jsonDictionary {
    self = [super init];
    
    if (self) {
        _userId = jsonDictionary[@"userId"];
        _name = jsonDictionary[@"name"];
        _bio = jsonDictionary[@"bio"];
        _latitude = jsonDictionary[@"lat"];
        _longitude = jsonDictionary[@"lon"];
        _city = jsonDictionary[@"city"];
        _state = jsonDictionary[@"state"];
        _countryName = jsonDictionary[@"localized_country_name"];

    }
    return self;
}

@end
