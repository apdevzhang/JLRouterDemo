// RouterManager.m
//
// Copyright (c) 2018 BANYAN
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "RouterManager.h"
#import <objc/runtime.h>

static NSString *const kViewControllerIdentifier = @"controller";

@implementation RouterManager

#pragma mark - Lifecycle
+ (RouterManager *)sharedInstance {
    static RouterManager *sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = RouterManager.new;
    });
    return sharedInstance;
}

- (instancetype)init {
    self = [super init];
    if (self) {
#ifdef DEBUG
    [self setVerboseLoggingEnabled:YES];
#endif
    }
    return self;
}

#pragma mark - Public Methods
- (void)registerScheme:(NSString *)scheme {
    _scheme = scheme;
#if __has_include(<JLRoutes/JLRoutes.h>)
    [[JLRoutes routesForScheme:scheme] addRoute:[NSString stringWithFormat:@"/:%@", kViewControllerIdentifier] handler:^BOOL(NSDictionary<NSString *,id> * _Nonnull parameters) {
        Class class = NSClassFromString(parameters[kViewControllerIdentifier]);
        UIViewController *nextViewController = class.new;
        [self parametersToViewController:nextViewController parameters:parameters];
        UIViewController *currentViewController = [self currentViewController];
        [currentViewController.navigationController pushViewController:nextViewController animated:YES];
        return YES;
    }];
#else
    NSCAssert(0 == 1, @"JLRoutes is required...");
#endif
}

- (void)pushToViewController:(NSString *)routeString {
    if (_scheme == nil) {
        NSCAssert(0 == 1, @"JLRoutes Scheme not set...");
        return;
    }
    
    NSCharacterSet *characterSet = [NSCharacterSet characterSetWithCharactersInString:@"`#%^{}\"[]|\\<> "].invertedSet;
    
    routeString = [routeString stringByAddingPercentEncodingWithAllowedCharacters:characterSet];
    
    NSString *urlString = [NSString stringWithFormat:@"%@://%@", _scheme,routeString];
    
    NSURL *url = [NSURL URLWithString:urlString];

    if (@available(iOS 10.0, *)) {
        [UIApplication.sharedApplication openURL:url options:@{} completionHandler:nil];
    } else {
        [UIApplication.sharedApplication openURL:url];
    }
}

- (void)setVerboseLoggingEnabled:(BOOL)enable {
    [JLRoutes setVerboseLoggingEnabled:enable];
}

#pragma mark - Private Methods
- (UIViewController *)currentViewController {
    UIViewController *viewController = UIApplication.sharedApplication.keyWindow.rootViewController;
    while (1) {
        if ([viewController isKindOfClass:[UITabBarController class]]) {
            viewController = ((UITabBarController *)viewController).selectedViewController;
        }
        if ([viewController isKindOfClass:[UINavigationController class]]) {
            viewController = ((UINavigationController *)viewController).visibleViewController;
        }
        if (viewController.presentedViewController) {
            viewController = viewController.presentedViewController;
        } else {
            break;
        }
    }
    return viewController;
}

- (void)parametersToViewController:(UIViewController *)viewController parameters:(NSDictionary *)parameters {
    unsigned int outCount = 0;
    objc_property_t *properties = class_copyPropertyList(viewController.class , &outCount);
    for (int i = 0; i < outCount; i++) {
        objc_property_t property = properties[i];
        NSString *key = [NSString stringWithUTF8String:property_getName(property)];
        NSString *param = parameters[key];
        if (param != nil) {
            [viewController setValue:param forKey:key];
        }
    }
}

@end
