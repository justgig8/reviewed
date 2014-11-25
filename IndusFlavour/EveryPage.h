//
//  EveryPage.h
//  SwapBBM
//
//  Created by Apple on 09/07/13.
//  Copyright (c) 2013 Weird Logics. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EveryPage : UIViewController<UITextFieldDelegate>{
    
    UIView *topBar;
    UILabel *heading;
    
    IBOutlet UIScrollView *scrollView; 
}

@property (nonatomic, retain) UIView *topBar;
@property (nonatomic, retain) UILabel *heading;

@property(nonatomic,strong)UISwipeGestureRecognizer *swiper;

@property (nonatomic, retain) IBOutlet UIScrollView *scrollView;

@property (nonatomic, retain) IBOutlet UIImageView *background;

-(void) tap;


@end
