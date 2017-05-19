//
//  MyCardsViewController.m
//  businessTime
//
//  Created by Eve Denison on 5/15/17.
//  Copyright © 2017 A Cahn. All rights reserved.
//

#import "MyCardsViewController.h"
#import "MyCards.h"
#import "BusinessTimeAPI.h"
#import "AppDelegate.h"
#import <UIKit/UIKit.h>
#import "GalleryCell.h"

@interface MyCardsViewController () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;



@end

@implementation MyCardsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    }

-(void)viewDidAppear:(BOOL)animated{
    
    [super viewDidAppear:animated];
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    __weak typeof(self) bruce = self;
    [BusinessTimeAPI getAllCardsForUser:appDelegate.userId andCompletion:^(NSArray<MyCards *> *cards) {
        __strong typeof(bruce) hulk = bruce;
        hulk.allCards = cards;
        [self.collectionView reloadData];
    }];

}

- (UIImage *)getImageFromString:(NSString *)dataString {
    NSData *data = [[NSData alloc]initWithBase64EncodedString:dataString
                                                      options:NSDataBase64DecodingIgnoreUnknownCharacters];
    UIImage *img = [UIImage imageWithData:data];
    return img;
}

-(void)share:(UILongPressGestureRecognizer *)sender {
    CGPoint point = [sender locationInView:self.collectionView];
    NSIndexPath *indexPath = [self.collectionView indexPathForItemAtPoint:point];
    
    GalleryCell *cell = (GalleryCell *)[self.collectionView cellForItemAtIndexPath:indexPath];
    
    UIImage *image = cell.cardImageView.image;
    
    NSArray *activityItems = @[image];
    UIActivityViewController *activityViewControntroller = [[UIActivityViewController alloc] initWithActivityItems:activityItems applicationActivities:nil];
    NSArray *excludedActivities = @[UIActivityTypePostToTwitter, UIActivityTypePostToFacebook, UIActivityTypePostToWeibo, UIActivityTypePrint, UIActivityTypeCopyToPasteboard, UIActivityTypeSaveToCameraRoll, UIActivityTypeAddToReadingList, UIActivityTypePostToFlickr, UIActivityTypePostToVimeo, UIActivityTypePostToTencentWeibo];
    activityViewControntroller.excludedActivityTypes = excludedActivities;
    
        [self presentViewController:activityViewControntroller animated:true completion:nil];
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.allCards.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    GalleryCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    MyCards *card = [self.allCards objectAtIndex:indexPath.row];
    
    UIImage *cardImage = [self getImageFromString:card.cardJPG];
    
    cell.cardImageView.image = cardImage;
    
    UILongPressGestureRecognizer *longPressGestureRecognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(share:)];
    
    [cell addGestureRecognizer:longPressGestureRecognizer];
    
    
    return cell;

}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {

    NSString *selected = [self.allCards objectAtIndex:indexPath.row];
    NSLog(@"SElECTED CELL: %@", selected);
}

@end
