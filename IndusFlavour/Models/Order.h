//
//  Order.h
//  Barleyz
//
//  Created by weird logics on 21/02/13.
//  Copyright (c) 2013 minds.weird@gmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Customer.h"

@interface Order : NSObject

/*
 
 <suborder date="13-05-2013" tableNumber="423C10-1368439350770" time="03:32 PM">
 <deviceUid>AE1D8FD1-CAE6-402D-935B-16740D423C10</deviceUid>
 </suborder>
 <item id="545">
 <orderSequence>1</orderSequence>
 <menuItemId>6</menuItemId>
 <name>Raita</name>
 <variant>default</variant>
 <quantity>1</quantity>
 <status>Ordered</status>
 <price>0.99</price>
 </item>
 </order>
 */
@property (nonatomic, retain) NSString *identifier;
@property (nonatomic, retain) NSString *date;
@property (nonatomic, retain) NSString *merchant;
@property (nonatomic, retain) NSString *orderNumber;
@property (nonatomic, retain) NSString *servingEmployeeCode;
@property (nonatomic, retain) NSString *servingEmployeeName;
@property (nonatomic, retain) NSString *customer;
@property (nonatomic, retain) NSString *customerId;
@property (nonatomic, retain) NSString *tableName;
@property (nonatomic, retain) NSString *deviceUid;
@property (nonatomic, retain) NSString *guests;
@property (nonatomic, retain) NSString *initiated;
@property (nonatomic, retain) NSString *orderStatus;
@property (nonatomic, retain) NSString *billAmount;

@property (nonatomic, retain) NSMutableArray *suborder;
@property (nonatomic, retain) NSMutableArray *item;
@property(nonatomic,retain)   NSMutableArray *deliveryAddress;

-(NSString*)description;
@end
