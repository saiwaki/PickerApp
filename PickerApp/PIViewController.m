//
//  PIViewController.m
//  PickerApp
//
//  Created by Hitoshi Saiwaki on 2013/02/26.
//  Copyright (c) 2013年 Hitoshi Saiwaki. All rights reserved.
//

#import "PIViewController.h"
#import "PIAppDelegate.h"
#import "ModalViewController.h"

@interface PIViewController ()

@end

@implementation PIViewController {
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"PI", @"PI");
        self.tabBarItem.image = [UIImage imageNamed:@"PI"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)openModalButton:(id)sender {
    ModalViewController *modalCont = [[ModalViewController alloc] init];
    [self presentViewController:modalCont animated:YES completion:nil];
}

@end
