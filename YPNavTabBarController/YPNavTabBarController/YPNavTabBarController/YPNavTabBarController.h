//
//  YPNavTabBarController.h
//  YPNavTabBarController
//
//  Created by 胡云鹏 on 15/9/24.
//  Copyright (c) 2015年 MichaelPPP. All rights reserved.
//

#import "YPNavTabBar.h"
#import <UIKit/UIKit.h>

@interface YPNavTabBarController : UIViewController

/** 子控制器 */
@property (nonatomic, strong) NSArray* subViewControllers;

/** 选项条顶端距离父视图顶端的距离 */
@property (nonatomic, assign) CGFloat navTabBar_Y;

/** 内容视图的高度 */
@property (nonatomic, assign) CGFloat contentViewH;

/** 设置风格 */
@property (nonatomic, assign) YPNavTabBarType navTabBar_type;

/** 设置选项排列风格 */
@property (nonatomic, assign) YPNavTabBarStyle navTabBar_style;

/** 设置选项卡的背景颜色 */
@property (nonatomic, strong) UIColor* navTabBar_color;

/** 选项条横条的颜色 */
@property (nonatomic, strong) UIColor* navTabBarLine_color;

/** 选项标题普通状态文字的颜色 */
@property (nonatomic, strong) UIColor* navTabBar_normalTitle_color;

/** 选项标题选中状态文字的颜色 */
@property (nonatomic, strong) UIColor* navTabBar_selectedTitle_color;

/** 索引 */
@property (nonatomic, assign) NSInteger currentIndex;

/** 构造方法 */
- (instancetype)initWithParentViewController:(UIViewController*)parentViewController;

@end

@interface UIViewController (YPNavTabBarControllerItem)

@property (nonatomic, strong, readonly) YPNavTabBarController* navTabBarController;

@end














































