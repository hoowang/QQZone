//
//  WKDockTabBar.m
//  QQZone
//
//  Created by 王虎 on 15-8-9.
//  Copyright (c) 2015年 hoowang. All rights reserved.
//

#import "WKDockTabBar.h"
#import "WkDockTabBarItem.h"

@interface WKDockTabBar()
/** 上次选中item */
@property (strong, nonatomic) WkDockTabBarItem* lastSelected;
@end
@implementation WKDockTabBar

+ (instancetype)dockTabBar{
    return [self new];
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    [self initUI];
    return self;
}

- (void)initUI{
    self.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
    [self createItems];

}

- (void)setTabBarFrameWithScreenDirection:(WKScreenDirection)direction{
    self.height = self.subviews.count * kDockItemHeight;
    self.width = self.superview.width;
    switch (direction) {
        case KWKScreenHorizontalDirection:
            [self adjustItems:KWKScreenHorizontalDirection];
            break;

        case KWKScreenVerticalDirection:
            [self adjustItems:KWKScreenVerticalDirection];
            break;
    }

}

- (void)adjustItems:(WKScreenDirection)direction{
    NSUInteger itemCount = self.subviews.count;
    CGFloat itemH = kDockItemHeight;
    for (NSUInteger i = 0; i != itemCount; ++i) {
        WkDockTabBarItem* view = self.subviews[i];
        [view setScreenDirection:direction];
        view.frame = CGRectMake(0, i * itemH, self.width, itemH);
    }
}

-(void)createItems{
    [self addSubview:[WkDockTabBarItem dockTabBarItemWithImage:@"tab_bar_feed_icon" Title:@"全部动态"]];
    [self addSubview:[WkDockTabBarItem dockTabBarItemWithImage:@"tab_bar_passive_feed_icon" Title:@"与我相关"]];
    [self addSubview:[WkDockTabBarItem dockTabBarItemWithImage:@"tab_bar_pic_wall_icon" Title:@"照片墙"]];
    [self addSubview:[WkDockTabBarItem dockTabBarItemWithImage:@"tab_bar_e_album_icon" Title:@"电子相框"]];
    [self addSubview:[WkDockTabBarItem dockTabBarItemWithImage:@"tab_bar_friend_icon" Title:@"好友"]];
    [self addSubview:[WkDockTabBarItem dockTabBarItemWithImage:@"tab_bar_e_more_icon" Title:@"更多"]];

    for (UIControl* control in self.subviews) {
        [control addTarget:self action:@selector(selectedItemChanged:) forControlEvents:UIControlEventTouchDown];
    }
}

- (void)selectedItemChanged:(WkDockTabBarItem*)sender{
    [sender setSelected:YES];
    self.lastSelected.selected = NO;
    self.lastSelected = sender;
    if ([self.delegate respondsToSelector:@selector(selectedItemChanged:)]) {
        [self.delegate selectedItemChanged:[self.subviews indexOfObject:sender]];
    }
}


@end
