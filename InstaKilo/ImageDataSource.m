//
//  ImageDataModel.m
//  InstaKilo
//
//  Created by Cameron Mcleod on 2019-06-12.
//  Copyright © 2019 Cameron Mcleod. All rights reserved.
//

#import "ImageDataSource.h"
#import "ImageCollectionViewCell.h"

@interface InstaKiloCollectionViewController ()



@end


@implementation ImageDataSource


- (instancetype _Nonnull )init
{
    self = [super init];
    if (self) {
        
        NSBundle *mainBundle = [NSBundle mainBundle];
        NSArray *imagePathsArray = [[NSArray alloc] initWithArray:[mainBundle pathsForResourcesOfType:@"jpg" inDirectory:@"Images"]];
        NSMutableArray *imageBundle = [[NSMutableArray alloc] init];
        
        for(NSString *path in imagePathsArray){
            NSLog(@"%@", path);
            UIImage *image = [UIImage imageWithContentsOfFile:path];
            [imageBundle addObject:image];
        }
        
        _imageArray = imageBundle;
        NSLog(@"Image array loaded with %ld images", [_imageArray count]);

    }
    return self;
}

- (void)registerClass:(Class)cellClass forCellWithReuseIdentifier:(NSString *)identifier{
    
}

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    // Fetch a cell of the appropriate type.
    ImageCollectionViewCell *imageCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"imageCellIdentity" forIndexPath:indexPath];
    
    // Configure the cell’s contents.
    UIImage *loadedCellImage = self.imageArray[indexPath.row];
    UIImageView *loadedCellImageView = [[UIImageView alloc] initWithImage:loadedCellImage];
    loadedCellImageView.translatesAutoresizingMaskIntoConstraints = NO;
    
    loadedCellImageView.contentMode =  UIViewContentModeScaleAspectFit;
    
    [imageCell.contentView addSubview:loadedCellImageView];
    
    imageCell.contentMode = UIViewContentModeScaleAspectFit;
    
    NSLayoutConstraint *imageCenterYConstraint = [NSLayoutConstraint constraintWithItem: loadedCellImageView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:imageCell attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0.0];
    
    imageCenterYConstraint.active = YES;
    
    NSLayoutConstraint *imageCenterXConstraint = [NSLayoutConstraint constraintWithItem: loadedCellImageView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:imageCell attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0];
    
    imageCenterXConstraint.active = YES;
    
    NSLayoutConstraint *imageWidthConstraint = [NSLayoutConstraint constraintWithItem: loadedCellImageView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:imageCell attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0.0];
    
    imageWidthConstraint.active = YES;
    
    NSLayoutConstraint *imageHeightConstraint = [NSLayoutConstraint constraintWithItem: loadedCellImageView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:imageCell attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0.0];
    
    imageHeightConstraint.active = YES;
    
    
    return imageCell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.imageArray count];
}

@end
