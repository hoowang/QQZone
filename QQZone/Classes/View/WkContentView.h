//
//  WkContentView.h
//  QQZone
//
//  Created by 王虎 on 15-8-11.
//  Copyright (c) 2015年 hoowang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WkContentView : UIView
+ (instancetype)contentView;

- (void)loadContentViewWithClass:(Class)viewClass;

@end
