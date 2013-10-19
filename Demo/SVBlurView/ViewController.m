//
//  ViewController.m
//  SVBlurView
//
//  Created by Sam Vermette on 19.10.13.
//  Copyright (c) 2013 Sam Vermette. All rights reserved.
//

#import "ViewController.h"
#import "SVBlurView.h"


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"background"]];
    backgroundView.frame = self.view.bounds;
    backgroundView.contentMode = UIViewContentModeScaleAspectFill;
    [self.view addSubview:backgroundView];
    
    SVBlurView *blurView = [[SVBlurView alloc] initWithFrame:CGRectMake(60, 100, 200, 200)];
    [backgroundView addSubview:blurView];
}

@end
