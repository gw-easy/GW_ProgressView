//
//  GWProgressView.h
//  iSpeakDemo
//
//  Created by gw on 2017/12/2.
//  Copyright © 2017年 gw. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GWProgressView : UIView

@property (strong,nonatomic) UIColor *trackTintColor;       //背景色
@property (strong,nonatomic) UIColor *progressTintColor;             //进度条颜色
@property (assign,nonatomic) CGFloat progress;                  //进度条进度的值
@property (assign,nonatomic) NSInteger progressCornerRadius;         //进度条圆角
@property (assign,nonatomic) NSInteger progressBorderWidth;          //进度条边宽度

//需要设置背景image
@property (copy, nonatomic)NSString *backImage;

//假如需要动态进度
@property (copy, nonatomic)NSString *progressImage;

@end
