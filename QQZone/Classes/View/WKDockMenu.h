//
//  WKDockMenu.h
//  QQZone
//
//  Created by 王虎 on 15-8-9.
//  Copyright (c) 2015年 hoowang. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol WKDockMenuDelegate <NSObject>

@optional
- (void)menuItemClicked:(NSUInteger)itemIndex;
@end

@interface WKDockMenu : UIView

+ (instancetype)dockMenu;
- (void)setMenuItemFrameWith:(WKScreenDirection)direction;
/** 代理*/
@property (weak, nonatomic) id<WKDockMenuDelegate> delegate;
@end
