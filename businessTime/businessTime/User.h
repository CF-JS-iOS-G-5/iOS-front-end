//
//  User.h
//  businessTime
//
//  Created by A Cahn on 5/15/17.
//  Copyright © 2017 A Cahn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface User : NSObject

@property(strong, nonatomic)NSString *userId;
@property(strong, nonatomic)NSString *iToken;
@property(strong, nonatomic)NSArray<UIImage *> *cards;

-(instancetype)initWithDictionary:(NSDictionary *)jsonDictionary;

@end
