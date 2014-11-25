//
//  HTTPResponseErrors.m
//  WowTasty
//
//  Created by weird logics on 20/07/13.
//  Copyright (c) 2013 Weird Logics. All rights reserved.
//

#import "NetworkMessanger.h"
#import <SystemConfiguration/SystemConfiguration.h>
#include <netdb.h>


NSString *kNoNetworkFound = @"NoNetworkFound";

@implementation NetworkMessanger

//Create a client side error for any server side respnse code --
+(NSString *)errorMessageResponseCode:(NSUInteger)code{
    
    NSString *errorCode = [NSString stringWithFormat:@"%d",code];
    NSString *errorMessage = NSLocalizedString(errorCode,nil);
    return errorMessage;
}

//Create a client side error for any server side respnse code --
+(NSError *)errorForResponseCode:(NSUInteger)code{
    
    NSError *error =nil;
    NSString *errorCode = [NSString stringWithFormat:@"%d",code];
    NSString *errorMessage = NSLocalizedString(errorCode,nil);
    NSDictionary *dictionary = [self userInfoWithDiscription:errorMessage recoveryOption:@""];
    error = [[NSError alloc] initWithDomain:@"HTTPResponse" code:code userInfo:dictionary];
    return error;
}


//Create a client side error for any server side respnse code --
+(NSError *)errorWithName:(NSString *)name andDescription:(NSString *)descText{
    
    NSError *error =nil;
    NSString *errorMessage = NSLocalizedString(descText,nil);
    NSDictionary *dictionary = [self userInfoWithDiscription:errorMessage recoveryOption:@""];
    error = [[NSError alloc] initWithDomain:name code:0 userInfo:dictionary];
    return error;
}



//check whether there is any network connection or not
+(BOOL) isNetworkConnectionFound
{
    BOOL isNetworkFound = NO;

    // Create zero address
    struct sockaddr_in zeroAddress;
    bzero(&zeroAddress, sizeof(zeroAddress));
    zeroAddress.sin_len = sizeof(zeroAddress);
    zeroAddress.sin_family = AF_INET;
    
    // Recover reachability flags
    SCNetworkReachabilityRef defaultRouteReachability = SCNetworkReachabilityCreateWithAddress(NULL, (struct sockaddr *)&zeroAddress);
    SCNetworkReachabilityFlags flags;
    
	//check the reachibility of network
    BOOL didRetrieveFlags = SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags);
    CFRelease(defaultRouteReachability);
    
    if (didRetrieveFlags)
    {
        BOOL isReachable = ((flags & kSCNetworkFlagsReachable) != 0);
        BOOL needsConnection = ((flags & kSCNetworkFlagsConnectionRequired) != 0);
        //return whether network connection is available or not
        isNetworkFound = (isReachable && !needsConnection) ? YES :NO;
  }else {
      NSLog(@"Error. Could not recover network reachability flags\n");
  }
 	return isNetworkFound;
}


// Function used to check the network connectivity
+(BOOL)isConnectedToWeb{
	BOOL connected;
	const char *host = "www.apple.com";
    // Recover reachability flags
	SCNetworkReachabilityRef reachability = SCNetworkReachabilityCreateWithName(NULL, host);
	SCNetworkReachabilityFlags flags;
	//check the reachibility of network
	connected = SCNetworkReachabilityGetFlags(reachability, &flags);
	BOOL isConnected = connected && (flags & kSCNetworkFlagsReachable) && !(flags & kSCNetworkFlagsConnectionRequired);
	CFRelease(reachability);
    
  	//return whether network connection is available or not
	return isConnected;
}


//Only display an alert --
+(void)userAlertIfNoNetwork {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"INTERNET_FAILED",nil)
                                                    message:NSLocalizedString(@"INTERNET_FAILED_MESSAGE",nil)
                                                   delegate:nil
                                          cancelButtonTitle:NSLocalizedString(@"DISMISS",nil)
                                          otherButtonTitles:nil];
    [alert show];
}


//Creating errors user info----
+(NSDictionary *)userInfoWithDiscription:(NSString *)descriptionKey recoveryOption:(NSString *)recoveryOption{
    
    NSMutableDictionary *dictionary = [[NSMutableDictionary  alloc] init];
    
    if (descriptionKey) {
        [dictionary setObject:descriptionKey forKey:NSLocalizedDescriptionKey];
    }
   
    if (recoveryOption) {
        [dictionary setObject:recoveryOption forKey:NSLocalizedRecoverySuggestionErrorKey];
    }
    return dictionary;
}

@end
