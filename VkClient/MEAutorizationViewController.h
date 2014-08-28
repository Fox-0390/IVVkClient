//
//  MEAutorizationViewController.h
//  TransitionFun
//
//  Created by Inozemtsev Vladimir on 21/07/14.
//  Copyright (c) 2014 Mike Enriquez. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MEAccessToken;
typedef void(^MELoginCompletionBlock)(MEAccessToken* token);

@interface MEAutorizationViewController : UIViewController<UIWebViewDelegate>
-(id)initWithCompletionBlock:(MELoginCompletionBlock) completionBlock;
@end
