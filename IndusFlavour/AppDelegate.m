//
//  AppDelegate.m
//  IndusFlavour
//
//  Created by WL004 on 08/08/13.
//  Copyright (c) 2013 WL004. All rights reserved.
//

#import "AppDelegate.h"


#import "Initializer.h"
#import "TestFlight.h"
#import "CoverPage.h"

@interface AppDelegate(){
    
    UINavigationController *nc;
}



@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    
#define TESTING 1
#ifdef TESTING
    [TestFlight setDeviceIdentifier:[[[UIDevice currentDevice] identifierForVendor] UUIDString]];
#endif
    [TestFlight takeOff:@"a88187a6-0cbb-439b-ad4d-82444c837c22"];
    [Initializer setup];
    
    [MemoryData setup];
    
    if (![launchOptions objectForKey:UIApplicationLaunchOptionsURLKey]) {
        
    }
    
    UIViewController *viewController;
    
    viewController = [[CoverPage alloc] initWithNibName:@"CoverPage" bundle:nil];
    
    nc = [[UINavigationController alloc] initWithRootViewController:viewController];
    self.window.rootViewController = nc;
    nc.navigationBarHidden = YES;
    [self.window makeKeyAndVisible];
    return YES;
}


- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url {
    
    [nc popToRootViewControllerAnimated:NO];
    
    NSString *params = [NSString stringWithFormat:@"%@",url.absoluteString];
    NSLog(@"received:%@",params);
    
    NSArray *array = [[[params componentsSeparatedByString:@"//"] objectAtIndex:1] componentsSeparatedByString:@"&"];
    
    if ([array count] >= 2){
        NSString *table = [[[array objectAtIndex:1] componentsSeparatedByString:@"="] objectAtIndex:1];
        NSLog(@"table = %@", table);
        [MemoryData setTable:table];
    }
    if ([array count] >= 3){
        NSString *mobile = [[[array objectAtIndex:2] componentsSeparatedByString:@"="] objectAtIndex:1];
        NSLog(@"mobile = %@", mobile);
        [MemoryData setMobile:mobile];
    }
    [[NSNotificationCenter defaultCenter] postNotificationName:@"DATA RECEIVED" object:nil];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
