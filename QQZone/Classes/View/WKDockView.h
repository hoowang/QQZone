//
//  WKDockView.h
//  QQZone
//
//  Created by 王虎 on 15-8-9.
//  Copyright (c) 2015年 hoowang. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol WKDockViewEventDelegate <NSObject>

@optional
    - (void)iconViewClicked;
    - (void)tabBarSelectedItemChanged:(NSUInteger)index;
    - (void)menuItemClicked:(NSUInteger)index;
@end

@interface WKDockView : UIView

+ (instancetype)dockView;

- (void)setHeigthWithScreenDirection:(WKScreenDirection)direction;
/** 代理指针*/
@property (weak, nonatomic) id<WKDockViewEventDelegate> delegate;
@end
