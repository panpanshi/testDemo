//
//  SPBlockViewController.m
//  testDemo
//
//  Created by ShiPanpan on 2018/5/10.
//  Copyright © 2018年 ShiPanpan. All rights reserved.
//  Block的使用方法

#import "SPBlockViewController.h"
#import "utilityDrawViewHelper.h"
#import "SPTwoBlockViewController.h"

@interface SPBlockViewController ()

@property (nonatomic, strong) UILabel *textLabel;

@end

@implementation SPBlockViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)pushToTwoBlockVC {
    SPTwoBlockViewController *blockVC = [[SPTwoBlockViewController alloc] init];
//    __weak SPBlockViewController *weakSelf = self;
    __weak typeof(self) weakSelf = self;
    
    blockVC.myCallBackBlock = ^(NSString *text) {
        weakSelf.textLabel.text = text;
    };
    
    [self.navigationController pushViewController:blockVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
