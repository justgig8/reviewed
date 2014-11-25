//
//  Initializer.h
//  MenuFresh
//
//  Created by Apple on 08/07/13.
//  Copyright (c) 2013 Weird Logics. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Initializer : NSObject

+(void) setup;

+(NSString *) serverHost;
+(NSString *) merchantName;
+(NSString *) apiKey;

@end
