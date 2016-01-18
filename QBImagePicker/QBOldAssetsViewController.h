//
//  QBAssetsViewController.h
//  QBImagePicker
//
//  Created by Katsuma Tanaka on 2015/04/06.
//  Copyright (c) 2015 Katsuma Tanaka. All rights reserved.
//

#import <UIKit/UIKit.h>

@class QBOldImagePickerController;
@class ALAssetsGroup;

@interface QBOldAssetsViewController : UICollectionViewController

@property (nonatomic, weak) QBOldImagePickerController *imagePickerController;
@property (nonatomic, strong) ALAssetsGroup *assetsGroup;

@end
