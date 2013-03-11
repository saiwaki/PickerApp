//
//  PIAppDelegate.h
//  PickerApp
//
//  Created by Hitoshi Saiwaki on 2013/02/26.
//  Copyright (c) 2013年 Hitoshi Saiwaki. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PIViewController.h"
#import "ListingViewController.h"

@interface PIAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UINavigationController *navPi;
@property (strong, nonatomic) UINavigationController *navLi;
@property (strong, nonatomic) UITabBarController *tabCont;

@end
