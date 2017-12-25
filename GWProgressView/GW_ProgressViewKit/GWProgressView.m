//
//  GWProgressView.m
//  iSpeakDemo
//
//  Created by gw on 2017/12/2.
//  Copyright © 2017年 gw. All rights reserved.
//

#import "GWProgressView.h"
#import "GW_AnimatedGIFImageSerialization.h"
@interface GWProgressView ()

@property (strong,nonatomic) UIImageView *firstView;
@property (strong,nonatomic) UIImageView *secondView;
@property (strong,nonatomic) UILabel *progressLabel;

@end
@implementation GWProgressView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = self.superview.backgroundColor;
        _trackTintColor = [UIColor whiteColor];
        _progressCornerRadius = self.frame.size.height/2;
        _progressTintColor = [UIColor whiteColor];
        [self addSubview:self.firstView];
        [self.firstView addSubview:self.secondView];
//        [self addSubview:self.progressLabel];
    }
    return self;
}

- (UIImageView *)firstView{
    if (_firstView == nil){
        _firstView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        _firstView.backgroundColor = _trackTintColor;
        _firstView.layer.masksToBounds = YES;
        _firstView.layer.cornerRadius = _progressCornerRadius;
    }
    return _firstView;
}

- (UIImageView *)secondView{
    if (_secondView == nil){
        _secondView = [[UIImageView alloc]initWithFrame:CGRectZero];
        _secondView.backgroundColor = _progressTintColor;
        _secondView.layer.masksToBounds = YES;
        _secondView.layer.cornerRadius = _progressCornerRadius;
    }
    return _secondView;
}

//- (UILabel *)progressLabel{
//    if (_progressLabel == nil){
//        UILabel *lb = [[UILabel alloc]init];
//        lb.textAlignment = NSTextAlignmentRight;
//        CGFloat value = _progress * 100;
//        NSString *valueStr = [[NSString stringWithFormat:@"%.1f",value]stringByAppendingString:@"%"];
//        lb.text = valueStr;
//        lb.textColor = [UIColor whiteColor];
//        _progressLabel = lb;
//    }
//    return _progressLabel;
//}



- (void)layoutSubviews{
    [super layoutSubviews];
    self.secondView.frame = CGRectMake(0, 0, self.frame.size.width * _progress, self.frame.size.height);
//    self.progressLabel.frame = CGRectMake(-10, 0, self.frame.size.width, self.frame.size.height);
    
}

#pragma mark - set&&get

- (void)setTrackTintColor:(UIColor *)trackTintColor{
    _trackTintColor = trackTintColor;
    self.firstView.backgroundColor = trackTintColor;
}

- (void)setProgress:(CGFloat)progress{
    _progress = progress;
    CGFloat leftEdge = self.frame.size.width * _progress-self.frame.size.width;
    if (leftEdge >0) {
        self.secondView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
        return;
    }
    self.secondView.frame = CGRectMake(self.frame.size.width * _progress-self.frame.size.width, 0, self.frame.size.width, self.frame.size.height);
}

- (void)setProgressCornerRadius:(NSInteger)progressCornerRadius{
    _progressCornerRadius = progressCornerRadius;
}

- (void)setProgressTintColor:(UIColor *)progressTintColor{
    _progressTintColor = progressTintColor;
    self.secondView.backgroundColor = progressTintColor;
}

- (void)setProgressBorderWidth:(NSInteger)progressBorderWidth{
    self.layer.borderWidth = progressBorderWidth;
    _progressBorderWidth = progressBorderWidth;
}

- (void)setBackImage:(NSString *)backImage{
    _backImage = backImage;
    if ([self isConfile:backImage]) {
        self.firstView.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:backImage ofType:nil]];
    }else{
        self.firstView.image = [UIImage imageNamed:backImage];
    }
}

- (void)setProgressImage:(NSString *)progressImage{
    _progressImage = progressImage;
    if ([self isConfile:progressImage]) {
        self.secondView.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:progressImage ofType:nil]];
    }else{
        self.secondView.image = [UIImage imageNamed:progressImage];
    }
}

- (BOOL)isConfile:(NSString *)name{
    if ([name hasSuffix:@".jpg"] || [name hasSuffix:@".png"] || [name hasSuffix:@".gif"]) {
        return YES;
    }
    return NO;
}

@end
