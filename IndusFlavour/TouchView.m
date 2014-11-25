//
//  TouchView.m
//  Sample
//
//  Created by Mobi_Mac on 28/05/13.
//  Copyright (c) 2013 Mobi_Mac. All rights reserved.
//

#import "TouchView.h"

@implementation TouchView

 
@synthesize delegate,prevPoint;


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {

    UITouch *touch = [touches anyObject];
    CGPoint currentPoint =  [touch locationInView:self];
    short endTag = 0;
  
    for (UIImageView *v in self.subviews) {
        if (CGRectContainsPoint(v.frame,currentPoint) && [v isKindOfClass:[UIImageView class]]) {
             v.highlighted = YES;
            self.prevPoint = currentPoint;
            endTag = v.tag;
        }else{
            v.highlighted = NO;
        }
    }
    [self highLightAllPagesBeforeSelection:endTag];
}



-(void)highLightAllPagesBeforeSelection:(short)tag{
    
    for (short i = tag-1; i > 0; i--) {
        UIImageView *pV = (UIImageView*)[self viewWithTag:i];
        if ([pV isKindOfClass:[UIImageView class]]) {
            pV.highlighted = YES;
        }
    }
    [self addForFeedbackFromView:tag];
}



//-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
//    
//    UITouch *touch = [touches anyObject];
//    CGPoint currentPoint =  [touch locationInView:self];
//    //[self addForFeedback:currentPoint];
//}


//-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
//    
//    UITouch *touch = [touches anyObject];
//  
//    CGPoint currentPoint =  [touch locationInView:self];
//   
//    for (UIImageView *v in self.subviews) {
//     
//        if ([v isKindOfClass:[UIImageView class]] && !CGRectContainsPoint(v.frame,currentPoint))
//            {
//                [self playWithTile:v];
//                break;
//            }
//    }
//}



-(void)playWithTile:(UIImageView *)imageView {
    
    NSLog(@"Found in  %d",imageView.tag);
    imageView.highlighted = YES;
    [self play:imageView.tag];

}

-(void)play:(NSUInteger)soundPath{

  NSString *soundText = [NSString stringWithFormat:@"/00%d.mp3",soundPath];
	NSString *path = [NSString stringWithFormat:@"%@%@",[[NSBundle mainBundle] resourcePath],soundText];
	SystemSoundID soundID;
	NSURL *filePath = [NSURL fileURLWithPath:path isDirectory:NO];
	AudioServicesCreateSystemSoundID((__bridge CFURLRef)filePath, &soundID);
	AudioServicesPlaySystemSound(soundID);

}

-(void)addForFeedbackFromView:(NSUInteger)tag {

    [self play:tag];
    
    if ([self.delegate respondsToSelector:@selector(touchView:addFeedBackAtIndex:)]){
        [self.delegate  touchView:self addFeedBackAtIndex:tag];
    }
}


    
-(void)addForFeedback:(CGPoint)currentPoint{
   
    short count = 0;
    for (short i = 0; i < [[self subviews] count]; i ++){
   
        UIImageView *imageView = (UIImageView *)[self viewWithTag:i];
        
        NSLog(@"%s imageView %@",__FUNCTION__,imageView);
        
        if (imageView && [imageView isKindOfClass:[UIImageView class]]) {
         
            if (!imageView.highlighted) {
                break;
            }
             count = i;
        }
    }
    if (count >0) {
        
        if ([self.delegate respondsToSelector:@selector(touchView:addFeedBackAtIndex:)]) {
            [self.delegate  touchView:self addFeedBackAtIndex:count];
        }
    }
    
    NSLog(@"FeedBack Value %d self.delegate  %@",count,self.delegate );
}


@end
