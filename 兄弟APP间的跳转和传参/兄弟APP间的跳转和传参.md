# 兄弟APP间的跳转和传参

以兄弟APP`Betta`和`Shuke`做测试,步骤如下:

- 配置scheme
- 添加白名单
- 注册路由
- 跨APP跳转、传参

## 配置scheme
`Betta`配置URL Type并添加URL Schemes为`Betta`作为标识符

`Shuke`配置URL Type并添加URL Schemes为`Shuke`作为标识符

## 添加白名单
`Betta`配置LSApplicationQueriesSchemes,添加兄弟APP`Shuke`的scheme`Shuke`为白名单

`Shuke`配置LSApplicationQueriesSchemes,添加兄弟APP`Betta`的scheme`Betta`为白名单

## 注册路由
两个APP互相以自己的scheme进行路由注册,这一步不再详解

## 跨APP跳转、传参
以`Betta`跳转`Shuke`为例

```
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
```
详情见Demo,路由注册和配置因外面的README文件已说明过，这里不再进行重复说明。