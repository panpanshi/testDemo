//
//  SPButtonViewController.m
//  testDemo
//
//  Created by ShiPanpan on 2018/4/20.
//  Copyright © 2018年 ShiPanpan. All rights reserved.
//  可以用来判断多个接口返回之后再进行某个操作

#import "SPButtonViewController.h"
#import "utilityDrawViewHelper.h"
#import <CoreText/CoreText.h>
#import "SPBlockViewController.h"

typedef NS_ENUM(NSInteger, FinishState) {
    NoneFinish  = 0,        //无任何接口完成
    OneFinish   = 1 << 0,   //第一个接口完成
    TwoFinish   = 1 << 1,   //第二个接口完成
    ThreeFinish = 1 << 2,   //第三个接口完成
    FourFinish  = 1 << 3,   //第四个接口完成
};


@interface SPButtonViewController ()

@property (nonatomic, assign) FinishState finishState;

@end

@implementation SPButtonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //获取状态栏的rect
    CGRect statusRect = [[UIApplication sharedApplication] statusBarFrame];
    //获取self.view的rect
    CGRect viewRect = self.view.frame;
    //获取导航栏栏的rect
    CGRect navRect = self.navigationController.navigationBar.frame;
    //mainScreen的rect
    CGRect screenRect = [UIScreen mainScreen].applicationFrame;
    
    NSLog(@"状态栏frame：%@，self.view的frame：%@,导航栏frame：%@,screen的frame：%@",NSStringFromCGRect(statusRect),NSStringFromCGRect(viewRect),NSStringFromCGRect(navRect),NSStringFromCGRect(screenRect));

}

- (void)pushToBlockVC {
    SPBlockViewController *blockVC = [[SPBlockViewController alloc] init];
    [self.navigationController pushViewController:blockVC animated:YES];
}

- (void)changeTheState {
    
    NSLog(@"没有赋值之前%ld",(long)self.finishState);
    
    [self oneFinish];
    NSLog(@"oneFinish%ld",(long)self.finishState);
    NSLog(@"%ld", (long)self.finishState & OneFinish);
    NSLog(@"%ld", (long)self.finishState & TwoFinish);
    NSLog(@"%ld", (long)self.finishState & ThreeFinish);
    NSLog(@"%ld", (long)self.finishState & FourFinish);
    
    [self TwoFinish];
    NSLog(@"TwoFinish%ld",(long)self.finishState);
    NSLog(@"%ld", (long)self.finishState & OneFinish);
    NSLog(@"%ld", (long)self.finishState & TwoFinish);
    NSLog(@"%ld", (long)self.finishState & ThreeFinish);
    NSLog(@"%ld", (long)self.finishState & FourFinish);
    
    [self ThreeFinish];
    NSLog(@"ThreeFinish%ld",(long)self.finishState);
    NSLog(@"%ld", (long)self.finishState & OneFinish);
    NSLog(@"%ld", (long)self.finishState & TwoFinish);
    NSLog(@"%ld", (long)self.finishState & ThreeFinish);
    NSLog(@"%ld", (long)self.finishState & FourFinish);
    
    [self FourFinish];
    NSLog(@"FourFinish%ld",(long)self.finishState);
    NSLog(@"%ld", (long)self.finishState & OneFinish);
    NSLog(@"%ld", (long)self.finishState & TwoFinish);
    NSLog(@"%ld", (long)self.finishState & ThreeFinish);
    NSLog(@"%ld", (long)self.finishState & FourFinish);
}

- (void)oneFinish {
    self.finishState = self.finishState | OneFinish;
}

- (void)TwoFinish {
    self.finishState = self.finishState | TwoFinish;
}

- (void)ThreeFinish {
    self.finishState = self.finishState | ThreeFinish;
}

- (void)FourFinish {
    self.finishState = self.finishState | FourFinish;
}


- (void)createButton {
    
//    UIButton *button = [utilityDrawViewHelper addButtonInView:self.view frame:CGRectMake(100, 200, 47, 22) title:@"视频" font:[UIFont systemFontOfSize:11.0] titleColor:[UIColor whiteColor] backgroundColor:[UIColor redColor] tag:0 addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside borderColor:nil borderWidth:0 cornerRadius:0];
    UIButton *button = [utilityDrawViewHelper buttonWithFrame:CGRectMake(100, 200, 47, 22) title:@"视频" font:[UIFont systemFontOfSize:11.0] titleColor:[UIColor whiteColor] backgroundColor:[UIColor redColor] tag:0 addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside superView:self.view];
    
    [button setImage:[UIImage imageNamed:@"left_btn.png"] forState:UIControlStateNormal];
    
    //打印before
    NSLog(@"before image-->%@",NSStringFromUIEdgeInsets(button.imageEdgeInsets));
    NSLog(@"before title-->%@",NSStringFromUIEdgeInsets(button.titleEdgeInsets));
    

//    [button setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 24.5)];
    
    [button setImageEdgeInsets:UIEdgeInsetsMake(7, 9, 7, 32)];
//    [button setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 10)];
    [button setTitleEdgeInsets:UIEdgeInsetsMake(0, 16, 0, 8.5)];
    
//    [button setImageEdgeInsets:UIEdgeInsetsMake(0, button.titleLabel.intrinsicContentSize.width, 0, -button.titleLabel.intrinsicContentSize.width)];
//    [button setTitleEdgeInsets:UIEdgeInsetsMake(0, -button.currentImage.size.width, 0, button.currentImage.size.width)];
//
    
    
//    NSLog(@"after image-->%@",NSStringFromUIEdgeInsets(button.imageEdgeInsets));
//    NSLog(@"after title-->%@",NSStringFromUIEdgeInsets(button.titleEdgeInsets));
    
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
