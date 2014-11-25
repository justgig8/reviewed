//
//  FeedBackDataManager.h
//  PianoMan
//
//  Created by weird logics on 28/05/13.
//  Copyright (c) 2013 Weird Logics. All rights reserved.
//

#import "UIDataManager.h"

#import "UserProfile.h"

@interface FeedBackDataManager : UIDataManager   <NetworkResourcerDelegate>


@property(nonatomic,retain)UserProfile *customer;
@property(nonatomic,retain)NSString *merchant;
@property(nonatomic,retain)NSString *category;

@end
