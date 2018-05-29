//
//  SPViewController.m
//  testDemo
//
//  Created by ShiPanpan on 2018/5/26.
//  Copyright © 2018年 ShiPanpan. All rights reserved.
//

#import "SPViewController.h"

@interface SPViewController ()

@end

@implementation SPViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //获取状态栏的rect
    CGRect statusRect = [[UIApplication sharedApplication] statusBarFrame];
    //获取self.view的rect
    CGRect viewRect = self.view.frame;
    //mainScreen的rect
    CGRect screenRect = [UIScreen mainScreen].applicationFrame;
     NSLog(@"状态栏frame：%@，self.view的frame：%@,screen的frame：%@",NSStringFromCGRect(statusRect),NSStringFromCGRect(viewRect),NSStringFromCGRect(screenRect));
    
//    NSLog(@"状态栏frame：%@，self.view的frame：%@,导航栏frame：%@,screen的frame：%@",NSStringFromCGRect(statusRect),NSStringFromCGRect(viewRect),NSStringFromCGRect(navRect),NSStringFromCGRect(screenRect));
    
//    CGRect navRect = self.navigationController.navigationBar.frame;
//    NSLog(@"导航栏frame：%@，self.view的frame：%@,导航栏frame：%@",NSStringFromCGRect(statusRect),NSStringFromCGRect(viewRect),NSStringFromCGRect(navRect));
    
    
    //获取导航栏的rect
//    CGRect navRect = self.navigationController.navigationBar.frame;
    //那么导航栏+状态栏的高度
//    statusRect.size.height+navRect.size.height
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
