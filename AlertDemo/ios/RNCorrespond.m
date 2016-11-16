//
//  RNCorrespond.m
//  AlertDemo
//
//  Created by aiDove on 2016/11/16.
//  Copyright © 2016年 Facebook. All rights reserved.
//

#import "RNCorrespond.h"
#import <UIKit/UIKit.h>

@interface RNCorrespond ()

@property (nonatomic, strong) UIWindow *myWindow;

@end

@implementation RNCorrespond
RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(createNativeWindow) {
  dispatch_async(dispatch_get_main_queue(), ^{
    _myWindow = [UIWindow new];
    _myWindow.windowLevel = [UIApplication sharedApplication].keyWindow.windowLevel + 1;
    
    UIViewController *vc = [UIViewController new];
    vc.view.backgroundColor = [UIColor whiteColor];
    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeSystem];
    [btn setTitle:@"Hide Window" forState:UIControlStateNormal];
    btn.frame = CGRectMake(140, 200, 100, 100);
    [btn addTarget:self action:@selector(onButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [vc.view addSubview:btn];
    
    _myWindow.rootViewController = vc;
    [_myWindow makeKeyAndVisible];
  });
}

RCT_EXPORT_METHOD(openNativeWindow) {
  dispatch_async(dispatch_get_main_queue(), ^{
    [UIView animateWithDuration:0.3 animations:^{
      _myWindow.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {}];
  });
  
}

- (void) onButtonClick {
  dispatch_async(dispatch_get_main_queue(), ^{
    [UIView animateWithDuration:0.3 animations:^{
      _myWindow.transform = CGAffineTransformMakeTranslation(0, _myWindow.bounds.size.height);
    } completion:^(BOOL finished) {}];
  });
}

@end
