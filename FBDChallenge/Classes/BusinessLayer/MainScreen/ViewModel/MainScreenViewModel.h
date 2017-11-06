//
//  MainScreenViewModel.h
//  FBDChallenge
//
//  Created by Ilkhom on 10/21/17.
//  Copyright © 2017 Test. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MainScreenViewModel : NSObject <UICollectionViewDataSource, FBDNetworkingDelegate>

@property (nonatomic, weak) UIViewController *view;

- (void)loadNextReposBatch;
- (void)resetViewModel;

@end
