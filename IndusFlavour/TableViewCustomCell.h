//
//  TableViewCustomCell.h
//  WowTasty
//
//  Created by weird logics on 25/04/13.
//  Copyright (c) 2013 weird logics. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TableCellItems.h" 


@interface TableViewCustomCell : UITableViewCell {
    
    

}
@property (nonatomic,retain)   TableCellItems *cellItem;
@property (nonatomic,retain)  UILabel *lblTitle,*lblDesc;
@property (nonatomic,retain)  UIImageView *tileImageView;
@property (nonatomic,retain)  UIView *cellSepratorView;

//Title Text and styling. 
-(void)setTitle:(NSString *)text frame:(CGRect)frame fontName:(NSString *)fName fontSize:(float )fsize textColor:(UIColor *)color textAlignment:(NSTextAlignment)alignment;
//Description Text and styling. 
-(void)setDescription:(NSString *)text frame:(CGRect)frame fontName:(NSString *)fName fontSize:(float )fsize textColor:(UIColor *)color textAlignment:(NSTextAlignment)alignment;

//Set tile Image. 
-(void)setTile:(UIImage *)tileImage frame:(CGRect)frame;
//set cell seprator. 
-(void)setCellSepratorWithBackgroundColor:(UIColor *)color andframe:(CGRect)frame;

    
//set text and styling for any lable. 
-(UILabel *)addlabelWithText:(NSString *)text frame:(CGRect)frame fontName:(NSString *)fName fontSize:(float )fsize textColor:(UIColor *)color textAlignment:(NSTextAlignment)alignment;

@end
