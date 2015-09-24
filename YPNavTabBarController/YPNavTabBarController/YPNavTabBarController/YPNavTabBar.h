//
//  YPNavTabBar.h
//  YPNavTabBarController
//
//  Created by 胡云鹏 on 15/9/24.
//  Copyright (c) 2015年 MichaelPPP. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YPNavTabBar;

@protocol YPNavTabBarDelegate <NSObject>

@optional

/** 当选项被选择时候的回调代理方法 */
- (void)itemDidSelectedWithIndex:(YPNavTabBar *)navTabBar index:(NSInteger)index;

@end


@interface YPNavTabBar : UIView

/** 代理 */
@property (nonatomic, assign) id <YPNavTabBarDelegate> delegate;

/** 当前索引 */
@property (nonatomic, assign) NSInteger currentItemIndex;

/** 选项标题数组 */
@property (nonatomic, strong) NSArray *itemTitles;

/** 横条颜色 */
@property (nonatomic, strong) UIColor *navgationTabBar_lineColor;

/** 拖动比例 */
@property (nonatomic, assign) CGFloat progress;

/** 选项卡的背景颜色 */
@property (nonatomic, strong) UIColor *navgationTabBar_color;

/** 被按压的选项数组 */
@property (nonatomic, strong) NSMutableArray *items;

/** 选项标题普通状态文字的颜色 */
@property (nonatomic, strong) UIColor *navTabBar_normalTitle_color;

/** 选项标题选中状态文字的颜色 */
@property (nonatomic, strong) UIColor *navTabBar_selectedTitle_color;

/**
 *  刷新数据
 */
- (void)updateData;

@end
