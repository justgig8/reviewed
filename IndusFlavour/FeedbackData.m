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

-(void)setFeedbackCustomer:(UserProfile *)customer {
  
    if (!customer.name) {
        NSLog(@" %s : Customrer name not found",__FUNCTION__);
    }else if (customer.phone && customer.email){
       
             if (customer.id) customer.id = @"0";
        if (customer.userId == nil) {
            if (customer.phone) {
                customer.userId = customer.phone;
            }else {
                customer.userId = customer.email;
            }
        }
    }else{
        NSLog(@"%s : Feedback Customer Not added %@",__FUNCTION__,customer);
    }
}


-(Review *)addReviewWithType:(NSString *)reviewType andComment:(NSString *)comment {

    Review *review = nil;
    if (comment && reviewType) {
        
        BOOL isNewReview = YES;
        for (Review *each in self.currentFeedback.review) {
            if ([each.type isEqualToString:reviewType]) {
                isNewReview = NO;
                review = each;
                break;
            }
        }
    
        if (isNewReview) {
            review = [[Review alloc] init];
            [self.currentFeedback.response addObject:review];
        }
        review.comment = comment;
        review.type = reviewType;
    }
    return review;
}

-(Response *)addResponseText:(NSString *)resText questionName:(NSString *)name questionText:(NSString *)questionText andCategory:(NSString *)categoryText {


    if(FeedbackDataFlag) NSLog(@"Response Text %@ \n Name %@ \n QuestionText %@ \n Category Text %@",resText,name,questionText,categoryText);
    
    
    Response *response = nil;

    if (resText && name  && questionText && categoryText) {
        
        BOOL isNewResponse = YES;
        for (Response *each in self.currentFeedback.response) {
            if ([each.question.name isEqualToString:name]) {
                isNewResponse = NO;
                response = each;
                NSLog(@"Each:%@",each.question.name);
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
            if(FeedbackDataFlag)  NSLog(@"New Response Status -- \n question %@ question %@",question,response);
        }else {
             if(FeedbackDataFlag) NSLog(@"Older Response Status -- \n isNewResponse : %d \n response %@ ",isNewResponse,response);
        }
        //Only Response text can be change in feedback existing list other's will be same in any case like question Category question text. 
        response.responseText = resText;
    }else {
       if(FeedbackDataFlag) NSLog(@"Erorr : Response Can't be created \n resText %@ \n name:%@ \n QuestionText:%@ \n  CategoryText : %@ ",resText,name,questionText,categoryText);
   }
    
    if(FeedbackDataFlag)  NSLog(@"Number of Responses adeded %@ ",self.currentFeedback.response);
    
    return response; 
    return nil;
}


@end
