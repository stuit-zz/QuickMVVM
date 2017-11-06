//
//  UsersAPIService.h
//  FBDChallenge
//
//  Created by Ilkhom on 10/22/17.
//  Copyright © 2017 Test. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FBDDataService.h"

@interface UsersAPIService : FBDDataService

- (NSArray*)getFacebookReposWithPage:(int)page andDelegate:(id<FBDNetworkingDelegate>)delegate;

- (BOOL)storeFacebookReposWithArray:(NSArray*)array;
- (NSArray*)fetchAllGitHubData;

@end
