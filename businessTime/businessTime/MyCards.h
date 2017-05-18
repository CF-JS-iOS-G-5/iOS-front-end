//
//  MyCards.h
//  businessTime
//
//  Created by Eve Denison on 5/15/17.
//  Copyright © 2017 A Cahn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MyCards : NSObject

@property(strong, nonatomic)NSString *userId;
@property(strong, nonatomic)NSString *cardJPG;

@property(strong, nonatomic)NSString *fullName;
@property(strong, nonatomic)NSString *companyName;
@property(strong, nonatomic)NSString *skills;
@property(strong, nonatomic)NSString *phoneNumber;
@property(strong, nonatomic)NSString *email;
@property(strong, nonatomic)NSString *socialMedia;



-(instancetype)initWithUserId:(NSString *)userId andCardJPG:(NSData *)cardJPG;

@end
