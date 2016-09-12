//
//  SupportedInterfaceOrientations.h
//  Test
//
//  Created by BoBo on 16/9/12.
//  Copyright © 2016年 JR_Dun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface SupportedInterfaceOrientations : NSObject

+ (SupportedInterfaceOrientations *)sharedInstance;

@property (assign, nonatomic) UIInterfaceOrientationMask orientationMask;

@end
