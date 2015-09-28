//
//  WkDockTabBarItem.m
//  QQZone
//
//  Created by 王虎 on 15-8-10.
//  Copyright (c) 2015年 hoowang. All rights reserved.
//

#import "WkDockTabBarItem.h"

@interface WkDockTabBarItem()
/** 屏幕方向*/
@property (assign, nonatomic) WKScreenDirection direction;
@end

@implementation WkDockTabBarItem
const CGFloat kRatio = 0.4;

+ (instancetype)dockTabBarItemWithImage:(NSString *)image Title:(NSString *)title{
    WkDockTabBarItem* item = [self new];
    [item setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [item setBackgroundImage:[UIImage imageNamed:@"tabbar_separate_selected_bg"] forState:UIControlStateSelected];
    [item setTitle:title forState:UIControlStateNormal];

    return item;
}

- (instancetype)init{
    self = [super init];
    self.imageView.contentMode = UIViewContentModeCenter;
    return self;
}

- (void)setScreenDirection:(WKScreenDirection)direction{
    _direction = direction;
}

- (void)setHighlighted:(BOOL)highlighted{

}

- (CGRect)imageRectForContentRect:(CGRect)contentRect{
    switch (self.direction) {
        case KWKScreenHorizontalDirection:
            return CGRectMake(0, 0, self.width * kRatio, self.height);

        case KWKScreenVerticalDirection:
            return self.bounds;
    }
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect{
    switch (self.direction) {
        case KWKScreenHorizontalDirection:
        {
            CGFloat x = self.width * kRatio;
            CGFloat y = 0;
            return CGRectMake(x, y, self.width * (1.0 - kRatio), self.height);
        }
        case KWKScreenVerticalDirection:
            return CGRectMake(0, 0, -1, -1);
    }
}

@end
