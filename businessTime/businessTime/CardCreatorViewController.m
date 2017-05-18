//
//  CardCreatorViewController.m
//  businessTime
//
//  Created by Eve Denison on 5/15/17.
//  Copyright © 2017 A Cahn. All rights reserved.
//

#import "CardCreatorViewController.h"
#import "MyCards.h"
#import "BusinessTimeAPI.h"

@interface CardCreatorViewController ()

@property (weak, nonatomic) IBOutlet UITextField *fullNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *skillsTextField;
@property (weak, nonatomic) IBOutlet UITextField *phoneNumberTextField;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *socialMediaTextField;
@property (weak, nonatomic) IBOutlet UITextField *companyNameTextField;


@end

@implementation CardCreatorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma MARK Image Snapshot

- (NSString *)snapshot {
    UIGraphicsBeginImageContextWithOptions(self.cardView.bounds.size, NO, [UIScreen mainScreen].scale);
    
    [self.cardView drawViewHierarchyInRect:self.cardView.bounds afterScreenUpdates:YES];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    NSData *imageData = UIImagePNGRepresentation(image);

    UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil);
    NSString *dataString = [imageData base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    
    return dataString;
}
// Convert NSString -> NSData -> UIImage
- (UIImage *)getImageFromString:(NSString *)dataString {
    NSData *data = [[NSData alloc]initWithBase64EncodedString:dataString
                                                      options:NSDataBase64DecodingIgnoreUnknownCharacters];
    UIImage *img = [UIImage imageWithData:data];
    return img;
}



- (IBAction)updateCardButtonPressed:(id)sender {
}

- (IBAction)saveCardButtonPressed:(id)sender {
    NSString *userId = [[NSUserDefaults standardUserDefaults]objectForKey:@"kUserId"];
    
    MyCards *newCard = [[MyCards alloc]initWithUserId:userId andCardJPG:[self snapshot]];
    
    newCard.fullName = self.fullNameTextField.text;
    newCard.skills = self.skillsTextField.text;
    newCard.phoneNumber = self.phoneNumberTextField.text;
    newCard.email = self.emailTextField.text;
    newCard.socialMedia = self.socialMediaTextField.text;
    newCard.companyName = self.companyNameTextField.text;
    
    NSLog(@"NEW CARD: %@", newCard);

    [BusinessTimeAPI postCard:newCard andCompletion:^(NSURLResponse *response) {
        NSLog(@"%@", response);
    }];
}


@end
