//
//  YPNavTabBar.h
//  YPNavTabBarController
//
//  Created by 胡云鹏 on 15/9/24.
//  Copyright (c) 2015年 MichaelPPP. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol YPNavTabBarDelegate <NSObject>

@optional

/** 当选项被选择时候的回调代理方法 */
- (void)itemDidSelectedWithIndex:(NSInteger)index;

@end


@interface YPNavTabBar : UIView

/** 代理 */
@property (nonatomic, assign) id <YPNavTabBarDelegate> delegate;

/** 当前索引 */
@property (nonatomic, assign) NSInteger currentItemIndex;

/** 选项标题数组 */
@property (nonatomic, strong) NSArray *itemTitles;

/** 横条颜色 */
@property (nonatomic, strong) UIColor *lineColor;

/** 拖动比例 */
@property (nonatomic, assign) CGFloat progress;

/**
 *  刷新数据
 */
- (void)updateData;

@end
