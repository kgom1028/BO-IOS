//
//  WebViewController.m
//  BinaryOptions
//
//  Created by BoHuang on 9/17/16.
//  Copyright © 2016 ITLove007. All rights reserved.
//

#import "WebViewController.h"
#import "Language.h"
#import "FLAnimatedImage.h"
#import "FLAnimatedImageView.h"
@import Firebase;

@interface WebViewController ()

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSURLRequest *urlRequest;
    if([self.url isEqualToString:@"file"]){
        

        NSString *html = [[NSString alloc] initWithContentsOfFile:self.filePath encoding:NSUTF8StringEncoding error:nil];
        
        // Tell the web view to load it
        //[_webView loadHTMLString:html baseURL:[[NSBundle mainBundle] bundleURL]];
      //  IMYWebView* webview = [[IMYWebView alloc] initWithFrame:self.myWebView.bounds usingUIWebView:YES];
       // [self.myWebView addSubview:webview];
       // [self.myWebView setAutoresizesSubviews:YES];
        [self.myWebView setScalesPageToFit:YES];

        self.myWebView.contentMode = UIViewContentModeScaleAspectFit;
        [self.myWebView loadHTMLString:html baseURL:[[NSBundle mainBundle] bundleURL]];
        
    }else{
        urlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:self.url]];
    [self.myWebView loadRequest:urlRequest];

    }
         //  [_webView.scrollView setShowsHorizontalScrollIndicator:NO ];
    //_webView.delegate =self;

    [_loadAnim setHidden:NO];
    [self.myWebView setHidden:YES];
    self.myWebView.delegate = self;

    //[_webView setHidden:YES];
    FLAnimatedImage *loadingAnimation = [[FLAnimatedImage alloc] initWithAnimatedGIFData:[NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"loading_anim" ofType:@"gif"]]];
    self.loadAnim.animatedImage = loadingAnimation;
    

   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView.contentOffset.x > 0)
        scrollView.contentOffset = CGPointMake(0,scrollView.contentOffset.y);
}*/


/*- (void)webView:(UIWebView *)wv didFailLoadWithError:(NSError *)error {
    // Ignore NSURLErrorDomain error -999.
    if (error.code == NSURLErrorCancelled) return;
    
    // Ignore "Fame Load Interrupted" errors. Seen after app store links.
    if (error.code == 102 && [error.domain isEqual:@"WebKitErrorDomain"]) return;
    
    // Normal error handling…
}*/
-(void) webViewDidStartLoad:(IMYWebView *)webView{
    NSURL* url = [webView.currentRequest URL];
    const char* urlchar = [[url absoluteString] UTF8String];
    NSString* urlStr = [NSString stringWithUTF8String:urlchar];
    if ([urlStr containsString:@"promo/registration"]) {
        NSLog(@"string contains promo/registration!");
        
        [FIRAnalytics logEventWithName:@"ios_register_try"
                            parameters:@{
                                         kFIRParameterItemID:[NSString stringWithFormat:@"registerstate"],
                                         kFIRParameterItemName:@"try",
                                         kFIRParameterContentType:@"username"
                                         }];
        
    } else {
        NSLog(@"string does not contain promo/registration");
    }
    
    if ([urlStr containsString:@"register-finish"]) {
        NSLog(@"string contains register-finish");
        
        [FIRAnalytics logEventWithName:@"ios_register_success"
                            parameters:@{
                                         kFIRParameterItemID:[NSString stringWithFormat:@"registerstate"],
                                         kFIRParameterItemName:@"success",
                                         kFIRParameterContentType:@"username"
                                         }];
        
    } else {
        NSLog(@"string does not contain register-finish");
    }
}

-(void) webViewDidFinishLoad:(IMYWebView *)webView{
    [_loadAnim setHidden:YES];
    [_myWebView setHidden:NO];
    if([self.url isEqualToString:@"file"])
    {
        float zoom = 3;
        [webView.scrollView setZoomScale:zoom];
    }

}
/*-(BOOL) webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    if ([[[request URL] scheme] isEqual:@"mailto"]) {
        if ([[UIApplication sharedApplication]canOpenURL:[request URL]])
        [[UIApplication sharedApplication] openURL:[request URL]];
        return NO;
    }
    
    NSURL *url = request.URL;
    if (![url.scheme isEqual:@"http"] && ![url.scheme isEqual:@"https"]) {
        if ([[UIApplication sharedApplication]canOpenURL:url]) {
            [[UIApplication sharedApplication]openURL:url];
            return NO;
        }
    }
    return YES;
}*/
-(BOOL) webView:(IMYWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    if ([[[request URL] scheme] isEqual:@"mailto"]) {
        if ([[UIApplication sharedApplication]canOpenURL:[request URL]])
            [[UIApplication sharedApplication] openURL:[request URL]];
        return NO;
    }
   
    return YES;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)backAction:(id)sender {
    if([self.myWebView canGoBack])
        [_myWebView goBack];
    else
        [self dismissViewControllerAnimated:YES completion:nil];
    
}

@end
