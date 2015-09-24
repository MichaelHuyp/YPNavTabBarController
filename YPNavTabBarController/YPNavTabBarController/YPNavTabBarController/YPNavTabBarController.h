//
//  YPNavTabBarController.h
//  YPNavTabBarController
//
//  Created by 胡云鹏 on 15/9/24.
//  Copyright (c) 2015年 MichaelPPP. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YPNavTabBarController : UIViewController

@property (nonatomic, strong) NSArray *subViewControllers;

/** 选项条顶端距离父视图顶端的距离 */
@property (nonatomic, assign) CGFloat navTabBar_Y;

/** 内容视图的高度 */
@property (nonatomic, assign) CGFloat contentViewH;

- (void)addParentController:(UIViewController *)viewController;

@end
