//
//  FeedBackDataManager.m
//  PianoMan
//
//  Created by weird logics on 28/05/13.
//  Copyright (c) 2013 Weird Logics. All rights reserved.
//

#import "FeedBackDataManager.h"
#import "Feedback.h"
#import "NetworkResourcer.h"

@implementation FeedBackDataManager

@synthesize customer;
@synthesize merchant;


-(id)initWithDelegate:(id)delegates  {
    
    self = [super initWithDelegate:delegates];
    if (self){
        self.delegate = delegates;
    }
    return self;
}

-(BOOL)setupCreateReuestWithText:(id)object{
    
    NSLog(@"object %@",object);
     [super setupCreateReuestWithText:object];
    self.responseType = [Feedback class];
    NSString *url = [NSString stringWithFormat:@"/admin/merchant/post-feedback?apikey=987462984"];
    
    self.networkResourcer = [[NetworkResourcer alloc] init];
    BOOL isAnyDelay = [self.networkResourcer createRequestUrl:url object:object responseType:self.responseType callBackController:(id)self requestId:self.requestKey header:nil];
    
    return isAnyDelay;
}


/*
 Network Resourcer delegate -------
 */
-(void)requestCompletedWith:(NetworkResourcer *)networkResourcer {
    
    if (self.networkResourcer.downloadedData == nil) {
        [self requestFailed:networkResourcer];
    }else {
        [self createRequestCompletionHandler:self.networkResourcer.downloadedData];
    }
}

-(void)requestFailed:(NetworkResourcer *)networkResourcer{
    
    NSLog(@"failed failed failed");
}

@end
