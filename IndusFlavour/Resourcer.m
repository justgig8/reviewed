//
//  Resourcer.m
//  Shah
//
//  Created by Apple on 18/12/12.
//  Copyright (c) 2012 Apple. All rights reserved.
//

#import "Resourcer.h"

@implementation Resourcer


+(UIView *)getBlackView: (float)alpha and: (CGRect)frame{
    
    UIView *x = [[UIView alloc] initWithFrame:frame];
    x.backgroundColor = [UIColor colorWithWhite:0 alpha:alpha];
    return x;
}

+(UIView *) viewWithFrame: (CGRect)frame{
    
    UIView *x = [[UIView alloc] initWithFrame:frame];
    x.backgroundColor = [UIColor clearColor];
    return x;
}

+(UIView *) viewWithFrame: (CGRect)frame andImageName:(NSString *)imageName {
    
    UIView *x = [[UIView alloc] initWithFrame:frame];
    UIImage *image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:imageName ofType:@"png"]];
    x.backgroundColor = [UIColor colorWithPatternImage:image];
    return x;
}


+(UIButton *) buttonWithFrame:(CGRect)frame andImageName:(NSString *)imageName target:(id)target selector:(SEL)sel{
    
    NSString *name1 = [NSString stringWithFormat:@"%@-static", imageName];
    NSString *name2 = [NSString stringWithFormat:@"%@-hover", imageName];
    UIImage *image1 = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:name1 ofType:@"png"]];
    UIImage *image2 = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:name2 ofType:@"png"]];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame =  frame;
    [button setImage:image1 forState:UIControlStateNormal];
    [button setImage:image2 forState:UIControlStateHighlighted];
    [button addTarget:target action:sel forControlEvents:UIControlEventTouchUpInside];
    return button;
}

+(UIButton *) buttonWithFrame:(CGRect)frame withTitle:(NSString *)btnName target:(id)target selector:(SEL)sel{
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.titleLabel.textAlignment = NSTextAlignmentCenter;
    button.titleLabel.numberOfLines = 2;
    button.frame = frame;
    [button setTitle:btnName forState:UIControlStateNormal];

    //Add selctor.
    [button addTarget:target action:sel forControlEvents:UIControlEventTouchUpInside];
    
    return button;
    
}


+(UIButton *) buttonWithFrame:(CGRect)frame withTitle:(NSString *)btnName andBackgroundImageName:(NSString *)imageName {
    
    NSString *name1 = [NSString stringWithFormat:@"%@-static", imageName];
    NSString *name2 = [NSString stringWithFormat:@"%@-hover", imageName];
    UIImage *image1 = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:name1 ofType:@"png"]];
    UIImage *image2 = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:name2 ofType:@"png"]];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.titleLabel.textAlignment = NSTextAlignmentCenter;
    button.titleLabel.numberOfLines = 2;
    button.frame = frame;
    [button setTitle:btnName forState:UIControlStateNormal];
    [button setBackgroundImage:image1 forState:UIControlStateNormal];
    [button setBackgroundImage:image2 forState:UIControlStateHighlighted];
    return button;

}



+(UIButton *) buttonWithFrame:(CGRect)frame withTitle:(NSString *)btnName andBackgroundImageName:(NSString *)imageName withFont:(UIFont *)font {
    
    NSString *name1 = [NSString stringWithFormat:@"%@-static", imageName];
    NSString *name2 = [NSString stringWithFormat:@"%@-hover", imageName];
    UIImage *image1 = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:name1 ofType:@"png"]];
    UIImage *image2 = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:name2 ofType:@"png"]];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.titleLabel.textAlignment = NSTextAlignmentCenter;
    button.titleLabel.numberOfLines = 2;
    button.frame = frame;
    [button setTitle:btnName forState:UIControlStateNormal];
    [button setBackgroundImage:image1 forState:UIControlStateNormal];
    [button setBackgroundImage:image2 forState:UIControlStateHighlighted];
    [button.titleLabel setFont:font];
    return button;
    
}


+(UIButton *) buttonWithFrame:(CGRect)frame withTitle:(NSString *)btnNTitle andBackgroundImageName:(NSString *)imageName withFont:(UIFont *)font normalTextColor:(UIColor *)ncolor selectedTextColor:(UIColor *)scolor {
    
    NSString *name1 = [NSString stringWithFormat:@"%@-static", imageName];
    NSString *name2 = [NSString stringWithFormat:@"%@-hover", imageName];
    UIImage *image1 = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:name1 ofType:@"png"]];
    UIImage *image2 = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:name2 ofType:@"png"]];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.titleLabel.textAlignment = NSTextAlignmentCenter;
    button.titleLabel.numberOfLines = 2;
    button.frame = frame;
    [button setTitle:btnNTitle forState:UIControlStateNormal];
   
    [button setBackgroundImage:image1 forState:UIControlStateNormal];
    [button setBackgroundImage:image2 forState:UIControlStateHighlighted];
    [button setBackgroundImage:image2 forState:UIControlStateSelected];
    
    [button setTitleColor:ncolor forState:UIControlStateNormal];
    [button setTitleColor:scolor forState:UIControlStateHighlighted];
    [button setTitleColor:scolor forState:UIControlStateSelected];
    
    [button.titleLabel setFont:font];
    return button;
    
}


+(UIButton *) buttonWithFrame:(CGRect)frame withNormalTitle:(NSString *)btnNTitle withSelectedTitle:(NSString *)btnSTitle andBackgroundImageName:(NSString *)imageName withFont:(UIFont *)font normalTextColor:(UIColor *)ncolor selectedTextColor:(UIColor *)scolor {
    
    NSString *name1 = [NSString stringWithFormat:@"%@-static", imageName];
    NSString *name2 = [NSString stringWithFormat:@"%@-hover", imageName];
    UIImage *image1 = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:name1 ofType:@"png"]];
    UIImage *image2 = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:name2 ofType:@"png"]];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.titleLabel.textAlignment = NSTextAlignmentCenter;
    button.titleLabel.numberOfLines = 2;
    button.frame = frame;
    [button setTitle:btnNTitle forState:UIControlStateNormal];
    [button setTitle:btnSTitle forState:UIControlStateSelected];
  
    [button setBackgroundImage:image1 forState:UIControlStateNormal];
    [button setBackgroundImage:image2 forState:UIControlStateHighlighted];
    [button setBackgroundImage:image2 forState:UIControlStateSelected];
    
    [button setTitleColor:ncolor forState:UIControlStateNormal];
    //[button setTitleColor:scolor forState:UIControlStateHighlighted];
    //[button setTitleColor:scolor forState:UIControlStateSelected];
    
    [button.titleLabel setFont:font];
    return button;
    
}

+(UIView *)addSearchInputScreen:(CGRect)frame textColor:(UIColor *)color withDefaultText:(NSString *)text backImageName:(NSString *)imgName textFiledOrigin:(CGPoint)origin textFieldDelegate:(id)delegate{
    
    UIView *inputView = [Resourcer viewWithFrame:frame];
    
    UIImageView *imgView = [Resourcer imageViewWithFrame:inputView.bounds andImageName:@"search"];
    [inputView addSubview:imgView];
    
    frame.origin.x = origin.x;
    frame.origin.y = origin.y;
    frame.size.width -= origin.x +12;
    frame.size.height -= origin.y*2;
    UITextField *textField = [[UITextField alloc] initWithFrame:frame];
    textField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:text attributes:@{NSForegroundColorAttributeName: color}];
    
    textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    [inputView addSubview:textField];
    textField.tag = 100;
    textField.textColor = [UIColor whiteColor];
    textField.autocorrectionType = UITextAutocorrectionTypeNo;
    textField.returnKeyType = UIReturnKeyDone;
    textField.delegate = delegate;
    return inputView;
    
}

+(UIButton *) buttonWithFrame:(CGRect)frame andSigleImageName:(NSString *)imageName{
    
    UIImage *image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:imageName ofType:@"png"]];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    [button setBackgroundImage:image forState:UIControlStateNormal];
    return button;
}


+(UIButton *) buttonWithFrame:(CGRect)frame andImageName:(NSString *)imageName{
    
    NSString *name1 = [NSString stringWithFormat:@"%@-static", imageName];
    NSString *name2 = [NSString stringWithFormat:@"%@-hover", imageName];
    UIImage *image1 = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:name1 ofType:@"png"]];
    UIImage *image2 = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:name2 ofType:@"png"]];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    [button setImage:image1 forState:UIControlStateNormal];
    [button setImage:image2 forState:UIControlStateHighlighted];
    
    return button;
}

+(UIButton *) buttonWithFrame:(CGRect)frame{
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];//UIButtonTypeCustom //  UIButtonTypeRoundedRect
    button.frame = frame;
  
    return button;
}

+(UIImageView *) imageViewWithFrame:(CGRect)frame andImageName:(NSString *)imageName{
    
    UIImage *image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:imageName ofType:@"png"]];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    imageView.frame = frame;
    
    return imageView;
}

+(UIImageView *) imageViewWithImageName:(NSString *)imageName originPoint:(CGPoint)orgin{
    
    UIImage *image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:imageName ofType:@"png"]];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    imageView.frame = CGRectMake(orgin.x,orgin.y, image.size.width,image.size.height);
    return imageView;
}

+(UIImageView *) imageViewWithImageName:(NSString *)imageName withCenterPoint:(CGPoint)center{
    
    UIImage *image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:imageName ofType:@"png"]];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    imageView.frame = CGRectMake(0,0, image.size.width,image.size.height);
    imageView.center = center;
    return imageView;
}


+(UIImage *) imageWithName :(NSString *)name{
    return [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:name ofType:@"png"]];
}


+(UILabel *) labelWithFrame:(CGRect)frame andText:(NSString *)text ofSize: (int)x andBold: (bool)bold{
    
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.backgroundColor = [UIColor clearColor];
    label.text = text;
    [label setFont:[UIFont boldSystemFontOfSize:x]];
    label.numberOfLines=0;
    
    return label;
}

+(UILabel *) labelWithFrame:(CGRect)frame andText:(NSString *)text ofSize: (int)x withFontName:(NSString *)fontName {
    
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.backgroundColor = [UIColor clearColor];
    label.text = text;
    label.textColor  = [UIColor whiteColor];
    label.font = [UIFont fontWithName:fontName size:x];
    label.numberOfLines=0;
    return label;
}


+(UILabel *) labelWithFrame:(CGRect)frame andText:(NSString *)text ofSize: (int)x withFontName:(NSString *)fontName textAlignment :(NSTextAlignment) textAignment{
    
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.backgroundColor = [UIColor redColor];
    label.textAlignment = textAignment;
    label.text = text;
    label.textColor  = [UIColor blackColor];
    label.font = [UIFont fontWithName:fontName size:x];
    label.numberOfLines=0;
    NSLog(@"label %@ text %@",label,text);
    
    return label;
}




+(UILabel *) labelWithFrame:(CGRect)frame andText: (NSString *)text ofSize: (int)x{
    
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.backgroundColor = [UIColor clearColor];
    label.text = text;
    [label setFont:[UIFont systemFontOfSize:x]];
    label.numberOfLines=0;
    
    return label;
}

+(UILabel *) labelWithFrame:(CGRect)frame andText: (NSString *)text{
    
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.backgroundColor = [UIColor clearColor];
    label.text = text;
    label.numberOfLines=0;
    
    return label;
}

+(UIScrollView *) scrollViewWithFrame:(CGRect)frame{
    UIScrollView *sv = [[UIScrollView alloc] initWithFrame:frame];
    return sv;
}



+(UIView *) getTextFieldViewWith:(CGRect)frame withImage:(NSString *)imageName and:(NSString *)defaultText and:(float)leftMargin and:(float)topMargin and:(UIColor *)textColor and:(int)fontSize and:(NSString *)fontType and:(int)textFieldTag and:(id)delegate textField:(UITextField *)textField {
    
    UIView *result = [[UIView alloc] initWithFrame:frame];
    result.backgroundColor=[UIColor clearColor];
    
    UIImage *image = [UIImage imageNamed:imageName];
    UIImageView *imgView = [[UIImageView alloc ]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
    imgView.image = image;
    imgView.userInteractionEnabled=YES;
    
    [result addSubview:imgView];
    
    float l,t,w,h;
    
    l=frame.size.width*leftMargin;
    t=frame.size.height*topMargin;
    w=frame.size.width-2*l;
    h=frame.size.height-2*t;
    
    textField.frame = CGRectMake(l, t, w, h);
    textField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:defaultText attributes:@{NSForegroundColorAttributeName: textColor}];
    textField.autocorrectionType = UITextAutocorrectionTypeNo;
    textField.textColor = textColor;
    textField.font = [UIFont fontWithName:fontType size:fontSize];
    textField.clipsToBounds = YES;
    textField.returnKeyType = UIReturnKeyNext;
    textField.tag=textFieldTag;
    textField.delegate=delegate;
    [result addSubview:textField];
    textField = textField;
    
    return result;
}



@end
