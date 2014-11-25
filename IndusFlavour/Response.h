//
//  Response.h
//  PianoMan
//
//  Created by weird logics on 28/05/13.
//  Copyright (c) 2013 Weird Logics. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FeedBackQuestion.h"
@interface Response : NSObject

@property(nonatomic,retain)Question *question;
@property(nonatomic,retain)NSString *responseText;


@end
