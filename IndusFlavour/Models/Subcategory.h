//
//  Subcategory.h
//  MenuFresh
//
//  Created by Apple on 27/06/13.
//  Copyright (c) 2013 Weird Logics. All rights reserved.
//
#import "Model.h"
@interface Subcategory : Model

@property(nonatomic,assign)NSString      *identifier;
@property(nonatomic,retain)NSMutableArray *item;



-(Subcategory *) initWithName: (NSString *)subcategoryName andImageName: (NSString *)subcategoryImageName andItems: (NSMutableArray *)subcategoryItems;


@end
