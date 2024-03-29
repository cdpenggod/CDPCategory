//
//  NSDictionary+CDPDic.m
//  Router
//
//  Created by CDP on 2018/4/4.
//  Copyright © 2018年 CDP. All rights reserved.
//

#import "NSDictionary+CDPDic.h"
#import "NSString+CDPStr.h"

@implementation NSDictionary (CDPDic)

+(BOOL)isNull:(NSDictionary *)dic{
    if (dic == nil||[dic isKindOfClass:[NSNull class]]||![dic isKindOfClass:[NSDictionary class]]) {
        return YES;
    }
    else{
        return NO;
    }
}
-(id)isHaveKey:(NSString *)key{
    if ([NSDictionary isNull:self]) {
        return nil;
    }
    if ([self.allKeys containsObject:key]) {
        if ([self objectForKey:key]==nil||[[self objectForKey:key] isKindOfClass:[NSNull class]]) {
            return nil;
        }
        return [self objectForKey:key];
    }
    else{
        return nil;
    }
}
-(id)isHaveKey:(NSString *)key emptyReplace:(id)replace{
    id value=[self isHaveKey:key];
    if (value==nil||[value isKindOfClass:[NSNull class]]) {
        return (replace==nil)?nil:replace;
    }
    else{
        return value;
    }
}
-(NSString *)isHaveStringKey:(NSString *)key{
    if ([NSDictionary isNull:self]) {
        return @"";
    }
    if ([self.allKeys containsObject:key]) {
        if ([self objectForKey:key]==nil||[[self objectForKey:key] isKindOfClass:[NSNull class]]) {
            return @"";
        }
        if ([NSString stringIsNull:[NSString stringWithFormat:@"%@",[self objectForKey:key]]]) {
            return @"";
        }
        return [NSString stringWithFormat:@"%@",[self objectForKey:key]];
    }
    else{
        return @"";
    }
}
-(NSString *)isHaveStringKey:(NSString *)key emptyReplace:(NSString *)replaceStr{
    NSString *str=[self isHaveStringKey:key];
    if ([NSString stringIsNull:str]) {
        return ([NSString stringIsNull:replaceStr])?@"":replaceStr;
    }
    else{
        return str;
    }
}
-(BOOL)isHaveBoolKey:(NSString *)key{
    if ([NSDictionary isNull:self]) {
        return NO;
    }
    if ([self.allKeys containsObject:key]) {
        if ([self objectForKey:key]==nil||[[self objectForKey:key] isKindOfClass:[NSNull class]]) {
            return NO;
        }
        return [[NSString stringWithFormat:@"%@",[self objectForKey:key]] integerValue];
    }
    else{
        return NO;
    }
}



@end

/// 校验字典是否有效
/// @param dic 无效示例：nil/非NSDictionary类型
BOOL dicVaild(NSDictionary * _Nullable dic) {
    if (dic == nil ||
        [dic isKindOfClass:[NSNull class]] ||
        ![dic isKindOfClass:[NSDictionary class]]) {
        return NO;
    }
    else{
        return YES;
    }
}    

//校验字典是否有效且有值
BOOL dicNotEmpty(NSDictionary * _Nullable dic) {
    return dicVaild(dic) && dic.allKeys.count > 0;
}

/// 转化为Dictionary
/// 首先检查是否有效，无效就返回@{}，有效就返回Dictionary
/// @param obj 目标对象
NSDictionary * _Nonnull toDic(id _Nullable obj) {
    return dicVaild(obj) ? obj : @{};
}
