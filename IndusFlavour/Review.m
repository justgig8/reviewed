//
//  Review.m
//  WowTasty
//
//  Created by Weird Logics4 on 5/13/13.
//  Copyright (c) 2013 Weird Logics. All rights reserved.
//

#import "Review.h"

@implementation Review

@synthesize comment;
@synthesize entity;
@synthesize userId;
@synthesize rating;
@synthesize type;

-(NSString *)description {
    return [NSString stringWithFormat:@"comment %@, entity %@ ,  userId %@,  rating %@ type %@",comment, entity,  userId, rating,type ];
}


@end
