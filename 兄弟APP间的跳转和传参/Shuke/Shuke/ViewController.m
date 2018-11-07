//
//  ViewController.m
//  Shuke
//
//  Created by BANYAN on 2018/11/7.
//  Copyright © 2018 BANYAN. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"点击空白页跳转至Betta并赋值";
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSURL *url = [NSURL URLWithString:@"Betta://ShukeViewController?name=Shuke&age=16"];
    
    if ([[UIApplication sharedApplication] canOpenURL:url]) {
        [UIApplication.sharedApplication openURL:url];
    } else {
        NSAssert(0 == 1, @"系统内需要安装Betta");
    }
}

@end
