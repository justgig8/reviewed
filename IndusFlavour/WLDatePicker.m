//
//  WLDatePicker.m
//  Barleyz
//
//  Created by weird logics on 22/02/13.
//  Copyright (c) 2013 minds.weird@gmail.com. All rights reserved.
//

#import "WLDatePicker.h"

@implementation WLDatePicker

@synthesize isVisible;

@synthesize datePickerView = _datePickerView,
viewController = _viewController;
@synthesize delegate =_delegate;


static NSDateFormatter *dateFormatter;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.frame = frame;
        // Initialization code
        self.clipsToBounds = YES;
        overLayView = nil;
        CGRect frame = self.bounds;
        frame.size.height -=265;
        overLayView = [[UIView alloc] initWithFrame:frame];
        [self addSubview:overLayView];
        //[overLayView setBackgroundColor:[UIColor redColor]];
      
        self.clipsToBounds = YES;
        self.alpha = 0.0;
       
        frame.origin.y =frame.size.height;
        
        frame.origin.y +=50;
        frame.size.height = 220;
        _datePickerView = [[UIDatePicker alloc] initWithFrame:frame];
        [self addSubview:_datePickerView];
        
        _datePickerView.maximumDate = [NSDate date];
        _datePickerView.datePickerMode = UIDatePickerModeDate;
        dateFormatter = nil;
        if (dateFormatter == nil) {
            dateFormatter = [[NSDateFormatter alloc] init];
            [dateFormatter setDateFormat:FORMAT_DATE];
        }
   
        [self createGestureRecognizers];
        [self setHelpViewVisibility:YES];
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(540,880,35,35);
        [self addSubview:btn];
        [btn setImage:[UIImage imageNamed:@"PickerClose.png"] forState:UIControlStateNormal];
        //[btn setBackgroundImage:[UIImage imageNamed:@"login-hover.png"] forState:UIControlStateHighlighted];
        [btn setTitle:@"" forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [btn.titleLabel setFont:[UIFont fontWithName:@"Futura" size:15]];
        [btn addTarget:self action:@selector(clickedButtonDone:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return self;
}


-(void)minimumDate{
    
//    NSString *dateString = @"01-01-1913";
//    
//    NSDate *date = [dateFormatter dateFromString:dateString];
//    NSDate *minDate =
 
}

-(void)setDefaultDate:(NSString *)dateString{

    [dateFormatter setDateFormat:@"dd-MM-yyyy"];
    NSDate *date = [dateFormatter dateFromString:dateString];
    [self.datePickerView setDate:date animated:NO];

}



-(void) createGestureRecognizers {
    
	UITapGestureRecognizer *tapper = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideDatePicker)];
	tapper.numberOfTapsRequired = 1;
	[overLayView addGestureRecognizer:tapper];
}

-(void)setHelpViewVisibility:(BOOL)isVisibile{
    
    CGContextRef context = UIGraphicsGetCurrentContext();
	[UIView beginAnimations:nil context:context];
	[UIView setAnimationDuration:0.50];
    self.backgroundColor = [UIColor clearColor];
   
    CGRect bounds = self.bounds;
    
    if (isVisibile) {
        self.alpha = 1.0;
        self.frame = bounds;
    }else{
        self.alpha = 0.0;
        bounds.origin.y = bounds.size.height;
        self.frame = bounds;
    }
	[UIView commitAnimations];
    
}

-(void)hideDatePicker{
    
    [self setHelpViewVisibility:NO];
    
    if ([self.delegate respondsToSelector:@selector(datePickerGetHidden:)]) {
        [self.delegate datePickerGetHidden:self];
    }
      NSString *dateString = [[NSString alloc] initWithString:[dateFormatter stringFromDate:_datePickerView.date]];
    if ([_delegate respondsToSelector:@selector(datePicker:pickedDateText:)]){
        [_delegate datePicker:self pickedDateText:dateString];
    }

    [self performSelector:@selector(removeViewFromSuperView) withObject:nil afterDelay:1.0];
}

-(void)removeViewFromSuperView{
     [self removeFromSuperview];
}
#pragma mark --Overlay delegate

-(void)overlayViewGetHidden:(UIView *)view{
    [self hideDatePicker];
}

-(void)overlayViewGetVisible:(UIView *)view{
    
    
}

-(void)hideDatePickerAndPick{
    [self clickedButtonDone:nil];
}



-(void)clickedButtonDone:(UIButton *)btn {
    
     NSString *dateString = [[NSString alloc] initWithString:[dateFormatter stringFromDate:_datePickerView.date]];

    NSLog(@"clickedButtonDone : dateString %@",dateString);
    
    if ([_delegate respondsToSelector:@selector(datePicker:pickedDateText:)]){
         [_delegate datePicker:self pickedDateText:dateString];
    }
    if ([_delegate respondsToSelector:@selector(datePicker:datePicked:)]) {
        [_delegate datePicker:self datePicked:_datePickerView.date];
    }
    [self  hideDatePicker];
}



//-(void)datePickerGetHidden:(WLDatePicker *)view;
//-(void)datePickerGetVisible:(WLDatePicker *)view;
//-(void)datePicker:(WLDatePicker *)view datePicked:(NSDate *)date;
//-(void)datePicker:(WLDatePicker *)view pickedDateText:(NSString *)text;

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
