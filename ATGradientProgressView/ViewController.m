//
//  ViewController.m
//  ATGradientProgressView
//
//  Created by Jaym on 2017/11/13.
//  Copyright © 2017年 Auntec. All rights reserved.
//

#import "ViewController.h"
#import "ATGradientProgressView.h"

//hexcolor
#define RGB(r,g,b) [UIColor colorWithRed: r/255.0 green: g/255.0 blue: b/255.0 alpha:1];
#define HexColor(hexValue) [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16)) / 255.0 green:((float)((hexValue & 0xFF00) >> 8)) / 255.0 blue:((float)(hexValue & 0xFF)) / 255.0 alpha:1.0]

@interface ViewController ()
@property (weak, nonatomic) IBOutlet ATGradientProgressView *progressView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.progressView.colorArr = @[(id)HexColor(0xFDDF76).CGColor, (id)HexColor(0xFEBC19).CGColor];
    [self.progressView setProgress:0.3];

    ATGradientProgressView *progressView = [[ATGradientProgressView alloc] initWithFrame:CGRectMake(0, 0, 300, 20)];
    progressView.center = self.view.center;
    progressView.colorArr = @[(id)HexColor(0xFDDF76).CGColor, (id)HexColor(0xFEBC19).CGColor];
    progressView.progress = 0.85;
    [self.view addSubview:progressView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
