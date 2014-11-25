//
//  FeedbackData.h
//  WowTasty
//
//  Created by weird logics on 25/05/13.
//  Copyright (c) 2013 Weird Logics. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "UserProfile.h"
#import "Review.h"
#import "Feedback.h"
#import "FeedBackQuestion.h"
#import "Response.h"

//All review Type for feedback-- 
extern NSString *kReviewTypeSuggestion;
extern NSString *kReviewTypeCommment;

//All review Type for feedback--
extern NSString *kQuestionCategoryPresentation;
extern NSString *kQuestionCategoryQuality;
extern NSString *kQuestionCategoryService;



@interface FeedbackData : NSObject

@property(nonatomic,retain)NSMutableArray *questionList;

+(FeedbackData*)sharedFeedbackData;
-(Feedback*)getCurrentFeedback;
-(void)setFeedbackCustomer:(UserProfile *)customer;

-(Review *)addReviewWithType:(NSString *)reviewType andComment:(NSString *)comment ;
-(Response *)addResponseText:(NSString *)resText questionName:(NSString *)name questionText:(NSString *)questionText andCategory:(NSString *)categoryText;

+(void) reset;

@end
