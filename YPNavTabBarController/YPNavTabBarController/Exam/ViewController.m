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
    
    
    UIViewController *oneViewController = [[UIViewController alloc] init];
    oneViewController.title = @"新闻";
    oneViewController.view.backgroundColor = [UIColor brownColor];
    
    UIViewController *twoViewController = [[UIViewController alloc] init];
    twoViewController.title = @"体育";
    twoViewController.view.backgroundColor = [UIColor purpleColor];
    
    UIViewController *threeViewController = [[UIViewController alloc] init];
    threeViewController.title = @"娱乐八卦";
    threeViewController.view.backgroundColor = [UIColor orangeColor];
    
    UIViewController *fourViewController = [[UIViewController alloc] init];
    fourViewController.title = @"天府之国";
    fourViewController.view.backgroundColor = [UIColor magentaColor];
    
    UIViewController *fiveViewController = [[UIViewController alloc] init];
    fiveViewController.title = @"四川省";
    fiveViewController.view.backgroundColor = [UIColor yellowColor];
    
    UIViewController *sixViewController = [[UIViewController alloc] init];
    sixViewController.title = @"政治";
    sixViewController.view.backgroundColor = [UIColor cyanColor];
    
    UIViewController *sevenViewController = [[UIViewController alloc] init];
    sevenViewController.title = @"国际新闻";
    sevenViewController.view.backgroundColor = [UIColor blueColor];
    
    UIViewController *eightViewController = [[UIViewController alloc] init];
    eightViewController.title = @"自媒体";
    eightViewController.view.backgroundColor = [UIColor greenColor];
    
    UIViewController *ninghtViewController = [[UIViewController alloc] init];
    ninghtViewController.title = @"科技";
    ninghtViewController.view.backgroundColor = [UIColor redColor];
    
    UIViewController *ninghtViewController1 = [[UIViewController alloc] init];
    ninghtViewController1.title = @"测试1";
    ninghtViewController1.view.backgroundColor = [UIColor redColor];
    UIViewController *ninghtViewController2 = [[UIViewController alloc] init];
    ninghtViewController2.title = @"测试2222";
    ninghtViewController2.view.backgroundColor = [UIColor redColor];
    UIViewController *ninghtViewController3 = [[UIViewController alloc] init];
    ninghtViewController3.title = @"测试133333333";
    ninghtViewController3.view.backgroundColor = [UIColor redColor];
    
    
    
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
    
    YPNavTabBarController *navTabBarController = [[YPNavTabBarController alloc] init];
    navTabBarController.subViewControllers = @[oneVc, twoVc, threeVc, fourVc , fiveVc,sixVc];
    // 设置选项的位置(垂直方向)
    navTabBarController.navTabBar_Y = 20;   // 默认为0
    [navTabBarController addParentController:self];
    // 设置默认选中索引
    navTabBarController.currentIndex = 5;
    
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
