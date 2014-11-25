//
//  TableLayoutDataManager.m
//  IndusFlavour
//
//  Created by Weird Logics4 on 5/29/13.
//  Copyright (c) 2013 Weird Logics4. All rights reserved.
//

#import "AdminDataManager.h"
#import "Initializer.h"
#import "Order.h"

@implementation AdminDataManager




+(NetworkResponse *)placePadOnTable:(NSString*)merchantName table:(NSString*)tableNo {
  
    Class responseType = [Order class];
    
    NSString *url = [NSString stringWithFormat:@"admin/order/get-last/%@/%@",merchantName,tableNo];
    
    NSMutableDictionary  *header = [[NSMutableDictionary alloc] init];
    [header setValue:[Initializer apiKey] forKey:@"apikey"];
    
    NetworkResponse *response = [NetworkResourcer sendSyncGetRequest:url andParams:nil responseType:responseType header:header];
    if (![response.responseObject isKindOfClass:responseType]) {
        response.responseObject = nil;
    }
    return response;
}



@end
