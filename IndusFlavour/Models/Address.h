//
//  Address.h
//  WowTasty
//
//  Created by Weird Logics4 on 5/10/13.
//  Copyright (c) 2013 Weird Logics. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Model.h"
@interface Address : Model

@property(nonatomic,retain) NSString *city;
@property(nonatomic,retain) NSString *zip;
@property(nonatomic,retain) NSString *state;
@property(nonatomic,retain) NSString *addressLine;
@property(nonatomic,retain) NSString *contactNumber;
@property(nonatomic,retain) NSString *street;
@property(nonatomic,retain) NSString *landmark;
@end
