//
//  NSObject+CDPSingleton.h
//  CDPCategory
//
//  Created by CDP on 2020/11/7.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol CDPSingleton <NSObject>
@optional

/// 调用单例
+ (instancetype)cdp_sharedInstance;

/// 销毁单例
+ (void)cdp_destorySharedInstance;

@end

@interface NSObject (CDPSingleton)
/// 使用时，将需要单例化的类遵循 <CDPSingleton> 协议，然后就可通过 cdp_sharedInstance 类方法调用该类单例

@end

NS_ASSUME_NONNULL_END
