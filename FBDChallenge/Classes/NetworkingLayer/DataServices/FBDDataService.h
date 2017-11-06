//
//  FBDDataService.h
//  FBDChallenge
//
//  Created by Ilkhom on 10/22/17.
//  Copyright © 2017 Test. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FBDNetworking.h"
#import "AppDelegate.h"

@interface FBDDataService : NSObject {
    AppDelegate *appDelegate;
    NSManagedObjectContext *context;
}

- (NSArray*)searchEntityByDesc:(NSEntityDescription*)desc andEID:(NSDictionary*)item;

@end
