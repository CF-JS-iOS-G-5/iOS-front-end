//
//  HomeViewController.m
//  businessTime
//
//  Created by A Cahn on 5/15/17.
//  Copyright © 2017 A Cahn. All rights reserved.
//

#import "HomeViewController.h"
#import "AuthManager.h"
#import "MeetupToken.h"
#import <SafariServices/SafariServices.h>

@interface HomeViewController () <SFSafariViewControllerDelegate>

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)safariViewControllerDidFinish:(SFSafariViewController *)controller {
    [self dismissViewControllerAnimated:true completion:nil];
}

- (IBAction)loginButtonPressed:(id)sender {
    
    NSString *authPath = @"https://secure.meetup.com/oauth2/authorize?client_id=93f0rhae311pei09pvejtujope&response_type=code&redirect_uri=businessTime://";
    NSURL *baseURL = [NSURL URLWithString:authPath];
    SFSafariViewController *svc = [[SFSafariViewController alloc] initWithURL:baseURL];
    svc.delegate = self;
    [self presentViewController:svc animated:YES completion:nil];

}


@end
