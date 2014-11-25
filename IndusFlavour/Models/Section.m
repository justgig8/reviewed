//
//  Section.m
//  MenuFresh
//
//  Created by Apple on 27/06/13.
//  Copyright (c) 2013 Weird Logics. All rights reserved.
//

#import "Section.h"

@implementation Section

//@synthesize category;
@synthesize identifier;

-(Section *) initWithName: (NSString *)sectionName andImageName: (NSString *)sectionImageName andCategories: (NSMutableArray *)sectionCategories{
    
    self = [super initWithName:sectionName andImageName:sectionImageName andList:sectionCategories];
    if (self) {
        
    }
    return self;
}

@end
