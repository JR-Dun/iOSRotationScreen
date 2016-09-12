//
//  SupportedInterfaceOrientations.m
//  Test
//
//  Created by BoBo on 16/9/12.
//  Copyright © 2016年 JR_Dun. All rights reserved.
//

#import "SupportedInterfaceOrientations.h"

@implementation SupportedInterfaceOrientations

+ (SupportedInterfaceOrientations *)sharedInstance {
    static SupportedInterfaceOrientations *instance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        instance = [[self alloc] init];
        instance.orientationMask = UIInterfaceOrientationMaskPortrait;  // 默认竖屏
    });
    return instance;
}

@end
