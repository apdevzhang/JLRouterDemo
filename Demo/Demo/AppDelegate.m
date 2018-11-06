//
//  AppDelegate.m
//  Demo
//
//  Created by BANYAN on 2018/11/6.
//  Copyright © 2018 BANYAN. All rights reserved.
//

#import "AppDelegate.h"
#import <CocoaRouter/RouterManager.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
    self.window.backgroundColor = UIColor.whiteColor;
    
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController: [NSClassFromString(@"ViewController") new]];
    
    self.window.rootViewController = navigationController;
    [self.window makeKeyAndVisible];
    
    [RouterManager.sharedInstance registerScheme:@"CocoaRouter"];       // 注册scheme
    
    return YES;
}

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options {
    return [JLRoutes routeURL:url];
}

@end
