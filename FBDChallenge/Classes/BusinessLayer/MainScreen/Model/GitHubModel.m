//
//  GitHubModel.m
//  FBDChallenge
//
//  Created by Ilkhom on 10/21/17.
//  Copyright © 2017 Test. All rights reserved.
//

#import "GitHubModel.h"

@implementation GitHubModel

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    if (self) {
        NSDictionary *data = dict? : @{};
        self.eid = [data objectForKey:@"id"] == [NSNull null] ? @"" : [[data objectForKey:@"id"] stringValue];
        self.repoName = [data objectForKey:@"name"] == [NSNull null] ? @"Repo has no name" : [data objectForKey:@"name"];
        self.repoDescription = [data objectForKey:@"description"] == [NSNull null] ? @"No description available" : [data objectForKey:@"description"];
        self.ownerLogin = [[data objectForKey:@"owner"] objectForKey:@"login"] == [NSNull null] ? @"Owner not available": [[data objectForKey:@"owner"] objectForKey:@"login"];
        self.isForked = [[data objectForKey:@"fork"] boolValue];
    }
    return self;
}

- (instancetype)initWithEntity:(GitHubEntity *)entity {
    self = [super init];
    if (self) {
        self.eid = entity.eid;
        self.repoName = entity.name;
        self.repoDescription = entity.desc;
        self.ownerLogin = entity.login;
        self.isForked = entity.fork;
    }
    return self;
}

@end
