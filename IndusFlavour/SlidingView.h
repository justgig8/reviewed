//
//  SlidingView.h
//  FeedBack
//
//  Created by weird logics on 25/06/13.
//  Copyright (c) 2013 Weird Logics. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SlidingView;
@protocol SlidingViewDelegate <NSObject>

-(void)sliderViewDidSlid:(SlidingView *)slidingView andIndex:(NSString *)text;

@end


@interface SlidingView : UIView

@property (nonatomic,retain)UISlider *slider;
@property (nonatomic,retain)UIImageView *smilyImageView;
@property (nonatomic,retain)UIButton *buttonCheck;
@property (nonatomic,retain)UILabel *categoryLabel;

@property (nonatomic,retain)id <SlidingViewDelegate> sliderDelegate;

@end


