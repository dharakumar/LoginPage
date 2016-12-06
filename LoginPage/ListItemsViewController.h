//
//  ListItemsViewController.h
//  LoginPage
//
//  Created by Kumar on 12/1/16.
//  Copyright © 2016 Kumar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "Items+CoreDataProperties.h"
#import "AppDelegate.h"
#import "Customer+CoreDataProperties.h"
#import "ListViewCell.h"


@interface ListItemsViewController : UIViewController   <UITableViewDelegate ,UITableViewDataSource ,NSFetchedResultsControllerDelegate >
@property (nonatomic,strong) NSFetchedResultsController *fetchedResultsController;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic ,strong) Customer *customer;
@end
