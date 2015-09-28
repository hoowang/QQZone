//
//  WKDockTabBar.h
//  QQZone
//
//  Created by 王虎 on 15-8-9.
//  Copyright (c) 2015年 hoowang. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol WKDockTabBarDelegate <NSObject>

@optional
- (void)selectedItemChanged:(NSUInteger)itemIndex;
@end

@interface WKDockTabBar : UIView

+ (instancetype)dockTabBar;
- (void)setTabBarFrameWithScreenDirection:(WKScreenDirection)direction;

/** 代理指针*/
@property (weak, nonatomic) id<WKDockTabBarDelegate> delegate;
@end
