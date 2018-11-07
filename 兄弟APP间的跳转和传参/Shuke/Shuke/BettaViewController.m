//
//  BettaViewController.m
//  Shuke
//
//  Created by BANYAN on 2018/11/7.
//  Copyright © 2018 BANYAN. All rights reserved.
//

#import "BettaViewController.h"

@interface BettaViewController ()

@end

@implementation BettaViewController

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
     self.navigationItem.title = [NSString stringWithFormat:@"Betta->name:%@,age:%ld", self.name, self.age];
}

#pragma mark - Event
#pragma mark - Notification
#pragma mark - Public Methods
#pragma mark - Private Methods
#pragma mark - Delegate
#pragma mark - Setter/Getter

@end
