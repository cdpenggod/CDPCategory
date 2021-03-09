//
//  UIView+CDPView.m
//  Router
//
//  Created by CDP on 2018/4/4.
//  Copyright © 2018年 CDP. All rights reserved.
//

#import "UIView+CDPView.h"

@implementation UIView (CDPView)



-(void)setX:(CGFloat)x{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}
-(void)setY:(CGFloat)y{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}
-(CGFloat)x{
    return self.frame.origin.x;
}
-(CGFloat)y{
    return self.frame.origin.y;
}
-(void)setCenterX:(CGFloat)centerX{
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}
-(CGFloat)centerX{
    return self.center.x;
}
-(void)setCenterY:(CGFloat)centerY{
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}
-(CGFloat)centerY{
    return self.center.y;
}
-(void)setWidth:(CGFloat)width{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}
-(void)setHeight:(CGFloat)height{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}
-(CGFloat)height{
    return self.frame.size.height;
}
-(CGFloat)width{
    return self.frame.size.width;
}
-(void)setSize:(CGSize)size{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}
-(CGSize)size{
    return self.frame.size;
}
-(void)setOrigin:(CGPoint)origin{
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}
-(CGPoint)origin{
    return self.frame.origin;
}
//设置layer的border
-(void)setBorderColor:(UIColor *)color width:(CGFloat)width{
    self.layer.borderColor=color.CGColor;
    self.layer.borderWidth=width;
}
//设置view的layer圆角度数且maskToBounds=YES;
-(void)setCornerRadius:(CGFloat)cornerRadius{
    self.layer.cornerRadius=cornerRadius;
    self.layer.masksToBounds=YES;
}
//绘制圆角
- (void)roundingCorners:(UIRectCorner)corners radius:(float)radius {
    self.layer.mask = nil;
    if(corners && corners != 9999){
        CGRect bounds = CGRectZero;
        CGFloat offsetPoint = 1;
        if (corners == (UIRectCornerBottomLeft | UIRectCornerBottomRight)) {
            bounds = CGRectMake(0, -offsetPoint, self.bounds.size.width, self.bounds.size.height + offsetPoint);
        } else if (corners == (UIRectCornerTopLeft | UIRectCornerTopRight)) {
            bounds = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height + offsetPoint);
        } else {
            bounds = self.bounds;
        }
        UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:bounds byRoundingCorners:corners cornerRadii:CGSizeMake(radius, radius)];
        CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
        maskLayer.frame = self.bounds;
        maskLayer.path = maskPath.CGPath;
        self.layer.mask = maskLayer;
    }
}



@end
