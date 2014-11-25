//
//  UserProfile.h
//  SwapBBM
//
//  Created by Apple on 10/07/13.
//  Copyright (c) 2013 Weird Logics. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserProfile : NSObject

@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *userId;
@property (nonatomic, retain) NSString *id;
@property (nonatomic, retain) NSString *phone;
@property (nonatomic, retain) NSString *email;

@property (nonatomic, retain) NSString *birthday;
@property (nonatomic, retain) NSString *anniversary;
@property (nonatomic, retain) NSString *houseNo;
@property (nonatomic, retain) NSString *area;
@property(nonatomic,retain)NSString *addressLine;
 @property(nonatomic,retain)NSString *state;
 @property(nonatomic,retain)NSString *city;
 @property(nonatomic,retain)NSString *registrar;
@property(nonatomic,retain)NSString *accountType;
@property(nonatomic,retain)NSMutableArray  *access;
@property(nonatomic,retain)NSString *referencedFrom;
@property(nonatomic,retain)NSString *lastCheckedIn;
@property(nonatomic,retain)NSString *lastCheckInTime;
@property(nonatomic,retain)NSMutableArray *images;
@property(nonatomic,retain)NSString *gender;
 @property(nonatomic,retain)NSString *dateOfBirth;
/*
 
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
 @property(nonatomic,retain)NSString *referencedFrom;
 */


//@property (nonatomic, retain) NSString *gender;
//@property (nonatomic, retain) NSString *age;
//@property (nonatomic, retain) NSString *address;
//
//@property (nonatomic, retain) NSString *bbmPin;
//
//@property (nonatomic, retain) NSString *username;
//@property (nonatomic, retain) NSString *password;



-(UserProfile *) initWithName: (NSString *)uname;


@end
