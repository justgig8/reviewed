//
//  AsyncRequestHelper.h
//  WowTasty
//
//  Created by weird logics on 02/05/13.
//  Copyright (c) 2013 Weird Logics. All rights reserved.
//

#import <Foundation/Foundation.h>
#import"MKNetworkKit.h"

@protocol AsyncRequestDelegate

-(void)asynRequestCompleted:(id)asyncHelper withResponseData:(NSString *)string responseType:(id)responseType responseCode:(NSInteger)responseCode uniqueResourceId:(NSString *)uri;
-(void)asynRequestFailed:(id)asyncHelper withError:(NSError *)error uniqueResourceId:(NSString *)uri responseCode:(NSInteger)responseCode;



@end;

@interface AsyncRequest : MKNetworkEngine {
    
}


@property(nonatomic,strong)id delegate;
 
- (id) initWithHostName:(NSString*) hostName apiPath:(NSString*) apiPath customHeaderFields:(NSDictionary*) header withCallBack:(id<AsyncRequestDelegate>)callObject;

-(MKNetworkOperation *)getResourceFromURL:(NSString *)urlString queryStringParams:(NSDictionary *)params responseType:(id)responseType  uniqueResourceId:(NSString *)uri;

-(MKNetworkOperation *)createResourceFromURL:(NSString *)urlString responseType:(id)responseType contentText:(NSString *)contentText contentType:(NSString *)contentType uniqueResourceId:(NSString *)uri callBack:(id<AsyncRequestDelegate>)callObject;

-(MKNetworkOperation *)updateResourceFromURL:(NSString *)urlString responseType:(id)responseType contentText:(NSString *)contentText contentType:(NSString *)contentType uniqueResourceId:(NSString *)uri callBack:(id<AsyncRequestDelegate>)callObject httpMethod:(NSString *)httpMethod;


@end
