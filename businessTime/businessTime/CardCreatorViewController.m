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

@interface CardCreatorViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *fullNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *skillsTextField;
@property (weak, nonatomic) IBOutlet UITextField *phoneNumberTextField;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *companyNameTextField;
@property (weak, nonatomic) IBOutlet UIButton *saveButton;


@end

@implementation CardCreatorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self styleSaveButton];
    
    self.fullNameTextField.delegate = self;
    self.skillsTextField.delegate = self;
    self.phoneNumberTextField.delegate = self;
    self.emailTextField.delegate = self;
    self.companyNameTextField.delegate = self;
}

#pragma MARK Image Snapshot

- (NSString *)snapshot {
    UIGraphicsBeginImageContextWithOptions(self.cardView.bounds.size, NO, [UIScreen mainScreen].scale);
    
    [self.cardView drawViewHierarchyInRect:self.cardView.bounds afterScreenUpdates:YES];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    NSData *imageData = UIImageJPEGRepresentation(image, 0.2);

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


-(void)styleSaveButton {
    self.saveButton.layer.cornerRadius = 6;
}

- (IBAction)saveCardButtonPressed:(id)sender {
    NSString *userId = [[NSUserDefaults standardUserDefaults]objectForKey:@"kUserId"];
    
    MyCards *newCard = [[MyCards alloc]initWithUserId:userId andCardJPG:[self snapshot]];
    
    newCard.fullName = self.fullNameTextField.text;
    newCard.skills = self.skillsTextField.text;
    newCard.phoneNumber = self.phoneNumberTextField.text;
    newCard.email = self.emailTextField.text;
    newCard.companyName = self.companyNameTextField.text;
    
    NSLog(@"NEW CARD: %@", newCard);

    [BusinessTimeAPI postCard:newCard andCompletion:^(NSURLResponse *response) {
        NSLog(@"%@", response);
    }];
}

#pragma MARK text field methods

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    return YES;
}

// hide the keyboard
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [[self view] endEditing:YES];
}

@end
