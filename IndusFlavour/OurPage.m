//
//  OurPage.m
//  Langoor
//
//  Created by Weird Minds on 10/09/12.
//  Copyright (c) 2012 minds.weird@gmail.com. All rights reserved.
//

#import "OurPage.h"



@interface OurPage ()

@end

@implementation OurPage

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        UIImage *image = [UIImage imageNamed:@"wm.png"];
        self.view.backgroundColor=[UIColor colorWithPatternImage:image];
    }
    return self;
}

-(void) close{
    [ViewUtils goBackFrom:self];
}

-(void) addGesture{
    
    UISwipeGestureRecognizer *recognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(close)];
    recognizer.direction=UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:recognizer];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self addGesture];
    
    float l,t,w,h;
    
    UIButton *button;
    t=30;
    l=600;
    w=85;
    h=46;
    
    UIImage *image1 = [UIImage imageNamed:@"back-h.png"];
    UIImage *image2 = [UIImage imageNamed:@"back-s.png"];
    
    
    button=[UIButton buttonWithType:UIButtonTypeCustom];
    button.frame=CGRectMake(l, t, w, h);
    button.backgroundColor=[UIColor clearColor];
    [button setImage:image1 forState:UIControlStateNormal];
    [button setImage:image2 forState:UIControlStateHighlighted];
    [button addTarget:self action:@selector(close) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];

}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

@end
