//
//  ImageDataModel.h
//  InstaKilo
//
//  Created by Cameron Mcleod on 2019-06-12.
//  Copyright © 2019 Cameron Mcleod. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "InstaKiloCollectionViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface ImageDataSource : NSObject <UICollectionViewDelegate, UICollectionViewDataSource>

@property NSMutableArray *imageArray;

@end

NS_ASSUME_NONNULL_END
