//
//  UIColor+SKDarkMode.m
//  CTAssetsPickerDemo
//
//  Created by Sergey Koval on 18.04.2020.
//  Copyright © 2020 Clement T. All rights reserved.
//

#import "UIColor+SKDarkMode.h"

// colors reference and good article
// https://nshipster.com/dark-mode/

@implementation UIColor (SKDarkMode)

-(UIColor*)adaptive {
    if (@available(iOS 13.0, *)) {
        return [UIColor colorWithDynamicProvider:^UIColor * _Nonnull(UITraitCollection * _Nonnull traits) {
            if (traits.userInterfaceStyle == UIUserInterfaceStyleDark) {
                if (self == [UIColor blackColor]) {
                    return [UIColor systemGrayColor];
                }
                else if (self == [UIColor darkGrayColor]) {
                    return [UIColor systemGray2Color];
                }
                else if (self == [UIColor lightGrayColor]) {
                    return [UIColor systemGray4Color];
                }
                else if (self == [UIColor whiteColor]) {
                    return [UIColor systemGray6Color];
                }
                else if (self == [UIColor grayColor]) {
                    return [UIColor systemGray3Color];
                }
                else if (self == [UIColor redColor]) {
                    return [UIColor systemRedColor];
                }
                else if (self == [UIColor greenColor]) {
                    return [UIColor systemGreenColor];
                }
                else if (self == [UIColor blueColor]) {
                    return [UIColor systemIndigoColor];
                }
                else if (self == [UIColor cyanColor]) {
                    return [UIColor systemBlueColor];
                }
                else if (self == [UIColor yellowColor]) {
                    return [UIColor systemYellowColor];
                }
                else if (self == [UIColor magentaColor]) {
                    return [UIColor systemPinkColor];
                }
                else if (self == [UIColor orangeColor]) {
                    return [UIColor systemOrangeColor];
                }
                else if (self == [UIColor purpleColor]) {
                    return [UIColor systemPurpleColor];
                }
                else if (self == [UIColor brownColor]) {
                    return [UIColor colorWithRed: 0.770 green: 0.510 blue: 0.310 alpha:1.0];
                }
                else if (self == [UIColor clearColor]) {
                    return [UIColor clearColor];
                }
                else if (self == [UIColor darkTextColor]) {
                    return [UIColor labelColor];
                }
                else if (self == [UIColor lightTextColor]) {
                    return [UIColor systemGray6Color];
                }
                else {
                    CGFloat hue;
                    CGFloat saturation;
                    CGFloat brightness;
                    CGFloat alpha;
                    BOOL success = [self getHue:&hue saturation:&saturation brightness:&brightness alpha:&alpha];
                    NSLog(@"success: %i hue: %0.2f, saturation: %0.2f, brightness: %0.2f, alpha: %0.2f", success, hue, saturation, brightness, alpha);
                    
//                    CGFloat newSaturation = 0.5;
//                    if (saturation > 0.5) {
//                        CGFloat diff = saturation - 0.5;
//                        newSaturation = 0.5 - diff;
//                    }
//                    else {
//                        CGFloat diff = 0.5 - saturation;
//                        newSaturation = 0.5 + diff;
//                    }
//
//                    return [UIColor colorWithHue:hue saturation:newSaturation brightness:brightness alpha:alpha];

                    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness - 0.3 alpha:alpha];
                }
            }
            return self;
        }];
    } else {
        return self;
    }
}

-(UIColor* _Nonnull)adaptiveWithDark:(UIColor* _Nonnull)color {
    if (@available(iOS 13.0, *)) {
        return [UIColor colorWithDynamicProvider:^UIColor * _Nonnull(UITraitCollection * _Nonnull traits) {
            return traits.userInterfaceStyle == UIUserInterfaceStyleDark ? color : self;
        }];
    } else {
        return self;
    }
}

@end
