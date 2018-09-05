//
//  UIColor+CDPColor.m
//  Router
//
//  Created by CDP on 2018/4/4.
//  Copyright © 2018年 CDP. All rights reserved.
//

#import "UIColor+CDPColor.h"
#import "NSString+CDPStr.h"

@implementation UIColor (CDPColor)

/**
 *  随机生成不同颜色的方法
 *
 *  @param count 需要生成的颜色数
 *
 *  @return 所有生成的颜色
 */
+ (NSMutableArray *)getAllColors:(NSInteger)count{
    NSMutableArray *myColors = [NSMutableArray array];
    
    NSInteger startColor = 0xdddddd;
    NSInteger endColor = 0xff111111;
    NSInteger step = (startColor-endColor)/(count+3);
    NSInteger hexValue;
    for (NSInteger i = count-1; i>=0; i--) {
        hexValue = 0xff000000 | (NSInteger)(endColor+step*i);
        
        UIColor *resultColor = [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16)) / 255.0 green:((float)((hexValue & 0xFF00) >> 8)) / 255.0 blue:((float)(hexValue & 0xFF)) / 255.0 alpha:1.0f];
        
        [myColors addObject:resultColor];
    }
    return myColors;
}
#pragma mark  十六进制颜色
+(UIColor *)colorWithHexColorString:(NSString *)hexColorString{
    return [self colorWithHexColorString:hexColorString alpha:1.0f];
}
+(UIColor *)colorWithHexColorString:(NSString *)hexColorString alpha:(float)alpha{
    if ([NSString stringIsNull:hexColorString]) {
        return [UIColor clearColor];
    }
    if ([hexColorString hasPrefix:@"#"]) {
        hexColorString=[hexColorString stringByReplacingOccurrencesOfString:@"#" withString:@""];
    }
    unsigned int red, green, blue;
    
    NSRange range;
    
    range.length =2;
    
    range.location =0;
    
    [[NSScanner scannerWithString:[hexColorString substringWithRange:range]]scanHexInt:&red];
    
    range.location =2;
    
    [[NSScanner scannerWithString:[hexColorString substringWithRange:range]]scanHexInt:&green];
    
    range.location =4;
    
    [[NSScanner scannerWithString:[hexColorString substringWithRange:range]]scanHexInt:&blue];
    
    UIColor *color = [UIColor colorWithRed:(float)(red/255.0f)green:(float)(green/255.0f)blue:(float)(blue/255.0f)alpha:alpha];
    
    return color;
}


@end
