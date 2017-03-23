//
//  LoginView.m
//  FadeDemo
//
//  Created by Yioks-Mac on 17/3/17.
//  Copyright © 2017年 Yioks-Mac. All rights reserved.
//

#import "LoginView.h"
#import "Prefix.h"
#import "CustomTextField.h"

@interface LoginView ()<UITextFieldDelegate>

@property (nonatomic, strong) UIImageView *logoView;

@property (nonatomic, strong) CustomTextField *userName;

@property (nonatomic, strong) CustomTextField *passWord;

@property (nonatomic, strong) UIButton *loginBtn;

@property (nonatomic, strong) UIButton *registBtn;
@property (nonatomic, strong) UIButton *forgetPWDBtn;

@end

@implementation LoginView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupView];
    }
    return self;
}

- (void)setupView {
    self.logoView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 328 / 2 * KSCALE, 148 / 2 * KSCALE)];
    self.logoView.image = [UIImage imageNamed:@"logo"];
    [self addSubview:self.logoView];
    
    self.userName = [[CustomTextField alloc] initWithFrame:CGRectMake(0, 268 / 2 * KSCALE, (320 + 18 + 28) / 2 * KSCALE, (34 + 16) / 2 * KSCALE)];
    UIImageView *userNameImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 28 / 2 * KSCALE, 34 / 2 * KSCALE)];
    userNameImageView.image = [UIImage imageNamed:@"手机号白色"];
    self.userName.leftView = userNameImageView;
    
    self.userName.font = [UIFont systemFontOfSize:14];
    self.userName.leftViewMode = UITextFieldViewModeAlways;
    
    self.userName.placeholder = @"请输入手机号";
    [self.userName setValue:[UIColor colorWithHexString:@"dddddd"] forKeyPath:@"_placeholderLabel.textColor"];
    [self.userName setValue:[UIFont boldSystemFontOfSize:14] forKeyPath:@"_placeholderLabel.font"];
    self.userName.font = [UIFont systemFontOfSize:14];
    self.userName.textColor = [UIColor colorWithHexString:@"ffffff"];
    self.userName.delegate = self;
    [self addSubview:self.userName];
    
    self.passWord = [[CustomTextField alloc]initWithFrame:CGRectMake(0, (148 + 120 + 34 + 56 + 16) / 2 * KSCALE, (320 + 18 + 28) / 2 * KSCALE, (34 + 16) / 2 * KSCALE)];
    UIImageView *passwordImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 28 / 2 * KSCALE, 34 / 2 * KSCALE)];
    passwordImageView.image = [UIImage imageNamed:@"密码"];
    self.passWord.leftView = passwordImageView;
    self.passWord.leftViewMode = UITextFieldViewModeAlways;
    self.passWord.placeholder = @"请输入密码";
    [self.passWord setValue:[UIColor colorWithHexString:@"dddddd"] forKeyPath:@"_placeholderLabel.textColor"];
    [self.passWord setValue:[UIFont boldSystemFontOfSize:14] forKeyPath:@"_placeholderLabel.font"];
    self.passWord.font = [UIFont systemFontOfSize:14];
    self.passWord.textColor = [UIColor colorWithHexString:@"ffffff"];
    self.passWord.delegate = self;
    self.passWord.secureTextEntry = YES;
    [self addSubview:self.passWord];
    
    self.loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.loginBtn.frame = CGRectMake(0, self.passWord.frame.origin.y + self.passWord.frame.size.height + 64 /2 * KSCALE, 368 / 2 * KSCALE, 56 / 2 * KSCALE);
    [self.loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [self.loginBtn setTitleColor:[UIColor colorWithHexString:@"#fefefe"] forState:UIControlStateNormal];
    self.loginBtn.backgroundColor = [UIColor colorWithHexString:@"#5ac8fa"];
    self.loginBtn.layer.cornerRadius = self.loginBtn.frame.size.height / 2.0;
    self.loginBtn.clipsToBounds = YES;
    [self addSubview:self.loginBtn];
    
    self.registBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.registBtn.frame = CGRectMake(0, self.bounds.size.height - 30 / 2 * KSCALE, 130 / 2 *KSCALE, 30 / 2 * KSCALE);
    [self.registBtn setTitle:@"快速注册>>" forState:UIControlStateNormal];
    self.registBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [self.registBtn setTitleColor:[UIColor colorWithHexString:@"#dddddd"] forState:UIControlStateNormal];
    [self.registBtn setTitleColor:[UIColor colorWithHexString:@"#5ac8fa"] forState:UIControlStateHighlighted];
    [self addSubview:self.registBtn];
    
    self.forgetPWDBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.forgetPWDBtn.frame = CGRectMake(self.bounds.size.width - 130 / 2 * KSCALE, self.bounds.size.height - 30 / 2 * KSCALE, 130 / 2 * KSCALE, 30 / 2 *KSCALE);
    [self.forgetPWDBtn setTitle:@"忘记密码?" forState:UIControlStateNormal];
    
    self.forgetPWDBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [self.forgetPWDBtn setTitleColor:[UIColor colorWithHexString:@"dddddd"] forState:UIControlStateNormal];
    [self.forgetPWDBtn setTitleColor:[UIColor colorWithHexString:@"5ac8fa"] forState:UIControlStateHighlighted];
    [self addSubview:self.forgetPWDBtn];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    if (textField == self.userName) {
        UIImageView *leftView = (UIImageView *)self.userName.leftView;
        leftView.image = [UIImage imageNamed:@"手机号"];
        self.userName.lineView.backgroundColor = [UIColor colorWithHexString:@"#5ac8fa"];
    }else {
        UIImageView *leftView = (UIImageView *)self.passWord.leftView;
        leftView.image = [UIImage imageNamed:@"密码蓝色"];
        self.passWord.lineView.backgroundColor = [UIColor colorWithHexString:@"#5ac8fa"];
    }
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    if (textField == self.userName) {
        UIImageView *leftView = (UIImageView *)self.userName.leftView;
        leftView.image = [UIImage imageNamed:@"手机号白色"];
        self.userName.lineView.backgroundColor = [UIColor whiteColor];
    }else {
        UIImageView *leftView = (UIImageView *)self.passWord.leftView;
        leftView.image = [UIImage imageNamed:@"密码"];
        self.passWord.lineView.backgroundColor = [UIColor whiteColor];
    }
}

@end
