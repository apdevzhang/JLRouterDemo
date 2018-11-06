//
//  ViewController.m
//  Demo
//
//  Created by BANYAN on 2018/11/6.
//  Copyright © 2018 BANYAN. All rights reserved.
//

#import "ViewController.h"
#import <CocoaRouter/RouterManager.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [RouterManager.sharedInstance pushToViewController:@"RouterViewController?text=路由"];        // 跳转到控制器RouterViewController并赋值
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
