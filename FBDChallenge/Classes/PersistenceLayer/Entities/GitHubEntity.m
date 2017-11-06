//
//  GitHubEntity+CoreDataProperties.m
//  FBDChallenge
//
//  Created by Ilkhom on 10/23/17.
//  Copyright © 2017 Test. All rights reserved.
//
//

#import "GitHubEntity.h"

@implementation GitHubEntity

@dynamic eid;
@dynamic name;
@dynamic login;
@dynamic desc;
@dynamic fork;

- (void)populateWithDictionary:(NSDictionary *)dict {
    NSDictionary *data = dict? : @{};
    self.eid = [data objectForKey:@"id"] == [NSNull null] ? @"" : [[data objectForKey:@"id"] stringValue];
    self.name = [data objectForKey:@"name"] == [NSNull null] ? @"Repo has no name" : [data objectForKey:@"name"];
    self.desc = [data objectForKey:@"description"] == [NSNull null] ? @"No description available" : [data objectForKey:@"description"];
    self.login = [[data objectForKey:@"owner"] objectForKey:@"login"] == [NSNull null] ? @"Owner not available": [[data objectForKey:@"owner"] objectForKey:@"login"];
    self.fork = [[data objectForKey:@"fork"] boolValue];
}

@end
