//
//  MultiSelectionPage.m
//  IndusFlavour
//
//  Created by WL004 on 08/08/13.
//  Copyright (c) 2013 WL004. All rights reserved.
//

#import "MultiSelectionPage.h"
#import "Feedback.h"
#import "SSTextView.h"
#import "Review.h"
#import "FeedbackData.h"
#import "FeedBackDataManager.h"
#import "Initializer.h"

@interface MultiSelectionPage(){
 
    NSArray *array;
    NSMutableArray *buttons;
    NSMutableArray *answers;
}

@end


@implementation MultiSelectionPage

@synthesize textView;
@synthesize message;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    array = [NSArray arrayWithObjects:@"100",@"101",@"102", @"200",@"201",@"202", @"300",@"301",@"302", nil];
    buttons = [[NSMutableArray alloc] initWithCapacity:array.count];
    
    answers = [[NSMutableArray alloc] init];
    
    textView.placeholder = @"Any Suggestion";
    textView.placeholderTextColor = [UIColor whiteColor];
    textView.autocorrectionType = UITextAutocorrectionTypeNo;
    [textView setFont:[UIFont fontWithName:@"Helvetica neue" size:20.0]];
    textView.backGrooundImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"input-suggestion.png" ]];
    [self.view addSubview:textView];
    // Do any additional setup after loading the view from its nib.
}

-(void) viewDidAppear:(BOOL)animated{
    
    [super viewDidAppear:animated];

    UIButton *button;
    for (NSString *tag in array) {
        button = (UIButton *)[self.view viewWithTag:[tag intValue]];
        [buttons addObject:button];
    }
}

-(IBAction)select:(id)sender{
    UIButton *button = (UIButton *)sender;
    
    for (int i=0; i<=2; i++) {
        int value = 0;
        if (button.tag >=100 && button.tag<=110) {
            value = 0;
        }else if(button.tag >=200 && button.tag<=210){
            value = 1;
        }else if(button.tag >=300 && button.tag<=310){
            value = 2;
        }
        
        NSLog(@"value :%d",value);
        
        UIButton *btn;
        switch (value) {
            case 0:
                btn = (UIButton*)[self.view viewWithTag:100+i];
                 btn.selected = NO;
            [answers removeObject: [NSString stringWithFormat:@"%d",btn.tag]];
            break;
            case 1:
               btn = (UIButton*)[self.view viewWithTag:200+i];
                 btn.selected = NO;
                [answers removeObject: [NSString stringWithFormat:@"%d",btn.tag]];
                break;
            case 2:
                btn = (UIButton*)[self.view viewWithTag:300+i];
                 btn.selected = NO;
                [answers removeObject: [NSString stringWithFormat:@"%d",btn.tag]];
                break;
            }
    }
    
        button.selected=YES;
        int tag = button.tag;
        NSLog(@"clicked button for tag: %d", tag);
        [answers addObject: [NSString stringWithFormat:@"%d", tag]];
        if (tag%100==0) {
            button = (UIButton *)([self.view viewWithTag:tag+1]);
           // button.selected=NO;
            button = (UIButton *)([self.view viewWithTag:tag+2]);
            button.selected=NO;
        }else if (tag%100==1) {
            button = (UIButton *)([self.view viewWithTag:tag-1]);
            //button.selected=NO;
            button = (UIButton *)([self.view viewWithTag:tag+1]);
            button.selected=NO;
        }else if (tag%100==2) {
            button = (UIButton *)([self.view viewWithTag:tag-2]);
           // button.selected=NO;
            button = (UIButton *)([self.view viewWithTag:tag-1]);
            button.selected=NO;
        }
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self resign];
}

-(void) resign{
    
     [textView resignFirstResponder];
}

-(IBAction)next:(id)sender
{
    [self resign];
    
    NSLog(@"data captured: %@", [self dataCaptured]);
    
    int code = [self validate];
    
    if (code==0) {
        
        [self setAnswers];

        [self submit];
        
//        UserPage *page = [[UserPage alloc] initWithNibName:@"UserPage" bundle:nil];
//        [ViewUtils forwardFrom:self to:page];
    }else{
        
        message.text = @"Please complete all entries above.";
        message.alpha=0;
        [UIView animateWithDuration:2 animations:^(void) {
            message.alpha=1;
        }];
    }
}


-(void) submit{
    
    Feedback *feedbackObj = [[FeedbackData sharedFeedbackData] getCurrentFeedback];
    feedbackObj.merchant = [Initializer merchantName];
    
    NSLog(@"feedbackObj :%@",feedbackObj);
    FeedBackDataManager *abc = [[FeedBackDataManager alloc] init];
    [abc setupCreateReuestWithText:feedbackObj];

    ThankYouPage *page = [[ThankYouPage alloc] initWithNibName:@"ThankYouPage" bundle:nil];
    [ViewUtils forwardFrom:self to:page];
}


-(void) setAnswers{
    
    int count=0;
    
    NSLog(@"Answers %d", [answers count]);
    
    NSLog(@"map: %@", [[MemoryData map] allKeys]);
    
    for (NSString *each in answers) {
        int x = [each intValue]%100;
      
        FeedBackQuestion *question = [[MemoryData map] objectForKey:[NSString stringWithFormat:@"%d", count]];
        NSLog(@"question: %@", question);
        NSLog(@"question list: %@ x: %d", question.list, x);
        
        question.answer = [question.list objectAtIndex:x];
   
        NSLog(@"question.answer %@",question.answer);
        
        [[FeedbackData sharedFeedbackData] addResponseText:question.answer questionName:question.identifier questionText:question.question andCategory:@"General"];
        count++;
    }
    
    NSLog(@"Current FeedBack %@",[[FeedbackData sharedFeedbackData] getCurrentFeedback]);
    
    
//    Review *review = [[Review alloc] init];
//    review.type = @"reviewType";
//    review.comment = textView.text;
//    [[FeedbackData sharedFeedbackData] addReviewWithType:review.type andComment:review.comment];
}

-(int) validate{
    
    int code=0;
    if (answers.count!=3) {
        code = 100;
    }
    
    return code;
}

-(NSString *)dataCaptured{
    
    NSString *suggestions = textView.text;
    
    answers = [NSMutableArray arrayWithArray:
    [answers sortedArrayUsingComparator:^(id string1, id string2) {
        return [((NSString *)string1) compare:((NSString *)string2)
                                      options:NSNumericSearch];
    }]];
    
    return [NSString stringWithFormat:@"answers: %@, suggestions: %@", answers, suggestions];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
