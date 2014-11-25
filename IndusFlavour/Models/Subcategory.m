//
//  Subcategory.m
//  MenuFresh
//
//  Created by Apple on 27/06/13.
//  Copyright (c) 2013 Weird Logics. All rights reserved.
//

#import "Subcategory.h"

@implementation Subcategory
@synthesize item;
@synthesize identifier;

-(Subcategory *) initWithName: (NSString *)subcategoryName andImageName: (NSString *)subcategoryImageName andItems: (NSMutableArray *)subcategoryItems{
    
    self = [super initWithName:subcategoryName andImageName:subcategoryImageName andList:subcategoryItems];
    if (self) {
        
    }
    return self;
}


@end
