//
//  Utitilty.m
//  Barleyz
//
//  Created by weird logics on 05/02/13.
//  Copyright (c) 2013 minds.weird@gmail.com. All rights reserved.
//

#import "Utility.h"

#define NUMBERS_ONLY @"1234567890"
#define CHARACTER_LIMIT 10
@implementation Utility



static Utility *sharedInctance;


+(NSString *)getDeviceUUID{
    return [[[UIDevice currentDevice] identifierForVendor] UUIDString];
}

+(Utility*) sharedInstance{
    
	@synchronized(self){
		if(!sharedInctance){
			sharedInctance = [[Utility alloc]init];
		}
	}
	return sharedInctance;
}



+(CGRect)resizeFrameToIphoneFive:(CGRect)frame isIphoneFive:(BOOL)boolValue{
    
    if (boolValue) {
        float screenRatio = 568.0/480.0;
        frame.size.width *=screenRatio;
        frame.size.height *=screenRatio;
        frame.origin.y *=screenRatio;
    }
    return frame; 
}

+(CGRect)resizeFrameToIphoneFour:(CGRect)frame isIphoneFive:(BOOL)boolValue{
    
    if (!boolValue) {
        float screenRatio = 480.0/568.0;
        frame.size.width *=screenRatio;
        frame.size.height *=screenRatio;
        frame.origin.y *=screenRatio;
    }
    return frame;
}


+(CGRect)resetFrameHeightToIphoneFour:(CGRect)frame isIphoneFive:(BOOL)boolValue{
    
    if (!boolValue) {
        float screenRatio = 480.0/568.0;
        frame.size.height *=screenRatio;
        frame.origin.y *=screenRatio;
    }
    return frame;
}





+(float)heightOfText:(NSString *)text width:(float)width withFont:(UIFont *)font{
    
    CGSize frame = [text sizeWithFont:font constrainedToSize:CGSizeMake(width,999) lineBreakMode:NSLineBreakByWordWrapping];
    return frame.height;
}


+(float)widthOfText:(NSString *)text height:(float)h withFont:(UIFont *)font{
    
    CGSize frame = [text sizeWithFont:font constrainedToSize:CGSizeMake(999,h) lineBreakMode:NSLineBreakByWordWrapping];
    return frame.width;
}



+(id)findClass:(id)forClass onViews:(NSArray *)onViews {
	
	id controller = nil;
	Class class;
	//check whether forClass variable is not belong to NSString class if yes then fetch the name of class From the string
	if([forClass isKindOfClass:[NSString class]]) {
		class = NSClassFromString(forClass);
	}else {
		class = forClass;
	}
	//find object from array of object
	for(int i = 0; i < [onViews count]; i++) {
		
		if([[onViews objectAtIndex:i] isKindOfClass:class]) {
			controller = [onViews objectAtIndex:i];
			break;
		}
	}
	return controller;
}


//SCROLLING SECTION ZTO TOP OF TABLE VIEW//
+(void)scrollToTopAnimationBlock:(NSInteger)sectionOpened view:(UITableView*)tableView view:(UIView*)view{
    
    [UIView animateWithDuration:0.4 delay:0.3
                        options:UIViewAnimationOptionCurveLinear animations:^{
                            
                            CGRect cellRect = [tableView rectForSection:sectionOpened];
                            CGPoint origin = [tableView convertPoint:cellRect.origin fromView:view];
                            [tableView setContentOffset:CGPointMake(0, origin.y)];
                            
                        } completion:^(BOOL finished) {
                            
                        }];
    
}

+(void)setTableCOntentOffset:(UITableView*)table originalSize:(CGSize)currentSize{
    
    [table setContentInset:UIEdgeInsetsMake(0, 0, 0, 0)];
    [table setContentSize:currentSize];
    
}

+(void)setAttributesForNavigationTitle:(UIColor*)textColor shadowColor:(UIColor*)shadowColor font:(NSString*)fontName size:(float)size{
    
    NSDictionary *navbarTitleTextAttributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                               textColor,UITextAttributeTextColor,
                                               [UIColor blackColor], UITextAttributeTextShadowColor,
                                               [NSValue valueWithUIOffset:UIOffsetMake(-1, 0)], UITextAttributeTextShadowOffset,[UIFont fontWithName:fontName size:size], UITextAttributeFont, nil];
    [[UINavigationBar appearance] setTitleTextAttributes:navbarTitleTextAttributes];
}

+(UIView*)headerFooterForTableView:(CGRect)frame fontName:(NSString*)font sizeOfText:(float)size titleText:(NSString*)titleText type:(short)type{
    
    UIView *footer = nil;
    UILabel *label = nil;
    
    CGRect footerFrame = frame;
    CGSize labelsize = CGSizeZero;
    CGRect labelFrame = CGRectZero;
    
    if (type == 0) {    //FOR HEADER//
        labelFrame = CGRectMake(15, 0, footerFrame.size.width - 20,footerFrame.size.height);
        
    }else{  //FOR FOOTER//
        labelsize = [titleText sizeWithFont:[UIFont fontWithName:font size:size+5.0] constrainedToSize:CGSizeMake(250, 300.0) lineBreakMode:NSLineBreakByWordWrapping];
        labelFrame = CGRectMake(15, -15, footerFrame.size.width - 20,labelsize.height);
    }
    
    footer = [[UIView alloc] initWithFrame:footerFrame];
    label = [[UILabel alloc] initWithFrame:labelFrame];
    label.textColor = [UIColor whiteColor];
    label.backgroundColor = [UIColor clearColor];
    
    if (type == 1) {
        label.textAlignment = NSTextAlignmentCenter;
    }
    
    label.numberOfLines = 0;
    
    label.text = titleText;
    label.font = [UIFont fontWithName:font size:size];
    [footer setBackgroundColor:[UIColor clearColor]];
    [footer addSubview:label];
    return footer;
    
}

+(BOOL)mobileNumberKeyPadEntryWithText:(NSString *)completeText renge:(NSRange)range string:(NSString *)string{
    NSUInteger newLength = [completeText length] + [string length] - range.length;
    NSCharacterSet *cs = [[NSCharacterSet characterSetWithCharactersInString:NUMBERS_ONLY] invertedSet];
    NSString *filtered = [[string componentsSeparatedByCharactersInSet:cs] componentsJoinedByString:@""];
    return (([string isEqualToString:filtered])&&(newLength <= CHARACTER_LIMIT));
    
}



+ (NSString *)encodeURLComponent:(NSString *)string
{
    NSString *s = [string stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    return s;
}

@end
