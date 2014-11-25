//
//  TableViewCustomCell.m
//  WowTasty
//
//  Created by weird logics on 25/04/13.
//  Copyright (c) 2013 weird logics. All rights reserved.
//

#import "TableViewCustomCell.h"
#import "SlidingView.h"


@implementation TableViewCustomCell

@synthesize lblTitle,lblDesc,tileImageView,cellSepratorView;

@synthesize cellItem;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
       // [self setSelectionStyle:UITableViewCellSelectionStyleNone] ;
    }
    return self;
}



//----------------------------------------Add label-------------------------------------------//
-(UILabel *)addlabelWithText:(NSString *)text frame:(CGRect)frame fontName:(NSString *)fName fontSize:(float )fsize textColor:(UIColor *)color textAlignment:(NSTextAlignment)alignment  {
    
    UIFont *font = [UIFont fontWithName:fName size:fsize];
    float height =  [self heightOfText:text width:frame.size.width withFont:font];
  
    //Rest the height of the label as per text. 
    if (height > frame.size.height) {
        frame.size.height = height;
    }
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.backgroundColor = [UIColor clearColor];
    label.textAlignment = alignment;
    label.text = text;
    label.textColor  = color;
    label.font = font;
    label.numberOfLines=0;
    
    //NSLog(@"New label added %@ With Text %@",label,text);
    return label;
}


-(float)heightOfText:(NSString *)text width:(float)width withFont:(UIFont *)font{
    
    CGSize frame = [text sizeWithFont:font constrainedToSize:CGSizeMake(width,999) lineBreakMode:NSLineBreakByWordWrapping];
    return frame.height;
}


//-----------------------------------------------------------------------------------------//

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}


//set title label of cell. 
-(void)setTitle:(NSString *)text frame:(CGRect)frame fontName:(NSString *)fName fontSize:(float )fsize textColor:(UIColor *)color textAlignment:(NSTextAlignment)alignment {
    
    self.lblTitle = [self addlabelWithText:text frame:frame fontName:fName fontSize:fsize textColor:color textAlignment:alignment];
    [self addSubview:self.lblTitle];
}

//set description label of cell. 
-(void)setDescription:(NSString *)text frame:(CGRect)frame fontName:(NSString *)fName fontSize:(float )fsize textColor:(UIColor *)color textAlignment:(NSTextAlignment)alignment {
    self.lblDesc = [self addlabelWithText:text frame:frame fontName:fName fontSize:fsize textColor:color textAlignment:alignment];
    [self addSubview: self.lblDesc];
}


//setTile Image. 
-(void)setTile:(UIImage *)tileImage frame:(CGRect)frame {
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
    imageView.image = tileImage;
    self.tileImageView = imageView;
     [self addSubview: self.tileImageView];
}


//setTile Image.
-(void)setCellSepratorWithBackgroundColor:(UIColor *)color andframe:(CGRect)frame {
    
    self.cellSepratorView = [[UIView alloc] initWithFrame:frame];
    self.cellSepratorView.backgroundColor = color;
     [self addSubview: self.cellSepratorView];
}











@end
