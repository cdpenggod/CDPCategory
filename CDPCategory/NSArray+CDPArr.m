//
//  NSArray+CDPArr.m
//  Router
//
//  Created by CDP on 2018/4/4.
//  Copyright © 2018年 CDP. All rights reserved.
//

#import "NSArray+CDPArr.h"

@implementation NSArray (CDPArr)


//数组是否为空
+(BOOL)isNull:(NSArray *)arr{
    if (arr == nil||
        [arr isKindOfClass:[NSNull class]]||
        ![arr isKindOfClass:[NSArray class]]) {
        return YES;
    }
    else{
        return NO;
    }
}


@end
    
/// 校验数组是否有效
/// @param arr 无效示例：nil/非NSArray类型
BOOL arrVaild(NSArray * _Nullable arr) {
    if (arr == nil||
        [arr isKindOfClass:[NSNull class]]||
        ![arr isKindOfClass:[NSArray class]]) {
        return NO;
    } else {
        return YES;
    }
}

/// 转化为Array
/// 首先检查是否有效，无效就返回@[]，有效就返回Array
/// @param obj 目标对象
NSArray * _Nonnull toArr(id _Nullable obj) {
    return arrVaild(obj) ? obj : @[];
}
