//
//  HomeViewController.m
//  businessTime
//
//  Created by A Cahn on 5/15/17.
//  Copyright © 2017 A Cahn. All rights reserved.
//

#import "HomeViewController.h"
#import "CardCreatorViewController.h"
#import <SafariServices/SafariServices.h>
#import "BusinessTimeAPI.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [BusinessTimeAPI postCloudKitID:@"Testid and response2" andCompletion:^(User *user) {
        NSLog(@"reached homeview controller");
    }];
}
- (IBAction)createCardButtonPressed:(id)sender {
    
//    CardCreatorViewController *cardCreatorViewController = [[CardCreatorViewController alloc] init];
    [self.tabBarController setSelectedIndex:1];
    
}

- (IBAction)myCardsButtonPressed:(id)sender {
    
    [self.tabBarController setSelectedIndex:3];
}


@end
