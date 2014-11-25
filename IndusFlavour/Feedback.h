//
//  Feedback.h
//  PianoMan
//
//  Created by weird logics on 28/05/13.
//  Copyright (c) 2013 Weird Logics. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "UserProfile.h"

@interface Feedback : NSObject

@property(nonatomic,strong)NSString *category;
@property(nonatomic,strong)NSString *merchant;
@property(nonatomic,strong)NSString *name;

@property(nonatomic,strong)NSString *registerMe;
@property(nonatomic,strong)NSString *subscribe;

@property(nonatomic,strong)NSMutableArray *response;
@property(nonatomic,strong)UserProfile *customer;
@property(nonatomic,strong)NSMutableArray *review;
@end
