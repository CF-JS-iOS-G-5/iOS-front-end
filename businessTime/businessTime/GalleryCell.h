//
//  GalleryCell.h
//  businessTime
//
//  Created by Eve Denison on 5/18/17.
//  Copyright © 2017 A Cahn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GalleryCell : UICollectionViewCell

@property(strong, nonatomic)UIImage *cardImage;
@property (weak, nonatomic) IBOutlet UIImageView *cardImageView;

@end

