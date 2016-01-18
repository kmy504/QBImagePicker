//
//  QBImagePicker.h
//  QBImagePicker
//
//  Created by Tanaka Katsuma on 2013/12/30.
//  Copyright (c) 2013年 Katsuma Tanaka. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>

@class QBOldImagePickerController;

@protocol QBOldImagePickerControllerDelegate <NSObject>

@optional
- (void)qb_imagePickerController:(QBOldImagePickerController *)imagePickerController didSelectAsset:(ALAsset *)asset;
- (void)qb_imagePickerController:(QBOldImagePickerController *)imagePickerController didSelectAssets:(NSArray *)assets;
- (void)qb_imagePickerControllerDidCancel:(QBOldImagePickerController *)imagePickerController;

- (BOOL)qb_imagePickerController:(QBOldImagePickerController *)imagePickerController shouldSelectAsset:(ALAsset *)asset;

@end

typedef NS_ENUM(NSUInteger, QBOldImagePickerControllerFilterType) {
    QBImagePickerControllerFilterTypeNone = 0,
    QBImagePickerControllerFilterTypePhotos,
    QBImagePickerControllerFilterTypeVideos
};

@interface QBOldImagePickerController : UIViewController

@property (nonatomic, weak) id<QBOldImagePickerControllerDelegate> delegate;

@property (nonatomic, copy) NSArray *groupTypes;
@property (nonatomic, assign) QBOldImagePickerControllerFilterType filterType;

@property (nonatomic, assign) BOOL allowsMultipleSelection;
@property (nonatomic, assign) NSUInteger minimumNumberOfSelection;
@property (nonatomic, assign) NSUInteger maximumNumberOfSelection;

@property (nonatomic, copy) NSString *prompt;
@property (nonatomic, assign) BOOL showsNumberOfSelectedAssets;
@property (nonatomic, assign) BOOL showEmptyAssetGroups;

@property (nonatomic, assign) NSUInteger numberOfColumnsInPortrait;
@property (nonatomic, assign) NSUInteger numberOfColumnsInLandscape;

@property (nonatomic, strong, readonly) NSMutableOrderedSet *selectedAssetURLs;

@property (nonatomic, assign) BOOL showsCancelButton __attribute__((deprecated));

+ (BOOL)isAccessible;

@end
