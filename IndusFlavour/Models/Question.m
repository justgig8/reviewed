//
//  Question.m
//  PianoMan
//
//  Created by weird logics on 28/05/13.
//  Copyright (c) 2013 Weird Logics. All rights reserved.
//

#import "Question.h"

@implementation Question

@synthesize category,
name,
text;


-(NSString *)description{

    return [NSString stringWithFormat:@"category %@ || name %@ || text %@ ",category, name , text];
}

@end
