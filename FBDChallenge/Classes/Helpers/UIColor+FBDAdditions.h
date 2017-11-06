//
//  UIColor+FBDAdditions.h
//  FBDChallenge
//
//  Created by Ilkhom on 10/22/17.
//  Copyright © 2017 Test. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (FBDAdditions)

+ (UIColor *)colorWithHex:(int)hex alpha:(float)alpha;

+ (UIColor*)forkedColor;
+ (UIColor*)notForkedColor;

@end
