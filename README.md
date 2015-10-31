# YPNavTabBarController
##这是一款自定义滑块分段选择控制器
* An easy way to use Segment selection controller
* 用法简单的滑块分段选择控制器:两行代码就可集成

## 如何使用YPNavTabBarController
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
