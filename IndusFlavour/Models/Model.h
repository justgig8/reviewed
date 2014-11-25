//
//  Model.h
//  MenuFresh
//
//  Created by Apple on 01/07/13.
//  Copyright (c) 2013 Weird Logics. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model : NSObject{
    
    NSString *name;
    NSString *imageName;
    NSMutableArray *list;
}

@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *imageName;
@property (nonatomic, retain) NSMutableArray *list;

-(Model *) initWithName: (NSString *)modelName andImageName: (NSString *)modelImageName andList: (NSMutableArray *)modelList;

@end
