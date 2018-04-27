//
//  SPButtonViewController.m
//  testDemo
//
//  Created by ShiPanpan on 2018/4/20.
//  Copyright © 2018年 ShiPanpan. All rights reserved.
//

#import "SPButtonViewController.h"
#import "utilityDrawViewHelper.h"
#import <CoreText/CoreText.h>

@interface SPButtonViewController ()

@end

@implementation SPButtonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createButton];
}

- (void)createButton {
    
    //    UIButton *button = [utilityDrawViewHelper addButtonInView:self.view frame:CGRectMake(100, 200, 47, 22) title:nil font:[UIFont systemFontOfSize:11.0] titleColor:[UIColor whiteColor] backgroundColor:[UIColor redColor]];
    UIButton *button = [utilityDrawViewHelper addButtonInView:self.view frame:CGRectMake(100, 200, 47, 22) title:@"" font:[UIFont systemFontOfSize:11.0] titleColor:[UIColor whiteColor] backgroundColor:[UIColor redColor] tag:0 addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside borderColor:nil borderWidth:0 cornerRadius:0];
//    button.imageView.frame = CGRectMake(8, 7, 6, 8);
//    button.imageView.image = [UIImage imageNamed:@"left_btn.png"];
    
//    [button setBackgroundImage:[UIImage imageNamed:@"left_btn.png"] forState:UIControlStateNormal];
//    [button setImage:[UIImage imageNamed:@"left_btn.png"] forState:UIControlStateNormal];
//    [button setImageEdgeInsets:UIEdgeInsetsMake(0, -20, 0, 0)];
    
    
//    button.imageView.contentMode = UIViewContentModeScaleAspectFit;
//    button.titleLabel.backgroundColor = [UIColor grayColor];
//    button.imageView.backgroundColor = [UIColor greenColor];
    
    
    //    [button setBackgroundImage:<#(nullable UIImage *)#> forState:<#(UIControlState)#>]
    
    //    button.titleLabel.frame = CGRectMake(15, 0, button.frame.size.width - 15, 22);
    //    button.imageView.frame = CGRectMake(8, 7, 6, 8);
    
    [button setTitleEdgeInsets:UIEdgeInsetsMake(0, 10, 0, 10)];
//    [button setImageEdgeInsets:UIEdgeInsetsMake(7, 8, 7, 28)];
    
    //    [button setTitleEdgeInsets:UIEdgeInsetsMake(0, -button.imageView.size.width, 0, button.imageView.size.width)];
    //    [button setImageEdgeInsets:UIEdgeInsetsMake(0, button.titleLabel.bounds.size.width, 0, -button.titleLabel.bounds.size.width)];
}

// 匹配 纯汉字正则表达式 8.5.6
- (BOOL)isEnglishOrNOtByString:(NSString *)string {
    // 匹配规则
    NSString *preStr = @".*[a-z0－9A-Z]+.*";
    // 创建谓词对象并设定条件的表达式
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", preStr];

    return [predicate evaluateWithObject:string];
    
    
}



- (void)buttonClick {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
