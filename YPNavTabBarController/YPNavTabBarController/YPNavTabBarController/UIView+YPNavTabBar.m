//
//  UIView+YPNavTabBar.m
//  YPNavTabBarController
//
//  Created by 胡云鹏 on 15/9/24.
//  Copyright (c) 2015年 MichaelPPP. All rights reserved.
//

#import "UIView+YPNavTabBar.h"

@implementation UIView (YPNavTabBar)

- (void)setYp_x:(CGFloat)yp_x
{
    CGRect frame = self.frame;
    frame.origin.x = yp_x;
    self.frame = frame;
}

- (CGFloat)yp_x
{
    return self.frame.origin.x;
}

- (void)setYp_y:(CGFloat)yp_y
{
    CGRect frame = self.frame;
    frame.origin.y = yp_y;
    self.frame = frame;
}

- (CGFloat)yp_y
{
    return self.frame.origin.y;
}

- (void)setYp_width:(CGFloat)yp_width
{
    CGRect frame = self.frame;
    frame.size.width = yp_width;
    self.frame = frame;
}

- (CGFloat)yp_width
{
    return self.frame.size.width;
}

- (void)setYp_height:(CGFloat)yp_height
{
    CGRect frame = self.frame;
    frame.size.height = yp_height;
    self.frame = frame;
}

- (CGFloat)yp_height
{
    return self.frame.size.height;
}

- (void)setYp_size:(CGSize)yp_size
{
    CGRect frame = self.frame;
    frame.size = yp_size;
    self.frame = frame;
}

- (CGSize)yp_size
{
    return self.frame.size;
}

- (void)setYp_origin:(CGPoint)yp_origin
{
    CGRect frame = self.frame;
    frame.origin = yp_origin;
    self.frame = frame;
}

- (CGPoint)yp_origin
{
    return self.frame.origin;
}

- (void)setYp_centerX:(CGFloat)yp_centerX
{
    CGPoint center = self.center;
    center.x = yp_centerX;
    self.center = center;
}

- (CGFloat)yp_centerX
{
    return self.center.x;
}

- (void)setYp_centerY:(CGFloat)yp_centerY
{
    CGPoint center = self.center;
    center.y = yp_centerY;
    self.center = center;
}

- (CGFloat)yp_centerY
{
    return self.center.y;
}

@end

















