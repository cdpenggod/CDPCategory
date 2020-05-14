//
//  UIButton+CDPButton.h
//  CDP
//
//  Created by CDP on 2020/1/9.
//  Copyright © 2020 HJ. All rights reserved.
//

#import <UIKit/UIKit.h>




@interface UIButton (CDPButton)


/**
 *  两次重复点击的间隔(需手动设置)
 */
@property (nonatomic,assign) NSTimeInterval cdpEventInterval;

/**
 *  记录上次点击时间
 *  (内部自动管理赋值,如需必要,不要手动更改)
 */
@property (nonatomic,assign) NSTimeInterval cdpEventTime;

/**
 *  在button原有范围修改button响应区域
 *  (值正数为向button内方向修改，负数为向button外方向修改，即正数缩小，负数扩充)
 */
@property(nonatomic,assign) UIEdgeInsets cdpEdgeInsets;




@end



