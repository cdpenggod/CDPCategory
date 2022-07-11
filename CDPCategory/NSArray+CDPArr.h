//
//  NSArray+CDPArr.h
//  Router
//
//  Created by CDP on 2018/4/4.
//  Copyright © 2018年 CDP. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (CDPArr)


/**
 *  数组是否为空
 */
+(BOOL)isNull:(NSArray *)arr;

@end

/// 校验数组是否有效
/// @param arr 无效示例：nil/非NSArray类型
BOOL arrVaild(NSArray * _Nullable arr);

/// 校验数组是否有效且有值
/// @param arr 无效示例：nil/非NSArray类型 或 数组为空
BOOL arrNotEmpty(NSArray * _Nullable arr);

/// 转化为Array
/// 首先检查是否有效，无效就返回@[]，有效就返回Array
/// @param obj 目标对象
NSArray * _Nonnull toArr(id _Nullable obj);
