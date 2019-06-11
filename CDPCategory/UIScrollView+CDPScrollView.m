//
//  UIScrollView+CDPScrollView.m
//  Router
//
//  Created by CDP on 2018/4/4.
//  Copyright © 2018年 CDP. All rights reserved.
//

#import "UIScrollView+CDPScrollView.h"
#import "UIViewController+CDPVC.h"

@implementation UIScrollView (CDPScrollView)


+(void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [UIViewController didMethodSwizzlingWithOriginalSel:@selector(initWithFrame:style:) swizzledSel:@selector(HJ_initWithFrame:style:) class:[self class]];
    });
    
}
-(instancetype)HJ_initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    UIScrollView *scrollView=[self HJ_initWithFrame:frame style:style];
    
    if (@available(iOS 11.0, *)) {
        self.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        self.contentInset=UIEdgeInsetsMake(0, 0, 0, 0);
    } else {
        // Fallback on earlier versions
    }
    
    return scrollView;
}
/*
//判断提前上拉预加载(需要MJRefresh)
-(void)judgeAutoFootRefresh{
    if ([self isKindOfClass:[UITableView class]]) {
        UITableView *tableView=(UITableView *)self;
        if (tableView.mj_footer!=nil&&
            [tableView.mj_footer isRefreshing]==NO&&
            tableView.mj_footer.state!=MJRefreshStateNoMoreData&&
            tableView.numberOfSections>0) {
            
            if (tableView.contentOffset.y+tableView.bounds.size.height>=tableView.contentSize.height-tableView.bounds.size.height*2/3) {
                [tableView.mj_footer beginRefreshing];
            }
        }
    }
    else if ([self isKindOfClass:[UICollectionView class]]) {
        UICollectionView *collectionView=(UICollectionView *)self;
        if (collectionView.mj_footer!=nil&&
            [collectionView.mj_footer isRefreshing]==NO&&
            collectionView.mj_footer.state!=MJRefreshStateNoMoreData&&
            collectionView.numberOfSections>0) {
            
            if (collectionView.contentOffset.y+collectionView.bounds.size.height>=collectionView.contentSize.height-collectionView.bounds.size.height*2/3) {
                [collectionView.mj_footer beginRefreshing];
            }
        }
    }
}*/


@end
