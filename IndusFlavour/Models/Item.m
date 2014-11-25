//
//  Item.m
//  MenuFresh
//
//  Created by Apple on 27/06/13.
//  Copyright (c) 2013 Weird Logics. All rights reserved.
//

#import "Item.h"

@implementation Item

@synthesize price, summary,identifier;
@synthesize type;

-(Item *) initWithName: (NSString *)itemName andImageName: (NSString *)itemImageName andPrice: (NSString *)itemPrice andSummary: (NSString *)itemSummary{
    
    self = [super initWithName:itemName andImageName:itemImageName andList:nil];
    if (self) {
        self.price = itemPrice;
        self.summary = itemSummary;
    }
    return self;
}


-(BOOL)isEqual:(id)object  {
  
    Item *thisObject = (Item *)object;
    
    if ([thisObject.identifier isEqualToString:self.identifier]) {
        return YES;
    }
    return NO;
}

-(NSUInteger)hash{
    return [self.identifier hash];
}

-(NSString*)description{
    
    return [NSString stringWithFormat:@"name=%@|price=%@|identifier=%@|type=%@",name,price,identifier,type];
}
@end
