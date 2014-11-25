//
//  Section.h
//  MenuFresh
//
//  Created by Apple on 27/06/13.
//  Copyright (c) 2013 Weird Logics. All rights reserved.
//

#import "Model.h"
@interface Section : Model

@property(nonatomic,retain)NSString        *identifier;
//@property(nonatomic,retain)NSMutableArray *category;

-(Section *) initWithName: (NSString *)sectionName andImageName: (NSString *)sectionImageName andCategories: (NSMutableArray *)sectionCategories;


@end
