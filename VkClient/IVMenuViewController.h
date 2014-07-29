//
//  IVMenuViewController.h
//  VkClient
//
//  Created by Inozemtsev Vladimir on 29/07/14.
//  Copyright (c) 2014 Inozemtsev Vladimir. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IVMenuViewController : UIViewController<UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *table;

@end
