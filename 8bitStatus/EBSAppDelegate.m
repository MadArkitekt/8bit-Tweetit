//
//  EBSAppDelegate.m
//  8bitStatus
//
//  Created by MadArkitekt on 5/20/14.
//  Copyright (c) 2014 Ed Salter. All rights reserved.
//

#import "EBSAppDelegate.h"
#import "EBSColorVC.h"
@implementation EBSAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:[[EBSColorVC alloc] init]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
