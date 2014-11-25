//
//  MenuHandler.h
//  MenuFresh
//
//  Created by Apple on 08/07/13.
//  Copyright (c) 2013 Weird Logics. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Menu;
@interface MenuHandler : NSObject

+(MenuHandler *) setup;

+(Menu *) getMenu: (NSString *)merchantName andIsUpdated: (BOOL)isUpdatedMenuToBeGiven;

@property (nonatomic, retain) NSMutableDictionary *merchantMenuMap;

@end
