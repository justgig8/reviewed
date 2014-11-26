//
//  MemoryData.m
//  IndusFlavour
//
//  Created by WL004 on 09/08/13.
//  Copyright (c) 2013 WL004. All rights reserved.
//

#import "MemoryData.h"
#import "Item.h"


@implementation MemoryData

@synthesize itemMap,currentCustomer;

static NSMutableDictionary *map; /* <questionId, Question> */
static UserProfile *user;
static id menuObject = nil;
static MemoryData *sharedMemoryData;

static NSString *table, *mobile;

-(id)init{
    
    self = [super init];
    if (self) {
        self.currentCustomer = [self initializeCurrentCustomer];
        
    }
    return self;
}

+(MemoryData*) sharedMemoryData{
    
    if(sharedMemoryData){
        return sharedMemoryData;
    }
    
    @synchronized(self){
        if(!sharedMemoryData){
            sharedMemoryData = [[MemoryData alloc] init];
            sharedMemoryData.itemMap = [[NSMutableDictionary alloc]init]; 
        }
    }
    return sharedMemoryData;
}


+(void) setup{
    
    user = [[UserProfile alloc] init];
    
    map = [[NSMutableDictionary alloc] init];
    
    FeedBackQuestion *question;
    NSString *identifier;
    
    identifier=@"0";
    question = [[FeedBackQuestion alloc] initWithIdentifier:identifier andName:@"Was the food delivered on time?" andOptions:[NSArray arrayWithObjects:@"Perhaps", @"Somewhat", @"Definitely", nil]];
    [map setObject:question forKey:identifier];
    
    identifier=@"1";
    question = [[FeedBackQuestion alloc] initWithIdentifier:identifier andName:@"Was the overall service satisfactory?" andOptions:[NSArray arrayWithObjects:@"Perhaps", @"Somewhat", @"Definitely", nil]];
    [map setObject:question forKey:identifier];
    
    identifier=@"2";
    question = [[FeedBackQuestion alloc] initWithIdentifier:identifier andName:@"How likely are you to refer Indus Flavour to friends/ associates?" andOptions:[NSArray arrayWithObjects:@"Perhaps", @"Somewhat", @"Definitely", nil]];
    [map setObject:question forKey:identifier];
    
    identifier=@"3";
    question = [[FeedBackQuestion alloc] initWithIdentifier:identifier andName:@"Any other improvements you would like here:"];
    [map setObject:question forKey:identifier];
}

+(UserProfile *)user{
    return user;
}
+(void)setCurrentMenu:(id)menu{
    
    menuObject = menu;
}
+(id)getMenu{
    return menuObject;
}

+(NSMutableDictionary *) map{
    return map;
}
+(void)addItemToItemMap:(id)item{
    Item *i = (Item*)item;
    [sharedMemoryData.itemMap setObject:i forKey:[i identifier]];
}

-(UserProfile *)initializeCurrentCustomer {
    UserProfile *customer = [[UserProfile alloc] init];
    customer.identifier = @"0";
    return customer;
}

-(void)resetCurrentCustomer {
    self.currentCustomer =  nil;
    self.currentCustomer = [self initializeCurrentCustomer];
}


+(void) setTable: (NSString *)t{
    table = t;
}
+(NSString *)table{
    return table;
}

+(void) setMobile: (NSString *)m{
    mobile = m;
}
+(NSString *)mobile{
    return mobile;
}


@end
