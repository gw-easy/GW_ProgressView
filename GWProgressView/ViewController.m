//
//  ViewController.m
//  GWProgressView
//
//  Created by gw on 2017/12/22.
//  Copyright © 2017年 gw. All rights reserved.
//

#import "ViewController.h"
#import "GWProgressView.h"
@interface ViewController ()

@property (strong, nonatomic)GWProgressView *progressView;

@property (strong, nonatomic)GWProgressView *progressView2;

@property (assign, nonatomic)float proValue;

@property (assign, nonatomic)float allTime;

@property (strong, nonatomic)NSTimer *timer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.progressView];
    [self.view addSubview:self.progressView2];
    self.allTime = 1000;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(timerAction) userInfo:nil repeats:YES];
    
    
    
}

- (void)timerAction{
    self.proValue += 1/_allTime;
    if (self.proValue > 1) {
        [self.timer invalidate];
        self.timer = nil;
    }
    
    self.progressView.progress = self.proValue;
    self.progressView2.progress = self.proValue;
}

- (GWProgressView *)progressView{
    if (!_progressView) {
        _progressView = [[GWProgressView alloc] initWithFrame:CGRectMake(30, 100, self.view.frame.size.width-60, 20)];
        _progressView.trackTintColor = [UIColor lightGrayColor];
        _progressView.progressImage = @"progressImage.gif";
//        _progressView.progressTintColor = [UIColor redColor];
    }
    return _progressView;
}

- (GWProgressView *)progressView2{
    if (!_progressView2) {
        _progressView2 = [[GWProgressView alloc] initWithFrame:CGRectMake(30, 400, self.view.frame.size.width-60, 20)];
        _progressView2.trackTintColor = [UIColor lightGrayColor];

        _progressView2.progressTintColor = [UIColor greenColor];
    }
    return _progressView2;
}


@end
