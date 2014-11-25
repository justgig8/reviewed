//
//  Order.m
//  Barleyz
//
//  Created by weird logics on 21/02/13.
//  Copyright (c) 2013 minds.weird@gmail.com. All rights reserved.
//

#import "Order.h"

@implementation Order

@synthesize identifier,
date,
merchant,
orderNumber,
servingEmployeeCode,
servingEmployeeName,
customer,
customerId,
tableName,
deviceUid,
guests,
initiated,
orderStatus,
billAmount,
suborder,
item,
deliveryAddress;

-(NSString*)description{
    
    return [NSString stringWithFormat:@"Identifier : %@| Merchant :%@ | Order No :%@ | Items :%@| Table Name :%@| Serving Emp Code: %@| Serving Emp Name: %@| Date :%@",self.identifier,self.merchant,self.orderNumber,self.item,self.tableName,self.servingEmployeeCode,self.servingEmployeeName,self.date];
}

@end

