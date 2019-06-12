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

@property NSMutableArray *imageArray;

@end


@implementation ImageDataSource


- (instancetype)init
{
    self = [super init];
    if (self) {
        _imageArray = [NSMutableArray alloc] initWithObjects:<#(id  _Nonnull const __unsafe_unretained * _Nullable)#> count:<#(NSUInteger)#>
    }
    return self;
}

- (void)registerClass:(Class)cellClass forCellWithReuseIdentifier:(NSString *)identifier{
    
}

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    // Fetch a cell of the appropriate type.
    ImageCollectionViewCell *imageCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"imageCellIdentity" forIndexPath:indexPath];
    
    // Configure the cell’s contents.
    ToDo *tasksToDo = toDoArray[indexPath.row];
    
    taskCell.taskLabel.text = tasksToDo.taskTitle;
    taskCell.taskDescriptionLabel.text = tasksToDo.toDoDescription;
    taskCell.taskPriorityLabel.text = [NSString stringWithFormat:@"%ld", tasksToDo.priorityNumber];
    
    return imageCell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    <#code#>
}

@end
