//
//  UserProfile.m
//  SwapBBM
//
//  Created by Apple on 10/07/13.
//  Copyright (c) 2013 Weird Logics. All rights reserved.
//

#import "UserProfile.h"

@implementation UserProfile


-(UserProfile *) initWithName: (NSString *)uname{
    
    self = [super init];
    if (self) {
        self.name = uname;
    }
    
    return self;
}

@end
