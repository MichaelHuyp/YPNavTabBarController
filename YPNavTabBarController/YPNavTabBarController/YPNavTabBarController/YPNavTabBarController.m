//
//  YPNavTabBarController.m
//  YPNavTabBarController
//
//  Created by 胡云鹏 on 15/9/24.
//  Copyright (c) 2015年 MichaelPPP. All rights reserved.
//

#import "YPNavTabBarController.h"
#import "YPNavTabBarControllerConst.h"
#import "YPNavTabBar.h"

@interface YPNavTabBarController () <YPNavTabBarDelegate>

/** 索引 */
@property (nonatomic, assign) NSInteger currentIndex;
/** 选项标题数组 */
@property (nonatomic, strong) NSMutableArray *titles;
/** 选线条 */
@property (nonatomic, weak) YPNavTabBar *navTabBar;
/** 滚动主视图 */
@property (nonatomic, weak) UIScrollView *mainView;
/** 选项条颜色 */
@property (nonatomic, strong) UIColor *navTabBarColor;
/** 选项条横条的颜色 */
@property (nonatomic, strong) UIColor *navTabBarLineColor;

@end

@implementation YPNavTabBarController

#pragma mark - lazy -

- (UIScrollView *)mainView
{
    if (_mainView == nil) {
        UIScrollView *mainView = [[UIScrollView alloc] init];
        mainView.frame = CGRectMake(0, CGRectGetMaxY(self.navTabBar.frame), YPScreenW, YPScreenH - CGRectGetMaxY(self.navTabBar.frame));
        mainView.pagingEnabled = YES;
        mainView.bounces = NO;
        mainView.showsHorizontalScrollIndicator = NO;
        mainView.contentSize = CGSizeMake(YPScreenW * self.subViewControllers.count, 0);
        [self.view addSubview:mainView];
        self.mainView = mainView;
    }
    return _mainView;
}

- (YPNavTabBar *)navTabBar
{
    if (_navTabBar == nil) {
        YPNavTabBar *navTabBar = [[YPNavTabBar alloc] init];
        navTabBar.frame = CGRectMake(0, 0, YPScreenW, 44);
        navTabBar.backgroundColor = _navTabBarColor;
        navTabBar.delegate = self;
        navTabBar.lineColor = _navTabBarColor;
        navTabBar.itemTitles = _titles;
        // 更新选项条标题数据
        [navTabBar updateData];
        [self.view addSubview:navTabBar];
        self.navTabBar = navTabBar;
    }
    return _navTabBar;
}

#pragma mark - 初始化 -

- (void)setup
{
    // 初始化索引为1
    self.currentIndex = 1;
    
    // 初始化选项条颜色
    self.navTabBarColor = YPColor_RGBA(240.0f, 230.0f, 230.0f, 1.0f);
    
    // 初始化选项卡标题数组
    self.titles = [[NSMutableArray alloc] initWithCapacity:self.subViewControllers.count];
    
    for (UIViewController *viewController in self.subViewControllers)
    {
        [self.titles addObject:viewController.title];
    }
}

- (void)setSubViewControllers:(NSArray *)subViewControllers
{
    _subViewControllers = subViewControllers;
    
    // 初始化基本信息
    [self setup];
    
    // 初始化选项条
    [self navTabBar];
    
    // 初始化滚动主视图
    [self mainView];
    
    // 开启KVO监听
    NSKeyValueObservingOptions options = NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld;
    
    [self.mainView addObserver:self forKeyPath:@"contentOffset" options:options context:nil];
    
    
    // 加载子视图
    [_subViewControllers enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop){
        
        UIViewController *viewController = (UIViewController *)self.subViewControllers[idx];
        viewController.view.frame = CGRectMake(idx * YPScreenW, 0, YPScreenW, self.mainView.frame.size.height);
        [self.mainView addSubview:viewController.view];
        [self addChildViewController:viewController];
    }];
    
    
    [self.view bringSubviewToFront:self.navTabBar];
}


#pragma mark - viewDidLoad -
- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - KVO -
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    UIScrollView *scrollView = (UIScrollView *)object;
    
    if ([keyPath isEqualToString:@"contentOffset"]) {
        
        _currentIndex = scrollView.contentOffset.x / YPScreenW;
        
        _navTabBar.currentItemIndex = _currentIndex;
        
        CGFloat progress = scrollView.contentOffset.x / YPScreenW;
        
        _navTabBar.progress = progress;
        
    }
}


#pragma mark - YPNavTabBarDelegate -

- (void)itemDidSelectedWithIndex:(NSInteger)index
{
    [self.mainView setContentOffset:CGPointMake(index * YPScreenW, 0) animated:NO];
}


#pragma mark - 公共方法 -

- (void)setNavTabBar_Y:(CGFloat)navTabBar_Y
{
    if (!_navTabBar) return;
    
    _navTabBar_Y = navTabBar_Y;
    
    self.navTabBar.yp_y = navTabBar_Y;
    
    self.mainView.frame = CGRectMake(0, CGRectGetMaxY(self.navTabBar.frame), YPScreenW, YPScreenH - CGRectGetMaxY(self.navTabBar.frame));
}

- (void)setContentViewH:(CGFloat)contentViewH
{
    if (!_mainView) return;
    
    _contentViewH = contentViewH;
    
    _mainView.yp_height = contentViewH;
}

- (void)addParentController:(UIViewController *)viewController
{
    [viewController addChildViewController:self];
    [viewController.view addSubview:self.view];
}


@end



















