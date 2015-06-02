//
//  ViewController.m
//  TestWebViewWithURLRestrictions
//
//  Created by Michel Mongkhoy on 6/2/15.
//  Copyright (c) 2015 Michel Mongkhoy. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSURL *url = [NSURL URLWithString:@"http://www.google.fr"];
    NSURLRequest *urlRequest = [[NSURLRequest alloc] initWithURL:url];
    [self.webView loadRequest:urlRequest];
}

#pragma mark <UIWebViewDelegate>

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    if ([request.URL.absoluteString hasPrefix:@"http://www.google.fr"] ||
        [request.URL.absoluteString hasPrefix:@"https://www.google.fr"]) {
        NSLog(@"Please continue to browse on the Google French Website");
        return YES;
    } else {
        NSLog(@"Sorry, other websites except the Google French one are not allowed");
        return NO;
    }
}

@end
