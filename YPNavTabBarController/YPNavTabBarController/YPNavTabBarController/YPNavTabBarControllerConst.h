#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "UIView+YPNavTabBar.h"

#ifdef DEBUG // 处于开发阶段
#define YPLog(...) NSLog(__VA_ARGS__)
#else // 处于发布阶段
#define YPLog(...)
#endif

/** 系统导航栏高度 */
#define YPNavigationBarH 44.0f
/** 系统状态栏高度 */
#define YPStatusBar 20.0f
/** 系统导航栏+状态栏高度 */
#define YPStatusBarAndNavBar 64.0f
/** 选项卡高度 */
#define YPTabBarH 49.0f



/**
 *  通知中心
 */
#define YPNotificationCenter [NSNotificationCenter defaultCenter]

/**
 *  屏幕
 */
#define YPScreen [UIScreen mainScreen]
/**
 *  屏幕宽度
 */
#define YPScreenW [UIScreen mainScreen].bounds.size.width
/**
 *  屏幕高度
 */
#define YPScreenH [UIScreen mainScreen].bounds.size.height
/**
 *  屏幕Frame
 */
#define YPScreenBounds [UIScreen mainScreen].bounds
/**
 *  屏幕伸缩度（Retina时值为2,非Retina值为1）
 */
#define YPScreenScale [UIScreen mainScreen].scale

/**
 *  颜色
 */
#define YPBlackColor [UIColor blackColor]
#define YPBlueColor [UIColor blueColor]
#define YPRedColor [UIColor redColor]
#define YPWhiteColor [UIColor whiteColor]
#define YPGrayColor [UIColor grayColor]
#define YPDarkGrayColor [UIColor darkGrayColor]
#define YPLightGrayColor [UIColor lightGrayColor]
#define YPGreenColor [UIColor greenColor]
#define YPCyanColor [UIColor cyanColor]
#define YPYellowColor [UIColor yellowColor]
#define YPMagentaColor [UIColor magentaColor]
#define YPOrangeColor [UIColor orangeColor]
#define YPPurpleColor [UIColor purpleColor]
#define YPBrownColor [UIColor brownColor]
#define YPClearColor [UIColor clearColor]
/**
 *  字体大小
 */
#define YPFont_10 [UIFont boldSystemFontOfSize:10]
#define YPFont_11 [UIFont boldSystemFontOfSize:11]
#define YPFont_12 [UIFont boldSystemFontOfSize:12]
#define YPFont_13 [UIFont boldSystemFontOfSize:13]
#define YPFont_14 [UIFont boldSystemFontOfSize:14]
#define YPFont_15 [UIFont boldSystemFontOfSize:15]
#define YPFont_16 [UIFont boldSystemFontOfSize:16]
#define YPFont_17 [UIFont boldSystemFontOfSize:17]
#define YPFont_18 [UIFont boldSystemFontOfSize:18]
#define YPFont_19 [UIFont boldSystemFontOfSize:19]
#define YPFont_20 [UIFont boldSystemFontOfSize:20]


/**
 *  RGB颜色
 */
#define YPColor_RGB(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define YPColor_RGBA(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)/255.0]
/**
 *  随机色
 */
#define YPRandomColor_RGB YPColor_RGB(arc4random_uniform(256),arc4random_uniform(256),arc4random_uniform(256))
#define YPRandomColor_RGBA YPColor_RGBA(arc4random_uniform(256),arc4random_uniform(256),arc4random_uniform(256),arc4random_uniform(256))