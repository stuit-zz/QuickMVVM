//
//  FBDNetworking.h
//  FBDChallenge
//
//  Created by Ilkhom on 10/22/17.
//  Copyright © 2017 Test. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol FBDNetworkingDelegate <NSObject>

@optional

- (void)connectionDidFinishResult:(NSArray*)jsonArray
                         withTask:(NSURLSessionTask*)dataTask
                       userParams:(NSDictionary*)userParams
                            error:(NSError*)error;
@end

@interface FBDNetworking : NSObject

+ (const FBDNetworking *)shared;

- (NSURLSessionTask*)requestForAPI:(NSString*)api
                        withMethod:(NSString*)method
                         ownerName:(NSString*)ownerName
                        httpMethod:(NSString*)httpMethod
                        parameters:(NSDictionary*)parameters
                        userParams:(NSDictionary*)userParams
                          delegate:(id<FBDNetworkingDelegate>)delegate;

@end
