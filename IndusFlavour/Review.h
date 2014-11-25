//
//  Review.h
//  WowTasty
//
//  Created by Weird Logics4 on 5/13/13.
//  Copyright (c) 2013 Weird Logics. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Review : NSObject

@property(nonatomic,strong)NSString *type;
@property(nonatomic,strong)NSString *comment;
@property(nonatomic,strong)NSString *entity;
@property(nonatomic,strong)NSString *userId;
@property(nonatomic,strong)NSString *rating;

@end
