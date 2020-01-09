//
//  UIButton+CDPButton.m
//  CDP
//
//  Created by CDP on 2020/1/9.
//  Copyright © 2020 HJ. All rights reserved.
//

#import "UIButton+CDPButton.h"
#import "UIViewController+CDPVC.h"

@implementation UIButton (CDPButton)

-(instancetype)init{
    if (self=[super init]) {
        self.cdpEventInterval=0;
        self.cdpEventTime=0;
    }
    return self;
}

//runtime生成属性
- (NSTimeInterval)cdpEventInterval{
    NSTimeInterval interval = [objc_getAssociatedObject(self,@selector(cdpEventInterval)) doubleValue];
    return interval;
}
- (void)setCdpEventInterval:(NSTimeInterval)cdpEventInterval{
    objc_setAssociatedObject(self,@selector(cdpEventInterval),@(cdpEventInterval),OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (NSTimeInterval)cdpEventTime{
    NSTimeInterval time = [objc_getAssociatedObject(self,@selector(cdpEventTime)) doubleValue];
    return time;
}
- (void)setCdpEventTime:(NSTimeInterval)cdpEventTime{
    objc_setAssociatedObject(self,@selector(cdpEventTime),@(cdpEventTime),OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


//进行方法替换
+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [UIViewController didMethodSwizzlingWithOriginalSel:@selector(sendAction:to:forEvent:) swizzledSel:@selector(cdp_sendAction:to:forEvent:) class:[self class]];
    });
}
//替换的方法
- (void)cdp_sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event {
    NSTimeInterval nowTime=[NSDate date].timeIntervalSince1970;
    
    //判断是否可点击
    if (self.cdpEventInterval>0&&nowTime-self.cdpEventTime<self.cdpEventInterval) {
        return;
    }
    
    //记录点击时间
    self.cdpEventTime=nowTime;
    
    //执行点击
    [self cdp_sendAction:action to:target forEvent:event];
}









@end
