//
//  FBDNetworking.m
//  FBDChallenge
//
//  Created by Ilkhom on 10/22/17.
//  Copyright © 2017 Test. All rights reserved.
//

#import "FBDNetworking.h"

@implementation FBDNetworking {
    NSURLSession *defaultSession;
}

+ (const FBDNetworking *)shared {
    static const FBDNetworking *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[FBDNetworking alloc] init];
    });
    return instance;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
        config.HTTPAdditionalHeaders = @{@"Content-Type": @"application/json"};
        defaultSession = [NSURLSession sessionWithConfiguration:config];
        return self;
    }
    return nil;
}

- (NSURLSessionTask*)requestForAPI:(NSString*)api
                        withMethod:(NSString*)method
                         ownerName:(NSString*)ownerName
                        httpMethod:(NSString*)httpMethod
                        parameters:(NSDictionary*)parameters
                        userParams:(NSDictionary*)userParams
                          delegate:(id<FBDNetworkingDelegate>)delegate {
    if (!parameters)
        parameters = @{};
    
    if (!userParams)
        userParams = @{};
    
    __block NSDictionary *_userParams = userParams;
    
    NSURLComponents *url = [[NSURLComponents alloc] initWithString:[NSString stringWithFormat:@"%@/%@/%@/%@", BASE_URL, api, ownerName, method]];
    NSMutableArray *queryItems = [NSMutableArray array];
    for (NSString *key in parameters) {
        [queryItems addObject:[NSURLQueryItem queryItemWithName:key value:parameters[key]]];
    }
    url.queryItems = queryItems.count ? queryItems : nil;
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url.URL];
    request.HTTPMethod = httpMethod;
    
    #ifndef NDEBUG
    [self printRequest:request userParams:userParams];
    #endif
    __block NSURLSessionTask *dataTask;
    dataTask = [defaultSession dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSError *err = nil;
        NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData: data options: NSJSONReadingAllowFragments error: &err];
        #ifndef NDEBUG
        [self printResponse:jsonArray withTask:dataTask];
        #endif
        dispatch_async(dispatch_get_main_queue(), ^{
            if ([delegate respondsToSelector:@selector(connectionDidFinishResult:withTask:userParams:error:)]) {
                if (!error) {
                    [delegate connectionDidFinishResult:jsonArray withTask:dataTask userParams:_userParams error:nil];
                } else {
                    [delegate connectionDidFinishResult:nil withTask:dataTask userParams:_userParams error:error];
                }
            }
        });
    }];
    [dataTask resume];
    return dataTask;
}

- (void)printResponse:(NSArray*)arr withTask:(NSURLSessionTask*)task {
    NSLog(@"\n<<<<<<<<<<< Response data: %@", task.originalRequest.URL.absoluteString);
    NSLog(@"\n%@\n\n", arr);
}

- (void)printRequest:(NSURLRequest*)request userParams:(NSDictionary*)params {
    NSLog(@"\n>>>>>>>>>>> Request data: %@", request.URL.absoluteString);
    NSLog(@"HTTP Method: %@", request.HTTPMethod);
    NSLog(@"Method field: %@\n\n", [params objectForKey:kUserRequestMethodName]);
}



@end
