//
//  CustomTextField.m
//  FadeDemo
//
//  Created by Yioks-Mac on 17/3/17.
//  Copyright © 2017年 Yioks-Mac. All rights reserved.
//

#import "CustomTextField.h"
#import "Prefix.h"

@implementation CustomTextField


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
/*
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    
}
 */

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _lineView = [[UIView alloc] initWithFrame:CGRectMake((28 + 18 ) / 2, self.frame.size.height - 1, self.frame.size.width - (28 + 18 ) / 2, 1)];
        _lineView.backgroundColor = [UIColor whiteColor];
        [self addSubview:_lineView];
        self.tintColor = [UIColor colorWithHexString:@"#ffffff"];
    }
    return self;
}


- (CGRect)textRectForBounds:(CGRect)bounds {
    return CGRectMake(bounds.origin.x + (18 + 28) / 2 * KSCALE, bounds.origin.y, bounds.size.width - (28 + 18) / 2 * KSCALE, bounds.size.height - 16 / 2 * KSCALE);
}

- (CGRect)placeholderRectForBounds:(CGRect)bounds {
    return CGRectMake(bounds.origin.x + (18 + 28) / 2 * KSCALE, bounds.origin.y, bounds.size.width - (28 + 18) / 2 * KSCALE, bounds.size.height - 16 / 2 * KSCALE);
}

- (CGRect)editingRectForBounds:(CGRect)bounds {
    return CGRectMake(bounds.origin.x + (18 + 28) / 2 * KSCALE, bounds.origin.y, bounds.size.width - (28 + 18) / 2 * KSCALE, bounds.size.height - 16 /2 * KSCALE);
}

- (CGRect)leftViewRectForBounds:(CGRect)bounds{
    return CGRectMake(0, 0, 28 / 2 * KSCALE, 34 / 2 * KSCALE);
}

@end
