//
//  FBDGlobals.h
//  FBDChallenge
//
//  Created by Ilkhom on 10/21/17.
//  Copyright © 2017 Test. All rights reserved.
//

#ifndef FBDGlobals_h
#define FBDGlobals_h


#endif /* FBDGlobals_h */

#pragma mark - Networking parameters
#define BASE_URL                                                @"https://api.github.com"
/// APIs
#define API_USERS                                               @"users"
/// Owner
#define OWNER_FACEBOOK                                          @"facebook"
/// Methods
#define REQUEST_METHOD_REPOS                                    @"repos"
/// Methods key
#define METHOD_KEY_REPOS                                        @"keyRepos"
/// Keys
#define kUserRequestMethodName                                  @"userRequestMethodName"
#define kRequestPageKey                                         @"page"
#define kRequestItemsPerPageKey                                 @"per_page"

/// PROPERTIES
#define MAX_REPO_LOAD                                           30

#define SCREEN_SIZE                                             ([[UIScreen mainScreen] bounds])
#define SCREEN_WIDTH                                            (SCREEN_SIZE.size.width)
#define SCREEN_HEIGHT                                           (SCREEN_SIZE.size.height)
#define MAIN_SCREEN_ITEM_WIDTH                                  150
#define MAIN_SCREEN_ITEM_HEIGHT                                 200
#define MAIN_SCREEN_ITEM_PER_ROW                                (floorf(SCREEN_WIDTH / MAIN_SCREEN_ITEM_WIDTH))


#pragma mark - UICollectionViewCell identifiers
/// MainScreen
#define kMainScreenUICollectionViewGitHubCell                   @"MainScreenUICollectionViewGitHubCell"
