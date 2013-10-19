//
//  SVBlurView.h
//  SVBlurView
//
//  Created by Sam Vermette on 19.10.13.
//  Copyright (c) 2013 Sam Vermette. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SVBlurView : UIView

@property (nonatomic, readwrite) CGFloat blurRadius; // default is 20.0f
@property (nonatomic, readwrite) CGFloat saturationDelta; // default is 1.5
@property (nonatomic, readwrite) UIColor *tintColor; // default nil

@end
