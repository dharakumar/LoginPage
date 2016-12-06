//
//  AddListViewController.m
//  LoginPage
//
//  Created by Kumar on 12/1/16.
//  Copyright © 2016 Kumar. All rights reserved.
//

#import "AddListViewController.h"

@interface AddListViewController ()

@end

@implementation AddListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"Tab bar controller 1 is loaded");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)Done:(id)sender {
    
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = delegate.persistentContainer.viewContext;
        NSError *error = nil;
    // Save the object to persistent store
       
   /*
    // Create a new managed object
    Items *newUser = [NSEntityDescription insertNewObjectForEntityForName:@"Items" inManagedObjectContext:context];
    [newUser setValue:self.nameText.text forKey:@"name"];
    [newUser setValue:self.quantity.text forKey:@"quantity"];
     newUser.purchase_by = self.cust;
    
    if (![context save:&error]) {
        NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
    
    }
    */

    
    //Fetching
    NSArray *fetchedObjects;
    //NSManagedObjectContext *context = [self managedObjectContext];
    NSFetchRequest *fetch = [[NSFetchRequest alloc] init];
    NSEntityDescription *entityDescription = [NSEntityDescription entityForName:@"Items"  inManagedObjectContext: context];
    [fetch setEntity:entityDescription];
   
    fetch.returnsObjectsAsFaults = NO;
    [fetch setPredicate:[NSPredicate predicateWithFormat:@"purchase_by = %@",self.cust]];
    // NSError * error = nil;
    fetchedObjects = [context executeFetchRequest:fetch error:&error];
    
    if([fetchedObjects count] == 1)
        NSLog(@"Fetched %@", [fetchedObjects objectAtIndex:0]);
    else
        NSLog(@"Fetch is nil");
    
    
    
    
}
- (IBAction)Save:(id)sender {
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = delegate.persistentContainer.viewContext;
    NSError *error = nil;
    
    //NSError *error = nil;
    // Save the object to persistent store
    if (![context save:&error]) {
        NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
    }
    
    // Create a new managed object
    Items *newUser = [NSEntityDescription insertNewObjectForEntityForName:@"Items" inManagedObjectContext:context];
    [newUser setValue:self.nameText.text forKey:@"name"];
    [newUser setValue:self.quantity.text forKey:@"quantity"];
    newUser.purchase_by = self.cust;
    
    if (![context save:&error]) {
        NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
    }
    
    
    
    //Fetching
    NSArray *fetchedObjects;
    //NSManagedObjectContext *context = [self managedObjectContext];
    NSFetchRequest *fetch = [[NSFetchRequest alloc] init];
    NSEntityDescription *entityDescription = [NSEntityDescription entityForName:@"Items"  inManagedObjectContext: context];
    [fetch setEntity:entityDescription];
    
    fetch.returnsObjectsAsFaults = NO;
    [fetch setPredicate:[NSPredicate predicateWithFormat:@"purchase_by = %@",self.cust]];
    // NSError * error = nil;
    fetchedObjects = [context executeFetchRequest:fetch error:&error];
    
    if([fetchedObjects count] == 1)
        NSLog(@"Fetched %@", [fetchedObjects objectAtIndex:0]);
    else
        NSLog(@"Fetch is nil");
    
    
}

- (IBAction)Cancel:(id)sender {
     [self dismissViewControllerAnimated:YES completion:nil];}
@end
