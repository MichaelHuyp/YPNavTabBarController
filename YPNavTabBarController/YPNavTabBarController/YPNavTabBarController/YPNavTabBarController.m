//
//  YPNavTabBarController.m
//  YPNavTabBarController
//
//  Created by 胡云鹏 on 15/9/24.
//  Copyright (c) 2015年 MichaelPPP. All rights reserved.
//

#import "YPNavTabBarController.h"
#import "YPNavTabBarControllerConst.h"

@interface YPNavTabBarController () <YPNavTabBarDelegate>

/** 索引 */
@property (nonatomic, assign) NSInteger currentIndex;
/** 选项标题数组 */
@property (nonatomic, strong) NSMutableArray *titles;
/** 选线条 */
@property (nonatomic, weak) YPNavTabBar *navTabBar;
/** 滚动主视图 */
@property (nonatomic, weak) UIScrollView *mainView;

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
        navTabBar.delegate = self;
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
    
    [self.view bringSubviewToFront:self.navTabBar];
}


#pragma mark - viewDidLoad &dealloc -
- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)dealloc
{
    [self.mainView removeObserver:self forKeyPath:@"contentOffset"];
}

bool addTwoVcFlag;

#pragma mark - KVO -
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    UIScrollView *scrollView = (UIScrollView *)object;
    
    if ([keyPath isEqualToString:@"contentOffset"] && object == self.mainView) {
        
        _currentIndex = scrollView.contentOffset.x / YPScreenW;
        
        _navTabBar.currentItemIndex = _currentIndex;
        
        CGFloat progress = scrollView.contentOffset.x / YPScreenW;
        
        _navTabBar.progress = progress;
        
        
        if (scrollView.contentOffset.x >= 0.01f && scrollView.contentOffset.x < YPScreenW) { // 说明是向右拖动
            
            if (!addTwoVcFlag) {
                // 加载第二个视图
                UIViewController *twoVc = (UIViewController *)self.subViewControllers[1];
                twoVc.view.frame = CGRectMake(YPScreenW, 0, YPScreenW, self.mainView.frame.size.height);
                [self.mainView addSubview:twoVc.view];
                [self addChildViewController:twoVc];
            }
            
            addTwoVcFlag = YES;
        }
        
        // 加载子视图
        [_subViewControllers enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop){
            if (idx <= 1) return;
            if ((_currentIndex + 1) == idx) {
                UIViewController *viewController = (UIViewController *)self.subViewControllers[idx];
                viewController.view.frame = CGRectMake(idx * YPScreenW, 0, YPScreenW, self.mainView.frame.size.height);
                [self.mainView addSubview:viewController.view];
                [self addChildViewController:viewController];
            }
        }];
        
    }
}


#pragma mark - YPNavTabBarDelegate -

- (void)itemDidSelectedWithIndex:(YPNavTabBar *)navTabBar index:(NSInteger)index
{
    [self.mainView setContentOffset:CGPointMake(index * YPScreenW, 0) animated:NO];
    
    UIViewController *selectedVc = (UIViewController *)self.subViewControllers[index];
    selectedVc.view.frame = CGRectMake(YPScreenW * index, 0, YPScreenW, self.mainView.frame.size.height);
    [self.mainView addSubview:selectedVc.view];
    [self addChildViewController:selectedVc];
    
    
    for (int i = 0; i < (int)navTabBar.items.count; i++) {
        
        UIButton *btn = navTabBar.items[i];
        if (i == index) {
            btn.selected = YES;
        } else {
            btn.selected = NO;
        }
    }
    
}


#pragma mark - 公共方法 -

- (void)setNavTabBar_Y:(CGFloat)navTabBar_Y
{
    _navTabBar_Y = navTabBar_Y;
    
    self.navTabBar.yp_y = navTabBar_Y;
    
    self.mainView.frame = CGRectMake(0, CGRectGetMaxY(self.navTabBar.frame), YPScreenW, YPScreenH - CGRectGetMaxY(self.navTabBar.frame));
}

- (void)setContentViewH:(CGFloat)contentViewH
{
    _contentViewH = contentViewH;
    
    _mainView.yp_height = contentViewH;
}

- (void)setNavTabBar_color:(UIColor *)navTabBar_color
{
    navTabBar_color = navTabBar_color;
    
    self.navTabBar.navgationTabBar_color = navTabBar_color;
}

- (void)setNavTabBarLine_color:(UIColor *)navTabBarLine_color
{
    _navTabBarLine_color = navTabBarLine_color;
    
    self.navTabBar.navgationTabBar_lineColor = navTabBarLine_color;
}


- (void)addParentController:(UIViewController *)viewController
{
    viewController.automaticallyAdjustsScrollViewInsets = NO;
    [viewController addChildViewController:self];
    [viewController.view addSubview:self.view];
}


- (void)setNavTabBar_normalTitle_color:(UIColor *)navTabBar_normalTitle_color
{
    _navTabBar_normalTitle_color = navTabBar_normalTitle_color;
    
    self.navTabBar.navTabBar_normalTitle_color = navTabBar_normalTitle_color;
}

- (void)setNavTabBar_selectedTitle_color:(UIColor *)navTabBar_selectedTitle_color
{
    _navTabBar_selectedTitle_color = navTabBar_selectedTitle_color;
    
    self.navTabBar.navTabBar_selectedTitle_color = navTabBar_selectedTitle_color;
}

- (void)setNavTabBar_type:(YPNavTabBarType)navTabBar_type
{
    _navTabBar_type = navTabBar_type;
    
    self.navTabBar.type = navTabBar_type;
}

- (void)setNavTabBar_style:(YPNavTabBarStyle)navTabBar_style
{
    _navTabBar_style = navTabBar_style;
    
    self.navTabBar.style = navTabBar_style;
}

@end



















