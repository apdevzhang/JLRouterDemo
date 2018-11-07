//
//  ViewController.m
//  Betta
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
    
    self.navigationItem.title = @"点击空白页跳转至Shuke并赋值";
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    //  参数解释
    //  `Shuke`为将要跳转的scheme
    //  BettaViewController为APP`Shuke`里面的控制器
    //  name=Betta、age=16为传递过去的参数
    NSURL *url = [NSURL URLWithString:@"Shuke://BettaViewController?name=Betta&age=16"];
    
    if ([[UIApplication sharedApplication] canOpenURL:url]) {
        [UIApplication.sharedApplication openURL:url];
    } else {
        NSAssert(0 == 1, @"系统内需要安装Shuke");
    }
}

@end
