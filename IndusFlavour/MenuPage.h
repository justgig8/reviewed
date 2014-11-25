//
//  MenuPage.h
//  IndusFlavour
//
//  Created by WL004 on 08/08/13.
//  Copyright (c) 2013 WL004. All rights reserved.
//

#import "EveryPage.h"

@interface MenuPage : EveryPage<UITableViewDelegate>
@property(nonatomic,strong)IBOutlet UITableView *tableview;

@end
