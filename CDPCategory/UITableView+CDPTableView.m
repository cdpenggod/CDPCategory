//
//  UITableView+CDPTableView.m
//  Router
//
//  Created by CDP on 2018/4/4.
//  Copyright © 2018年 CDP. All rights reserved.
//

#import "UITableView+CDPTableView.h"
#import "UIViewController+CDPVC.h"

@implementation UITableView (CDPTableView)

+(void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [UIViewController didMethodSwizzlingWithOriginalSel:@selector(initWithFrame:style:) swizzledSel:@selector(HJ_initWithFrame:style:) class:[self class]];
    });
    
}


-(instancetype)HJ_initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    UITableView *tableView=[self HJ_initWithFrame:frame style:style];
    
    if (@available(iOS 11.0, *)) {
        self.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        self.contentInset=UIEdgeInsetsMake(0, 0, 0, 0);
        self.estimatedRowHeight=0;
        self.estimatedSectionHeaderHeight=0;
        self.estimatedSectionFooterHeight=0;
    } else {
        // Fallback on earlier versions
    }
    
    return tableView;
}

@end
