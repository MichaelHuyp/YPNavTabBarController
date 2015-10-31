//
//  ViewController.m
//  YPNavTabBarController
//
//  Created by 胡云鹏 on 15/9/24.
//  Copyright (c) 2015年 MichaelPPP. All rights reserved.
//

#import "ViewController.h"
#import "YPNavTabBarController.h"
#import "OneViewController.h"
#import "TwoViewController.h"
#import "ThreeViewController.h"
#import "FourViewController.h"
#import "FiveViewController.h"
#import "SixViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    OneViewController *oneVc = [[OneViewController alloc] init];
    oneVc.title = @"娱乐";
    TwoViewController *twoVc = [[TwoViewController alloc] init];
    twoVc.title = @"体育";
    ThreeViewController *threeVc = [[ThreeViewController alloc] init];
    threeVc.title = @"北京";
    FourViewController *fourVc = [[FourViewController alloc] init];
    fourVc.title = @"国际新闻";
    FiveViewController *fiveVc = [[FiveViewController alloc] init];
    fiveVc.title = @"测试模块1";
    SixViewController *sixVc = [[SixViewController alloc] init];
    sixVc.title = @"测试模块22";
    
    YPNavTabBarController *navTabBarController = [[YPNavTabBarController alloc] initWithParentViewController:self];
    navTabBarController.subViewControllers = @[oneVc, twoVc, threeVc, fourVc , fiveVc,sixVc];
    
    
    // 设置选项的位置(垂直方向)
    navTabBarController.navTabBar_Y = 20;   // 默认为0
    // 设置默认选中索引
    navTabBarController.currentIndex = 4;
    
    navTabBarController.navTabBar_type = YPNavTabBarTypeEllipse;
    
    // 设置内容视图的高度
    // navTabBarController.contentViewH = 100; // 默认填充
    // 设置选项条的背景颜色
    // navTabBarController.navTabBar_color = [UIColor redColor];
    // 设置选项条的导航条颜色
    // navTabBarController.navTabBarLine_color = [UIColor yellowColor];
    // 设置未被选中时的标题字体颜色
    // navTabBarController.navTabBar_normalTitle_color = [UIColor purpleColor];
    // 设置选中时的标题字体颜色
    // navTabBarController.navTabBar_selectedTitle_color = [UIColor orangeColor];
    // navTabBarController.navTabBar_style = YPNavTabBarStyleCenter;
    
}

@end
