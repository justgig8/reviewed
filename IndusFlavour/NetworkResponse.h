//
//  NetworkResponse.h
//  KittySu
//
//  Created by weird logics on 17/04/13.
//  Copyright (c) 2013 weird logics. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetworkResponse : NSObject

@property (nonatomic, strong) id responseObject;
@property (nonatomic, assign) NSInteger statusCode;
@property (nonatomic, strong) NSString *statusMsg;
@property (nonatomic, strong) NSData *response;
@property (nonatomic, strong) NSError *error;
@property (nonatomic, assign) bool isSuccessful;

@end
