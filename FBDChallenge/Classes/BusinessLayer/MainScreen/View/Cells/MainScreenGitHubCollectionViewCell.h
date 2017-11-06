//
//  MainScreenGitHubCollectionViewCell.h
//  FBDChallenge
//
//  Created by Ilkhom on 10/21/17.
//  Copyright © 2017 Test. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainScreenGitHubCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong, readonly) UILabel *repoNameLbl;
@property (nonatomic, strong, readonly) UILabel *repoDescriptionLbl;
@property (nonatomic, strong, readonly) UILabel *ownerLoginLbl;

- (void)setIsForked:(BOOL)isForked;

@end
