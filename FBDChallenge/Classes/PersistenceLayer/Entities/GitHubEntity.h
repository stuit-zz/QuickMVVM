//
//  GitHubEntity+CoreDataProperties.h
//  FBDChallenge
//
//  Created by Ilkhom on 10/23/17.
//  Copyright © 2017 Test. All rights reserved.
//
//

#import <CoreData/CoreData.h>

@interface GitHubEntity : NSManagedObject

@property (nullable, nonatomic, copy) NSString *eid;
@property (nullable, nonatomic, copy) NSString *name;
@property (nullable, nonatomic, copy) NSString *login;
@property (nullable, nonatomic, copy) NSString *desc;
@property (nonatomic) BOOL fork;

- (void)populateWithDictionary:(NSDictionary *_Nullable)dict;

@end
