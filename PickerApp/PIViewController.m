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

//    NSString *post =[[NSString alloc] initWithFormat:@"tweet[content]=yaha"];
//    NSData *data = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];

//    NSDictionary *dic = @{@"tweet[content]" : @"yaha"};
    NSDictionary *dict = @{@"tweet[content]" : @"いいね",@"authenticity_token":@"Nm4m0orV+4iQSaEWfiS/9MJrNz/ZQOcTTon0kSdU2wo="};
    NSString *bodyString = [self buildParameters:dict];
    NSLog(@"%@",bodyString);
    NSData   *dd   = [bodyString dataUsingEncoding:NSUTF8StringEncoding];
    
    NSURL *url = [[NSURL alloc]initWithString:@"http://localhost:3000/tweets"];
    NSMutableURLRequest *req = [[NSMutableURLRequest alloc]initWithURL:url];
    [req setHTTPMethod:@"POST"];
    [req setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-type"];
    [req setValue:[NSString stringWithFormat:@"%d",[dd length]] forHTTPHeaderField:@"Content-Length"];
    [req setValue:@"_tsubuyaki_session=6a67816c08d9b3d6d95e2ac2fc9eafb4" forHTTPHeaderField:@"Cookie"];
//    [req setValue:@"Y7p0kJSHxi9AzcB4rf9SPqo5NGy5ByQWAP0pj3dv90U=" forHTTPHeaderField:@"X-CSRF-Token"];
    [req setHTTPBody:dd];
    [req setHTTPShouldHandleCookies:YES];
    NSURLConnection *con = [[NSURLConnection alloc]initWithRequest:req delegate:self];
    if (con) {
        
    }
    
}

- (NSString *) buildParameters:(NSDictionary *)params {
    NSMutableString *s = [NSMutableString string];
    
    NSString *key;
    for ( key in params ) {
        NSString *uriEncodedValue = [self uriEncodeForString:[params objectForKey:key]];
        [s appendFormat:@"%@=%@&", key, uriEncodedValue];
    }
    
    if ( [s length] > 0 ) {
        [s deleteCharactersInRange:NSMakeRange([s length]-1, 1)];
    }
    return s;
}

- (NSString* ) uriEncodeForString:(NSString *)str {
    return (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes
                                          (NULL,
                                           (__bridge CFStringRef) str,
                                           NULL,
                                           CFSTR("!*'();:@&=+$,/?%#[]"),
                                           kCFStringEncodingUTF8));
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
