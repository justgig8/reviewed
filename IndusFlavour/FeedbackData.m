//
//  FeedbackData.m
//  WowTasty
//
//  Created by weird logics on 25/05/13.
//  Copyright (c) 2013 Weird Logics. All rights reserved.
//

#import "FeedbackData.h"


NSString *kReviewTypeSuggestion =  @"Suggestion";
NSString *kReviewTypeCommment =  @"Commment";

//Feedback categories --- 
NSString *kQuestionCategoryPresentation = @"Presentation";
NSString *kQuestionCategoryQuality = @"Quality";
NSString *kQuestionCategoryService = @"Service";


@interface FeedbackData (){
    
    Feedback *currentFeedback;
     NSString *customerId;
}

@property(nonatomic,retain) Feedback *currentFeedback;

@end 

@implementation FeedbackData

#define FeedbackDataFlag YES


static FeedbackData *sharedObject;

@synthesize questionList;
@synthesize currentFeedback;


+(FeedbackData*)sharedFeedbackData{
    
    if (sharedObject) {
        return sharedObject;
    }
    
    if (!sharedObject){
        @synchronized(self){
            if (!sharedObject) {
                sharedObject = [[FeedbackData alloc]init];
                sharedObject.currentFeedback = [sharedObject createNewFeedback];
            }
            
        }
    }
    
	return sharedObject;
}

+(void) reset{
    
    [FeedbackData sharedFeedbackData].currentFeedback = [sharedObject createNewFeedback];
    [FeedbackData sharedFeedbackData].questionList = [[NSMutableArray alloc] init];
}

-(Feedback*)createNewFeedback{

    Feedback *feedback = [[Feedback alloc] init];
    feedback.name = @"Feedback";
    feedback.category = @"General";
    feedback.response = [[NSMutableArray alloc] init];
    feedback.review = [[NSMutableArray alloc] init];
    
    return feedback;
}

-(Feedback *)getCurrentFeedback{
    return sharedObject.currentFeedback;
}

-(void) addReviewWithType:(NSString *)reviewType andComment:(NSString *)comment {

    if (comment && reviewType) {
        
        BOOL isNewReview = YES;
        for (Review *each in self.currentFeedback.review) {
            if ([each.type isEqualToString:reviewType]) {
                isNewReview = NO;
                break;
            }
        }
    
        if (isNewReview) {
            Review *review = [[Review alloc] init];
            review.type = reviewType;
            review.comment = comment;
            [self.currentFeedback.review addObject:review];
        }
    }
}

-(Response *)addResponseText:(NSString *)resText questionName:(NSString *)name questionText:(NSString *)questionText andCategory:(NSString *)categoryText {

    Response *response = nil;

    if (resText && name  && questionText && categoryText) {
        
        BOOL isNewResponse = YES;
        for (Response *each in self.currentFeedback.response) {
            if ([each.question.name isEqualToString:name]) {
                isNewResponse = NO;
                response = each;
                break;
            }
        }
        
        if (isNewResponse) {
            Question *question = [[Question alloc] init];
            question.category = categoryText;
            question.name = name;
            question.text = questionText;
          
            response = [[Response alloc] init];
            response.question = question;
            [self.currentFeedback.response addObject:response];
        }
        //Only Response text can be change in feedback existing list other's will be same in any case like question Category question text. 
        response.responseText = resText;
    }
    
    return response;
}

@end
