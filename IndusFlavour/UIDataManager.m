//
//  DownloadManager.m
//  WowTasty
//
//  Created by weird logics on 14/05/13.
//  Copyright (c) 2013 Weird Logics. All rights reserved.
//

#import "UIDataManager.h"
#import "NetworkResourcer.h"

@interface UIDataManager ()

@end

@implementation UIDataManager

@synthesize requestedObject;
@synthesize requestType;
@synthesize delegate;
@synthesize responseData;
@synthesize networkResourcer;


-(id)initWithDelegate:(id)delegates  {
    
    self = [super init];
    if (self){
        self.delegate = delegate;
    }
    return self;
}



-(BOOL)setupGetReuestWithText:(NSString *)requestText {
    
    self.requestedObject = requestText;
    return NO;
    
}

-(BOOL)setupCreateReuestWithText:(id)object {
    
    self.requestedObject = object;
    return NO;

}

-(BOOL)setupUpdateReuestWithObject:(id)object{
    self.requestedObject = object;
    return NO;

}



//////////////////////////////////////////////////////////////////////////////////

-(void)getRequestCompletionHandler:(id)data{
    
    if ([self.delegate respondsToSelector:@selector(getRequestCompleted:withDataObject:)])
        [self.delegate getRequestCompleted:self withDataObject:data];
}
-(void)getRequestFailedHandler{
    if ([self.delegate respondsToSelector:@selector(getRequestFailed:withError:)])
        [self.delegate getRequestFailed:self withError:self.responseError];
}

//////////////////////////////////////////////////////////////////////////////////

-(void)createRequestCompletionHandler:(id)data{
    if ([self.delegate respondsToSelector:@selector(createRequestCompleted:withDataObject:)])
        [self.delegate createRequestCompleted:self withDataObject:data];
}
-(void)createRequestFailedHandler{
    if ([self.delegate respondsToSelector:@selector(updateRequestFailed:withError:)])
        [self.delegate updateRequestFailed:self withError:self.responseError];
}

//////////////////////////////////////////////////////////////////////////////////

-(void)updateRequestCompletionHandler:(id)data{
    if ([self.delegate respondsToSelector:@selector(updateRequestCompleted:withDataObject:)])
        [self.delegate updateRequestCompleted:self withDataObject:data];
}
-(void)updateRequestFailedHandler{
    if ([self.delegate respondsToSelector:@selector(updateRequestFailed:withError:)])
        [self.delegate updateRequestFailed:self withError:self.responseError];
}



-(NSError *)uiDataErrorDomain:(NSString *)domain descr:(NSString *)descr  reco:(NSString *)reco errorCode:(NSUInteger)code{

    NSDictionary *userInfo;
    NSError *err;
  
    userInfo = [NSDictionary dictionaryWithObjectsAndKeys:
                descr, NSLocalizedDescriptionKey,
                reco, NSLocalizedRecoverySuggestionErrorKey,
                nil];
    err = [NSError errorWithDomain:domain
                              code:code
                          userInfo:userInfo];
    return err;
}





@end
