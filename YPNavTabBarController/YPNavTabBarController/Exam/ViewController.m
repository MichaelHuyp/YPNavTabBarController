//
//  ViewController.m
//  YPNavTabBarController
//
//  Created by 胡云鹏 on 15/9/24.
//  Copyright (c) 2015年 MichaelPPP. All rights reserved.
//

#import "ViewController.h"
#import "YPNavTabBarController.h"

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
    
    YPNavTabBarController *navTabBarController = [[YPNavTabBarController alloc] init];
    navTabBarController.subViewControllers = @[oneViewController, twoViewController, threeViewController, fourViewController, fiveViewController, sixViewController, sevenViewController, eightViewController, ninghtViewController];
    // 设置选项的位置(垂直方向)
//    navTabBarController.navTabBar_Y = 64;   // 默认为0
    // 设置内容视图的高度
//    navTabBarController.contentViewH = 100; // 默认填充
    // 设置选项条的背景颜色
//    navTabBarController.navTabBar_color = [UIColor redColor];
    // 设置选项条的导航条颜色
//    navTabBarController.navTabBarLine_color = [UIColor yellowColor];
    // 设置未被选中时的标题字体颜色
//    navTabBarController.navTabBar_normalTitle_color = [UIColor purpleColor];
    // 设置选中时的标题字体颜色
    navTabBarController.navTabBar_selectedTitle_color = [UIColor orangeColor];
    
    [navTabBarController addParentController:self];
    
    

}

@end
