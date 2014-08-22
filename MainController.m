//
//  MainController.m
//  TextMessenger
//
//  Created by Lichard Baliuag on 25/11/12.
//  Copyright (c) 2012 Lichard Baliuag. All rights reserved.
//

#import "MainController.h"
#import "MessageContentViewController.h"
//#import "Custom.h"
#import "AddMessViewController.h"
#import "AppDelegate.h"
#import "MessageCell.h"


@interface MainController ()
{
    NSArray *message;
}

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath;
//@property (strong) NSMutableArray *messages;

@end


@implementation MainController

@synthesize fetchedResultsController = _fetchedResultsController;
@synthesize fetchedResultsControllerByGuid = _fetchedResultsControllerByGuid;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (NSManagedObjectContext *) managedObjectContext
{
    return [(AppDelegate *)[[UIApplication sharedApplication]delegate]managedObjectContext];
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    // Fetch the messages from persistent store
    //NSManagedObjectContext *managedObjectContext = [self managedObjectContext];
    //NSFetchRequest *fetchRequest = [[NSFetchRequest alloc]initWithEntityName:@"UserMessages"];
    //self.messages = [[managedObjectContext executeFetchRequest:fetchRequest error:nil]mutableCopy];
    //[self.tableView reloadData];
}

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)dealloc {
    
}

- (void)viewDidLoad
{
    
    if ([self.isFromNotification isEqualToString:@"1"]) {
        return;
    }
    
    [super viewDidLoad];
   
    [self.tableView registerNib:[UINib nibWithNibName:@"CustomCellMessageDetails" bundle:nil] forCellReuseIdentifier:@"Cell"];
    
    self.fetchedResultsController = nil;
    NSError *error = nil;
    if (![[self fetchedResultsController]performFetch:&error])
    {
        NSLog(@"Error in viewDidLoad! %@", error);
        //abort();
    }
    
    // Uncomment the following line to preserve selection between presentations.
    //-- self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
     self.navigationItem.leftBarButtonItem = self.editButtonItem;
    
    //self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemCompose target:self action:@selector(newMessage)];
    
    //To change navigation bar color.
    //self.navigationController.navigationBar.tintColor = [UIColor orangeColor];
    self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:24/255.0f green:177/255.0f blue:16/255.0f alpha:1.0f];
    
}

//- (void) LoadData
//{
//    //AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
//    
//}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    //return 1; 
    return [[self.fetchedResultsController sections]count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    id<NSFetchedResultsSectionInfo> sectionInfo = [[self.fetchedResultsController sections]objectAtIndex:section];
    return [sectionInfo numberOfObjects];
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSArray *sections = [[self fetchedResultsController] sections];
    id<NSFetchedResultsSectionInfo> currentSection = [sections objectAtIndex:section];
    return  [currentSection name];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    MessageCell *cell =(MessageCell *) [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    UserMessages *msg = [self.fetchedResultsController objectAtIndexPath:indexPath];

    //cell.imgRecipientImage =
    cell.labelSendToDate.text = @"15-Aug-2014 8:00PM";
    cell.labelStatus.text = @"Sent";
    cell.labelRecipientName.text = msg.recipientName;
    cell.labelMessageDetails.text = msg.messageContent;
    
    return cell;

}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{    
    [self performSegueWithIdentifier:@"MessageDetail" sender:self ];

}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

        if ([segue.identifier isEqualToString:@"MessageDetail"])
        {
            
            NSIndexPath *path = [self.tableView indexPathForSelectedRow];
            UserMessages *msg = [self.fetchedResultsController objectAtIndexPath:path];
            MessageContentViewController *mcvc = segue.destinationViewController;
            mcvc.userMessages = msg;
            
        }
        else if ([segue.identifier isEqualToString:@"notificationDetail"])
        {
            UserMessages *msg= [[[self fetchedResultsControllerByMessageID:self.notificationID] fetchedObjects] firstObject];
            MessageContentViewController *mcvc = segue.destinationViewController;
            // mcvc.messageGuid = msg.messageGuid;// [[message objectAtIndex:path.row] objectForKey:@"messageGuid"];
            mcvc.userMessages = msg;
            // UserMessages *msg = [self.fetchedResultsController objectAtIndexPath:path];
    }
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        // Source: http://www.youtube.com/watch?v=ZoTAKAjEIFM Time: 41:00
        
        NSManagedObjectContext *context = [self managedObjectContext];
        UserMessages *messageToDelete = [self.fetchedResultsController objectAtIndexPath:indexPath];
        [context deleteObject:messageToDelete];
        
         NSError *error = nil;
        if (![context save:&error])
        {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Commit editing error %@, %@", error, [error userInfo]);
            //abort();
        }
    }
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // The table view should not be re-orderable.
    return NO;
}

#pragma mark - Fetched Results Controller Section

- (NSFetchedResultsController *) fetchedResultsController
{
    
    if (_fetchedResultsController != nil)
    {
        return _fetchedResultsController;
        
    }
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    self.managedObjectContext = [appDelegate managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc]init];
    
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"UserMessages" inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
    
    // Set batch size to load only minimal data required.
    [fetchRequest setFetchBatchSize:20];
    
    // To arrange according to recipient name
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc]initWithKey:@"messageDateCreated" ascending:NO];
    //NSSortDescriptor *sortRecipientName = [[NSSortDescriptor alloc]initWithKey:@"recipientName" ascending:YES];
    
    //NSArray *sortArray = [NSArray arrayWithObjects:sortDescriptor,sortRecipientName, nil];
    NSArray *sortArray = [NSArray arrayWithObjects:sortDescriptor,sortDescriptor, nil];

    [fetchRequest setSortDescriptors:sortArray];

    // To assign an array for the sort desriptors property
    fetchRequest.sortDescriptors = [[NSArray alloc]initWithObjects:sortDescriptor, nil]; //sortDescriptors;
    
    _fetchedResultsController = [[NSFetchedResultsController alloc]initWithFetchRequest:fetchRequest managedObjectContext:self.managedObjectContext sectionNameKeyPath:@"messageDateCreated" cacheName:nil];
    
    self.fetchedResultsController = _fetchedResultsController;
    _fetchedResultsController.delegate = self;
    
    NSError *error = nil;
	if (![self.fetchedResultsController performFetch:&error])
    {
	    NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
	    abort();
	}

    return _fetchedResultsController;

}


- (NSFetchedResultsController *) fetchedResultsControllerByMessageID:(NSString *)messageGuid
{
    if (_fetchedResultsControllerByGuid != nil)
    {
        return _fetchedResultsControllerByGuid;
    }
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    self.managedObjectContext = [appDelegate managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc]init];
    
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"UserMessages" inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
    
    // Set batch size to load only minimal data required.
    [fetchRequest setFetchBatchSize:20];
    
    // To arrange according to recipient name
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc]initWithKey:@"messageDateCreated" ascending:NO]; // 1
    
    // To hold the sorted recipient name teporarily
    //NSArray *sortDescriptors = @[sortDescriptor];
    //NSArray *sortDescriptors = [[NSArray alloc]initWithObjects:sortDescriptor, nil];
    
    // To assign an array for the sort desriptors property
    fetchRequest.sortDescriptors = [[NSArray alloc]initWithObjects:sortDescriptor, nil]; //sortDescriptors;       // 2
    
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"messageGuid CONTAINS %@", messageGuid];
    [fetchRequest setPredicate:pred];
    
    _fetchedResultsControllerByGuid = [[NSFetchedResultsController alloc]initWithFetchRequest:fetchRequest managedObjectContext:self.managedObjectContext sectionNameKeyPath:nil cacheName:nil];
    
    self.fetchedResultsControllerByGuid = _fetchedResultsControllerByGuid;
    _fetchedResultsControllerByGuid.delegate = self;
    
    NSError *error = nil;
	if (![self.fetchedResultsControllerByGuid performFetch:&error])
    {
	    NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
	    abort();
	}
    
    return _fetchedResultsControllerByGuid;
    
}


#pragma mark - Fetched Results Controller Delegates
- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller
{
    [self.tableView beginUpdates];
}

- (void)controller:(NSFetchedResultsController *)controller didChangeSection:(id <NSFetchedResultsSectionInfo>)sectionInfo atIndex:(NSUInteger)sectionIndex forChangeType:(NSFetchedResultsChangeType)type
{
    switch(type) {
        case NSFetchedResultsChangeInsert:
            [self.tableView insertSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeDelete:
            [self.tableView deleteSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
            break;
    }
}

- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type
        newIndexPath:(NSIndexPath *)newIndexPath
{
    UITableView *tableView = self.tableView;        // Create temporary place holder
    switch(type) {
            
        case NSFetchedResultsChangeInsert:
            [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeDelete:
            [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeUpdate:
            {
            // Ref: http://www.youtube.com/watch?v=ZoTAKAjEIFM  Time: 36:00
            UserMessages *userMessages = [self.fetchedResultsController objectAtIndexPath:indexPath];
            UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
            // --- Recipient Name & Message Content here -- //
            cell.textLabel.text = userMessages.recipientName;
            cell.detailTextLabel.text = userMessages.messageContent;
            // ------------- enf of line ----------------- //
                
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

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller
{
    [self.tableView endUpdates];
}

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath
{
    NSManagedObject *object = [self.fetchedResultsController objectAtIndexPath:indexPath];
    cell.textLabel.text = [[object valueForKey:@"recipientName"] description];
}

-(void)CallOtherView
{
    [self performSegueWithIdentifier:@"notificationDetail" sender:self ];
    
}


@end
