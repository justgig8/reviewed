//
//  Modifier.m
//  WowTasty
//
//  Created by Weird Logics4 on 5/6/13.
//  Copyright (c) 2013 Weird Logics. All rights reserved.
//

#import "Modifier.h"

@implementation Modifier

@synthesize type;
@synthesize max;
@synthesize min;
@synthesize name;
@synthesize options;
@synthesize selectionType;


-(NSString *)description {
    return [NSString stringWithFormat:@"Modifier: type : %@ || max : %@ || min : %@ || name : %@|| options : %@|| selectionType : %@",type,max,min,name,options,selectionType];
}
@end
