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
        _userId = jsonDictionary[@"_id"];
        _iToken = jsonDictionary[@"iToken"];
    }
    return self;
}

@end
