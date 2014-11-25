//
//  DownloadManager.h
//  WowTasty
//
//  Created by weird logics on 14/05/13.
//  Copyright (c) 2013 Weird Logics. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ConstantsBank.h"

#import "NetworkResourcer.h"

@class UIDataManager;

@protocol UIDataManagerDelegate  <NSObject>


-(void)getRequestCompleted:(UIDataManager *)dataManager withDataObject:(id)object;
-(void)getRequestFailed:(UIDataManager *)dataManager withError:(NSError *)error;

-(void)createRequestCompleted:(UIDataManager *)dataManager withDataObject:(id)object;
-(void)createRequestFailed:(UIDataManager *)dataManager withError:(NSError *)error;

-(void)updateRequestCompleted:(UIDataManager *)dataManager withDataObject:(id)object;
-(void)updateRequestFailed:(UIDataManager *)dataManager withError:(NSError *)error;



@end


@interface UIDataManager : NSObject 

@property(nonatomic,assign) NSUInteger requestType;
@property(nonatomic,retain) NetworkResourcer *networkResourcer;
@property(nonatomic,retain) NSString *requestKey;
@property(nonatomic,retain) id <UIDataManagerDelegate> delegate;
@property(nonatomic,retain) Class responseType;
@property(nonatomic,retain)id responseData;
@property(nonatomic,retain)NSError *responseError;
@property(nonatomic,retain)id requestedObject;


-(void)getRequestCompletionHandler:(id)data;
-(void)createRequestCompletionHandler:(id)data;
-(void)updateRequestCompletionHandler:(id)data;

-(void)getRequestFailedHandler;
-(void)createRequestFailedHandler;
-(void)updateRequestFailedHandler;

//Needs to be implimented----
-(id)initWithDelegate:(id)delegates;

-(BOOL)setupGetReuestWithText:(NSString *)requestText;
-(BOOL)setupCreateReuestWithText:(id)object;
-(BOOL)setupUpdateReuestWithObject:(id)object;

//Error Handeler -----
-(NSError *)uiDataErrorDomain:(NSString *)domain descr:(NSString *)descr  reco:(NSString *)reco errorCode:(NSUInteger)code;
@end

