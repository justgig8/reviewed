//
//  Category.h
//  MenuFresh
//
//  Created by Apple on 27/06/13.
//  Copyright (c) 2013 Weird Logics. All rights reserved.
//
#import "Model.h"
@interface Categorie : Model



-(Categorie *) initWithName: (NSString *)categoryName andImageName: (NSString *)categoryImageName andSubcategories: (NSMutableArray *)categorySubcategories;

@property(nonatomic,retain)NSString       *identifier;
@property(nonatomic,retain)NSString       *catDescription;
@property(nonatomic,retain)NSMutableArray *subCategory;
@end
