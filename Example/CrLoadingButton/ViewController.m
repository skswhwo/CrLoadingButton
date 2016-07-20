//
//  ViewController.m
//  CrLoadingButton
//
//  Created by ChoJaehyun on 2016. 7. 20..
//  Copyright © 2016년 com.skswhwo. All rights reserved.
//

#import "ViewController.h"
#import "CrLoadingButton.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet CrLoadingButton *loadingButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.loadingButton setDidSelect:^(CrLoadingButton *button) {
        button.active = true;
        [self performSelector:@selector(endButton:) withObject:button afterDelay:1];
    }];
    
    
    CrLoadingButton *button = [CrLoadingButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"Hide Button" forState:UIControlStateNormal];
    button.frame                = CGRectMake(100, 240, 200, 60);
    button.backgroundColor      = [UIColor darkGrayColor];
    button.clipsToBounds        = YES;
    button.layer.cornerRadius   = button.frame.size.height/2;
    [self.view addSubview:button];
    
    button.hideButtonWhenActive   = true;
    [button setDidSelect:^(CrLoadingButton *button) {
        button.active = true;
        [self performSelector:@selector(endButton:) withObject:button afterDelay:1];
    }];
}


- (void)endButton:(CrLoadingButton *)button
{
    button.active = false;
}

@end