//
//  Prefix.h
//  FadeDemo
//
//  Created by Yioks-Mac on 17/3/17.
//  Copyright © 2017年 Yioks-Mac. All rights reserved.
//

#ifndef Prefix_h
#define Prefix_h

#import "UIColor+Hex.h"

//当前设备屏幕高度、宽度
#define DEVICE_SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define DEVICE_SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width

//判断设备
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)

#define IS_IPHONE_4 (fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )480) < DBL_EPSILON)

#define IS_IPHONE_5 ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )568 ) < DBL_EPSILON )

#define IS_IPHONE_6_Plus ([UIScreen mainScreen].scale == 3 )
#define IS_IPHONE_6 (fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )667 ) < DBL_EPSILON )

//4.0 4.7 5.5尺寸放大系数
#define KSCALE ((IS_IPHONE_6)? 1.0:(DEVICE_SCREEN_WIDTH/375.))


#define wKSCALE ((IS_IPHONE_6_Plus)? 1.0:(DEVICE_SCREEN_WIDTH/414.))
#define hKSCALE ((IS_IPHONE_6_Plus)? 1.0:(DEVICE_SCREEN_HEIGHT/736.))


#define kScreenScale     [UIScreen mainScreen].scale
#define kwScaleBase6     (DEVICE_SCREEN_WIDTH / 375.0)

#define printf_console printf
//#define NSLog(...) NSLog(__VA_ARGS__)//__PRETTY_FUNCTION__
#define FILE_NAME   [[[NSString stringWithFormat:@"%s", __FILE__] componentsSeparatedByString:@"/"] lastObject]

//开发环境下关闭log
#ifndef __OPTIMIZE__        // 开发环境下
#define NSLog(fmt, ...) {NSLog((@"%s [Line %d]\n[File: %@] " fmt), __PRETTY_FUNCTION__, __LINE__, FILE_NAME, ##__VA_ARGS__);}
#else                       // 生产环境下
#define NSLog(...) {}
#endif



#endif /* Prefix_h */
