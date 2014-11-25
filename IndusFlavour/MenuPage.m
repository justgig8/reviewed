//
//  MenuPage.m
//  IndusFlavour
//
//  Created by WL004 on 08/08/13.
//  Copyright (c) 2013 WL004. All rights reserved.
//

#import "MenuPage.h"
#import "MemoryData.h"
#import "MenuHandler.h"
#import "Menu.h"
#import "Section.h"
#import "Categorie.h"
#import "Subcategory.h"
#import "Item.h"
#import "FeedbackData.h"
@interface MenuPage ()
{
    NSMutableDictionary *categoryItemMap;
    NSMutableArray *itemSelectedArray;
}
@property(nonatomic,retain)NSMutableDictionary *allItemMap;

@property(nonatomic,strong)NSMutableArray *itemSelectedArray;
@end

@implementation MenuPage
@synthesize tableview,itemSelectedArray,allItemMap;

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
    
    categoryItemMap = [[NSMutableDictionary alloc] init];
    
    itemSelectedArray = [[NSMutableArray alloc]init];
    tableview.backgroundColor = [UIColor clearColor];
    tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    Menu *menu = [MemoryData getMenu];
    [self process: menu];
    
    // Do any additional setup after loading the view from its nib.
    
}

-(void) process: (Menu *)menu{
    
    for (Section *sec in menu.list) {
        for (Categorie *cat in sec.list) {
            NSLog(@"Sections:%@",sec.list);
            NSMutableArray *array = [[NSMutableArray alloc] init];
            for (Subcategory *subcat in cat.list) {
                for (Item *item in subcat.list) {
                    [array addObject: item];
                }
            }
            
            [categoryItemMap setObject:array forKey:cat.name];
        }
    }
}

-(IBAction) reset: (id)sender{
    
    [itemSelectedArray removeAllObjects];
    
    [tableview reloadData];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
    [[FeedbackData sharedFeedbackData]setQuestionList:nil];
    [[FeedbackData sharedFeedbackData] getCurrentFeedback];
    NSIndexPath *selectedIndex = [tableview indexPathForSelectedRow];
    
    [super viewWillAppear:animated];
    
    //Re select cell
    [tableview selectRowAtIndexPath:selectedIndex animated:NO scrollPosition:UITableViewScrollPositionNone];
}


-(IBAction)next:(id)sender
{
    
    if (self.itemSelectedArray.count>0) {
        
        [[FeedbackData sharedFeedbackData] setQuestionList:self.itemSelectedArray];
        NSLog(@"SELECTED ITEMS LIST : %@",self.itemSelectedArray);
        
        UserRatingPage *page = [[UserRatingPage alloc] initWithNibName:@"UserRatingPage" bundle:nil];
        [ViewUtils forwardFrom:self to:page];
        
    }else{
        
        MultiSelectionPage *page = [[MultiSelectionPage alloc]initWithNibName:@"MultiSelectionPage" bundle:nil];
        [ViewUtils forwardFrom:self to:page];
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [categoryItemMap allKeys].count;
}

-(UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    float height = [self tableView:tableView heightForHeaderInSection:section];
    UIView *x = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, height)];
    x.backgroundColor = [UIColor colorWithRed:140/255 green:140/255 blue:140/255 alpha:0.75];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 0.90*tableView.frame.size.width, height)];
    label.backgroundColor = [UIColor clearColor];
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentRight;
    label.font = [UIFont boldSystemFontOfSize:24];
    label.text = [[categoryItemMap allKeys] objectAtIndex:section];
    
    [x addSubview:label];
    
    return x;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSArray *array =  [categoryItemMap objectForKey:[[categoryItemMap allKeys] objectAtIndex:section]];
    return array.count;
}

- (CGFloat)tableView:(UITableView *)atableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 58;
}

-(CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 65;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSArray *array =  [categoryItemMap objectForKey:[[categoryItemMap allKeys] objectAtIndex:indexPath.section]];
    Item *item = [array objectAtIndex:indexPath.row];
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    if (cell) {
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setImage:[UIImage imageNamed:@"item-checkbox.png"] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"item-checkbox-hover.png"] forState:UIControlStateSelected];
        [button addTarget:self action:@selector(selectItem:) forControlEvents:UIControlEventTouchUpInside];
        button.frame = CGRectMake(520,5, 49, 48);
        button.tag = [item.identifier intValue];
        cell.textLabel.text = [item name];
        cell.textLabel.textColor = [UIColor whiteColor];
        cell.textLabel.font = [UIFont boldSystemFontOfSize:24];
        cell.backgroundColor = [UIColor clearColor];
        [cell addSubview:button];
    }
    
    return cell;
}


-(void)selectItem:(UIButton *)sender{
    int tag = sender.tag;
    sender.selected = !sender.selected;
    for (NSArray *array in [categoryItemMap allValues]) {
        for (Item *item in array) {
            if ([item.identifier intValue]==tag) {
                if (sender.selected) {
                    [self.itemSelectedArray addObject:item];
                }else {
                    [self.itemSelectedArray removeObject:item];
                }
                break;
            }
        }
    }
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
