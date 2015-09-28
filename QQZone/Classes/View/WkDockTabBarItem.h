//
//  WkDockTabBarItem.h
//  QQZone
//
//  Created by 王虎 on 15-8-10.
//  Copyright (c) 2015年 hoowang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WkDockTabBarItem : UIButton

+ (instancetype)dockTabBarItemWithImage:(NSString*)image Title:(NSString*)title;
- (void)setScreenDirection:(WKScreenDirection)direction;
@end
