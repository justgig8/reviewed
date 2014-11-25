//
//  NetworkResourcer.h
//  WowTasty
//
//  Created by weird logics on 03/05/13.
//  Copyright (c) 2013 Weird Logics. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetworkResponse.h"
#import "NetworkMessanger.h"

@class NetworkResourcer;

@protocol NetworkResourcerDelegate <NSObject>

-(void)requestCompletedWith:(NetworkResourcer *)networkResourcer;
-(void)requestFailed:(NetworkResourcer *)networkResourcer;

@end


@interface NetworkResourcer : NSObject

@property (nonatomic,assign) BOOL isRequestSend;
@property (nonatomic,assign) NSUInteger httpResponseCode;
@property (nonatomic,retain) NSString *uniqueResourceId;
@property (nonatomic,retain) id downloadedData;
@property (nonatomic,retain) Class responseType;
@property (nonatomic,retain) NSError *responseError;
@property (nonatomic,retain) NSString *responseText;

@property(nonatomic,strong)id <NetworkResourcerDelegate>delegate;

-(BOOL )addAsyncGetRequestUrl:(NSString *)urlString andParams:(NSDictionary *)queryParam  responseType:(Class)resType header:(NSMutableDictionary *)headers;
-(BOOL )addAsyncCreateRequestUrl:(NSString *)urlString  object:(id)object responseType:(id)resType callBackController:(id)target  requestId:(NSString *)requestKey header:(NSMutableDictionary *)header;
-(BOOL)addAsyncUpdateRequestUrl:(NSString *)urlString  object:(id)object responseType:(id)resType callBackController:(id)target  requestId:(NSString *)requestKey header:(NSMutableDictionary *)header;


+(NetworkResponse *)sendSyncRequestWithType:(NSString *)requestType urlString:(NSString *)urlString object:(id)object responseType:(Class)resType header:(NSMutableDictionary *)headers;

-(BOOL )createRequestUrl:(NSString *)urlString  object:(id)object responseType:(id)resType callBackController:(id)target  requestId:(NSString *)requestKey header:(NSMutableDictionary *)header;

+(NetworkResponse *)sendSyncGetRequest:(NSString *)urlString andParams:(NSDictionary *)queryParam  responseType:(Class)resType header:(NSMutableDictionary *)headers
;
@end
