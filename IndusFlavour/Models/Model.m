//
//  Model.m
//  MenuFresh
//
//  Created by Apple on 01/07/13.
//  Copyright (c) 2013 Weird Logics. All rights reserved.
//

#import "Model.h"

@implementation Model

@synthesize name, imageName, list;

-(Model *) initWithName: (NSString *)modelName andImageName: (NSString *)modelImageName andList: (NSMutableArray *)modelList{
    
    self = [super init];
    if (self) {
        self.name = modelName;
        self.imageName = modelImageName;
        self.list = modelList;
    }
    return self;
}


@end
