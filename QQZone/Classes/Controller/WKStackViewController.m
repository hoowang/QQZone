//
//  WKStackViewController.m
//  QQZone
//
//  Created by 王虎 on 15-8-9.
//  Copyright (c) 2015年 hoowang. All rights reserved.
//

#import "WKStackViewController.h"
#import "WKDockView.h"
#import "WkContentView.h"

@interface WKStackViewController ()<WKDockViewEventDelegate>
/** dockView*/
@property (weak, nonatomic) WKDockView* dockView;
/** contentView*/
@property (weak, nonatomic) WkContentView* contentView;
@end

@implementation WKStackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
}

/**
 *  @author hoowang, 15-08-09 19:08:22
 *
 *  检测当前IPAD方向是否为横屏
 *
 *  @return
 */
- (WKScreenDirection)screenDirectionWithSize:(CGSize)size{

    if(size.width > size.height){
        return KWKScreenHorizontalDirection;
    }
    return KWKScreenVerticalDirection;
}

- (void)initUI{
    self.view.backgroundColor = [UIColor colorWithRed:55.0/255 green:55.0/255 blue:55.0/255 alpha:1.0];
    [self initDockView];
    [self initContentView];
}

- (void)initDockView{
    WKDockView* dockView = [WKDockView dockView];
    dockView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    dockView.height = self.view.height;
    [dockView setHeigthWithScreenDirection:[self screenDirectionWithSize:self.view.size]];
    [self.view addSubview:dockView];
    self.dockView = dockView;
    dockView.delegate = self;
}

- (void)initContentView{
    WkContentView* contentView = [WkContentView contentView];
    [self.view addSubview:contentView];
    CGFloat statusBarH = [[UIApplication sharedApplication] statusBarFrame].size.height;
    contentView.frame = CGRectMake(self.dockView.width, statusBarH, kContentViewWidth, self.view.height - statusBarH);
    contentView.backgroundColor = [UIColor greenColor];
    self.contentView = contentView;
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator{
    [UIView animateWithDuration:[coordinator transitionDuration] animations:^{
        [self.dockView setHeigthWithScreenDirection:[self screenDirectionWithSize:size]];
        self.contentView.x  = self.dockView.width;
    }];
}

- (void)iconViewClicked{
    NSLog(@"%s", __func__);
}

- (void)tabBarSelectedItemChanged:(NSUInteger)index{
    NSLog(@"%s----%zd", __func__, index);
    [self.contentView loadContentViewWithClass:[UIView class]];

}

- (void)menuItemClicked:(NSUInteger)index{
    NSLog(@"%s----%zd", __func__, index);
}
@end
