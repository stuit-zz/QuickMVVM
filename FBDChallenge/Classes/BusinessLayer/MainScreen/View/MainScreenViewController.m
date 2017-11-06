//
//  MainScreenViewController.m
//  FBDChallenge
//
//  Created by Ilkhom on 10/21/17.
//  Copyright © 2017 Test. All rights reserved.
//

#import "MainScreenViewController.h"
#import "MainScreenGitHubCollectionViewCell.h"
#import "UsersAPIService.h"

@interface MainScreenViewController () {
    MainScreenViewModel *_viewModel;
}

@end

@implementation MainScreenViewController

- (instancetype)initWithViewModel:(MainScreenViewModel *)viewModel {
    self = [super init];
    if (self) {
        _viewModel = viewModel;
        _viewModel.view = self;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [_viewModel resetViewModel];
    
    UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:layout];
    self.collectionView.dataSource = _viewModel;
    self.collectionView.delegate = self;
    [self.collectionView registerClass:[MainScreenGitHubCollectionViewCell class] forCellWithReuseIdentifier:kMainScreenUICollectionViewGitHubCell];
    [self.view addSubview:self.collectionView];
    
    [self resetConstraints];
    [_viewModel loadNextReposBatch];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)resetConstraints {
    [self.collectionView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_topLayoutGuide);
        make.bottom.equalTo(self.mas_bottomLayoutGuide);
        make.left.right.equalTo(self.view);
    }];
}

#pragma mark - UICollectionViewDelegate
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(MAIN_SCREEN_ITEM_WIDTH, MAIN_SCREEN_ITEM_HEIGHT);
}

@end
