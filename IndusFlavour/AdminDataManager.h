//
//  TableLayoutDataManager.h
//  IndusFlavour
//
//  Created by Weird Logics4 on 5/29/13.
//  Copyright (c) 2013 Weird Logics4. All rights reserved.
//

#import "UIDataManager.h"

@interface AdminDataManager : UIDataManager

+(NetworkResponse *)placePadOnTable:(NSString*)merchantName table:(NSString*)tableNo;

@end
