//
//  AppDelegate.h
//  testDemo
//
//  Created by ShiPanpan on 2018/4/20.
//  Copyright © 2018年 ShiPanpan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

