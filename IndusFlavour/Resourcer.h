//
//  Resourcer.h
//  Shah
//
//  Created by Apple on 18/12/12.
//  Copyright (c) 2012 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Resourcer : NSObject

+(UIView *)getBlackView: (float)alpha and: (CGRect)frame;

+(UIView *) viewWithFrame: (CGRect)frame;
+(UIView *) viewWithFrame: (CGRect)frame andImageName:(NSString *)imageName;


+(UIButton *) buttonWithFrame:(CGRect)frame andImageName:(NSString *)imageName target:(id)target selector:(SEL)sel;
+(UIButton *) buttonWithFrame:(CGRect)frame withTitle:(NSString *)btnName andBackgroundImageName:(NSString *)imageName;

//Button Options-----------------
+(UIButton *) buttonWithFrame:(CGRect)frame withTitle:(NSString *)btnName target:(id)target selector:(SEL)sel;
+(UIButton *) buttonWithFrame:(CGRect)frame withTitle:(NSString *)btnName andBackgroundImageName:(NSString *)imageName withFont:(UIFont *)font;
+(UIButton *) buttonWithFrame:(CGRect)frame withTitle:(NSString *)btnNTitle andBackgroundImageName:(NSString *)imageName withFont:(UIFont *)font normalTextColor:(UIColor *)ncolor selectedTextColor:(UIColor *)scolor;
+(UIButton *) buttonWithFrame:(CGRect)frame withNormalTitle:(NSString *)btnNTitle withSelectedTitle:(NSString *)btnSTitle andBackgroundImageName:(NSString *)imageName withFont:(UIFont *)font normalTextColor:(UIColor *)ncolor selectedTextColor:(UIColor *)scolor;
+(UIButton *) buttonWithFrame:(CGRect)frame andSigleImageName:(NSString *)imageName;
+(UIButton *) buttonWithFrame:(CGRect)frame andImageName:(NSString *)imageName;
+(UIButton *) buttonWithFrame:(CGRect)frame;


+(UIImageView *) imageViewWithFrame:(CGRect)frame andImageName:(NSString *)imageName;
+(UIImageView *) imageViewWithImageName:(NSString *)imageName  originPoint:(CGPoint)orgin;
+(UIImageView *) imageViewWithImageName:(NSString *)imageName withCenterPoint:(CGPoint)center;
+(UIImage *) imageWithName :(NSString *)name;
+(UILabel *) labelWithFrame:(CGRect)frame andText: (NSString *)text;
+(UILabel *) labelWithFrame:(CGRect)frame andText: (NSString *)text ofSize: (int)x andBold: (bool)bold;
+(UILabel *) labelWithFrame:(CGRect)frame andText:(NSString *)text ofSize: (int)x withFontName:(NSString *)fontName;
+(UILabel *) labelWithFrame:(CGRect)frame andText:(NSString *)text ofSize: (int)x withFontName:(NSString *)fontName textAlignment :(NSTextAlignment) textAignment;
+(UILabel *) labelWithFrame:(CGRect)frame andText: (NSString *)text ofSize: (int)x;
+(UIScrollView *) scrollViewWithFrame:(CGRect)frame;

+(UIView *)addSearchInputScreen:(CGRect)frame textColor:(UIColor *)color withDefaultText:(NSString *)text backImageName:(NSString *)imgName textFiledOrigin:(CGPoint)origin textFieldDelegate:(id)delegate;

+(UIView *) getTextFieldViewWith:(CGRect)frame withImage:(NSString *)imageName and:(NSString *)defaultText and:(float)leftMargin and:(float)topMargin and:(UIColor *)textColor and:(int)fontSize and:(NSString *)fontType and:(int)textFieldTag and:(id)delegate textField:(UITextField *)textField;

@end
