//
//  ViewController.m
//  iOSRotationScreen
//
//  Created by BoBo on 16/9/12.
//  Copyright © 2016年 JR_Dun. All rights reserved.
//

#import "ViewController.h"
#import "SupportedInterfaceOrientations.h"

@interface ViewController ()

@property (nonatomic,strong) UIButton *buttonPortrait;
@property (nonatomic,strong) UIButton *buttonLandscape;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self initUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - initUI
- (void)initUI
{
    _buttonPortrait = [UIButton new];
    [_buttonPortrait setTitle:@"竖 屏" forState:UIControlStateNormal];
    [_buttonPortrait setBackgroundColor:[UIColor colorWithRed:0.0 green:0.502 blue:1.0 alpha:1.0]];
    [_buttonPortrait addTarget:self action:@selector(rotationPortrait) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_buttonPortrait];
    
    _buttonLandscape = [UIButton new];
    [_buttonLandscape setTitle:@"横 屏" forState:UIControlStateNormal];
    [_buttonLandscape setBackgroundColor:[UIColor colorWithRed:0.0 green:0.502 blue:1.0 alpha:1.0]];
    [_buttonLandscape addTarget:self action:@selector(rotationLandscape) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_buttonLandscape];
    
    _buttonPortrait.translatesAutoresizingMaskIntoConstraints = NO;
    _buttonLandscape.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSDictionary *views = NSDictionaryOfVariableBindings(_buttonPortrait,_buttonLandscape);
    NSDictionary *metrics = @{};
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"[_buttonPortrait(100)]" options:0 metrics:metrics views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"[_buttonLandscape(100)]" options:0 metrics:metrics views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-100-[_buttonPortrait(50)]-10-[_buttonLandscape(50)]" options:0 metrics:metrics views:views]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_buttonPortrait attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_buttonLandscape attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]];
}


#pragma mark - 竖屏
- (void)rotationPortrait
{
    [SupportedInterfaceOrientations sharedInstance].orientationMask = UIInterfaceOrientationMaskPortrait;
    
    NSNumber *orientationValue = [NSNumber numberWithInt:UIInterfaceOrientationPortrait];
    [[UIDevice currentDevice] setValue:orientationValue forKey:@"orientation"];
}

#pragma mark - 横屏
- (void)rotationLandscape
{
    [SupportedInterfaceOrientations sharedInstance].orientationMask = UIInterfaceOrientationMaskLandscape;
    
    NSNumber *orientationValue = [NSNumber numberWithInt:UIInterfaceOrientationLandscapeRight];
    [[UIDevice currentDevice] setValue:orientationValue forKey:@"orientation"];
}

@end
