//
//  MemoryData.h
//  IndusFlavour
//
//  Created by WL004 on 09/08/13.
//  Copyright (c) 2013 WL004. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UserProfile;
@interface MemoryData : NSObject

@property (nonatomic, retain) NSMutableDictionary *itemMap;
@property (nonatomic, strong) NSMutableDictionary *feedbackMap;
@property(nonatomic,retain)UserProfile *currentCustomer;

+(MemoryData*) sharedMemoryData;
+(void) setup;

+(void)addItemToItemMap:(id)item;

+(NSMutableDictionary *) map;
+(UserProfile *)user;
+(id)getMenu;
+(void)setCurrentMenu:(id)menu;

-(UserProfile *)initializeCurrentCustomer;
-(void)resetCurrentCustomer;

+(void) setTable: (NSString *)t;
+(NSString *)table;

+(void) setMobile: (NSString *)m;
+(NSString *)mobile;


@end
