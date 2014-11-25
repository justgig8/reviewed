//
//  Feedback.m
//  PianoMan
//
//  Created by weird logics on 28/05/13.
//  Copyright (c) 2013 Weird Logics. All rights reserved.
//

#import "Feedback.h"

@implementation Feedback

@synthesize category,
merchant,
name,
response,
customer,
review,
registerMe,
subscribe;

-(NSString *)description {
    
    return [NSString stringWithFormat:@"category %@, merchant %@ ,  name %@,  response %@ , customer %@ , review %@",category, merchant,  name,  response, customer, review];
    
}
@end
