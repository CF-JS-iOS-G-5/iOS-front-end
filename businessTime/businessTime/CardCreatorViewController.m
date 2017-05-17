//
//  CardCreatorViewController.m
//  businessTime
//
//  Created by Eve Denison on 5/15/17.
//  Copyright © 2017 A Cahn. All rights reserved.
//

#import "CardCreatorViewController.h"

@interface CardCreatorViewController ()

@end

@implementation CardCreatorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma MARK Image Snapshot

//- (UIImage *)snapshot {
//    UIGraphicsBeginImageContextWithOptions(self.cardView.bounds.size, YES, 0);
//    [self.cardView drawViewHierarchyInRect:self.cardView.bounds afterScreenUpdates:YES];
//    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//    
//    return image;
//}

- (UIImage *)snapshot {
    UIGraphicsBeginImageContextWithOptions(self.cardView.bounds.size, NO, [UIScreen mainScreen].scale);
    
    [self.cardView drawViewHierarchyInRect:self.cardView.bounds afterScreenUpdates:YES];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil);
    return image;
}

- (IBAction)fullNameTextField:(id)sender {
}

- (IBAction)companyNameTextField:(id)sender {
}

- (IBAction)skillsTextField:(id)sender {
}

- (IBAction)phoneNumberTextField:(id)sender {
}

- (IBAction)emailTextField:(id)sender {
}

- (IBAction)socialMediaTextField:(id)sender {
}

- (IBAction)updateCardButtonPressed:(id)sender {
}

- (IBAction)saveCardButtonPressed:(id)sender {
    
    [self snapshot];
}


@end
