//
//  EveryPage.m
//  SwapBBM
//
//  Created by Apple on 09/07/13.
//  Copyright (c) 2013 Weird Logics. All rights reserved.
//

#import "EveryPage.h"
#import "OurPage.h"

@interface EveryPage ()
{
    UIImageView *logo;
    UIButton *ourBtn;
}

@end

@implementation EveryPage

@synthesize topBar;
@synthesize heading;
@synthesize scrollView;
@synthesize background;
@synthesize swiper;



static UITextField *activeField;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
//        self.view.backgroundColor = [UIColor colorWithPatternImage:[ImageUtils imageWithName:@"background.png"]];

        //background = [[UIImageView alloc] initWithImage:[ImageUtils imageWithName:@"background.png"]];
        background.frame = self.view.frame;
        background.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        [self.view addSubview:background];
        
        [self.view sendSubviewToBack:background];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    swiper = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(goBack)];
    swiper.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swiper];
    
    UITapGestureRecognizer *tapper = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)];
    tapper.numberOfTapsRequired=1;
    [scrollView addGestureRecognizer:tapper];
    
    [self registerForKeyboardNotifications];
    
    logo = [[UIImageView alloc] initWithFrame:CGRectMake(500, 960, 250, 21)];
    logo.image = [UIImage imageNamed:@"wllogo"];
    
    [self.view addSubview:logo];
    
    ourBtn  = [UIButton buttonWithType:UIButtonTypeCustom];
    ourBtn.backgroundColor = [UIColor clearColor];
    ourBtn.frame = CGRectMake(420, 930, 311, 65);
    [ourBtn addTarget:self action:@selector(ourPage:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:ourBtn];
    
    //[self fill];
}




-(void)ourPage:(UIButton *)sender
{
    OurPage *page = [[OurPage alloc] initWithNibName:nil bundle:nil];
    [ViewUtils forwardFrom:self to:page];
    
    NSLog(@"gsdjkasgdjahgskdjgaksjdgakjshgdjkahsgd");
}

-(void)touchesEnded:(NSSet *)touches
          withEvent:(UIEvent *)event{
    [self tap];
}

-(void) tap{
    
}

-(void) fill{
    
    float l,t,w,h;
    
    l=0;
    t=0;
    w=320;
    h=51;
    topBar = [[UIView alloc] initWithFrame:CGRectMake(l, t, w, h)];
    //topBar.backgroundColor = [UIColor colorWithPatternImage:[ImageUtils imageWithName:@"top-bar.png"]];
    [self.view addSubview:topBar];
    
    l=0.025*topBar.frame.size.width;
    t=0.30*topBar.frame.size.height;
    w=0.10*topBar.frame.size.width;
    h=topBar.frame.size.height-2*t;
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(l, t, w, h);
    //[backButton setImage:[ImageUtils imageWithName:@"back-arrow.png"] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(goBack) forControlEvents:UIControlEventTouchUpInside];
    [topBar addSubview:backButton];
    
    l+=w+25;
    w=0.40*topBar.frame.size.width;
    heading = [[UILabel alloc] initWithFrame:CGRectMake(l, t, w, h)];
    heading.text = @"swapBBM";
    heading.backgroundColor = [UIColor clearColor];
    //heading.textColor = COLOR_FOR_HEADING;
    [topBar addSubview:heading];
    
    
}

-(void) goBack{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void) goHome{
    [self.navigationController popToRootViewControllerAnimated:NO];
}

- (void)registerForKeyboardNotifications{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWasShown:)
                                                 name:UIKeyboardWillShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillBeHidden:)
                                                 name:UIKeyboardWillHideNotification object:nil];
}

// Called when the UIKeyboardDidShowNotification is sent.
- (void)keyboardWasShown:(NSNotification*)aNotification{
    
    //logTrace(@"keyboard being shown");
    
    NSDictionary* info = [aNotification userInfo];
    CGSize kbSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
    UIEdgeInsets contentInsets = UIEdgeInsetsMake(0.0, 0.0, kbSize.height, 0.0);
    scrollView.contentInset = contentInsets;
    scrollView.scrollIndicatorInsets = contentInsets;
    
    // If active text field is hidden by keyboard, scroll it so it's visible
    // Your application might not need or want this behavior.
    CGRect aRect = self.view.frame;
    aRect.size.height -= kbSize.height;
    
//    NSLog(@"x: %f %f, y: %f %f", aRect.origin.y, aRect.size.height, activeField.frame.origin.x, activeField.frame.origin.y);
    
    if (!CGRectContainsPoint(aRect, activeField.frame.origin) ) {
        CGPoint scrollPoint = CGPointMake(0.0, activeField.frame.origin.y-kbSize.height);
        [scrollView setContentOffset:scrollPoint animated:YES];
    }
}

// Called when the UIKeyboardWillHideNotification is sent
- (void)keyboardWillBeHidden:(NSNotification*)aNotification
{
//    UIEdgeInsets contentInsets = UIEdgeInsetsZero;
//    scrollView.contentInset = contentInsets;
//    scrollView.scrollIndicatorInsets = contentInsets;
    
    [scrollView setContentOffset:CGPointZero animated:YES];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField{
//    logTrace(@"text field being edited");
    activeField = textField;
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    activeField = nil;
}


-(BOOL) textFieldShouldReturn:(UITextField *)textField{
    
    //    [super textFieldShouldReturn:textField];
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
