//
//  OrderItem.h
//  WowTasty
//
//  Created by Weird Logics4 on 5/10/13.
//  Copyright (c) 2013 Weird Logics. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OrderItem : NSObject

@property(nonatomic,retain)NSString *identifier;
@property(nonatomic,retain)NSString *orderSequence;
@property(nonatomic,retain)NSString *menuItemId;
@property(nonatomic,retain)NSString *name;
@property(nonatomic,retain)NSString *quantity;
@property(nonatomic,retain)NSString *status;
@property(nonatomic,retain)NSString *price;
@property(nonatomic,retain)NSString *categoryName;
@end
