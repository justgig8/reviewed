//
//  UserRatingPage.h
//  IndusFlavour
//
//  Created by WL004 on 08/08/13.
//  Copyright (c) 2013 WL004. All rights reserved.
//

#import "EveryPage.h"
@class FeedBackDataManager;
@interface UserRatingPage : EveryPage
{
    float cellHeight;
    FeedBackDataManager *feedBackDataManager;
    
}

@property(nonatomic,retain) IBOutlet UITableView *tableView;
@property(nonatomic,retain)NSMutableArray *tableDataDetails;


@end
