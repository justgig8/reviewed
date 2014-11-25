//
//  Response.m
//  PianoMan
//
//  Created by weird logics on 28/05/13.
//  Copyright (c) 2013 Weird Logics. All rights reserved.
//

#import "Response.h"

@implementation Response

@synthesize question,
responseText;


-(NSString *)description {
    return [NSString stringWithFormat:@"question %@, responseText %@ ",question, responseText];
}

@end
