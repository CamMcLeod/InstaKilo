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
        
        NSMutableArray *buildDbase = [[NSMutableArray alloc] init];
        
        for(int imageNumber = 0; imageNumber < [imagePathsArray count] ; imageNumber++){
            
            NSMutableArray *itemArray = [[NSMutableArray alloc] initWithCapacity:3];
            
            UIImage *image = [UIImage imageWithContentsOfFile:imagePathsArray[imageNumber]];
            
            [itemArray insertObject:image atIndex:0];
            
            if( [imagePathsArray[imageNumber] containsString:@"raccoon"]) {
                [itemArray insertObject:@"raccoon" atIndex:1];
            } else {
                [itemArray insertObject:@"squirrel" atIndex:1];
            }
            
            switch (arc4random_uniform(2)) {
                case 1:
                    [itemArray insertObject:@"the park" atIndex:2];
                    break;
                    
                default:
                    [itemArray insertObject:@"your backyard" atIndex:2];
                    break;
            }
            
            [buildDbase addObject:itemArray];
            
            NSLog(@"%@", buildDbase.lastObject[0]);
            NSLog(@"%@", buildDbase.lastObject[1]);
            NSLog(@"%@", buildDbase.lastObject[2]);
        }
        _imageInfo = buildDbase;
        NSLog(@"Image array loaded with %ld images", [_imageInfo count]);

    }
    return self;
}

- (void)registerClass:(Class)cellClass forCellWithReuseIdentifier:(NSString *)identifier{
    
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    NSMutableSet *imageSet = [[NSMutableSet alloc] init];
    for (NSArray *imageArray in self.imageInfo) {
        [imageSet addObject: imageArray[1]];
    }
    NSLog(@"%ld", [imageSet count]);
    return [imageSet count];
}


- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    // Fetch a cell of the appropriate type.
    ImageCollectionViewCell *imageCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"imageCellIdentity" forIndexPath:indexPath];
    
    // Configure the cell’s contents.
    NSArray *loadedCellInfo = self.imageInfo[indexPath.row];
    
    switch (indexPath.section) {
        case 0:
            break;
            
        case 1:
            loadedCellInfo = self.imageInfo[indexPath.row+7];
            break;
            
        default:
            break;
    }
    
    UIImage *loadedCellImage = loadedCellInfo[0];
    
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
    
    NSMutableSet *imageSet = [[NSMutableSet alloc] init];
    NSMutableArray *sectionArray =  [[NSMutableArray alloc] init];
    for (NSArray *imageArray in self.imageInfo) {
        [imageSet addObject: imageArray[1]];
    }
    
    for (id thing in imageSet){
        [sectionArray addObject: @0];
    }
    
    NSMutableSet *imageSet2 = [[NSMutableSet alloc] init];
    
    NSInteger imageSectionsCounted = 1;
    NSInteger imagesInSection = 0;
    for (int imageNumber = 0; imageNumber < [self.imageInfo count]; imageNumber ++) {
        
        [imageSet2 addObject: self.imageInfo[imageNumber][1]];
        
        NSLog(@"%@", self.imageInfo[imageNumber][1]);
        NSLog(@"%ld", [imageSet2 count]);
        
        if ([imageSet2 count] > imageSectionsCounted) {
            imageSectionsCounted = [imageSet2 count];
            imagesInSection = 1;
            NSInteger imagesSectionIndex = imageSectionsCounted - 1;
            [sectionArray replaceObjectAtIndex:imagesSectionIndex withObject:[NSNumber numberWithInteger:imagesInSection]];

        } else {
            imagesInSection++;
            NSInteger imagesSectionIndex = imageSectionsCounted - 1;
            [sectionArray replaceObjectAtIndex:imagesSectionIndex withObject:[NSNumber numberWithInteger:imagesInSection]];
        }
        
    }

    NSNumber *nsnumber = (NSNumber*)sectionArray[section];
    NSInteger value = [nsnumber integerValue];
    return value;
    
}

// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

@end
