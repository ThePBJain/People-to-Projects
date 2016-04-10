//
//  DraggableView.h
//  testing swiping
//
//  Created by Pranav Jain on 11/7/15.
//  Copyright (c) 2015 Pranav Jain. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "OverlayView.h"

@protocol DraggableViewDelegate <NSObject>

-(void)cardSwipedLeft:(UIView *)card;
-(void)cardSwipedRight:(UIView *)card;

@end

@interface DraggableView : UIView

@property (weak) id <DraggableViewDelegate> delegate;

@property (nonatomic, strong)UIPanGestureRecognizer *panGestureRecognizer;
@property (nonatomic)CGPoint originalPoint;
@property (nonatomic,strong)OverlayView* overlayView;
@property (nonatomic,strong)UITextView* information; //%%% a placeholder for any card-specific information

-(void)leftClickAction;
-(void)rightClickAction;

@end
