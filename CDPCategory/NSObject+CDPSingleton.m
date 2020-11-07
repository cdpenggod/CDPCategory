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

@end
