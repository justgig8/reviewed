//
//  AsyncRequestHelper.h
//  WowTasty
//
//  Created by weird logics on 02/05/13.
//  Copyright (c) 2013 Weird Logics. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MKNetworkEngine.h"
#import "MKNetworkOperation.h"

#import "AsyncRequest.h"

@class AsyncRequestHelper;


@interface AsyncRequestHelper : MKNetworkEngine


@property(nonatomic,strong)id delegate;
 
- (id) initWithHostName:(NSString*) hostName apiPath:(NSString*) apiPath customHeaderFields:(NSDictionary*) header withCallBack:(id<AsyncRequestDelegate>)callObject;


//Get Resource from the URL.
-(MKNetworkOperation *)getResourceFromURL:(NSString *)urlString queryStringParams:(NSDictionary *)params responseType:(id)responseType  uniqueResourceId:(NSString *)uri;


-(MKNetworkOperation *)createResourceFromURL:(NSString *)urlString responseType:(id)responseType contentText:(NSString *)contentText contentType:(NSString *)contentType uniqueResourceId:(NSString *)uri callBack:(id<AsyncRequestDelegate>)callObject;

-(MKNetworkOperation *)updateResourceFromURL:(NSString *)urlString responseType:(id)responseType contentText:(NSString *)contentText contentType:(NSString *)contentType uniqueResourceId:(NSString *)uri callBack:(id<AsyncRequestDelegate>)callObject httpMethod:(NSString *)httpMethod;
@end
