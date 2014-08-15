//
//  IVNewsViewController.h
//  VkClient
//
//  Created by Inozemtsev Vladimir on 14/08/14.
//  Copyright (c) 2014 Inozemtsev Vladimir. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ECSlidingViewController.h"

@interface IVNewsViewController :  UIViewController<ECSlidingViewControllerDelegate>
- (IBAction)menuButtonTapped:(id)sender;
@end
