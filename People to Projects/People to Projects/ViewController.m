//
//  ViewController.m
//  testing swiping
//
//  Created by Pranav Jain on 11/7/15.
//  Copyright (c) 2015 Pranav Jain. All rights reserved.
//

#import "ViewController.h"
#import "DraggableViewBackground.h"


@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    DraggableViewBackground *draggableBackground = [[DraggableViewBackground alloc]initWithFrame:self.view.frame];
    [self.view addSubview:draggableBackground];
}

@end
