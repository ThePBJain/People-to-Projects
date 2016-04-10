//
//  OverlayView.h
//  testing swiping
//
//  Created by Pranav Jain on 11/7/15.
//  Copyright (c) 2015 Pranav Jain. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger , GGOverlayViewMode) {
    GGOverlayViewModeLeft,
    GGOverlayViewModeRight
};

@interface OverlayView : UIView

@property (nonatomic) GGOverlayViewMode mode;
@property (nonatomic, strong) UIImageView *imageView;

@end
