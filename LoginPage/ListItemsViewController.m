//
//  ListItemsViewController.m
//  LoginPage
//
//  Created by Kumar on 12/1/16.
//  Copyright © 2016 Kumar. All rights reserved.
//

#import "ListItemsViewController.h"

@interface ListItemsViewController ()

@end

@implementation ListItemsViewController
@synthesize fetchedResultsController =_fetchedResultsController;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    AppDelegate *delegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *moc = delegate.persistentContainer.viewContext;
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Items" inManagedObjectContext:moc];
    [fetchRequest setEntity:entity];
    // Specify criteria for filtering which objects to fetch
    fetchRequest.returnsObjectsAsFaults =NO;
    
   // NSPredicate *predicate = [NSPredicate predicateWithFormat:@"purchase_by = %@", self.customer];
NSError * error1 = nil;
    NSArray *arr = [moc executeFetchRequest:fetchRequest error:&error1];
    
    //if([fetchRequest count] == 1)
        NSLog(@" item2 vdl Fetched %@", arr);
    //else
       // NSLog(@"Fetch is nil");
    
    NSError *error;
    if(![[self fetchedResultsController] performFetch:&error])
   {
      NSLog(@"@error");
   }
    [self.tableView reloadData];
    
self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
}

-(void) viewWillAppear:(BOOL)animated
{
    
    AppDelegate *delegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *moc = delegate.persistentContainer.viewContext;
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Items" inManagedObjectContext:moc];
    [fetchRequest setEntity:entity];
    // Specify criteria for filtering which objects to fetch
    fetchRequest.returnsObjectsAsFaults =NO;
    
    //NSPredicate *predicate = [NSPredicate predicateWithFormat:@"purchase_by = %@", self.customer];
    NSError * error1 = nil;
    NSArray *arr = [moc executeFetchRequest:fetchRequest error:&error1];
    
    //if([fetchRequest count] == 1)
    NSLog(@" item2 vdl Fetched %@", arr);
    //else
    // NSLog(@"Fetch is nil");
    

    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    id  sectionInfo =  [[_fetchedResultsController sections] objectAtIndex:section];
    return [sectionInfo numberOfObjects];
}



 - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
 ListViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
     Items *entity =[_fetchedResultsController objectAtIndexPath:indexPath];
     cell.name.text = entity.name;
     cell.quantity.text = entity.quantity;
     
     
 
 // Configure the cell...
 
 return cell;
 }


/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */


 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 //[tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
     
     NSManagedObject *entity = [self.fetchedResultsController objectAtIndexPath:indexPath];
     AppDelegate *delegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
     NSManagedObjectContext *moc = delegate.persistentContainer.viewContext;
     [moc deleteObject:entity];
     [moc save:nil];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of thppropriate class, insert it into the array, and add a new row to the table view
 }
 }
 
-(NSFetchedResultsController*)fetchedResultsController
{  NSLog(@"fetch controller %@", self.customer);
     if(_fetchedResultsController != nil)
    {
        return _fetchedResultsController;
    }
    
    AppDelegate *delegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *moc = delegate.persistentContainer.viewContext;
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Items" inManagedObjectContext:moc];
    [fetchRequest setEntity:entity];
    // Specify criteria for filtering which objects to fetch
    fetchRequest.returnsObjectsAsFaults =NO;
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"purchase_by = %@", self.customer];
    [fetchRequest setPredicate:predicate];
   NSSortDescriptor *sorters = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES];
   [fetchRequest setSortDescriptors:[NSArray arrayWithObjects:sorters, nil]];
    
   // NSError *error = nil;
    NSFetchedResultsController *fetchObjects = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:moc sectionNameKeyPath:nil cacheName:nil];
   // NSArray *fetchedObjects = [moc executeFetchRequest:fetchRequest error:&error];
    if (fetchObjects == nil) {
        
    }
    fetchObjects.delegate = self;
    _fetchedResultsController = fetchObjects;
   // NSLog(@"fetched %@",fetchObjects.fetchedObjects[0]);
    return _fetchedResultsController;
    
}
- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller {
    // The fetch controller is about to start sending change notifications, so prepare the table view for updates.
    [self.tableView beginUpdates];
}


- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type newIndexPath:(NSIndexPath *)newIndexPath {
    
    UITableView *tableView = self.tableView;
    
    switch(type) {
            
        case NSFetchedResultsChangeInsert:
        {    NSLog(@"NSFetchedResultsChamgeUpdate*********Insert:%@",newIndexPath);
            [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
        }
            break;
            
        case NSFetchedResultsChangeDelete:
            [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeUpdate:
        {  NSLog(@"NSFetchedResultsChamgeUpdate*********");
            Items *tem = [_fetchedResultsController objectAtIndexPath:indexPath];
            ListViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
            cell.name.text = [NSString stringWithFormat:@"%@", tem.name];
            cell.quantity.text = [NSString stringWithFormat:@"%@",tem.quantity];
        }
            break;
            
        case NSFetchedResultsChangeMove:
            [tableView deleteRowsAtIndexPaths:[NSArray
                                               arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
            [tableView insertRowsAtIndexPaths:[NSArray
                                               arrayWithObject:newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
    }
}


- (void)controller:(NSFetchedResultsController *)controller didChangeSection:(id )sectionInfo atIndex:(NSUInteger)sectionIndex forChangeType:(NSFetchedResultsChangeType)type {
    
    switch(type) {
            
        case NSFetchedResultsChangeInsert:
            [self.tableView insertSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeDelete:
            [self.tableView deleteSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
            break;
    }
}


- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller {
    // The fetch controller has sent all current change notifications, so tell the table view to process all updates.
    [self.tableView endUpdates];
}

@end
