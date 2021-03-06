//
//  UICollectionView+CDPCollectionView.m
//  Router
//
//  Created by CDP on 2018/4/4.
//  Copyright © 2018年 CDP. All rights reserved.
//

#import "UICollectionView+CDPCollectionView.h"
#import "UIViewController+CDPVC.h"

@implementation UICollectionView (CDPCollectionView)

+(void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [UIViewController didMethodSwizzlingWithOriginalSel:@selector(initWithFrame:style:) swizzledSel:@selector(HJ_initWithFrame:style:) class:[self class]];
    });
    
}
-(instancetype)HJ_initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    UICollectionView *collectionView=[self HJ_initWithFrame:frame style:style];
    
    if (@available(iOS 11.0, *)) {
        self.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        self.contentInset=UIEdgeInsetsMake(0, 0, 0, 0);
    } else {
        // Fallback on earlier versions
    }
    
    return collectionView;
}

@end
