//
//  UserRatingPage.m
//  IndusFlavour
//
//  Created by WL004 on 08/08/13.
//  Copyright (c) 2013 WL004. All rights reserved.
//

#import "UserRatingPage.h"
#import "FeedbackTableCell.h"
#import "FeedBackDataManager.h"
#import "UserPage.h"
#import "Item.h"
#import "MemoryData.h"
#import "FeedbackData.h"
#import "Resourcer.h"
#import "SlidingView.h"
#import "Feedback.h"

@implementation UserRatingPage

@synthesize tableView,tableDataDetails;

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
    tableDataDetails = [[NSMutableArray alloc] init];

    UITapGestureRecognizer *tapper = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(goBack)];
    tapper.numberOfTapsRequired=3;
    [self.view addGestureRecognizer:tapper];
    
    self.swiper.enabled = NO;
  
    for (Item *item in [[FeedbackData sharedFeedbackData] questionList]) {
        FeedbackCellDetails *details = [[FeedbackCellDetails alloc] init];
        details.title = item.name;
        [tableDataDetails addObject:details];
    }
    cellHeight = 130;
    
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    NSLog(@"user ratings page loaded");
}

-(void)feedbackTableCell:(FeedbackTableCell *)cell addFeedBackCat:(NSString *)catText reponseText:(NSString *)responseText
{
    NSString *name = [NSString stringWithFormat:@"%@_%ld",catText,(long)cell.tag];
    
    Response *reponse = [[FeedbackData sharedFeedbackData] addResponseText:responseText questionName:name questionText:cell.lblTitle.text andCategory:catText];
}


-(void)feedbackTableCell:(FeedbackTableCell *)cell removeFeedBackCat:(NSString *)catText reponseText:(NSString *)responseText
{
    NSLog(@"Remove form Feedback ");
    
}




#pragma mark - Table view data source
-(UIView*)tableView:(UITableView*)tableView viewForHeaderInSection:(NSInteger)section {
    NSString *title = [NSString stringWithFormat:@"%@          %@       %@",@"Date",@"Order Number",@"Price"];
    UIView *views = [[UIView alloc] initWithFrame:CGRectMake(0, 0,self.view.frame.size.width,25)];
    views.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"yellow.png"]];
    UILabel *lblTitle = [Resourcer labelWithFrame:CGRectMake(15, 0,self.view.frame.size.width,25) andText:title];
    [views addSubview:lblTitle];
    return views;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    // Return the number of rows in the section.
    int count = [self.tableDataDetails count];
    return count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    FeedbackTableCell *cell = [[FeedbackTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    if (cell) {
        cell.backgroundColor = [UIColor clearColor];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.delegate = (id)self;
        cell.tag = indexPath.row;
        FeedbackCellDetails *x = [self.tableDataDetails objectAtIndex:indexPath.row];
        [cell addDetailsInTableCell:cell restaurantDetails:x cellHeight:cellHeight];
    }
    return cell;
}

#pragma mark - Table view delegate

- (NSIndexPath *)tableView:(UITableView *)tableViews willSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableViews deselectRowAtIndexPath:indexPath animated:NO];
    return indexPath;
}

- (void)tableView:(UITableView *)tableViews didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableViews deselectRowAtIndexPath:indexPath animated:NO];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return cellHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0;
}

-(IBAction)next:(id)sender{
    MultiSelectionPage *page = [[MultiSelectionPage alloc]initWithNibName:@"MultiSelectionPage" bundle:nil];
    [ViewUtils forwardFrom:self to:page];
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
