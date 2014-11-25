//
//  WLDatePicker.h
//  Barleyz
//
//  Created by weird logics on 22/02/13.
//  Copyright (c) 2013 minds.weird@gmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WLDatePicker;

@protocol WLDatePickerDelegate <NSObject>

-(void)datePickerGetHidden:(WLDatePicker *)view;
-(void)datePickerGetVisible:(WLDatePicker *)view;
-(void)datePicker:(WLDatePicker *)view datePicked:(NSDate *)date;
-(void)datePicker:(WLDatePicker *)view pickedDateText:(NSString *)text;

@end


@interface WLDatePicker : UIView {
    UIView *viewForPicker;
    UIViewController *_viewController;
    UIDatePicker *_datePickerView;
    UIView  *overLayView;
    id<WLDatePickerDelegate> _delegate;
}
@property(nonatomic,assign)BOOL isVisible;
@property(nonatomic,retain)id<WLDatePickerDelegate> delegate;

@property(nonatomic,retain) UIDatePicker *datePickerView;
@property(nonatomic,retain) UIViewController *viewController;

-(void)setDefaultDate:(NSString *)dateString;

-(void)hideDatePickerAndPick;

@end
