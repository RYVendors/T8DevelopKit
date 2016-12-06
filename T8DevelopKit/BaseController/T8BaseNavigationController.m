//
//  DQBaseNavigationController.m
//  DaQuan
//
//  Created by yewei on 15/5/28.
//  Copyright (c) 2015年 Think. All rights reserved.
//

#import "T8BaseNavigationController.h"
#import "T8Defines.h"

@interface T8BaseNavigationController ()<UIGestureRecognizerDelegate,UINavigationControllerDelegate>

@end

@implementation T8BaseNavigationController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        NSDictionary *titleTextAttributes = @{NSFontAttributeName:[UIFont boldSystemFontOfSize:18.0f],NSForegroundColorAttributeName:MainContentColor};
        self.navigationBar.titleTextAttributes = titleTextAttributes;
        [self.navigationBar setBarTintColor:NavBarBgColor];
        self.navigationBar.tintColor = MainContentColor;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.interactivePopGestureRecognizer.delegate = self;
    
    
    __weak typeof(self) weakSelf = self;
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)])
    {
        self.interactivePopGestureRecognizer.delegate = weakSelf;
        self.delegate = weakSelf;
    }

    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Control Pop Gesture
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    if (self.viewControllers.count == 1)//关闭主界面的右滑返回
    {
        return NO;
    }else{
        return YES;
    }
}

#pragma mark - transparent navigation bar

- (void)transparentNavigationBar
{
    self.navigationBar.shadowImage = [UIImage new];
    [self.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
}

- (void)resetNavigationBar
{
    self.navigationBar.shadowImage = nil;
    [self.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
}

@end
