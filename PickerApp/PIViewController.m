//
//  PIViewController.m
//  PickerApp
//
//  Created by Hitoshi Saiwaki on 2013/02/26.
//  Copyright (c) 2013年 Hitoshi Saiwaki. All rights reserved.
//

#import "PIViewController.h"

@interface PIViewController ()

@end

@implementation PIViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    NSDictionary *dict = [NSDictionary dictionaryWithObject:@"aaa" forKey:@"content"];

    NSDictionary *dic = [NSDictionary dictionaryWithObject:dict forKey:@"tweets"];
    NSLog(@"%@",dic);
    NSData *data = [self encodeDictionary:dic];

    
    NSURL *url = [[NSURL alloc]initWithString:@"http://localhost:3000/tweets"];
    NSMutableURLRequest *req = [[NSMutableURLRequest alloc]initWithURL:url];
    [req setHTTPMethod:@"POST"];
    [req setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-type"];
    [req setValue:[NSString stringWithFormat:@"%d",[data length]] forHTTPHeaderField:@"Content-Length"];
    [req setValue:@"_tsubuyaki_session=563652b882c8f10c5cef4f7ade255220" forHTTPHeaderField:@"Cookie"];
    [req setValue:@"ZEz1Eiysbu9ENfnVNRubdqu5FM3hBgkJ8sdkGvbudd8=" forHTTPHeaderField:@"X-CSRF-Token"];
    [req setHTTPBody:data];
    [req setHTTPShouldHandleCookies:YES];
    NSURLConnection *con = [[NSURLConnection alloc]initWithRequest:req delegate:self];
    if (con) {
        
    }
    
}

- (NSData*)encodeDictionary:(NSDictionary*)dictionary {
    NSMutableArray *parts = [[NSMutableArray alloc] init];
    for (NSString *key in dictionary) {
        NSString *encodedValue = [[dictionary objectForKey:key] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSString *encodedKey = [key stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSString *part = [NSString stringWithFormat: @"%@=%@", encodedKey, encodedValue];
        [parts addObject:part];
    }
    NSString *encodedDictionary = [parts componentsJoinedByString:@"&"];
    return [encodedDictionary dataUsingEncoding:NSUTF8StringEncoding];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
