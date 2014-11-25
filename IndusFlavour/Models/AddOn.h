//
//  AddOn.h
//  WowTasty
//
//  Created by Weird Logics4 on 5/6/13.
//  Copyright (c) 2013 Weird Logics. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AddOn : NSObject

@property (nonatomic, strong) NSString          *type;
@property (nonatomic, strong) NSString          *max;
@property (nonatomic, strong) NSString          *min;
@property (nonatomic, strong) NSString          *name;
@property (nonatomic, strong) NSMutableArray    *options;
@property (nonatomic, strong) NSString          *selectionType;

@end
