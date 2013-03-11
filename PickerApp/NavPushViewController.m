//
//  NavPushViewController.m
//  PickerApp
//
//  Created by Hitoshi Saiwaki on 2013/03/11.
//  Copyright (c) 2013年 Hitoshi Saiwaki. All rights reserved.
//

#import "NavPushViewController.h"

@interface NavPushViewController ()

@end

@implementation NavPushViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"NavPush", @"NavPush");
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
