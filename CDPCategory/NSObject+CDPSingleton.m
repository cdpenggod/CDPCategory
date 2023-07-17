//
//  NSObject+CDPSingleton.m
//  CDPCategory
//
//  Created by CDP on 2020/11/7.
//

#import "NSObject+CDPSingleton.h"

@implementation NSObject (CDPSingleton)
NSMutableDictionary *_instanceDict;

/// 调用单例
+ (instancetype)cdp_sharedInstance {
    id _instance;
    
    @synchronized(self) {
        if (_instanceDict == nil) {
            _instanceDict = [[NSMutableDictionary alloc] initWithCapacity:10];
        }
        
        NSString *_className = NSStringFromClass([self class]);
        _instance = _instanceDict[_className];
        
        if (_instance == nil) {
            _instance = [[self.class alloc] init];
            [_instanceDict setValue:_instance forKey:_className];
        }
        return _instance;
    }
}
/// 销毁单例
+ (void)cdp_destorySharedInstance {
    if (_instanceDict == nil) {
        return;
    }
    
    NSString *_className = NSStringFromClass([self class]);
    if ([_instanceDict objectForKey:_className]) {
        [_instanceDict removeObjectForKey:_className];
    }
}

/// 去除json数据中null键值
static id CDPJSONObjectByRemovingKeysWithNullValues(id JSONObject, NSJSONReadingOptions readingOptions) {
    if ([JSONObject isKindOfClass:[NSArray class]]) {
        NSMutableArray *mutableArray = [NSMutableArray arrayWithCapacity:[(NSArray *)JSONObject count]];
        for (id value in (NSArray *)JSONObject) {
            [mutableArray addObject:JSONObjectByRemovingKeysWithNullValues(value, readingOptions)];
        }
        
        return (readingOptions & NSJSONReadingMutableContainers) ? mutableArray : [NSArray arrayWithArray:mutableArray];
    } else if ([JSONObject isKindOfClass:[NSDictionary class]]) {
        NSMutableDictionary *mutableDictionary = [NSMutableDictionary dictionaryWithDictionary:JSONObject];
        for (id <NSCopying> key in [(NSDictionary *)JSONObject allKeys]) {
            id value = (NSDictionary *)JSONObject[key];
            if (!value || [value isEqual:[NSNull null]]) {
                [mutableDictionary removeObjectForKey:key];
            } else if ([value isKindOfClass:[NSArray class]] || [value isKindOfClass:[NSDictionary class]]) {
                mutableDictionary[key] = JSONObjectByRemovingKeysWithNullValues(value, readingOptions);
            }
        }
        
        return (readingOptions & NSJSONReadingMutableContainers) ? mutableDictionary : [NSDictionary dictionaryWithDictionary:mutableDictionary];
    }
    return JSONObject;
}

@end
