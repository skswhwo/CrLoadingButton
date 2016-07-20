//
//  CrLoadingButton.h
//  CrLoadingButton
//
//  Created by ChoJaehyun on 2016. 7. 20..
//  Copyright © 2016년 com.skswhwo. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CrLoadingButton;

typedef void(^CrLoadingButtonCallback)(CrLoadingButton *button);

@interface CrLoadingButton : UIButton

@property (nonatomic, assign) BOOL hideButtonWhenActive;
@property (nonatomic, assign) BOOL active;
@property (nonatomic, strong) CrLoadingButtonCallback didSelect;

- (void)setActivityIndicatorStyle:(UIActivityIndicatorViewStyle)activityIndicatorStyle;

@end