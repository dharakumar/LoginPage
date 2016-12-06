//
//  AddListViewController.h
//  LoginPage
//
//  Created by Kumar on 12/1/16.
//  Copyright © 2016 Kumar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Items+CoreDataProperties.h"
#import "AppDelegate.h"
#import "Customer+CoreDataProperties.h"

@interface AddListViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *nameText;
@property (weak, nonatomic) IBOutlet UITextField *quantity;
@property (nonatomic, strong) Customer *cust;


- (IBAction)Save:(id)sender;
- (IBAction)Cancel:(id)sender;

@end
