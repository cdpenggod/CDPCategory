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
