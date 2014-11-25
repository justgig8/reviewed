//
//  UserPageViewController.h
//  IndusFlavour
//
//  Created by WL004 on 08/08/13.
//  Copyright (c) 2013 WL004. All rights reserved.
//

#import "EveryPage.h"

@interface UserPage : EveryPage<UITextFieldDelegate>


@property(nonatomic,strong)IBOutlet UITextField *name;
@property(nonatomic,strong)IBOutlet UITextField *mobile;
@property(nonatomic,strong)IBOutlet UITextField *username;
@property(nonatomic,strong)IBOutlet UITextField *domain;

@property(nonatomic,strong)IBOutlet UITextField *birthday;
@property(nonatomic,strong)IBOutlet UITextField *anniversary;

@property(nonatomic,strong)IBOutlet UITextField *houseNo;
@property(nonatomic,strong)IBOutlet UITextField *area;


@property(nonatomic,strong)IBOutlet UIButton *btnSubmit;
@property(nonatomic,strong)IBOutlet UIButton *btnGetBirthDate;
@property(nonatomic,strong)IBOutlet UIButton *btnGetAnniDate;

@property(nonatomic,strong)IBOutlet UILabel *message;

@end
