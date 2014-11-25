//
//  Testimonial.h
//  MasalaIndia
//
//  Created by Anil Khanna on 8/2/13.
//  Copyright (c) 2013 WL004. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Testimonial : NSObject

@property(nonatomic,strong) NSString *name;
@property(nonatomic,strong) UIImage *image;
@property(nonatomic,strong) NSDate *date;
@property(nonatomic,strong) NSString *text;

@end
