//
//  ViewController.m
//  FadeDemo
//
//  Created by Yioks-Mac on 17/3/17.
//  Copyright © 2017年 Yioks-Mac. All rights reserved.
//

#import "ViewController.h"
#import "LoginView.h"
#import "Prefix.h"

@interface ViewController ()

@property (nonatomic, strong) UIImageView *bgView;

@property (nonatomic, strong) UIImageView *coverView;

@property (nonatomic, strong) UIView *loginView;






@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self setupView];
    
    [self beginAnimation];
}

- (void)setupView {
    self.bgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    self.bgView.image = [UIImage imageNamed:@"background"];
    [self.view addSubview:self.bgView];
    self.bgView.layer.position = CGPointMake(0, 0);
    self.bgView.layer.anchorPoint = CGPointMake(0, 0);
    
    self.coverView = [[UIImageView alloc]initWithFrame:self.view.bounds];
    self.coverView.alpha = 0.0;
    self.coverView.image = [UIImage imageNamed:@"遮罩"];
    [self.view addSubview:self.coverView];
    
    self.loginView = [[LoginView alloc]initWithFrame:CGRectMake(0, 248 / 2 * KSCALE, 368 / 2 * KSCALE, self.view.bounds.size.height - (248 + 475) / 2)];
    CGPoint p = self.loginView.center;
    p.x = self.view.bounds.size.width / 2;
    self.loginView.center = p;
    self.loginView.alpha = 0.0;
    [self.view addSubview:self.loginView];
}

- (void)beginAnimation {
    //背景动画
    [UIView beginAnimations:@"enlarge" context:nil];
    [UIView setAnimationDelay:0.5];
    [UIView setAnimationDuration:2];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    [UIView setAnimationDidStopSelector:@selector(enlargeAnimationEnded)];
    self.bgView.transform = CGAffineTransformMakeScale(1.1, 1.1);
    [UIView commitAnimations];
    
    [UIView beginAnimations:@"slowAppear" context:nil];
    [UIView setAnimationDelay:2];
    [UIView setAnimationDuration:1];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    self.coverView.alpha = 0.7;
    self.loginView.alpha = 1;
    [UIView commitAnimations];
}

- (void)enlargeAnimationEnded {
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
