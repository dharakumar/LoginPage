//
//  MyAccountViewController.h
//  LoginPage
//
//  Created by Kumar on 11/28/16.
//  Copyright © 2016 Kumar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ListItemsViewController.h"
#import "AppDelegate.h"
#import "Customer+CoreDataProperties.h"
#import "AddListViewController.h"

@interface MyAccountViewController : UIViewController
- (IBAction)NewST:(id)sender;
- (IBAction)ListItems:(id)sender;
@property (nonatomic,strong) NSString *account;
@end
