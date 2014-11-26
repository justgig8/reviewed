//
//  SlidingView.m
//  FeedBack
//
//  Created by weird logics on 25/06/13.
//  Copyright (c) 2013 Weird Logics. All rights reserved.
//

#import "SlidingView.h"

@interface SlidingView () {
    short lastSmilyIndex;
    UILabel *lblStatus;
}

@end
@implementation SlidingView

@synthesize slider,categoryLabel,
smilyImageView,
buttonCheck;
@synthesize sliderDelegate;



- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self creatFeedbackForm:frame];
        lastSmilyIndex = 0;
    }
    return self;
}



-(void) creatFeedbackForm:(CGRect)ff {
    
    float l = 0;
    float t = 0;
    float w = 195;
    float h = 42;
 
    CGRect frame = CGRectMake(l,t,w,h);
    lblStatus = [[UILabel alloc] initWithFrame:frame];
    lblStatus.backgroundColor = [UIColor clearColor];
    lblStatus.textColor = [UIColor whiteColor];

    lblStatus.font = [UIFont fontWithName:@"Helvetica Neue" size:20];
    lblStatus.text = @"Excellent";
    [self addSubview:lblStatus];
  
    float tt = 40;
    float hh = 40;
 
    UIImage *filedImage = [UIImage imageNamed:@"slider-gray.png"];
    
    float ww = filedImage.size.width;
  
    float diff  = ff.size.width - ww;
    ff.size.width = ww;
    ff.origin.x += diff/2;
    self.frame = ff;
    
    float width = ff.size.width;
    float ll = (width-ww)/2;
 
    frame = CGRectMake(ll,tt,ww,hh);
    self.slider = [[UISlider alloc] initWithFrame:frame];
    [self.slider addTarget:self action:@selector(sliderAction:) forControlEvents:UIControlEventValueChanged];
    [self.slider setMinimumTrackImage:filedImage forState:UIControlStateNormal];
    [self.slider setMaximumTrackImage:[UIImage imageNamed:@"slider.png"] forState:UIControlStateNormal];
    [self.slider setThumbImage:[UIImage imageNamed:@"slider-button.png"] forState:UIControlStateNormal];
    self.slider.minimumValue = 0.0;
    self.slider.maximumValue = 100.0;
    self.slider.continuous = YES;
    self.slider.value = 100.0;
    
    
    
    frame = CGRectMake(ll,tt + 30,ww,hh-15);
    categoryLabel = [[UILabel alloc]initWithFrame:frame];
    [categoryLabel setTextAlignment:NSTextAlignmentLeft];
    categoryLabel.textColor = [UIColor colorWithRed:0.771 green:0.373 blue:0.365 alpha:1.000];
    categoryLabel.backgroundColor = [UIColor clearColor];
    [self addSubview:categoryLabel];
    
    [self addSubview:smilyImageView];
    [self addSubview:self.slider];
}


-(void) sliderAction:(UISlider *)sender {
    
    UIImageView *imageView = [sender.subviews objectAtIndex:2];
    CGRect theRect = [self convertRect:imageView.frame fromView:imageView.superview];
 
    CGRect sRect = lblStatus.frame;
    sRect.origin.x = theRect.origin.x;
    lblStatus.frame = sRect;

    
    if (sender.value<=30.00) {
        lblStatus.text = @"Average";
    }else if(sender.value>30.00 && sender.value<=80.00)
    {
        lblStatus.text = @"Good";
    }else if (sender.value>80.00 && sender.value<=100)
    {
        lblStatus.text = @"Excellent";
    }
    
    [self smilyIndexDidChanged:lblStatus.text];
}


-(void)smilyIndexDidChanged:(NSString *)text {
    if ([self.sliderDelegate respondsToSelector:@selector(sliderViewDidSlid:andIndex:)]) {
        [self.sliderDelegate sliderViewDidSlid:self andIndex:text];
    }
}



@end
