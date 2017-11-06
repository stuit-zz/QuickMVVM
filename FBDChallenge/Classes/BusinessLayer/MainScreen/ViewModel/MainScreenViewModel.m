//
//  MainScreenViewModel.m
//  FBDChallenge
//
//  Created by Ilkhom on 10/21/17.
//  Copyright © 2017 Test. All rights reserved.
//

#import "MainScreenViewModel.h"
#import "MainScreenGitHubCollectionViewCell.h"
#import "MainScreenViewController.h"
#import "UsersAPIService.h"

@implementation MainScreenViewModel {
    UsersAPIService *users;
    NSMutableArray *repos;
    BOOL isLoading;
    int currentPage;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        currentPage = 0;
        repos = [NSMutableArray new];
        users = [UsersAPIService new];
    }
    return self;
}

- (void)resetViewModel {
    repos = [[users fetchAllGitHubData] mutableCopy];
    [((MainScreenViewController*)_view).collectionView reloadData];
}

- (void)loadNextReposBatch {
    if (isLoading) {
        return;
    }
    isLoading = YES;
    currentPage = floorf(repos.count / MAX_REPO_LOAD);
    [users getFacebookReposWithPage:currentPage andDelegate:self];
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return repos.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MainScreenGitHubCollectionViewCell *cell = (MainScreenGitHubCollectionViewCell*)[collectionView dequeueReusableCellWithReuseIdentifier:kMainScreenUICollectionViewGitHubCell forIndexPath:indexPath];
    if (cell) {
        GitHubModel *model = (GitHubModel*)[repos objectAtIndex:indexPath.row];
        cell.repoNameLbl.text = [NSString stringWithFormat:@"Repo name: %@", model.repoName];
        cell.ownerLoginLbl.text = [NSString stringWithFormat:@"Owner login: %@", model.ownerLogin];
        cell.repoDescriptionLbl.text = model.repoDescription;
        [cell setIsForked:model.isForked];
    }
    if (indexPath.row == repos.count - 1) {
        [self loadNextReposBatch];
    }
    return cell? : [UICollectionViewCell new];
}

#pragma mark - FBDNetworkingDelegate
- (void)connectionDidFinishResult:(NSArray *)jsonArray withTask:(NSURLSessionTask *)dataTask userParams:(NSDictionary *)userParams error:(NSError *)error {
    NSString *methodKey = [userParams objectForKey:kUserRequestMethodName];
    if (!error) {
        if ([methodKey isEqualToString:METHOD_KEY_REPOS]) {
            if (jsonArray.count == 0)
                return;
            
            [users storeFacebookReposWithArray:jsonArray];
            NSDictionary *item;
            GitHubModel *model;
            for (int i = 0; i < jsonArray.count; i++) {
                item = [jsonArray objectAtIndex:i];
                model = [[GitHubModel alloc] initWithDictionary:item];
                [repos addObject:model];
            }
            [((MainScreenViewController*)_view).collectionView reloadData];
            isLoading = NO;
        }
    } else {
        // Error handling
    }
}

@end
