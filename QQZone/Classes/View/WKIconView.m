//
//  WKIconView.m
//  QQZone
//
//  Created by 王虎 on 15-8-10.
//  Copyright (c) 2015年 hoowang. All rights reserved.
//

#import "WKIconView.h"

@interface WKIconView()
/** 屏幕方向*/
@property (assign, nonatomic) WKScreenDirection direction;
@end

@implementation WKIconView

+ (instancetype)iconView{
    return [self new];
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    [self initUI];
    return self;
}

- (void)initUI{
    [self setImage:[UIImage imageNamed:@"monkey_king-001"] forState:UIControlStateNormal];
    [self setTitle:@"悟空" forState:UIControlStateNormal];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
}

- (void)setScreenDirection:(WKScreenDirection)direction{
    _direction = direction;
    switch (direction) {
        case KWKScreenHorizontalDirection:
            self.width = kIconButtonLandscapeWidth;
            self.height = kIconButtonLandscapeHeight;

            break;

        case KWKScreenVerticalDirection:
            self.width = kIconButtonPortraitWH;
            self.height = kIconButtonPortraitWH;
            break;
    }

    self.x = (self.superview.width - self.width) * 0.5;
    self.y = kIconButtonY;
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect{
    switch (self.direction) {
        case KWKScreenHorizontalDirection:
            return CGRectMake(0, 0, self.width, self.width);

        case KWKScreenVerticalDirection:
            return self.bounds;
    }
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect{
    switch (self.direction) {
        case KWKScreenHorizontalDirection:
        return CGRectMake(0, self.imageView.height, self.imageView.width, kIconButtonLandscapeTitleH);

        case KWKScreenVerticalDirection:
            return CGRectMake(0, 0, -1 , -1);
    }
}

@end
