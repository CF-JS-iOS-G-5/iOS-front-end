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
@property(strong, nonatomic)NSArray *allCards;


@end

@implementation MyCardsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
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

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.allCards.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    GalleryCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    MyCards *card = [self.allCards objectAtIndex:indexPath.row];
    
    UIImage *cardImage = [self getImageFromString:card.cardJPG];
    
    cell.cardImageView.image = cardImage;
    
    return cell;

}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {

    NSString *selected = [self.allCards objectAtIndex:indexPath.row];
    NSLog(@"SElECTED CELL: %@", selected);
}

@end
