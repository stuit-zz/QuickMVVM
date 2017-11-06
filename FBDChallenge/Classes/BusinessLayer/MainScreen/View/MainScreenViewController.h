//
//  MainScreenViewController.h
//  FBDChallenge
//
//  Created by Ilkhom on 10/21/17.
//  Copyright © 2017 Test. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainScreenViewModel.h"

@interface MainScreenViewController : UIViewController <UICollectionViewDelegateFlowLayout, FBDNetworkingDelegate>

@property (nonatomic, strong) UICollectionView *collectionView;

- (instancetype)initWithViewModel:(MainScreenViewModel*)viewModel;

@end
