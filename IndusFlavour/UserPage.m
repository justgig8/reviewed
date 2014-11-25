//
//  UserPageViewController.m
//  IndusFlavour
//
//  Created by WL004 on 08/08/13.
//  Copyright (c) 2013 WL004. All rights reserved.
//

#import "UserPage.h"

#import "WLDatePicker.h"
#import "UIDataManager.h"
#import "Feedback.h"
#import "FeedbackData.h"
#import "FeedBackDataManager.h"

@interface UserPage ()
{
    WLDatePicker *datePicker;
    short currentTag;
 
    NSArray *array;
}
@end

@implementation UserPage

@synthesize name;
@synthesize mobile;
@synthesize username;
@synthesize domain;
@synthesize birthday;
@synthesize anniversary;
@synthesize houseNo;
@synthesize area;
@synthesize btnGetAnniDate,btnGetBirthDate;
@synthesize message;

@synthesize btnSubmit;

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
   // Do any additional setup after loading the view.
    
    array = [[NSArray alloc] initWithObjects:name,mobile,username,domain,birthday,anniversary,houseNo,area, nil];
    UserProfile *userProfile = [[UserProfile alloc] init];
    name.text = userProfile.name;
    
    for (UITextField *each in array) {
        each.delegate=self;
    }
}

-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField{
    
    [super textFieldShouldReturn:textField];
    
    int index = [array indexOfObject:textField];
    if (index<[array count]-1) {
        [[array objectAtIndex:++index] becomeFirstResponder];
    }else{
        [self submit:btnSubmit];
    }
    
    return YES;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string  {
     if (textField==mobile) {
        
        return [Utility mobileNumberKeyPadEntryWithText:textField.text renge:range string:string];
    }
    return YES;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    
    [self resign];
}

-(void) resign{
    
    for (UITextField *each in array) {
        [each resignFirstResponder];
    }
}

-(IBAction)pickDate:(id)sender
{
    [self resign];
    UIButton *button = (UIButton *)sender;
    currentTag = button.tag;
    
    CGRect frame = self.view.bounds;
    frame.origin.y =  frame.size.height;
    datePicker = [[WLDatePicker alloc] initWithFrame:frame];
    datePicker.delegate = (id)self;
    [self.view addSubview:datePicker];
    
    if (currentTag == 1){
        if (birthday.text &&  birthday.text.length>0) {
            datePicker.datePickerView.date = [self getDate: birthday.text];
        }
        
    } else {
        if (anniversary.text && anniversary.text.length>0) {
            datePicker.datePickerView.date  = [self getDate: anniversary.text];
        } 
    }
}

-(NSDate *) getDate: (NSString *)ddmmyyyy{
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:FORMAT_DATE];
    return [dateFormatter dateFromString:ddmmyyyy];
}

-(void)datePicker:(WLDatePicker *)view pickedDateText:(NSString *)text{
    
    if (currentTag == 1){
        birthday.text = text;
    } else {
        anniversary.text = text;
    }
}

-(void)datePickerGetHidden:(WLDatePicker *)view{
    
}

-(void) textFieldDidBeginEditing:(UITextField *)textField{
    [super textFieldDidBeginEditing:textField];
    message.alpha=0;
}

-(IBAction)submit:(id)sender
{
    [self resign];
    
    NSLog(@"data captured: %@", [self dataCaptured]);
    
    int code = [self validate];
    
    if (code==0) {
        
        UserProfile *user = [[MemoryData sharedMemoryData] currentCustomer];
        user.id = @"0";
        user.name = name.text;
        user.phone = mobile.text;
        user.email = [NSString stringWithFormat:@"%@@%@", username.text, domain.text];
        user.birthday = birthday.text;
        user.anniversary = anniversary.text;
     
        
        Feedback *feedbackObj = [[FeedbackData sharedFeedbackData] getCurrentFeedback];
        feedbackObj.merchant = @"Indus Flavour";
        [feedbackObj setCustomer:user];
        
        NSLog(@"feedbackObj :%@",feedbackObj);
        FeedBackDataManager *abc = [[FeedBackDataManager alloc] init];
        [abc setupCreateReuestWithText:feedbackObj];
//        
//        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Thank You" message:@"for Your Valuable Feedback" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:nil, nil];
//        [alert show];

        
        ThankYouPage *page = [[ThankYouPage alloc] initWithNibName:@"ThankYouPage" bundle:nil];
        [ViewUtils forwardFrom:self to:page];
    }else{
        
        message.text = [Validator messageForCode:code];
        message.alpha=0;
        [UIView animateWithDuration:2 animations:^(void) {
            message.alpha=1;
        }];
    }
    
    
}

-(void)createRequestCompleted:(UIDataManager *)dataManager withDataObject:(id)object{
    
    if (dataManager.networkResourcer.httpResponseCode >=  200 && dataManager.networkResourcer.httpResponseCode <= 300) {
        ///
        
    NSLog(@"httpcode:%d",dataManager.networkResourcer.httpResponseCode);
    
    }else {
        
    }
    [btnSubmit setEnabled:YES];
}

-(void)createRequestFailed:(UIDataManager *)dataManager withError:(NSError *)error{
    
    [btnSubmit setEnabled:YES];
}


-(int) validate{
    
    int code;
    
    code = [Validator validateMobile: mobile.text];
    if (code==0) {
        if(username.text.length>0)
        {
        code = [Validator validateEmail: [NSString stringWithFormat:@"%@@%@", username.text,  domain.text]];
        }else
            return code;
    }
    
    return code;
}

-(NSString *)dataCaptured{
    
    return [NSString stringWithFormat:@"name: %@, mobile: %@, email: %@@%@, birthday: %@, anniversary: %@, houseNo: %@, area: %@", name.text, mobile.text, username.text, domain.text, birthday.text, anniversary.text, houseNo.text, area.text];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
