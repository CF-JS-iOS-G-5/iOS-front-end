//
//  MyCards.m
//  businessTime
//
//  Created by Eve Denison on 5/15/17.
//  Copyright © 2017 A Cahn. All rights reserved.
//

#import "MyCards.h"

@implementation MyCards

-(instancetype)initWithUserId:(NSString *)userId andCardJPG:(NSString *)cardJPG {
    self = [super init];
    
    if (self) {
        _userId = userId;
        _cardJPG = cardJPG;
    }
    return self;
}

-(instancetype)initWithDictionary:(NSDictionary *)jsonDictionary {
    self = [super init];
    
    if (self) {
        _userId = jsonDictionary[@"userId"];
        _cardJPG = jsonDictionary[@"picData"];
        _cardId = jsonDictionary[@"_id"];
    }
    return self;
}

@end
