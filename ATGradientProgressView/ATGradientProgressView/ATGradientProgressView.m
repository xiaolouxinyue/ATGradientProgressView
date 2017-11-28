//
//  ATGradientProgressView.m
//  ATGradientProgressView
//
//  Created by Jaym on 2017/11/13.
//  Copyright © 2017年 Auntec. All rights reserved.
//

#import "ATGradientProgressView.h"

//hexcolor
#define RGB(r,g,b) [UIColor colorWithRed: r/255.0 green: g/255.0 blue: b/255.0 alpha:1];
#define HexColor(hexValue) [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16)) / 255.0 green:((float)((hexValue & 0xFF00) >> 8)) / 255.0 blue:((float)(hexValue & 0xFF)) / 255.0 alpha:1.0]

@interface ATGradientProgressView (){
    UIColor *_bgProgressColor;
    NSArray *_colorArr;
    CGFloat _progress;
}

@property (nonatomic, strong) CALayer *bgLayer;
@property (nonatomic, strong) CAGradientLayer *gradientLayer;

@end

@implementation ATGradientProgressView

- (void)setProgress:(CGFloat)progress {
    if (progress < 0) {
        _progress = 0;
    }
    if (progress > 1) {
        _progress = 1;
    }
    _progress = progress;
    [self updateProgressView];
}

- (void)setColorArr:(NSArray *)colorArr {
    if (colorArr.count >= 2) {
        _colorArr = colorArr;
    }else {
        NSLog(@">>>>>颜色数组个数小于2，显示默认颜色");
    }
}

- (void)updateProgressView {
    self.gradientLayer.bounds = CGRectMake(0, 0, self.frame.size.width * self.progress, self.frame.size.height);
    self.gradientLayer.colors = self.colorArr;
}

#pragma mark - init

/*从Xib创建对象时调用*/
- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    
    self = [super initWithCoder:aDecoder];
    if(self) {
        [self commonInit];
    }
    return self;
}

/*从代码创建对象时调用*/
- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if(self) {
        [self commonInit];
    }
    return self;
}

- (void)commonInit{
    _colorArr = @[(id)HexColor(0xFDDF76).CGColor, (id)HexColor(0xFEBC19).CGColor];
    _progress = 0.65;
    _bgProgressColor = HexColor(0xf2f2f2);
}

-(void)drawRect:(CGRect)rect{

    if (!_bgLayer) {
        _bgLayer = [CALayer layer];
        //一般不用frame，因为不支持隐式动画
        _bgLayer.bounds = CGRectMake(0, 0, rect.size.width, rect.size.height);
        _bgLayer.anchorPoint = CGPointMake(0, 0);
        _bgLayer.backgroundColor = self.bgProgressColor.CGColor;
//        _bgLayer.cornerRadius = rect.size.height / 2.;
        [self.layer addSublayer:_bgLayer];
    }
    if (!_gradientLayer) {
        _gradientLayer = [CAGradientLayer layer];
        _gradientLayer.bounds = CGRectMake(0, 0, rect.size.width * self.progress, rect.size.height);
        _gradientLayer.startPoint = CGPointMake(0, 0);
        _gradientLayer.endPoint = CGPointMake(1, 0);
        _gradientLayer.anchorPoint = CGPointMake(0, 0);
        NSArray *colorArr = self.colorArr;
        _gradientLayer.colors = colorArr;
        _gradientLayer.cornerRadius = rect.size.height / 2.;
        [self.layer addSublayer:_gradientLayer];
    }
    self.layer.cornerRadius = rect.size.height / 2.;
    self.clipsToBounds = YES;
}


@end
