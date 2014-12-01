//
//  AppDelegate.m
//  dropApp
//
//  Created by Mathieu Rolfo on 11/16/14.
//  Copyright (c) 2014 Drop. All rights reserved.
//

#import "AppDelegate.h"
#import <MMDrawerController/MMDrawerController.h>
#import <MMDrawerController/MMDrawerVisualState.h>
#import "LoginController.h"
#import "PlantController.h"
#import "User.h"
#import "Action.h"
#import "TaskDatabase.h"
#import "SideMenuController.h"
#import "UserDatabase.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

-(void)menuButtonClicked
{

    if ([self.drawer openSide] == MMDrawerSideLeft) {
        [self.drawer closeDrawerAnimated:YES completion:nil];
    } else if ([self.drawer openSide] == MMDrawerSideNone) {
        [self.drawer openDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
    }
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    UIWindow *window = [[UIWindow alloc] initWithFrame:screenBounds];
    
    LoginController *login = [[LoginController alloc] init];
    self.login = login;
    
    
    SideMenuController *sideMenu = [[SideMenuController alloc] init];
    self.drawer = [[MMDrawerController alloc] initWithCenterViewController:login leftDrawerViewController:sideMenu];
    
    [self.drawer setDrawerVisualStateBlock:[MMDrawerVisualState parallaxVisualStateBlockWithParallaxFactor:4.0]];
    [self.drawer setShouldStretchDrawer:NO];
    [self.drawer setShowsShadow:NO];
    self.drawer.maximumLeftDrawerWidth = [UIScreen mainScreen].bounds.size.width * 2.0 / 3;

    
    [window setRootViewController:self.drawer];
    [window makeKeyAndVisible];
    [self setWindow:window];

    TaskDatabase *database = [[TaskDatabase alloc] init];
    self.tasksDatabase = [database loadDatabase];
   
    self.userDatabase = [[UserDatabase alloc] init];
    
    return YES;
}

-(void)loadUserbase {
    
}


-(void)enableDrawerAccess
{
    self.drawer.openDrawerGestureModeMask = MMOpenDrawerGestureModeBezelPanningCenterView |
    MMOpenDrawerGestureModePanningNavigationBar;
    
    self.drawer.closeDrawerGestureModeMask = MMCloseDrawerGestureModeTapCenterView |
    MMCloseDrawerGestureModePanningDrawerView |
    MMCloseDrawerGestureModePanningCenterView |
    MMCloseDrawerGestureModeTapNavigationBar |
    MMCloseDrawerGestureModePanningNavigationBar;
    
}

-(void)disableDrawerAccess
{
    
    self.drawer.openDrawerGestureModeMask = 0;
    self.drawer.closeDrawerGestureModeMask = 0;
    
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    BOOL success = [self.userDatabase saveChanges];
    if (success) {
        NSLog(@"Saving success");
    } else {
        NSLog(@"Saving failure");
    }
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
