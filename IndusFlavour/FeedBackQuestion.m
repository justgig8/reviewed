//
//  Question.m
//  IndusFlavour
//
//  Created by WL004 on 09/08/13.
//  Copyright (c) 2013 WL004. All rights reserved.
//

#import "FeedBackQuestion.h"

@implementation FeedBackQuestion

@synthesize identifier, question, list;
@synthesize answer;
@synthesize type;

-(FeedBackQuestion *) initWithIdentifier: (NSString *)i andName: (NSString *)name andOptions: (NSArray *)options{
    
    self = [super init];
    if (self) {
        self.identifier = i;
        self.question = name;
        self.list = [NSArray arrayWithArray:options];
        
        self.type = @"RADIOBUTTON";
    }
    
    return self;
}

-(FeedBackQuestion *) initWithIdentifier: (NSString *)i andName: (NSString *)name{
    
    self = [super init];
    if (self) {
        self.identifier = i;
        self.question = name;
        
        self.type = @"TEXTBOX";
    }
    
    return self;
}

@end
