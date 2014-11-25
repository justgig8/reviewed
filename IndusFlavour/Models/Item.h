//
//  Item.h
//  MenuFresh
//
//  Created by Apple on 27/06/13.
//  Copyright (c) 2013 Weird Logics. All rights reserved.
//

#import "Model.h"
@interface Item : Model


@property (nonatomic, retain) NSString      *price;
@property (nonatomic, retain) NSString      *summary;
@property (nonatomic,retain)NSString        *identifier;
@property (nonatomic, retain)NSString       *type;


-(Item *) initWithName: (NSString *)itemName andImageName: (NSString *)itemImageName andPrice: (NSString *)itemPrice andSummary: (NSString *)itemSummary;


-(NSString*)description;
@end