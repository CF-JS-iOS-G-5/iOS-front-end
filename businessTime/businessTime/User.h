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
@property(strong, nonatomic)NSString *iToken;

-(instancetype)initWithDictionary:(NSDictionary *)jsonDictionary;

@end
