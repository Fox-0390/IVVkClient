//
//  IVMyPageViewController.h
//  VkClient
//
//  Created by Inozemtsev Vladimir on 29/07/14.
//  Copyright (c) 2014 Inozemtsev Vladimir. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ECSlidingViewController.h"
@interface IVMyPageViewController : UIViewController<ECSlidingViewControllerDelegate>
- (IBAction)menuButtonTapped:(id)sender;
@end
