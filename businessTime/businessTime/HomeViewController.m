//
//  HomeViewController.m
//  businessTime
//
//  Created by A Cahn on 5/15/17.
//  Copyright © 2017 A Cahn. All rights reserved.
//

#import "HomeViewController.h"
#import "AppDelegate.h"
#import "CardCreatorViewController.h"
#import <SafariServices/SafariServices.h>
#import "BusinessTimeAPI.h"

@interface HomeViewController ()
@property (weak, nonatomic) IBOutlet UIButton *createCardButton;
@property (weak, nonatomic) IBOutlet UIButton *myCardsButton;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [BusinessTimeAPI postCloudKitID:appDelegate.iToken  andCompletion:^(User *user) {
        NSLog(@"User: %@", user);
        [self styleHomeButtons];
    }];
    
    
}

-(void)styleHomeButtons {
    self.createCardButton.layer.cornerRadius = 4;
    self.myCardsButton.layer.cornerRadius = 4;
}


- (IBAction)createCardButtonPressed:(id)sender {
    
//    CardCreatorViewController *cardCreatorViewController = [[CardCreatorViewController alloc] init];
    [self.tabBarController setSelectedIndex:1];
    
}

- (IBAction)myCardsButtonPressed:(id)sender {
    
    [self.tabBarController setSelectedIndex:2];
}


@end
