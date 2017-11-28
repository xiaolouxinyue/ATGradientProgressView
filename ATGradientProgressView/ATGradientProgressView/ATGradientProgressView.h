//
//  ATGradientProgressView.h
//  ATGradientProgressView
//
//  Created by Jaym on 2017/11/13.
//  Copyright © 2017年 Auntec. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ATGradientProgressView : UIView

/**
 *  进度 默认是0.65
 */
@property (nonatomic, assign) CGFloat progress;

/**
 *  进度条渐变颜色数组，颜色个数>=2 
 *  默认是 @[(id)HexColor(0xFDDF76).CGColor, (id)HexColor(0xFEBC19).CGColor];
 */
@property (nonatomic, strong) NSArray *colorArr;

/**
 *  进度条背景颜色  默认是 HexColor(0xf2f2f2)
 */
@property (nonatomic, strong) UIColor *bgProgressColor;

/**
 *  设置progress时自动更新UI，设置渐变色、背景不更新UI。如需更新，可手动调用此方法
 */
- (void)updateProgressView;

@end
