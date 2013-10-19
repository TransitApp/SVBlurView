# SVBlurView

SVBlurView is a simple reimplementation of FXBlurView for iOS 7. It uses `CIFilter` as well as the new `drawViewHierarchyInRect:` UIView API. It doesn't do dynamic blurs yet.

## Installation

### Manually

* Drag the `SVBlurView/SVBlurView` folder into your project. 
* `#import "SVBlurView.h"`

## Usage

(see sample Xcode project in `/Demo`)

```objective-c
    SVBlurView *blurView = [[SVBlurView alloc] initWithFrame:CGRectMake(60, 100, 200, 200)];
    [backgroundView addSubview:blurView];
```

#### Customization

```objective-c
@property (nonatomic, readwrite) CGFloat blurRadius; // defaults to 40.0f
```

## Credits

SVBlurView is brought to you by [Sam Vermette](http://samvermette.com) and [contributors to the project](https://github.com/samvermette/SVBlurView/contributors). If you have feature suggestions or bug reports, feel free to help out by sending pull requests or by [creating new issues](https://github.com/samvermette/SVBlurView/issues/new). If you're using SVBlurView in your project, attribution would be nice.