//
//  Address.m
//  WowTasty
//
//  Created by Weird Logics4 on 5/10/13.
//  Copyright (c) 2013 Weird Logics. All rights reserved.
//

#import "Address.h"

@implementation Address


@synthesize city;
@synthesize zip;
@synthesize state;
@synthesize addressLine;
@synthesize contactNumber,street,landmark;

-(NSString *)description {
    return [NSString stringWithFormat:@"city %@,zip %@, state %@,addressLine %@ ,contactNumber %@",city,zip,state,addressLine,contactNumber];
}

@end
