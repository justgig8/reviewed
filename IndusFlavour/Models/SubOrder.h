//
//  SubOrder.h
//  WowTasty
//
//  Created by weird logics on 16/05/13.
//  Copyright (c) 2013 Weird Logics. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Model.h"

@interface SubOrder : NSObject

@property(nonatomic,strong)NSString *date;
@property(nonatomic,strong)NSString *tableNumber;
@property(nonatomic,strong)NSString *time;
@property(nonatomic,strong)NSString *deviceUid;
@property(nonatomic,strong)NSMutableArray *item;


@end
