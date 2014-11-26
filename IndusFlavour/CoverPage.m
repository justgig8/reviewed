//
//  ViewController.m
//  IndusFlavour
//
//  Created by WL004 on 08/08/13.
//  Copyright (c) 2013 WL004. All rights reserved.
//

#import "CoverPage.h"
#import "MenuHandler.h"
#import "Initializer.h"
#import "Menu.h"
#import "MemoryData.h"
#import "AdminDataManager.h"
#import "NetworkResponse.h"
#import "Order.h"
#import "OrderItem.h"
#import "Item.h"
#import "UserRatingPage.h"
#import "FeedbackCellDetails.h"
#import "FeedbackData.h"
#import "SubOrder.h"
#import "UserProfile.h"
#import "Categorie.h"
#import "Subcategory.h"
#import "Section.h"
@interface CoverPage ()
{
    UITextField *txtField;
    UIView *txtfieldView ;
    NSMutableArray *pickrArray;
    IBOutlet UIPickerView *picker;
    NSMutableArray *categoryList;
    NSMutableArray *orderedItemList;
    
    BOOL isVisible;
}

@end

@implementation CoverPage

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    categoryList = [[NSMutableArray alloc] init];
    orderedItemList = [[NSMutableArray alloc] init];
    pickrArray  = [[NSMutableArray alloc] init];
    for (int i=1;i<=30 ; i++) {
        [pickrArray addObject:[NSString stringWithFormat:@"%d",i]];
    }
    
    txtfieldView = [[UIView alloc] initWithFrame:CGRectMake(567, -100, 65, 66)];
    txtfieldView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"table-number.png"]];
    txtField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 65, 66)];
    txtField.backgroundColor = [UIColor clearColor];
    txtField.userInteractionEnabled = NO;
    txtField.textColor = [UIColor redColor];
    txtField.textAlignment = NSTextAlignmentCenter;
    txtField.delegate = (id)self;
    [txtField setFont:[UIFont fontWithName:@"Helvetica Neue" size:44.0]];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 3, 65, 66);
    [btn addTarget:self action:@selector(showPicker:) forControlEvents:UIControlEventTouchUpInside];
    [txtField addSubview:btn];
    [txtfieldView addSubview:txtField];
    [self.view addSubview:txtfieldView];
    
    
    UISwipeGestureRecognizer *swiper = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(next:)];
    swiper.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:swiper];
    
    // Do any additional setup after loading the view, typically from a nib.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(test) name:@"DATA RECEIVED" object:nil];
    [self getListItem];
}

-(void) test{
    [FeedbackData reset];
    [self getOrderedItem];
}

-(void)getOrderedItem {
    
    if (txtField.text.length>0) {
        
        NetworkResponse *response = nil;
        response = [AdminDataManager placePadOnTable:[Initializer merchantName] table:txtField.text];
        Order *order = [[Order alloc] init];
        order = response.responseObject;
        NSLog(@"order received: %@", order);
        
        NSMutableArray *items = [[NSMutableArray alloc] init];
        if (order) {
            for (SubOrder *each in order.suborder) {
                NSLog(@"order.suborder %@",each.item);
                for (OrderItem *eachItem in each.item) {
                    if ([categoryList containsObject:eachItem.categoryName]) {
                        Item *item = [[Item alloc] init];
                        item.name = eachItem.name;
                        item.identifier = eachItem.menuItemId;
                        [items addObject:item];
                    }
                }
            }
            
            UserProfile *profile = [[UserProfile alloc] init];
            profile.identifier = @"0";
            profile.name = order.customer;
            profile.phone = order.customerId;
            profile.userId = order.customerId;
            
            [[FeedbackData sharedFeedbackData] setQuestionList:items];
            [[FeedbackData sharedFeedbackData] getCurrentFeedback].orderId = order.identifier;
            [[FeedbackData sharedFeedbackData] getCurrentFeedback].customer = profile;
            [[FeedbackData sharedFeedbackData] getCurrentFeedback].merchant = [Initializer merchantName];
            
            NSLog(@"array%@",[[FeedbackData sharedFeedbackData] questionList]);
        }else{
            [self getmerchantMenu];
        }
    }
    NSLog(@"yuhoo");
}


-(void)textFieldDidEndEditing:(UITextField *)textField
{
    txtField.text = textField.text;
    NSLog(@"textfield:%@",textField.text);
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    txtField.text = @"";
    [FeedbackData reset];
    [self getmerchantMenu];
}

-(void)getListItem
{
    Menu *menu =  [MenuHandler getMenu:[Initializer merchantName] andIsUpdated:YES];
    if(menu){
        for (Section *sec in menu.list) {
            for (Categorie *cat in sec.list) {
                for (Subcategory *subCat in cat.list) {
                    [categoryList addObject:subCat.name];
                }
                
            }
        }
    }
    
}

-(void) getmerchantMenu{
    Menu *menu =  [MenuHandler getMenu:[Initializer merchantName] andIsUpdated:YES];
    if(menu){
        [MemoryData setCurrentMenu:menu];
    }
}

-(IBAction)setTableNumaber:(id)sender
{
    [UIView animateWithDuration:2.0 animations:^(void){
        txtfieldView.frame = CGRectMake(567, 15, 65, 66);
    }];
    if (!isVisible){
        
        [self showPicker:sender];
    }
    else{
        [self hidePicker];
        [self getOrderedItem];
    }
    
}

-(void)showPicker:(UIButton *)sender
{
    isVisible = YES;
    [UIView animateWithDuration:.3 animations:^(void){
        [self.view bringSubviewToFront:picker];
        CGRect pickerRct = picker.frame;
        pickerRct.origin.y -= 216;
        [picker setFrame:pickerRct];
    }completion:^(BOOL finished){
        [picker selectRow:0 inComponent:0 animated:YES];
        [self pickerView:picker didSelectRow:0 inComponent:0];
    }];
}

-(void)hidePicker
{
    isVisible = NO;
    [UIView animateWithDuration:.3 animations:^(void){
        CGRect pickerRct = picker.frame;
        pickerRct.origin.y += 216;
        [picker setFrame:pickerRct];
    }];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (isVisible) {
        [self hidePicker];
    }
    [self getOrderedItem];
    
}


- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [pickrArray objectAtIndex:row];
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return [pickrArray count];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    NSString *categoryType  = [pickrArray objectAtIndex:[pickerView selectedRowInComponent:0]];
    txtField.text = categoryType;
}

-(IBAction)skip:(id)sender;
{
    [self hidePicker];
    [UIView animateWithDuration:2.0 animations:^(void){
        txtfieldView.frame = CGRectMake(567, -100, 65, 66);
    }];
}

-(void) viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

-(void)next:(UISwipeGestureRecognizer *)sender{
    
    if ([[[FeedbackData sharedFeedbackData] questionList] count]) {
        UserRatingPage *page = [[UserRatingPage alloc] initWithNibName:@"UserRatingPage" bundle:nil];
        NSLog(@"QuestionList:%@",[[FeedbackData sharedFeedbackData] questionList]);
        [ViewUtils forwardFrom:self to:page];
    }
    else{
        MenuPage *page = [[MenuPage alloc] initWithNibName:@"MenuPage" bundle:nil];
        [ViewUtils forwardFrom:self to:page];
    }
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
