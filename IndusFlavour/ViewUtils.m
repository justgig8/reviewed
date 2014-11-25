//
//  ViewUtils.m
//  MenuFresh
//
//  Created by Apple on 27/06/13.
//  Copyright (c) 2013 Weird Logics. All rights reserved.
//

#import "ViewUtils.h"
#import "AppDelegate.h"
@implementation ViewUtils


+(void) forwardFrom: (UIViewController *)x to: (UIViewController *)y{
    //logTrace(@"moving forward");
//    [x.navigationController pushViewController:y animated:YES];

    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    UIWindow *window = appDelegate.window;
    UINavigationController *nc = (UINavigationController *) window.rootViewController;
    [nc pushViewController:y animated:YES];
}

+(void) goBackFrom: (UIViewController *)x{
   // logTrace(@"going back");
    [x.navigationController popViewControllerAnimated:YES];
}

@end
