//
//  WkContentView.m
//  QQZone
//
//  Created by 王虎 on 15-8-11.
//  Copyright (c) 2015年 hoowang. All rights reserved.
//

#import "WkContentView.h"

@interface WkContentView()

/** 所有的View */
@property (strong, nonatomic) NSMutableDictionary* views;
@end

@implementation WkContentView

- (NSMutableDictionary *)views{
    if (_views) {
        return _views;
    }

    _views = [NSMutableDictionary dictionary];
    return _views;
}

+ (instancetype)contentView{
    return [self new];
}

- (void)loadContentViewWithClass:(Class)viewClass{
        // UIViewController* viewContr = [self.views objectForKey:NSStringFromClass(viewClass)];

    //    if (view == nil) {
    //        view = [viewClass new];
    //        [self.views setObject:view forKey:NSStringFromClass(viewClass)];
    //    }
    //    view.backgroundColor = [UIColor colorWithRed:arc4random_uniform(100) green:arc4random_uniform(60) blue:arc4random_uniform(130) alpha:1.0f];
    //    [self addSubview:view];
    //    view.frame = self.bounds;
}

@end
