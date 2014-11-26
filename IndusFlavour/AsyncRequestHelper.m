//
//  AsyncRequestHelper.m
//  WowTasty
//
//  Created by weird logics on 02/05/13.
//  Copyright (c) 2013 Weird Logics. All rights reserved.
//

#import "AsyncRequestHelper.h"


@implementation AsyncRequestHelper


@synthesize delegate;


- (id) initWithHostName:(NSString*) hostName apiPath:(NSString*) apiPath customHeaderFields:(NSDictionary*) header withCallBack:(id<AsyncRequestDelegate>)callObject{
    
    self = [super initWithHostName:hostName apiPath:apiPath customHeaderFields:header];
    
    if (self) {
        self.delegate = callObject;
    }
    return self;
}

-(MKNetworkOperation *)getResourceFromURL:(NSString *)urlString queryStringParams:(NSDictionary *)params responseType:(id)responseType  uniqueResourceId:(NSString *)uri {
    
    MKNetworkOperation *op = [self operationWithPath:urlString params:params];
    
    [op addCompletionHandler:^(MKNetworkOperation *completedOperation) {
        
        //DLog(@"Server Data found %@ ", completedOperation.responseString);
        
        if ([self.delegate respondsToSelector:@selector(asynRequestCompleted:withResponseData:responseType:responseCode:uniqueResourceId:)]) {
            [self.delegate asynRequestCompleted:self withResponseData:[completedOperation responseString] responseType:responseType responseCode:[completedOperation  HTTPStatusCode] uniqueResourceId:uri];
        }
    } errorHandler:^(MKNetworkOperation *errorOp, NSError* error) {
        if ([self.delegate respondsToSelector:@selector(asynRequestFailed:withError:uniqueResourceId:responseCode:)]) {
            [self.delegate asynRequestFailed:self withError:error uniqueResourceId:uri responseCode:[errorOp HTTPStatusCode]];
        }
    }];
    
    [self enqueueOperation:op];
    return op;
}

-(MKNetworkOperation *)createResourceFromURL:(NSString *)urlString responseType:(id)responseType contentText:(NSString *)contentText contentType:(NSString *)contentType uniqueResourceId:(NSString *)uri callBack:(id<AsyncRequestDelegate>)callObject {
    
    
    NSString *postData = contentText;
    
    if ([contentType isEqualToString:@"application/xml"]) {
        
        //Create XML -------
    }else {
        
        ///Check for other content type.
    }
    
    MKNetworkOperation *op = [self operationWithPath:urlString params:nil httpMethod:@"POST"];
    [op setCustomPostDataEncodingHandler:^NSString *(NSDictionary *postDataDict) {
        return postData;
    } forType:contentType];
    
    [op addCompletionHandler:^(MKNetworkOperation *completedOperation) {
        
        if ([self.delegate respondsToSelector:@selector(asynRequestCompleted:withResponseData:responseType:responseCode:uniqueResourceId:)]) {
            [self.delegate asynRequestCompleted:self withResponseData:[completedOperation responseString] responseType:responseType responseCode:[completedOperation  HTTPStatusCode] uniqueResourceId:uri];
        }
        
    } errorHandler:^(MKNetworkOperation *errorOp, NSError* error) {
        
        if ([self.delegate respondsToSelector:@selector(asynRequestFailed:withError:uniqueResourceId:responseCode:)]) {
            [self.delegate asynRequestFailed:self withError:error uniqueResourceId:uri responseCode:[errorOp HTTPStatusCode]];
        }
        NSLog(@"Error from server; %@", [error debugDescription]);
    }];
    
    [self enqueueOperation:op];
    
    return op;
}

-(MKNetworkOperation *)updateResourceFromURL:(NSString *)urlString responseType:(id)responseType contentText:(NSString *)contentText contentType:(NSString *)contentType uniqueResourceId:(NSString *)uri callBack:(id<AsyncRequestDelegate>)callObject httpMethod:(NSString *)httpMethod {
    
    
    NSString *postData = contentText;
    
    if ([contentType isEqualToString:@"application/xml"]) {
        
        //Create XML -------
    }else {
        
        ///Check for other content type.
    }
    if (httpMethod == nil) {
        httpMethod = @"PUT";
    }
    MKNetworkOperation *op = [self operationWithPath:urlString params:nil httpMethod:httpMethod];
    [op setCustomPostDataEncodingHandler:^NSString *(NSDictionary *postDataDict) {
        return postData;
    } forType:contentType];
    
    [op addCompletionHandler:^(MKNetworkOperation *completedOperation) {
        
        if ([self.delegate respondsToSelector:@selector(asynRequestCompleted:withResponseData:responseType:responseCode:uniqueResourceId:)]) {
            [self.delegate asynRequestCompleted:self withResponseData:[completedOperation responseString] responseType:responseType responseCode:[completedOperation  HTTPStatusCode] uniqueResourceId:uri];
        }
        
    } errorHandler:^(MKNetworkOperation *errorOp, NSError* error) {
        
        if ([self.delegate respondsToSelector:@selector(asynRequestFailed:withError:uniqueResourceId:responseCode:)]) {
            [self.delegate asynRequestFailed:self withError:error uniqueResourceId:uri responseCode:[errorOp HTTPStatusCode]];
        }
        NSLog(@"Error from server; %@", [error debugDescription]);
    }];
    
    [self enqueueOperation:op];
    
    return op;
}


@end
