//
//  Merchant.h
//  WowTasty
//
//  Created by Weird Logics4 on 5/3/13.
//  Copyright (c) 2013 Weird Logics. All rights reserved.
//


@interface Merchant :NSObject

@property (nonatomic, retain) NSString  *identifier;
@property (nonatomic, retain) NSString  *name;
@property (nonatomic, retain) NSString  *merchantDescription;
@property (nonatomic, retain) NSString  *url;
@property (nonatomic, retain) NSString  *email;
@property (nonatomic, retain) NSString  *phone;
@property (nonatomic, retain) NSString  *state;
@property (nonatomic, retain) NSString  *city;
@property (nonatomic, retain) NSString  *addressLine;
@property (nonatomic, retain) NSString  *zip;


-(NSString *)description;
@end
