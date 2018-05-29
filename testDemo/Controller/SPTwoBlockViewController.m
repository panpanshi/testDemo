//
//  SPTwoBlockViewController.m
//  testDemo
//
//  Created by ShiPanpan on 2018/5/10.
//  Copyright © 2018年 ShiPanpan. All rights reserved.
//

#import "SPTwoBlockViewController.h"
#import "utilityDrawViewHelper.h"

@interface SPTwoBlockViewController ()

@property (nonatomic, strong) UITextField *myTextField;

@end

@implementation SPTwoBlockViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(10, 100, KSCREEN_WIDTH - 20, 20)];
    textField.textColor = [UIColor blackColor];
    _myTextField = textField;
    [self.view addSubview:textField];
    
}

- (void)changeTheText {
    self.myCallBackBlock(_myTextField.text);
}

- (void)popToBlockVC {
    
    
    [self.navigationController popViewControllerAnimated:YES];
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
