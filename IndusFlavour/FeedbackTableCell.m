//
//  PianoCells.m
//  PianoMan
//
//  Created by weird logics on 27/05/13.
//  Copyright (c) 2013 Weird Logics. All rights reserved.
//

#import "FeedbackTableCell.h"
#import "Resourcer.h"
#import "TouchView.h"
#import "SlidingView.h"
#import "FeedbackData.h"

@interface FeedbackTableCell ()

@property(nonatomic,retain) SlidingView *sliderView1;
@property(nonatomic,retain) SlidingView *sliderView2;
@property(nonatomic,retain) NSMutableArray  *arrayOfTouchView;
@end


@implementation FeedbackTableCell

@synthesize delegate,sliderView1,sliderView2,itemId,lblStatus;


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        float w = 290,h = 94,l = 280 , t = 25;
        sliderView1 = [[SlidingView alloc] initWithFrame:CGRectMake(l,t, w,h)];
        sliderView1.tag = FeedbackQuestionCatPresentation;
        sliderView1.sliderDelegate = (id)self;
        [self addSubview:sliderView1];
    }
    
    return self;
}

-(void)sliderViewDidSlid:(SlidingView *)slidingView andIndex:(NSString *)text{
    
    NSLog(@"Table cell self.delegate %@",self.delegate);
    
    NSString *questionCat = nil;
    switch (slidingView.tag) {
            
        case FeedbackQuestionCatPresentation:
            questionCat = kQuestionCategoryService;
            break;
        case FeedbackQuestionCatQuality:
            questionCat = kQuestionCategoryQuality;
            break;
        default:
            break;
    }
    NSString *ratingText = text;//[self findRatingText:text];
    if ([self.delegate respondsToSelector:@selector(feedbackTableCell:addFeedBackCat:reponseText:)]) {
        [self.delegate  feedbackTableCell:self addFeedBackCat:questionCat reponseText:ratingText];
    }
}


-(void)addFeedbackResponse:(NSString *)text  forView:(short)viewIndex isSelected:(BOOL)isSelected{
    NSLog(@"Response Text %@ ",text);
    NSLog(@"On View  %d",viewIndex);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}


#pragma mark --- Cell Initialization for each Restaurant.

-(void)addDetailsInTableCell:(UITableViewCell *)cell restaurantDetails:(FeedbackCellDetails *)feedbackCellDetails cellHeight:(float)cellHeight{
    
    FeedbackTableCell *rCell = (FeedbackTableCell *)cell;
    NSString *fontName = @"Helvetica Neue";
    float fontSize = 26;
    UIColor *fontColor = [UIColor whiteColor];
    
    float leftMargin = 5;
    float leftCellWidth = 190;
    float gap = 5;
    float top = 0;
    
    float l = leftMargin;
    float t = top;
    float w = leftCellWidth;
    float h = 170;
    
    CGRect frame = CGRectMake(l,t,w,h);
    [rCell setTitle:feedbackCellDetails.title frame:frame fontName:fontName fontSize:fontSize textColor:fontColor textAlignment:NSTextAlignmentLeft];
    //rCell.lblTitle.backgroundColor = [UIColor whiteColor];
    t += rCell.lblTitle.frame.size.height + gap;
    rCell.lblTitle.textAlignment = NSTextAlignmentRight;
}

@end
