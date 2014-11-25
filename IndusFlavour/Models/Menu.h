//
//  Menu.h
//  MenuFresh
//
//  Created by Apple on 01/07/13.
//  Copyright (c) 2013 Weird Logics. All rights reserved.
//
#import "Model.h"
@interface Menu : Model

-(Menu *) initWithName: (NSString *)menuName andImageName: (NSString *)menuImageName andSections: (NSMutableArray *)menuSections;

@property (nonatomic, assign) NSInteger       identifier;
@property (nonatomic, assign) NSInteger       merchantId;
@property (nonatomic, retain) NSString        *merchantName;
@property (nonatomic, retain) NSString        *exportFormat;
@property (nonatomic, retain) NSString        *version;
@property (nonatomic, retain) NSMutableArray  *section;

@end
