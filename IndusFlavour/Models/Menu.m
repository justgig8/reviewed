//
//  Menu.m
//  MenuFresh
//
//  Created by Apple on 01/07/13.
//  Copyright (c) 2013 Weird Logics. All rights reserved.
//

#import "Menu.h"

@implementation Menu
@synthesize exportFormat,merchantId,section,merchantName,version,identifier;

-(Menu *) initWithName: (NSString *)menuName andImageName: (NSString *)menuImageName andSections: (NSMutableArray *)menuSections{
    
    self = [super initWithName:menuName andImageName:menuImageName andList:menuSections];
    if (self) {
        
    }
    return self;
}


@end
