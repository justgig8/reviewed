//
//  Merchant.m
//  WowTasty
//
//  Created by Weird Logics4 on 5/3/13.
//  Copyright (c) 2013 Weird Logics. All rights reserved.
//

#import "Merchant.h"

@implementation Merchant

@synthesize identifier;
@synthesize name;
@synthesize merchantDescription;
@synthesize url;
@synthesize email;
@synthesize phone;
@synthesize state;
@synthesize city;
@synthesize addressLine;
@synthesize zip;

-(NSString *)description{
    
	return [NSString stringWithFormat:@"name=%@|description=%@|url=%@|email=%@|phone=%@|state=%@|city=%@|addressline=%@|zip=%@",self.name,self.merchantDescription,self.url,self.email,self.phone,self.state,self.city,self.addressLine,self.zip];
}


@end
