//
//  ViewUtils.h
//  MenuFresh
//
//  Created by Apple on 27/06/13.
//  Copyright (c) 2013 Weird Logics. All rights reserved.
//

#import <Foundation/Foundation.h>

//#define forwardFrom(x)To(y) [ViewUtils forwardFrom: (UIViewController *)x to: (UIViewController *)y]
#define goBackFrom(x) [ViewUtils goBackFrom: (UIViewController *)x]

@interface ViewUtils : NSObject


+(void) forwardFrom: (UIViewController *)x to: (UIViewController *)y;
+(void) goBackFrom: (UIViewController *)x;


@end
