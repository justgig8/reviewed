//
//  Image.h
//  Barleyz
//
//  Created by weird logics on 25/01/13.
//  Copyright (c) 2013 minds.weird@gmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Image :  NSObject {
    
    NSString *name;
    NSString *originalLocation;
}
@property(nonatomic,retain) NSString *name;
@property(nonatomic,retain) NSString *originalLocation;

-(NSString*)description;
@end


