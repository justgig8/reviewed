//
//  Image.m
//  Barleyz
//
//  Created by weird logics on 25/01/13.
//  Copyright (c) 2013 minds.weird@gmail.com. All rights reserved.
//

#import "Image.h"

@implementation Image

@synthesize name,originalLocation;

-(NSString*)description{
    
    return [NSString stringWithFormat:@"name=%@|originalLocation=%@",name,originalLocation];
}

@end
