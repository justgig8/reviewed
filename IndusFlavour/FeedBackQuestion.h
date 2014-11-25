//
//  Question.h
//  IndusFlavour
//
//  Created by WL004 on 09/08/13.
//  Copyright (c) 2013 WL004. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FeedBackQuestion : NSObject{
    
    NSString *identifier;
    NSString *question;
    NSArray *list;
    NSString *answer;
    NSString *type;
}

@property (nonatomic, retain) NSString *identifier;
@property (nonatomic, retain) NSString *question;
@property (nonatomic, retain) NSArray *list;
@property (nonatomic, retain) NSString *answer;

@property (nonatomic, retain) NSString *type;


-(FeedBackQuestion *) initWithIdentifier: (NSString *)i andName: (NSString *)name andOptions: (NSArray *)options;
-(FeedBackQuestion *) initWithIdentifier: (NSString *)i andName: (NSString *)name;


@end
