# CocoaRouter
	基于JLRoutes的单scheme路由,配置步骤如下:
- 配置scheme
- 注册scheme
- 跳转路由地址
- 打印路由信息

## 配置scheme
```
URL Types	
	  |_URL identifier 		   com.BANYAN.CocoaRouter
	  	 |_URL Schemes
	  	 	|_  Item 0		      CocoaRouter
```

## 注册scheme
*注册在info.plist配置的scheme*

```
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
```

## 跳转路由地址
*需要跳转的控制器名称和需要传递的参数*

```
[RouterManager.sharedInstance pushToViewController:@"RouterViewController?text=路由"];
```

## 打印路由信息
*将路由的信息显示在Xcode控制台上,DEBUG模式下默认开启*

```Xcode console
[JLRoutes]: Trying to route URL CocoaRouter://RouterViewController?text=%E8%B7%AF%E7%94%B1
[JLRoutes]: Successfully matched <JLRRouteDefinition 0x283db93b0> - /:controller (priority: 0)
[JLRoutes]: Match parameters are {
    JLRoutePattern = "/:controller";
    JLRouteScheme = CocoaRouter;
    JLRouteURL = "CocoaRouter://RouterViewController?text=%E8%B7%AF%E7%94%B1";
    controller = RouterViewController;
    text = "\U8def\U7531";
}
```