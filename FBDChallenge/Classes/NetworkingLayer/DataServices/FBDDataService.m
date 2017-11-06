//
//  FBDDataService.m
//  FBDChallenge
//
//  Created by Ilkhom on 10/22/17.
//  Copyright © 2017 Test. All rights reserved.
//

#import "FBDDataService.h"

@implementation FBDDataService

- (instancetype)init {
    self = [super init];
    if (self) {
        appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
        context = appDelegate.managedObjectContext;
    }
    return self;
}

- (NSArray*)searchEntityByDesc:(NSEntityDescription*)desc andEID:(NSDictionary*)item {
    NSFetchRequest *fetch = [[NSFetchRequest alloc] init];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"eid = %@", [item objectForKey:@"id"]];
    [fetch setEntity:desc];
    [fetch setPredicate:predicate];
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"eid" ascending:YES];
    [fetch setSortDescriptors:[NSArray arrayWithObjects:sortDescriptor, nil]];
    NSError *error = nil;
    return [context executeFetchRequest:fetch error:&error];
}

@end
