//
//  NetworkResponse.m
//  KittySu
//
//  Created by weird logics on 17/04/13.
//  Copyright (c) 2013 weird logics. All rights reserved.
//

#import "NetworkResponse.h"

@implementation NetworkResponse


@synthesize statusCode, statusMsg;
@synthesize isSuccessful;
@synthesize response;
@synthesize responseObject;
@synthesize error;

-(NetworkResponse *) init{
    
    self = [super init];
    if (self) {
        self.isSuccessful=NO;
        self.statusCode = 0;
    }
    
    return self;
}

-(NSString *) description{
    
    return [NSString stringWithFormat:@"%@\nstatus code: %d\nstatus message: %@\nresponse: %@", [super description], statusCode, statusMsg, response];
}


@end
