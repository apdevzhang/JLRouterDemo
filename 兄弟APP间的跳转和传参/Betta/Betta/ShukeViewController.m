//
//  ShukeViewController.m
//  Betta
//
//  Created by BANYAN on 2018/11/7.
//  Copyright © 2018 BANYAN. All rights reserved.
//

#import "ShukeViewController.h"

@interface ShukeViewController ()

@end

@implementation ShukeViewController

#pragma mark - Lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - UI
- (void)initUI {
    self.navigationItem.title = [NSString stringWithFormat:@"Shuke->name:%@,age:%ld", self.name, self.age];
}

#pragma mark - Event
#pragma mark - Notification
#pragma mark - Public Methods
#pragma mark - Private Methods
#pragma mark - Delegate
#pragma mark - Setter/Getter

@end
