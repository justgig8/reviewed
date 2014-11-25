//
//  Utitilty.h
//  Barleyz
//
//  Created by weird logics on 05/02/13.
//  Copyright (c) 2013 minds.weird@gmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Utility : NSObject


+(Utility*)sharedInstance;

+(NSString *)getDeviceUUID;

//Frame Resizing for differnet iPhone and iPod Screen.
+(CGRect)resizeFrameToIphoneFive:(CGRect)frame isIphoneFive:(BOOL)boolValue;
+(CGRect)resizeFrameToIphoneFour:(CGRect)frame isIphoneFive:(BOOL)boolValue;
+(CGRect)resetFrameHeightToIphoneFour:(CGRect)frame isIphoneFive:(BOOL)boolValue;

+(float)heightOfText:(NSString *)text width:(float)width withFont:(UIFont *)font;
+(float)widthOfText:(NSString *)text height:(float)h withFont:(UIFont *)font;


+(id)findClass:(id)forClass onViews:(NSArray *)onViews;


+(void)setAttributesForNavigationTitle:(UIColor*)textColor shadowColor:(UIColor*)shadowColor font:(NSString*)fontName size:(float)size;

+(UIView*)headerFooterForTableView:(CGRect)frame fontName:(NSString*)font sizeOfText:(float)size titleText:(NSString*)titleText type:(short)type;

+(void)scrollToTopAnimationBlock:(NSInteger)sectionOpened view:(UITableView*)tableView view:(UIView*)view;
+(void)setTableCOntentOffset:(UITableView*)table originalSize:(CGSize)currentSize;
+(BOOL)mobileNumberKeyPadEntryWithText:(NSString *)completeText renge:(NSRange)range string:(NSString *)string;
+ (NSString *)encodeURLComponent:(NSString *)string;
@end
