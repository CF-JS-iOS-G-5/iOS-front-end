//
//  Meetup.m
//  businessTime
//
//  Created by Eve Denison on 5/15/17.
//  Copyright © 2017 A Cahn. All rights reserved.
//

#import "Meetup.h"

@implementation Meetup

-(instancetype)initWithDictionary:(NSDictionary *)jsonDictionary {
    
    self = [super init];
    
    if (self) {
        _eventName = jsonDictionary[@"name"];
        _eventDescription = jsonDictionary[@""];
    }
    return self;
}

@end
