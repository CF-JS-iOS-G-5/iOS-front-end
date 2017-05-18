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

@interface MyCardsViewController () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property(strong, nonatomic)NSArray *allCards;

@end

@implementation MyCardsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.collectionView.delegate = self;
    
    [BusinessTimeAPI getAllCardsForUser:@"591d1a72f002c90004150dd0" andCompletion:^(MyCards *cards) {
        NSLog(@"REACHED MY CARDS VIEW CONTROLLER");
    }];
    [self.collectionView reloadData];
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.allCards.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIndentifier = @"cell";
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIndentifier forIndexPath:indexPath];
    
    NSString *cardImage = [self.allCards objectAtIndex:indexPath.row];
    
    
    //POPULATE CELL WITH IMAGES HERE
    return cell;

}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {

    NSString *selected = [self.allCards objectAtIndex:indexPath.row];
    NSLog(@"SElECTED CELL: %@", selected);
}

@end
