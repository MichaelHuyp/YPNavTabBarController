//
//  UIView+YPNavTabBar.h
//  YPNavTabBarController
//
//  Created by 胡云鹏 on 15/9/24.
//  Copyright (c) 2015年 MichaelPPP. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (YPNavTabBar)

// frame
@property (nonatomic, assign) CGFloat yp_x;
@property (nonatomic, assign) CGFloat yp_y;
@property (nonatomic, assign) CGFloat yp_width;
@property (nonatomic, assign) CGFloat yp_height;
@property (nonatomic, assign) CGSize yp_size;
@property (nonatomic, assign) CGPoint yp_origin;
// center
@property (nonatomic, assign) CGFloat yp_centerX;
@property (nonatomic, assign) CGFloat yp_centerY;

@end
