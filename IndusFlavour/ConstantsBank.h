//
//  ConstantsBank.h
//  TheBeerCafe
//
//  Created by Weird Minds on 18/06/12.
//  Copyright (c) 2012 minds.weird@gmail.com. All rights reserved.
//


@interface ConstantsBank : NSObject

//Merchant Name------
extern NSString *kMERCHANTNAME;

//** Initlization methods----
//+(BOOL)isIPhoneFive;
+(float)startUpScreenDelay;
+(NSString *) valueForProp: (NSString *)key;
+(NSMutableArray *) ads;
+(NSTimer *)timer;
+(void) setTimer: (NSTimer *)x;
+(bool) isAdAlreadyLoaded;
+(void) setIsAdAlreadyLoaded: (bool) x;




@end
