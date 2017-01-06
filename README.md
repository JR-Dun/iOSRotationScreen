# iOSRotationScreen
屏幕旋转、横竖屏切换


## AppDelegate 
```
- (UIInterfaceOrientationMask)application:(UIApplication *)application
  supportedInterfaceOrientationsForWindow:(UIWindow *)window
{
    return [SupportedInterfaceOrientations sharedInstance].orientationMask;
}

```

## 使用例子 
```
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

```