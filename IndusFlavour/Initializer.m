//
//  Initializer.m
//  MenuFresh
//
//  Created by Apple on 08/07/13.
//  Copyright (c) 2013 Weird Logics. All rights reserved.
//

#import "Initializer.h"

#import "MenuHandler.h"
#import "Constants.h"

static NSString *serverHost;
static NSString *serverQAHost;
static NSString *merchantName;
static NSString *apiKey;

@implementation Initializer

+(void) setup{
    
    if (IS_DEFAULT_SETTINGS_MODE) {
        serverHost = @"10.0.0.248:7080/Indus";
//        serverHost = @"qa.appprix.com:7080/Indus";
        merchantName = @"Indus Flavour";
        apiKey = @"987462984";
        
    }else{
        
        [self registerDefaultsFromSettingsBundle];
        
        serverHost = [[NSUserDefaults standardUserDefaults] stringForKey:KEY_SERVER_HOST];
        merchantName = [[NSUserDefaults standardUserDefaults] stringForKey:KEY_MERCHANT_NAME];
        apiKey =    [[NSUserDefaults standardUserDefaults] stringForKey:KEY_APIKEY];
        
    }
    
    [MenuHandler setup];
}


+(void) registerDefaultsFromSettingsBundle{
    
    NSString *settingsBundle = [[NSBundle mainBundle] pathForResource:@"Settings" ofType:@"bundle"];
    if(!settingsBundle){
        NSLog(@"Could not find Settings.bundle");
        return;
    }
    
    NSDictionary *settings = [NSDictionary dictionaryWithContentsOfFile:[settingsBundle stringByAppendingPathComponent:@"Root.plist"]];
    
    NSArray *preferences = [settings objectForKey:@"PreferenceSpecifiers"];
    NSMutableDictionary *defaultsToRegister = [[NSMutableDictionary alloc] initWithCapacity:[preferences count]];
    for(NSDictionary *prefSpecification in preferences){
        NSString *key = [prefSpecification objectForKey:@"Key"];
        if(key){
            NSLog(@"key: %@ - value:%@", key, [prefSpecification objectForKey:@"DefaultValue"]);
            if ([prefSpecification objectForKey:@"DefaultValue"]) {
                [defaultsToRegister setObject:[prefSpecification objectForKey:@"DefaultValue"] forKey:key];
            }
        }
    }
    
    [[NSUserDefaults standardUserDefaults] registerDefaults:defaultsToRegister];
}


+(NSString *) serverQAHost{
    return serverQAHost;
}

+(NSString *) serverHost{
    return serverHost;
}

+(NSString *) merchantName{
    return merchantName;
}
+(NSString *) apiKey{
    return apiKey;
}


@end
