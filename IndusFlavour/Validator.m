//
//  Validator.m
//  SwapBBM
//
//  Created by Gaurav on 15/07/13.
//  Copyright (c) 2013 Weird Logics. All rights reserved.
//

#import "Validator.h"

@implementation Validator

+(NSString *)messageForCode: (int)code{
    
    NSLog(@"code: %d", code);
    
    NSString *result;
    switch (code) {
            
        case 0:
            result=@"Success.";
            break;
            
        case 50:
            result=@"Mobile no. is blank. Please check.";
            break;
        case 51:
            result=@"Mobile no. must contain 10 digits. Please check.";
            break;
        case 52:
            result=@"Mobile no. contains space(s). Please check.";
            break;
        case 53:
            result=@"Mobile no. contains invalid characters. Please check.";
            break;
            
        case 100:
            result=@"Username is blank. Please check.";
            break;
        case 101:
            result=@"Username contains space(s). Please check.";
            break;
        case 102:
            result=@"Username contains invalid characters. Please check.";
            break;
            
        case 200:
            result=@"Password is blank. Please check.";
            break;
            
        case 300:
            result=@"Email address is blank. Please check.";
            break;
        case 301:
            result=@"Email address contains space(s). Please check.";
            break;
        case 302:
            result=@"Email address is invalid. Please check.";
            break;
        case 303:
            result=@"Email address is invalid. Please check.";
            break;
        case 304:
            result=@"Email address is invalid. Please check.";
            break;
            
        case 400:
            result=@"BBM pin is blank. Please check.";
            break;
        case 401:
            result=@"BBM pin contains space(s). Please check.";
            break;
        case 402:
            result=@"BBM pin is invalid. Please check.";
            break;
        default:
            break;
    }
    
    return result;
}

+(int) validateMobile: (NSString *)mobile{
    
    if (!mobile || mobile.length==0) {
        return 50;
    }
    
    if (mobile.length!=10) {
        return 51;
    }
    
    if ([mobile rangeOfString:@" "].location != NSNotFound) {
        return 52;
    }
    
    NSCharacterSet * set = [[NSCharacterSet characterSetWithCharactersInString:@"9876543210"] invertedSet];
    if ([mobile rangeOfCharacterFromSet:set].location != NSNotFound) {
        return 53;
    }
    
    return 0;
}

+(int) validateUsername: (NSString *)username{
    
    if (!username || username.length==0) {
        return 100;
    }
    
    if ([username rangeOfString:@" "].location != NSNotFound) {
        return 101;
    }
    
    NSCharacterSet *set = [NSCharacterSet characterSetWithCharactersInString:@"~!@#$%^&*()_+-="];
    if ([username rangeOfCharacterFromSet:set].location != NSNotFound) {
        return 102;
    }
    
    return 0;
}

+(int) validatePassword: (NSString *)password{
    
    if (!password || password.length==0) {
        return 200;
    }
    
    return 0;
}

+(int) validateBBM: (NSString *)bbmpin{
    
    if (!bbmpin || bbmpin.length==0) {
        return 400;
    }
    
    if ([bbmpin rangeOfString:@" "].location != NSNotFound) {
        return 402;
    }
    
    NSCharacterSet * set = [[NSCharacterSet characterSetWithCharactersInString:@"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLKMNOPQRSTUVWXYZ0123456789"] invertedSet];
    if ([bbmpin rangeOfCharacterFromSet:set].location != NSNotFound) {
        return 401;
    }
    
    
    return 0;
}

+(int) validateEmail: (NSString *)email{
    
    if (!email || email.length==0) {
        return 300;
    }
    
    if ([email rangeOfString:@" "].location != NSNotFound) {
        return 301;
    }
    
    if ([email rangeOfString:@"@"].location == NSNotFound) {
        return 302;
        
    }
    
    NSArray *array = [email componentsSeparatedByString:@"@"];
    if ([array[1] rangeOfString:@"."].location == NSNotFound) {
        return 303;
    }
    
    NSArray *ar = [array[1] componentsSeparatedByString:@"."];
    if ([ar[0] length]==0 || [ar[1] length]==0) {
        return 304;
    }
    
    return [self validateUsername: array[0]];
}


@end
