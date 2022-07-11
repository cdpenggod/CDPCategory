//
//  NSDictionary+CDPDic.h
//  Router
//
//  Created by CDP on 2018/4/4.
//  Copyright © 2018年 CDP. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (CDPDic)


/**
 *  字典是否为空
 */
+(BOOL)isNull:(NSDictionary *)dic;

/**
 *  判断字典是否有该key
 */
-(id)isHaveKey:(NSString *)key;

/**
 *  判断字典是否有该key(若为空则返回replace,replace若为空,则返回nil)
 */
-(id)isHaveKey:(NSString *)key emptyReplace:(id)replace;

/**
 *  判断字典是否有值为字符串类型的key
 */
-(NSString *)isHaveStringKey:(NSString *)key;

/**
 *  判断字典是否有值为字符串类型的key(若为空则返回replaceStr,replaceStr若为空,则返回空字符串)
 */
-(NSString *)isHaveStringKey:(NSString *)key emptyReplace:(NSString *)replaceStr;

/**
 *  判断字典是否有1或0值的key
 */
-(BOOL)isHaveBoolKey:(NSString *)key;




@end
  
/// 校验字典是否有效
/// @param dic 无效示例：nil/非NSDictionary类型
BOOL dicVaild(NSDictionary * _Nullable dic);

/// 校验字典是否有效且有值
/// @param dic 无效示例：nil/非NSDictionary类型 或 字典为空
BOOL dicNotEmpty(NSDictionary * _Nullable dic);

/// 转化为Dictionary
/// 首先检查是否有效，无效就返回@{}，有效就返回Dictionary
/// @param obj 目标对象
NSDictionary * _Nonnull toDic(id _Nullable obj);
