//
//  IVMenuViewController.m
//  VkClient
//
//  Created by Inozemtsev Vladimir on 29/07/14.
//  Copyright (c) 2014 Inozemtsev Vladimir. All rights reserved.
//

#import "IVMenuViewController.h"
#import "UIViewController+ECSlidingViewController.h"
@interface IVMenuViewController ()
@property (nonatomic, strong) NSArray *menuItems;
@property (nonatomic, strong) UINavigationController *transitionsNavigationController;
@end

@implementation IVMenuViewController


- (NSArray *)menuItems {
    if (_menuItems) return _menuItems;
    
    _menuItems = @[@"Моя страница", @"Музло",@"Видосы",@"Новости",@"Друзьяки",@"Поиск"];
    
    return _menuItems;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"Title";
    // topViewController is the transitions navigation controller at this point.
    // It is initially set as a User Defined Runtime Attributes in storyboards.
    // We keep a reference to this instance so that we can go back to it without losing its state.
    self.transitionsNavigationController = (UINavigationController *)self.slidingViewController.topViewController;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.view endEditing:YES];
}

#pragma mark  -UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.menuItems.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"MenuCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MenuCell"];
    }
    NSString *menuItem = self.menuItems[indexPath.row];
    
    cell.textLabel.text = menuItem;
    [cell setBackgroundColor:[UIColor clearColor]];
    
    return cell;
}
#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *menuItem = self.menuItems[indexPath.row];
    
    // This undoes the Zoom Transition's scale because it affects the other transitions.
    // You normally wouldn't need to do anything like this, but we're changing transitions
    // dynamically so everything needs to start in a consistent state.
    self.slidingViewController.topViewController.view.layer.transform = CATransform3DMakeScale(1, 1, 1);
    // _menuItems = @[@"Моя страница", @"Музло",@"Видосы",@"Новости",@"Новости",@"Поиск"];
    if ([menuItem isEqualToString:@"Моя страница"])
        self.slidingViewController.topViewController = self.transitionsNavigationController;
    else if ([menuItem isEqualToString:@"Музло"])
        self.slidingViewController.topViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"MusicNavigationController"];
    else if ([menuItem isEqualToString:@"Видосы"])
        
        self.slidingViewController.topViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"VideoNavigationController"];
    else if ([menuItem isEqualToString:@"Новости"])
        
        self.slidingViewController.topViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"NewsNavigationController"];
    
    else if ([menuItem isEqualToString:@"Новости"])
        
        self.slidingViewController.topViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"NewsNavigationController"];
    else if ([menuItem isEqualToString:@"Поиск"])
        
        self.slidingViewController.topViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"SearchNavigationController"];

    //
    
    
    
    [self.slidingViewController resetTopViewAnimated:YES];
    
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
