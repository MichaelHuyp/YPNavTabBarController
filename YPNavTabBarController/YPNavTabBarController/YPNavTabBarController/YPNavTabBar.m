//
//  YPNavTabBar.m
//  YPNavTabBarController
//
//  Created by 胡云鹏 on 15/9/24.
//  Copyright (c) 2015年 MichaelPPP. All rights reserved.
//

#import "YPNavTabBar.h"
#import "YPNavTabBarControllerConst.h"

@interface YPNavTabBar()

/** 存储所有选项标题长度的数组 */
@property (nonatomic, strong) NSArray *itemsWidth;

/** 被按压的选项数组 */
@property (nonatomic, strong) NSMutableArray *items;

/** 所有的选项标题都在这个ScrollView上 */
@property (nonatomic, weak) UIScrollView *navgationTabBar;

/** 横条 */
@property (nonatomic, weak) UIView *line;


@end

@implementation YPNavTabBar


#pragma mark - lazy - 

- (UIScrollView *)navgationTabBar
{
    if (_navgationTabBar == nil) {
        UIScrollView *scrollView = [[UIScrollView alloc] init];
        scrollView.showsHorizontalScrollIndicator = NO;
        scrollView.backgroundColor = YPYellowColor;
        [self addSubview:scrollView];
        self.navgationTabBar = scrollView;
    }
    return _navgationTabBar;
}

- (UIView *)line
{
    if (_line == nil) {
        UIView *view = [[UIView alloc] init];
        view.backgroundColor = YPBlueColor;
        [self.navgationTabBar addSubview:view];
        self.line = view;
    }
    return _line;
}

- (NSMutableArray *)items
{
    if (_items == nil) {
        _items = [NSMutableArray array];
    }
    return _items;
}


- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}

- (void)setup
{
    CGFloat functionButtonX = YPScreenW;
    
    self.navgationTabBar.frame = CGRectMake(0, 0, functionButtonX, YPNavigationBarH);
}

- (void)updateData
{
    self.itemsWidth = [self getButtonsWidthWithTitles:self.itemTitles];
    
    if (self.itemTitles.count) {
        CGFloat contentWidth = [self contentWidthAndAddNavTabBarItemsWithButtonsWidth:self.itemsWidth];
        self.navgationTabBar.contentSize = CGSizeMake(contentWidth, 0);
    }
}

- (NSArray *)getButtonsWidthWithTitles:(NSArray *)titles
{
    NSMutableArray *widths = [NSMutableArray arrayWithCapacity:titles.count];
    
    for (NSString *title in titles)
    {
        CGSize size = CGSizeMake(MAXFLOAT, MAXFLOAT);
        NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
        attributes[NSFontAttributeName] = [UIFont systemFontOfSize:[UIFont systemFontSize]];
        
        size = [title boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size;
        
        NSNumber *width = [NSNumber numberWithFloat:size.width + 40.0f];
        [widths addObject:width];
    }
    
    return widths;
}

- (CGFloat)contentWidthAndAddNavTabBarItemsWithButtonsWidth:(NSArray *)widths
{
    CGFloat buttonX = 0;
    for (NSInteger index = 0; index < self.itemTitles.count; index++)
    {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(buttonX, 0, [widths[index] floatValue], YPNavigationBarH);
        [button setTitle:_itemTitles[index] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(itemPressed:) forControlEvents:UIControlEventTouchUpInside];
        [_navgationTabBar addSubview:button];
        
        [self.items addObject:button];
        
        buttonX += [widths[index] floatValue];
    }
    
    [self showLineWithButtonWidth:[widths[0] floatValue]];
    
    return buttonX;
}

- (void)itemPressed:(UIButton *)button
{
    NSInteger index = [self.items indexOfObject:button];
    [_delegate itemDidSelectedWithIndex:index];
}

- (void)showLineWithButtonWidth:(CGFloat)width
{
    self.line.frame = CGRectMake(2.0f, YPNavigationBarH - 3.0f, width - 4.0f, 3.0f);
}

#pragma mark - setter -
- (void)setProgress:(CGFloat)progress
{
    _progress = progress;
    
    _currentItemIndex = (int)progress;
    
    UIButton *oldBtn;
    
    if (_currentItemIndex > 0) {
        oldBtn = _items[_currentItemIndex - 1];
    }
    
    
    UIButton *button = _items[_currentItemIndex];
    
    CGFloat flag = YPScreenW;
    
    if (button.frame.origin.x + button.frame.size.width > flag)
    {
        CGFloat offsetX = button.frame.origin.x + button.frame.size.width - flag;
        if (_currentItemIndex < [_itemTitles count] - 1)
        {
            offsetX = offsetX + 40.0f;
        }
        
        [_navgationTabBar setContentOffset:CGPointMake(offsetX, 0) animated:YES];
    }
    else
    {
        [_navgationTabBar setContentOffset:CGPointMake(0, 0) animated:YES];
    }
    
    [UIView animateWithDuration:0.2f animations:^{
        
        CGFloat lineX = 0;
        
        if (oldBtn) { // 如果有上一个按钮
            lineX = button.frame.origin.x + oldBtn.frame.size.width * (_progress - (int)_progress);
        } else { // 如果没有上一个按钮
            lineX = button.frame.size.width * (_progress - (int)_progress);
        }
        
        if ((_progress - (int)_progress) == 0) {
            lineX = button.frame.origin.x;
        }
        
        
        CGFloat lineY = _line.frame.origin.y;
        CGFloat lineW = [_itemsWidth[_currentItemIndex] floatValue] - 4.0f;
        CGFloat lineH = _line.frame.size.height;
        
        self.line.frame = CGRectMake(lineX + 2.0f, lineY, lineW, lineH);
    }];
}


@end





















