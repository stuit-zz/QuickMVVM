//
//  UIColor+FBDAdditions.m
//  FBDChallenge
//
//  Created by Ilkhom on 10/22/17.
//  Copyright © 2017 Test. All rights reserved.
//

#import "UIColor+FBDAdditions.h"

@implementation UIColor (FBDAdditions)

+ (UIColor*)forkedColor {
    return [self colorWithHex:0x00FF00 alpha:0.5];
}

+ (UIColor *)notForkedColor {
    return [self whiteColor];
}

+ (UIColor *)colorWithHex:(int)hex alpha:(float)alpha {
    return [UIColor colorWithRed:((float) ((hex & 0xFF0000) >> 16))/255.0 green:((float) ((hex & 0xFF00) >> 8))/255.0 blue:((float) (hex & 0xFF))/255.0 alpha:alpha];
}

@end
