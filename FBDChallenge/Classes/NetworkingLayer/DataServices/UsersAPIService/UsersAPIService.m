//
//  UsersAPIService.m
//  FBDChallenge
//
//  Created by Ilkhom on 10/22/17.
//  Copyright © 2017 Test. All rights reserved.
//

#import "UsersAPIService.h"

@implementation UsersAPIService

#pragma mark - Networking section
- (NSArray*)getFacebookReposWithPage:(int)page andDelegate:(id<FBDNetworkingDelegate>)delegate {
    NSDictionary *params = @{kRequestPageKey:@(page).stringValue,
                             kRequestItemsPerPageKey:@(MAX_REPO_LOAD).stringValue};
    NSDictionary *userParams = @{kUserRequestMethodName: METHOD_KEY_REPOS};
    [[FBDNetworking shared] requestForAPI:API_USERS
                               withMethod:REQUEST_METHOD_REPOS
                                ownerName:OWNER_FACEBOOK
                               httpMethod:@"GET"
                               parameters:params
                               userParams:userParams
                                 delegate:delegate];
    return nil;
}

#pragma mark - Persistence section
- (BOOL)storeFacebookReposWithArray:(NSArray *)array {
    NSEntityDescription *desc = [NSEntityDescription entityForName:@"GitHubEntity" inManagedObjectContext:context];
    for (NSDictionary *item in array) {
        NSArray *fetchedObjects = [self searchEntityByDesc:desc andEID:item];
        if (fetchedObjects.count == 0) {
            GitHubEntity *entity = (GitHubEntity*)[[NSManagedObject alloc] initWithEntity:desc insertIntoManagedObjectContext:context];
            [entity populateWithDictionary:item];
        }
    }
    [appDelegate saveContext];
    return YES;
}

- (NSArray*)fetchAllGitHubData {
    NSFetchRequest *fetch = [NSFetchRequest fetchRequestWithEntityName:@"GitHubEntity"];
    NSArray *entities = [context executeFetchRequest:fetch error:nil];
    NSMutableArray *models = [NSMutableArray new];
    for (GitHubEntity *item in entities) {
        GitHubModel *model = [[GitHubModel alloc] initWithEntity:item];
        [models addObject:model];
    }
    return models;
}

@end
