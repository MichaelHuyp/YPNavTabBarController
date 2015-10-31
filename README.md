# YPNavTabBarController
##这是一款自定义滑块分段选择控制器
* An easy way to use Segment selection controller
* 用法简单的滑块分段选择控制器:两行代码就可集成
![(效果展示)](http://i.niupic.com/images/2015/10/31/Il1Ush.gif)
## Contents
* Examples
    * [如何使用YPNavTabBarController】](#如何使用YPNavTabBarController)
    * [YPNavTabBarController.h](#YPNavTabBarController.h)
    * [默认快速集成](#默认快速集成)

## <a id="如何使用YPNavTabBarController"></a>如何使用YPNavTabBarController
* 手动导入：
    * 将`YPNavTabBarController`文件夹中的所有文件拽入项目中
    * 导入主头文件：`#import "YPNavTabBarController.h"`

## <a id="YPNavTabBarController.h"></a>YPNavTabBarController.h
```objc
@interface YPNavTabBarController : UIViewController

/** 子控制器 */
@property (nonatomic, strong) NSArray *subViewControllers;

/** 选项条顶端距离父视图顶端的距离 */
@property (nonatomic, assign) CGFloat navTabBar_Y;

/** 内容视图的高度 */
@property (nonatomic, assign) CGFloat contentViewH;

/** 设置风格 */
@property (nonatomic, assign) YPNavTabBarType navTabBar_type;

/** 设置选项排列风格 */
@property (nonatomic, assign) YPNavTabBarStyle navTabBar_style;

/** 设置选项卡的背景颜色 */
@property (nonatomic, strong) UIColor *navTabBar_color;

/** 选项条横条的颜色 */
@property (nonatomic, strong) UIColor *navTabBarLine_color;

/** 选项标题普通状态文字的颜色 */
@property (nonatomic, strong) UIColor *navTabBar_normalTitle_color;

/** 选项标题选中状态文字的颜色 */
@property (nonatomic, strong) UIColor *navTabBar_selectedTitle_color;

/** 索引 */
@property (nonatomic, assign) NSInteger currentIndex;

- (instancetype)initWithParentViewController:(UIViewController *)parentViewController;

/**
 *  此方法已过期. 请使用'initWithParentViewController:'
 */
- (void)addParentController:(UIViewController *)viewController __deprecated_msg("此方法已过期. 请使用'initWithParentViewController:'");


@end

@interface UIViewController (YPNavTabBarControllerItem)

@property (nonatomic, strong, readonly) YPNavTabBarController *navTabBarController;

@end
```

## <a id="默认快速集成"></a>默认快速集成
![(默认)](http://i.niupic.com/images/2015/10/31/amSlCt.gif)
```objc
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
    
    /**
     *  以下内容都是可选参数
     */
     
    // 设置选项的位置(垂直方向)
    navTabBarController.navTabBar_Y = 20;   // 默认为0
    // 设置默认选中索引（默认选中第一页）
    // navTabBarController.currentIndex = 0;
    
    // 设置样式
    // navTabBarController.navTabBar_type = YPNavTabBarTypeEllipse;
    
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
```
