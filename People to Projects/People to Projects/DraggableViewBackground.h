//
//  DraggableViewBackground.h
//  testing swiping
//
//  Created by Pranav Jain on 11/7/15.
//  Copyright (c) 2015 Pranav Jain. All rights reserved.
//



#import <UIKit/UIKit.h>
#import "DraggableView.h"

@interface DraggableViewBackground : UIView <DraggableViewDelegate>

//methods called in DraggableView
-(void)cardSwipedLeft:(UIView *)card;
-(void)cardSwipedRight:(UIView *)card;

@property (retain,nonatomic)NSArray* exampleCardLabels; //%%% the labels the cards
@property (retain,nonatomic)NSMutableArray* allCards; //%%% the labels the cards


@end
