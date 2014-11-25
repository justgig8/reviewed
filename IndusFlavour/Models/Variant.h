//
//  Varient.h
//  Langoor
//
//  Created by weird logics on 03/01/13.
//  Copyright (c) 2013 minds.weird@gmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Menu.h"
@interface Variant : NSObject {
    
    NSString    *name;
    NSString    *desc;
    NSString    *unit;
    NSString    *price;
}
@property(nonatomic,retain)NSString    *name;
@property(nonatomic,retain)NSString  *desc;
@property(nonatomic,retain)NSString  *unit;
@property(nonatomic,retain)NSString  *price;

-(NSString *)description;
@end
