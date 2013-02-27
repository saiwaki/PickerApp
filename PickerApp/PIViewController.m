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

//    NSDictionary *dict = [NSDictionary dictionaryWithObject:@"saiwaki" forKey:@"content"];
//
//    NSDictionary *dic = [NSDictionary dictionaryWithObject:dict forKey:@"tweet"];
//    NSLog(@"%@",dic);
    NSString *post =[[NSString alloc] initWithFormat:@"tweet[content]=pickerapp"];
    NSData *data = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];

//    NSString *bodyString = [self _buildParameters:dict]; //dictではなくdicにしたい
//    NSData   *data   = [bodyString dataUsingEncoding:NSUTF8StringEncoding];
//    NSData   *data   = [NSKeyedArchiver archivedDataWithRootObject:dic];
    
    NSURL *url = [[NSURL alloc]initWithString:@"http://localhost:3000/tweets"];
    NSMutableURLRequest *req = [[NSMutableURLRequest alloc]initWithURL:url];
    [req setHTTPMethod:@"POST"];
    [req setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-type"];
    [req setValue:[NSString stringWithFormat:@"%d",[data length]] forHTTPHeaderField:@"Content-Length"];
    [req setValue:@"_tsubuyaki_session=b858e8d6006a7462115d4582218efd37" forHTTPHeaderField:@"Cookie"];
    [req setValue:@"Y7p0kJSHxi9AzcB4rf9SPqo5NGy5ByQWAP0pj3dv90U=" forHTTPHeaderField:@"X-CSRF-Token"];
    [req setHTTPBody:data];
    [req setHTTPShouldHandleCookies:YES];
    NSURLConnection *con = [[NSURLConnection alloc]initWithRequest:req delegate:self];
    if (con) {
        
    }
    
}

- (NSString*)_buildParameters:(NSDictionary *)params {
    NSMutableString *s = [NSMutableString string];
    
    NSString *key;
    for ( key in params ) {
        NSString *uriEncodedValue = [self _uriEncodeForString:[params objectForKey:key]];
        [s appendFormat:@"%@=%@&", key, uriEncodedValue];
    }
    
    if ( [s length] > 0 ) {
        [s deleteCharactersInRange:NSMakeRange([s length]-1, 1)];
    }
    return s;
}

- (NSString*)_uriEncodeForString:(NSString *)str {
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
