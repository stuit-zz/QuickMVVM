//
//  GitHubModel.h
//  FBDChallenge
//
//  Created by Ilkhom on 10/21/17.
//  Copyright © 2017 Test. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GitHubEntity.h"

@interface GitHubModel : NSObject

@property (nonatomic, strong) NSString *eid;
@property (nonatomic, strong) NSString *repoName;
@property (nonatomic, strong) NSString *repoDescription;
@property (nonatomic, strong) NSString *ownerLogin;
@property (nonatomic, assign) BOOL isForked;

- (instancetype)initWithDictionary:(NSDictionary*)dict;
- (instancetype)initWithEntity:(GitHubEntity *)entity;

@end
