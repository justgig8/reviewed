//
//  ConstantsBank.m
//  TheBeerCafe
//
//  Created by Weird Minds on 18/06/12.
//  Copyright (c) 2012 minds.weird@gmail.com. All rights reserved.
//

#import "ConstantsBank.h"

#import "Initializer.h"

@implementation ConstantsBank

static NSMutableDictionary *props;
static NSMutableArray *ads;
static NSTimer *timer;
static bool isAdAlreadyLoaded=false;

const static float startUpScreenDelay = 0.0;


NSString *kMERCHANTNAME = @"The Piano Man";

/*
Add other Initail details -------- 
*/
+(void) initialize{
    
    [super initialize];
    
   // [[self self] setDeviceType];
    props = [[NSMutableDictionary alloc] init];
    
    [props setObject:@"true" forKey:@"advertisements"];
    
    if ([[props valueForKey:@"advertisements"] boolValue] == true) {
        [props setObject:@"144" forKey:@"adBannerHeight"];
        [props setObject:@"10" forKey:@"adTime"];
    }else{
        [props setObject:@"0" forKey:@"adBannerHeight"];
        [props setObject:@"0" forKey:@"adTime"];
    }
    
    [props setObject:@"180" forKey:@"goBackTime"];
    
    ads = [[NSMutableArray alloc] init];
    for (int i=1; i<=2; i++) {
        NSString *name = [NSString stringWithFormat:@"ad%d", i];
        [ads addObject:name];
    }
}


+(float)startUpScreenDelay{
    return startUpScreenDelay;
}

//+(void)setDeviceType{
//
//    if([[UIDevice currentDevice]userInterfaceIdiom]==UIUserInterfaceIdiomPhone)
//    {
//         if ([[UIScreen mainScreen] bounds].size.height == 568) {
//               deviceType =  DEVICETYPEIPHONE5 ;  //iphone 5
//           }
//         else { //iphone 3.5 inch screen iphone 3g,4s
//            deviceType =  DEVICETYPEIPHONE4;
//         }
//    }
//    else {   //[ipad]
//        deviceType =  DEVICETYPEIPAD;
//    }
//}
//
//
//+(BOOL)isIPhoneFive{
//    if (deviceType == DEVICETYPEIPHONE5) {
//        return YES;
//    }
//    return NO;
//}
//
//
//+(BOOL)isIPad{
//    if (deviceType == DEVICETYPEIPHONE5) {
//        return YES;
//    }
//    return NO;
//}

+(NSString *) valueForProp: (NSString *)key{
    return [props objectForKey:key];
}


+(NSMutableArray *) ads{
    return ads;
}

+(NSTimer *)timer{
    return timer;
}
+(void) setTimer: (NSTimer *)x{
    timer=x;
}

+(bool) isAdAlreadyLoaded{
    return isAdAlreadyLoaded;
}
+(void) setIsAdAlreadyLoaded: (bool) x{
    isAdAlreadyLoaded=x;
}

@end
