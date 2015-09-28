//
//  WKDockView.m
//  QQZone
//
//  Created by 王虎 on 15-8-9.
//  Copyright (c) 2015年 hoowang. All rights reserved.
//

#import "WKDockView.h"
#import "WKDockMenu.h"
#import "WKDockTabBar.h"
#import "WKIconView.h"

@interface WKDockView()<WKDockMenuDelegate, WKDockTabBarDelegate>
/** dockMenu*/
@property (weak, nonatomic) WKDockMenu* dockMenu;
/** dockTabBar*/
@property (weak, nonatomic) WKDockTabBar* dockTabBar;
/** 头像*/
@property (weak, nonatomic) WKIconView* iconView;
@end

@implementation WKDockView

+ (instancetype)dockView{
    WKDockView* dockView = [[WKDockView alloc] init];
    return dockView;
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    [self initUI];
    return self;
}

- (void)initUI{
    [self createDockMenu];
    [self createTabBar];
    [self createIconView];
}

- (void)setHeigthWithScreenDirection:(WKScreenDirection)direction{
    switch (direction) {
        case KWKScreenHorizontalDirection:
            self.width = kDockLandscapeWidth;
            break;
        case KWKScreenVerticalDirection:
            self.width = kDockPortraitWidth;
            break;
    }
    [self.dockMenu setMenuItemFrameWith:direction];
    [self.dockTabBar setTabBarFrameWithScreenDirection:direction];
    self.dockTabBar.y = self.height - self.dockMenu.height - self.dockTabBar.height;
    [self.iconView setScreenDirection:direction];
}

- (void)createDockMenu{
    WKDockMenu* dockMenu = [WKDockMenu dockMenu];
    [self addSubview:dockMenu];
    self.dockMenu = dockMenu;
    dockMenu.delegate = self;
}

- (void)createTabBar{
    WKDockTabBar* dockTabBar = [WKDockTabBar dockTabBar];
    [self addSubview:dockTabBar];
    self.dockTabBar = dockTabBar;
    dockTabBar.delegate = self;
}

- (void)createIconView{
    WKIconView* iconView = [WKIconView iconView];
    [self addSubview:iconView];
    self.iconView = iconView;
    [iconView addTarget:self action:@selector(iconViewClickedHandler:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)iconViewClickedHandler:(UIButton*)sender{
    if ([self.delegate respondsToSelector:@selector(iconViewClicked)]) {
        [self.delegate iconViewClicked];
    }
}

- (void)menuItemClicked:(NSUInteger)itemIndex{
    if ([self.delegate respondsToSelector:@selector(menuItemClicked:)]) {
        [self.delegate menuItemClicked:itemIndex];
    }
}

- (void)selectedItemChanged:(NSUInteger)itemIndex{
    if ([self.delegate respondsToSelector:@selector(tabBarSelectedItemChanged:)]) {
        [self.delegate tabBarSelectedItemChanged:itemIndex];
    }
}

@end
