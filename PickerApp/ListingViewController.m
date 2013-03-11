//
//  ListingViewController.m
//  PickerApp
//
//  Created by Hitoshi Saiwaki on 2013/03/11.
//  Copyright (c) 2013年 Hitoshi Saiwaki. All rights reserved.
//

#import "ListingViewController.h"
#import "PIAppDelegate.h"
#import "NavPushViewController.h"

@interface ListingViewController ()

@end

@implementation ListingViewController {
    NSMutableArray *itemArray;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Listing", @"Listing");
        self.tabBarItem.image = [UIImage imageNamed:@"Listing"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
//    [_tableView deselectRowAtIndexPath:[_tableView indexPathForSelectedRow] animated:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UITableView DataSource Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    itemArray = [[NSMutableArray alloc] initWithObjects:@"Spade",@"Club",@"third",@"four", nil];
    return [itemArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (nil == cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = [itemArray objectAtIndex: indexPath.row];

    return cell;
}
#pragma mark UITableView Delegate Methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    PIAppDelegate *delegate = (PIAppDelegate *)[[UIApplication sharedApplication] delegate];
    NavPushViewController *navpushView = [[NavPushViewController alloc] init];
    [delegate.navLi pushViewController:navpushView animated:YES];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

//-(CGFloat)tableView:(UITableView*)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//
//}

@end
