//
//  HTTPResponseErrors.h
//  WowTasty
//
//  Created by weird logics on 20/07/13.
//  Copyright (c) 2013 Weird Logics. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetworkMessanger : NSObject

//Create a client side error for any server side respnse code
+(NSError *)errorForResponseCode:(NSUInteger)code;
+(NSString *)errorMessageResponseCode:(NSUInteger)code;

//create random error for error name and user descriotion.
+(NSError *)errorWithName:(NSString *)name andDescription:(NSString *)descText;
//check whether the network connection is found or not 
+(BOOL)isNetworkConnectionFound;
// Function used to check the network connectivity
+(BOOL)isConnectedToWeb;






extern NSString *kNoNetworkFound;

@end
