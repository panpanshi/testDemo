//
//  SPTwoBlockViewController.h
//  testDemo
//
//  Created by ShiPanpan on 2018/5/10.
//  Copyright © 2018年 ShiPanpan. All rights reserved.
//

#import <UIKit/UIKit.h>

//定义一个block
typedef void (^CallBackBlock)(NSString *text);

@interface SPTwoBlockViewController : UIViewController

@property (nonatomic, copy) CallBackBlock myCallBackBlock;

@end
