//
//  MultiSelectionPage.h
//  IndusFlavour
//
//  Created by WL004 on 08/08/13.
//  Copyright (c) 2013 WL004. All rights reserved.
//

#import "EveryPage.h"

@class SSTextView;

@interface MultiSelectionPage : EveryPage

@property (nonatomic, retain) IBOutlet SSTextView *textView;

@property(nonatomic,strong)IBOutlet UILabel *message;

@end
