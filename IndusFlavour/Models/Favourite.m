//
//  Favourite.m
//  WowTasty
//
//  Created by weird logics on 17/05/13.
//  Copyright (c) 2013 Weird Logics. All rights reserved.
//

#import "Favourite.h"

@implementation Favourite

@synthesize customerId,
merchant,orders;

-(NSString *)description{
    return  [NSString stringWithFormat:@"customerId %@|item %@|name %@|merchant %@|favourite Orders %@",self.customerId,self.list, self.name,self.merchant,self.orders];
}
@end
