//
//  PianoCells.h
//  PianoMan
//
//  Created by weird logics on 27/05/13.
//  Copyright (c) 2013 Weird Logics. All rights reserved.
//

#import "TableViewCustomCell.h"
#import "FeedbackCellDetails.h"

@class FeedbackTableCell;



//typedef enum {
//    FeedbackRatingPoor = 1,
//    FeedbackRatingFair,
//    FeedbackRatingGood,
//    FeedbackRatingVeryGood,
//    FeedbackRatingDelightful,
//
//}FeedbackRating;

typedef enum {
    FeedbackQuestionCatPresentation = 100,
    FeedbackQuestionCatQuality = 200,
}FeedbackQuestionCat;



@protocol FeedbackTableCellDelegate <NSObject>

-(void)feedbackTableCell:(FeedbackTableCell *)cell addFeedBackCat:(NSString *)catText reponseText:(NSString *)responseText;
-(void)feedbackTableCell:(FeedbackTableCell *)cell removeFeedBackCat:(NSString *)catText reponseText:(NSString *)responseText;
@end



@interface FeedbackTableCell : TableViewCustomCell

@property(nonatomic,retain)NSString *itemId;
@property(nonatomic,retain)   id<FeedbackTableCellDelegate>delegate;
@property (nonatomic,retain)  UILabel *lblDistance;
@property (nonatomic,retain)  UILabel *lblStatus;


-(void)addDetailsInTableCell:(UITableViewCell *)cell restaurantDetails:(FeedbackCellDetails *)restaurantDetails cellHeight:(float)cellHeight;

-(void)addFeedbackResponse:(NSString *)text  forView:(short )viewIndex isSelected:(BOOL)isSelected;

@end
