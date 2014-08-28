//
//  MEAutorizationViewController.m
//  TransitionFun
//
//  Created by Inozemtsev Vladimir on 21/07/14.
//  Copyright (c) 2014 Mike Enriquez. All rights reserved.
//

#import "MEAutorizationViewController.h"
#import "MEAccessToken.h"
@interface MEAutorizationViewController ()
@property(weak,nonatomic) UIWebView *webView;
@property(copy,nonatomic) MELoginCompletionBlock completionBlock;
@end

@implementation MEAutorizationViewController


-(id)initWithCompletionBlock:(MELoginCompletionBlock) completionBlock;
{
    self = [super init];
    if (self) {
        self.completionBlock=completionBlock;
    }
    return self;
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    CGRect frame=self.view.bounds;
    frame.origin=CGPointZero;
    
    UIWebView* web=[[UIWebView alloc] initWithFrame:frame];
    web.autoresizingMask=UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    
    [self.view addSubview:web];
    
    self.webView=web;
    UIBarButtonItem* item=[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(actionCancel:) ];
    
    [self.navigationItem setRightBarButtonItem:item animated:NO];
    
    self.navigationItem.title=@"Login";
    self.webView.delegate=self;
    
    //4412281
    NSString* urlString=@"https://oauth.vk.com/authorize?"
    "client_id=4412281&"
    "scope=1055&"//
    "redirect_uri=hello.there&"
    "display=mobile&"
    "v=5.21&"
    "response_type=token";
    NSURL* url=[NSURL URLWithString:urlString];
    NSURLRequest* request=[NSURLRequest requestWithURL:url];
    [web loadRequest:request];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    
    
    if([[[request URL] host] isEqualToString:@"hello.there"])
    {
        MEAccessToken* token=[[MEAccessToken alloc] init];
        NSString* query=[[request URL] absoluteString];
        
        NSArray* array=[query componentsSeparatedByString:@"#"];
        
        if (array.count>1) {
            query=[array lastObject];
        }
        
        
        NSArray* pairs=[query componentsSeparatedByString:@"&"];
        for (NSString* pair in pairs) {
            
            NSArray* pairArray=[pair componentsSeparatedByString:@"="];
            if (pairArray.count==2) {
                
                NSString* key=[pairArray firstObject];
                if ([key isEqualToString:@"access_token"]) {
                    token.token=[pairArray lastObject];
                }else if([key isEqualToString:@"expires_in"])
                {
                    NSTimeInterval interval=[[pairArray lastObject] doubleValue];
                    token.expirationDate=[NSDate dateWithTimeIntervalSinceNow:interval];
                    
                    
                }else if([key isEqualToString:@"user_id"])
                {
                    token.userID=[pairArray lastObject];
                }
                
                
            }
            
        }
        if(self.completionBlock)
            self.completionBlock(token);
        [self dismissViewControllerAnimated:true completion:nil];
        NSLog(@"%@",request.URL);
        return NO;
    }
    return YES;
}

-(void)dealloc
{
    self.webView=nil;
}

#pragma mark-Actions
-(void)actionCancel:(UIBarButtonItem*) item
{
    if(self.completionBlock)
        self.completionBlock(nil);
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
