//
//  QBImagePicker.m
//  QBImagePicker
//
//  Created by Tanaka Katsuma on 2013/12/30.
//  Copyright (c) 2013年 Katsuma Tanaka. All rights reserved.
//

#import "QBOldImagePickerController.h"

// ViewControllers
#import "QBOldAlbumsViewController.h"

@interface QBOldImagePickerController ()

@property (nonatomic, strong) UINavigationController *albumsNavigationController;

@property (nonatomic, strong) ALAssetsLibrary *assetsLibrary;
@property (nonatomic, strong, readwrite) NSMutableOrderedSet *selectedAssetURLs;
@property (nonatomic, strong) NSBundle *assetBundle;

@end

@implementation QBOldImagePickerController

+ (BOOL)isAccessible
{
    return ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary] &&
            [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeSavedPhotosAlbum]);
}

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        // Set default values
        self.groupTypes = @[
                            @(ALAssetsGroupSavedPhotos),
                            @(ALAssetsGroupPhotoStream),
                            @(ALAssetsGroupAlbum)
                            ];
        self.filterType = QBOldImagePickerControllerFilterTypeNone;
        self.minimumNumberOfSelection = 1;
        self.numberOfColumnsInPortrait = 4;
        self.numberOfColumnsInLandscape = 7;
        self.showEmptyAssetGroups = YES;
        
        self.assetsLibrary = [ALAssetsLibrary new];
        self.selectedAssetURLs = [NSMutableOrderedSet orderedSet];
        
        // Get asset bundle
        self.assetBundle = [NSBundle bundleForClass:[self class]];
        NSString *bundlePath = [self.assetBundle pathForResource:@"QBImagePickerOld" ofType:@"bundle"];
        if (bundlePath) {
            self.assetBundle = [NSBundle bundleWithPath:bundlePath];
        }
        
        [self setUpAlbumsViewController];
        
        // Set instance
        QBOldAlbumsViewController *albumsViewController = (QBOldAlbumsViewController *)self.albumsNavigationController.topViewController;
        albumsViewController.imagePickerController = self;
    }
    
    return self;
}

- (void)setUpAlbumsViewController
{
    // Add QBAlbumsViewController as a child
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"QBImagePicker" bundle:self.assetBundle];
    UINavigationController *navigationController = [storyboard instantiateViewControllerWithIdentifier:@"AlbumsNavigationController"];
    
    [self addChildViewController:navigationController];
    
    navigationController.view.frame = self.view.bounds;
    [self.view addSubview:navigationController.view];
    
    [navigationController didMoveToParentViewController:self];
    
    self.albumsNavigationController = navigationController;
}

@end
