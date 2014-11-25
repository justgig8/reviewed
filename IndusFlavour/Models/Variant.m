//
//  Varient.m
//  Langoor
//
//  Created by weird logics on 03/01/13.
//  Copyright (c) 2013 minds.weird@gmail.com. All rights reserved.
//

#import "Variant.h"

@implementation Variant
@synthesize desc;
@synthesize price;
@synthesize unit;
@synthesize name;
-(NSString *)description {
    
    return [NSString stringWithFormat:@"desc :%@ price :%@ name :%@ unit: %@",self.desc,self.price,self.name,self.unit];
}
@end
