//
//  ListingViewController.h
//  PickerApp
//
//  Created by Hitoshi Saiwaki on 2013/03/11.
//  Copyright (c) 2013年 Hitoshi Saiwaki. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListingViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end
