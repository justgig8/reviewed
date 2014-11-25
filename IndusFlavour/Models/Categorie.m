//
//  Category.m
//  MenuFresh
//
//  Created by Apple on 27/06/13.
//  Copyright (c) 2013 Weird Logics. All rights reserved.
//

#import "Categorie.h"

@implementation Categorie

@synthesize subCategory;
@synthesize catDescription;
@synthesize identifier;

-(Categorie *) initWithName: (NSString *)categoryName andImageName: (NSString *)categoryImageName andSubcategories: (NSMutableArray *)categorySubcategories{
    
    self = [super initWithName:categoryName andImageName:categoryImageName andList:categorySubcategories];
    if (self) {
        
    }
    return self;
}

@end