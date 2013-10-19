//
//  SVBlurView.m
//  SVBlurView
//
//  Created by Sam Vermette on 19.10.13.
//  Copyright (c) 2013 Sam Vermette. All rights reserved.
//

#import "SVBlurView.h"
#import "UIImage+ImageEffects.h"

@interface SVBlurView ()

@property (nonatomic, strong) UIView *blurContainerView;

@end


@implementation SVBlurView

- (id)initWithFrame:(CGRect)frame {
    if(self = [super initWithFrame:frame])
        [self addSubview:self.blurContainerView];
    
    self.blurRadius = 20;
    self.saturationDelta = 1.5;
    self.tintColor = nil;
    
    self.clipsToBounds = YES;
    return self;
}

- (UIView *)blurContainerView {
    if(!_blurContainerView) {
        _blurContainerView = [[UIView alloc] initWithFrame:CGRectZero];
        _blurContainerView.layer.masksToBounds = YES;
        _blurContainerView.layer.contentsScale = [UIScreen mainScreen].scale;
        _blurContainerView.layer.contentsGravity = kCAGravityCenter;
    }
    return _blurContainerView;
}

- (void)updateBlur {
    CGRect superviewBounds = self.superview.bounds;
    UIGraphicsBeginImageContextWithOptions(superviewBounds.size, NO, 0.0);
    [self.superview drawViewHierarchyInRect:superviewBounds afterScreenUpdates:YES];
    
    UIImage *complexViewImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    UIImage *blurredImage = [self applyBlurToImage:complexViewImage];
    self.blurContainerView.frame = superviewBounds;
    self.blurContainerView.layer.contents = (id)blurredImage.CGImage;
    self.blurContainerView.layer.position = [self convertPoint:self.superview.center fromView:self.superview];
}

- (UIImage *)applyBlurToImage:(UIImage *)image {
    return [image applyBlurWithRadius:self.blurRadius
                            tintColor:self.tintColor
                saturationDeltaFactor:self.saturationDelta
                            maskImage:nil];
}

- (void)didMoveToSuperview {
    [self updateBlur];
}

@end
