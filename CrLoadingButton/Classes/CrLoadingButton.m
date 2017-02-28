#import "CrLoadingButton.h"


@interface CrLoadingButton ()

@property (nonatomic, strong) NSString *disabledTitle;

@end

@implementation CrLoadingButton

#pragma mark - 
- (void)didMoveToSuperview
{
    [self addActivityIndicatorToSuperView];
}

#pragma mark - Setter
- (void)setActivityIndicatorStyle:(UIActivityIndicatorViewStyle)activityIndicatorStyle
{
    self.activityIndicator.activityIndicatorViewStyle = activityIndicatorStyle;
}

- (void)setActive:(BOOL)active
{
    _active = active;
    if (self.active) {
        
        [self setEnabled:NO];
        self.disabledTitle = [self titleForState:UIControlStateDisabled];
        if (self.hideButtonWhenActive) {
            self.alpha = 0;
        } else {
            [self setTitle:@"" forState:UIControlStateDisabled];
        }
        [self.activityIndicator startAnimating];
        
    } else {
        
        self.enabled = YES;
        self.alpha = 1;
        [self setTitle:self.disabledTitle forState:UIControlStateDisabled];
        [self.activityIndicator stopAnimating];
    }
}

- (void)setDidSelect:(CrLoadingButtonCallback)didSelect
{
    _didSelect = didSelect;
    [self addTarget:self action:@selector(buttonClicked) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark - Event
- (void)buttonClicked
{
    if (self.didSelect) {
        self.didSelect(self);
    }
}

#pragma mark - Private
- (void)addActivityIndicatorToSuperView
{
    if (_activityIndicator == nil) {
        _activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        [_activityIndicator setTranslatesAutoresizingMaskIntoConstraints:NO];
    }
    
    if (self.superview) {
        [self.superview addSubview:_activityIndicator];
        NSLayoutConstraint *constraintX = [NSLayoutConstraint constraintWithItem:_activityIndicator
                                                                       attribute:NSLayoutAttributeCenterX
                                                                       relatedBy:NSLayoutRelationEqual
                                                                          toItem:self
                                                                       attribute:NSLayoutAttributeCenterX
                                                                      multiplier:1.0f
                                                                        constant:0];
        NSLayoutConstraint *constraintY = [NSLayoutConstraint constraintWithItem:_activityIndicator
                                                                       attribute:NSLayoutAttributeCenterY
                                                                       relatedBy:NSLayoutRelationEqual
                                                                          toItem:self
                                                                       attribute:NSLayoutAttributeCenterY
                                                                      multiplier:1.0f
                                                                        constant:0];
        [self.superview addConstraint:constraintX];
        [self.superview addConstraint:constraintY];
    }
}

@end
