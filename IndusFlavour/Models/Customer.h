//
//  Customer.h
//  Loan
//
//  Created by Mobi_Mac on 18/04/13.
//  Copyright (c) 2013 Mobi_Mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Customer : NSObject


@property(nonatomic,retain)NSString *id;
@property(nonatomic,retain)NSString *name;
@property(nonatomic,retain)NSString *email;
@property(nonatomic,retain)NSString *addressLine;
@property(nonatomic,retain)NSString *gender;
@property(nonatomic,retain)NSString *dateOfBirth;
@property(nonatomic,retain)NSString *anniversary;
@property(nonatomic,retain)NSString *phone;
@property(nonatomic,retain)NSString *state;
@property(nonatomic,retain)NSString *city;
@property(nonatomic,retain)NSString *registrar;
@property(nonatomic,retain)NSString *lastCheckedIn;
@property(nonatomic,retain)NSString *lastCheckInTime;
@property(nonatomic,retain)NSMutableArray *images;
@property(nonatomic,retain)NSString *userId;
@property(nonatomic,retain)NSString *accountType;
@property(nonatomic,retain)NSMutableArray  *access;

@property(nonatomic,retain)NSString *studying;

@end
