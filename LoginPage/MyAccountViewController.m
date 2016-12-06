//
//  MyAccountViewController.m
//  LoginPage
//
//  Created by Kumar on 11/28/16.
//  Copyright © 2016 Kumar. All rights reserved.
//

#import "MyAccountViewController.h"

@interface MyAccountViewController ()
{
    Customer *customer;
}

@end

@implementation MyAccountViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"View Controller 3 Loaded");
    NSLog(@"success account");
}

-(void)viewDidAppear:(BOOL)animated
{    NSLog(@"View Controller 3 appeared");
    [super viewDidAppear:YES];
    NSString *msg = [self.account  stringByAppendingString:@" , You Are entered into your account"];
    
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Success" message:msg preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    [alertController addAction:ok];
    
    [self presentViewController:alertController animated:YES completion:nil];
    
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = delegate.persistentContainer.viewContext;
    NSError *error = nil;
    //Fetching
    NSArray *fetchedObjects;
    //NSManagedObjectContext *context = [self managedObjectContext];
    NSFetchRequest *fetch = [[NSFetchRequest alloc] init];
    NSEntityDescription *entityDescription = [NSEntityDescription entityForName:@"Customer"  inManagedObjectContext: context];
    [fetch setEntity:entityDescription];
    
    NSLog(@"customer %@",entityDescription);
    fetch.returnsObjectsAsFaults = NO;
    [fetch setPredicate:[NSPredicate predicateWithFormat:@"name = %@",self.account]];
    // NSError * error = nil;
    fetchedObjects = [context executeFetchRequest:fetch error:&error];
    
    if([fetchedObjects count] == 1)
        NSLog(@"Fetched %@", [fetchedObjects objectAtIndex:0]);
    else
        NSLog(@"Fetch is nil");
    customer = [fetchedObjects objectAtIndex:0];
    
/*
    customer = [NSEntityDescription insertNewObjectForEntityForName:@"Customer" inManagedObjectContext:context];
    [customer setValue:self.account forKey:@"name"];
    [customer setValue:@"4154941140" forKey:@"phone"];
    // newUser.purchase_by = @"Dhara";
    if (![context save:&error]) {
        NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
    }

  */

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    NSLog(@"segue");
    UITabBarController *tabbar =[segue destinationViewController];
    ListItemsViewController *tvc =[tabbar.viewControllers objectAtIndex:1];
    tvc.customer = customer;
    AddListViewController *vc = [tabbar.viewControllers objectAtIndex:0];
    vc.cust = customer;
   // tabbar.tabBarItem.title =@"Done";
    [[self.tabBarController.tabBar.items objectAtIndex:2] setTitle:NSLocalizedString(@"DONE", @"comment")];

    
}


- (IBAction)NewST:(id)sender {
    
    
}

- (IBAction)ListItems:(id)sender {
    
    
    
}


@end
