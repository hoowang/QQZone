//
//  WKDockMenu.m
//  QQZone
//
//  Created by 王虎 on 15-8-9.
//  Copyright (c) 2015年 hoowang. All rights reserved.
//

#import "WKDockMenu.h"

@implementation WKDockMenu

+ (instancetype)dockMenu{
    WKDockMenu* dockMenu = [self new];
    return dockMenu;
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    [self initUI];

    return self;
}

- (void)initUI{
    self.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
    [self createMenuItemWithImageName:@"tabbar_mood"];
    [self createMenuItemWithImageName:@"tabbar_photo"];
    [self createMenuItemWithImageName:@"tabbar_blog"];
}


- (void)createMenuItemWithImageName:(NSString*)imageName{
    UIButton* menuItem = [UIButton buttonWithType:UIButtonTypeCustom];
    [menuItem setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [menuItem setBackgroundImage:[UIImage imageNamed:@"tabbar_separate_selected_bg"] forState:UIControlStateHighlighted];
    [self addSubview:menuItem];
    [menuItem addTarget:self action:@selector(menuItemClicked:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)setMenuItemFrameWith:(WKScreenDirection)direction{
    self.width = self.superview.width;
    self.x = 0;
    NSUInteger menuItemCount = self.subviews.count;
    switch (direction) {
        case KWKScreenHorizontalDirection:
            self.height = kDockItemHeight;
            [self adjustItemsHorizontal];
            break;

        case KWKScreenVerticalDirection:
            self.height = kDockItemHeight * menuItemCount;
            [self adjustItemsVertical];
            break;
    }
    self.y = self.superview.height - self.height;
}

- (void)adjustItemsHorizontal{
    NSUInteger itemCount = self.subviews.count;
    CGFloat itemW = self.width / itemCount;

    for (NSUInteger i = 0; i != itemCount; ++i) {
        UIView* view = self.subviews[i];
        view.frame = CGRectMake(i * itemW, 0, itemW, self.height);
    }
}

- (void)adjustItemsVertical{
    NSUInteger itemCount = self.subviews.count;
    for (NSUInteger i = 0; i != itemCount; ++i) {
        UIView* view = self.subviews[i];
        view.frame = CGRectMake(0, i * kDockItemHeight, self.width, kDockItemHeight);
    }
}

- (void)menuItemClicked:(UIButton*)item{
    if ([self.delegate respondsToSelector:@selector(menuItemClicked:)]) {
        [self.delegate menuItemClicked:[self.subviews indexOfObject:item]];
    }
}

@end
