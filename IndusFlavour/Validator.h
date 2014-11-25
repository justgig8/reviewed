//
//  Validator.h
//  SwapBBM
//
//  Created by Gaurav on 15/07/13.
//  Copyright (c) 2013 Weird Logics. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Validator : NSObject


+(int) validateMobile: (NSString *)mobile;
+(int) validateUsername: (NSString *)username;
+(int) validatePassword: (NSString *)password;
+(int) validateEmail: (NSString *)email;
+(int) validateBBM: (NSString *)bbmpin;


+(NSString *)messageForCode: (int)code;


@end
