//
//  Favourite.h
//  WowTasty
//
//  Created by weird logics on 17/05/13.
//  Copyright (c) 2013 Weird Logics. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Model.h"
@interface Favourite : Model
@property(nonatomic,strong)NSString *customerId;
@property(nonatomic,strong)NSString *merchant;
@property(nonatomic,strong)NSMutableArray *orders;
@end
