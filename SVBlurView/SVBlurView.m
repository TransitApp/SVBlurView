//
//  SVBlurView.m
//  SVBlurView
//
//  Created by Sam Vermette on 19.10.13.
//  Copyright (c) 2013 Sam Vermette. All rights reserved.
//

#import "SVBlurView.h"

@interface SVBlurView ()

@property (nonatomic, strong) UIView *blurContainerView;

@end


@implementation SVBlurView

- (id)initWithFrame:(CGRect)frame {
    if(self = [super initWithFrame:frame])
        [self addSubview:self.blurContainerView];
    self.blurRadius = 40;
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
    CIContext *context = [CIContext contextWithOptions:nil];
    CIImage *ci_image = [CIImage imageWithCGImage:image.CGImage];
    CIFilter *filter = [CIFilter filterWithName:@"CIGaussianBlur"];
    [filter setValue:ci_image forKey:kCIInputImageKey];
    [filter setValue:@(self.blurRadius) forKey:kCIInputRadiusKey];
    CIImage *result = [filter valueForKey:kCIOutputImageKey];
    CGImageRef cgImage = [context createCGImage:result fromRect:[result extent]];
    return [UIImage imageWithCGImage:cgImage scale:image.scale orientation:image.imageOrientation];
}

- (void)didMoveToSuperview {
    [self updateBlur];
}

@end
