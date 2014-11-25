//
//  TouchView.h
//  Sample
//
//  Created by Mobi_Mac on 28/05/13.
//  Copyright (c) 2013 Mobi_Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <AudioToolbox/AudioToolbox.h>

@class TouchView;

@protocol TouchViewDelegate <NSObject>

-(void)touchView:(TouchView *)touchView addFeedBackAtIndex:(short)index;

@end

@interface TouchView : UIView

@property(nonatomic,assign)CGPoint prevPoint;


@property(nonatomic,retain)id <TouchViewDelegate> delegate;
@end
