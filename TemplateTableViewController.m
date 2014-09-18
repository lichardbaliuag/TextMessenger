//
//  TemplateTableViewController.m
//  TextMessenger
//
//  Created by Lichard Baliuag on 26/7/14.
//  Copyright (c) 2014 Lichard Baliuag. All rights reserved.
//

#import "TemplateTableViewController.h"
#import "FetchViewController.h"
#import "CustomLoader.h"
#import "CommonStyle.h"
#import "CommonURLFetch.h"



@interface TemplateTableViewController ()
{
    NSMutableArray *arrTemplate;
    NSArray *arrTemplateSearch;
    CustomLoader *loader;
    CommonURLFetch *fetchTemplate;
    dispatch_queue_t que;
}


@end

@implementation TemplateTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [self.tabBarController.tabBar setHidden:NO];
    fetchTemplate = [[CommonURLFetch alloc]init];
    
    
    
    [super viewDidLoad];
    
    
    loader = [[CustomLoader alloc]init];
    [loader InitializeLoader:self];
    
    UIRefreshControl *refresh = [[UIRefreshControl alloc] init];
    refresh.attributedTitle = [[NSAttributedString alloc] initWithString:@"Pull to Refresh"];
    [refresh addTarget:self action:@selector(initializeTemplate)forControlEvents:UIControlEventValueChanged];
    self.refreshControl = refresh;

    loader.label.text = @"Loading...";
    [self.tableView addSubview:loader.xview];
    [self.tableView addSubview:loader.spinner];
    [self.tableView addSubview:loader.label];
    [loader.spinner startAnimating];
    
    if (!que) {
        que = dispatch_queue_create("sample_que", NULL);
    }
    
    dispatch_async(que, ^{

        

        [self initializeTemplate];
        
    });

    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidAppear:(BOOL)animated
{
    [self.tabBarController.tabBar setHidden:NO];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
   // return arrTemplate.count;
    if (tableView == self.searchDisplayController.searchResultsTableView)
    {
        return [arrTemplateSearch count];
        
    } else {
        
        return [arrTemplate count];
    }

}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
//    NSDictionary *tmpDict = [[NSDictionary alloc]init];
//    
//    if (tableView == self.searchDisplayController.searchResultsTableView)
//    {
//        tmpDict = [arrTemplateSearch objectAtIndex:indexPath.row];
//
//    }
//    else
//    {
//        tmpDict = [arrTemplate objectAtIndex:indexPath.row];
//    }
//    
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        [self performSegueWithIdentifier: @"templateDetail" sender: self];
    }
    
    //[self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
    
    
    
    
}

- (void)stopRefresh
{
    
    //[self.tableView reloadData];
    [self.refreshControl endRefreshing];
    
}

-(void)initializeTemplate
{
//    [loader.spinner startAnimating];
//    [self.tableView addSubview:loader.spinner];
    
    
    
    
    dispatch_async(dispatch_get_main_queue(),^{
        
       // NSDictionary *dictionary;
        arrTemplate = [[NSMutableArray alloc] init];
        
        [fetchTemplate getGreetifyTemplate:^(NSMutableArray *array, NSError *error) {
            
            if (error != nil) {
                
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"Network connectivity or server not available" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                
                [loader.spinner stopAnimating];
                [self performSelector:@selector(stopRefresh) withObject:nil afterDelay:2.5];
                
                for (UIView *subview in [self.view subviews]) {
                    // Only remove the subviews with tag not equal to 1
                    if (subview.tag == 1) {
                        [subview removeFromSuperview];
                    }
                }
                
                [alert show];
            }
            else
            {
                arrTemplate = array;
                
                [self.tableView reloadData];
                
                sleep(1);
                
                
                [loader.spinner stopAnimating];
                [self performSelector:@selector(stopRefresh) withObject:nil afterDelay:2.5];
                
                for (UIView *subview in [self.view subviews]) {
                    // Only remove the subviews with tag not equal to 1
                    if (subview.tag == 1) {
                        [subview removeFromSuperview];
                    }
                }
            }
            
            
            
            

        }];
        
        
        //[self.tableView reloadData];
        
        
        
        //[self.tableView reloadData];
        
    });
    
    

}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self resignFirstResponder];

    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }

    NSDictionary *tmpDict = nil;

    // NSLog(@"numberOfRowsInSection %lu",(unsigned long)[[myObject filteredArrayUsingPredicate:resultPredicate] count]);
    //tmpDict =  [[arrTemplate filteredArrayUsingPredicate:resultPredicate] objectAtIndex:indexPath.row ] ;
    
    if (tableView == self.searchDisplayController.searchResultsTableView)
    {
    
        tmpDict = [arrTemplateSearch objectAtIndex:indexPath.row];
    } else
    {
        tmpDict = [arrTemplate objectAtIndex:indexPath.row];
    }
    cell.textLabel.text = [tmpDict objectForKey:@"TemplateTitle"];
    cell.detailTextLabel.text = [tmpDict objectForKey:@"TemplateContent"];

    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"templateDetail"])
    {
        NSIndexPath *path; // = [self.tableView indexPathForSelectedRow];
        
        FetchViewController *dv = segue.destinationViewController;
       // path = [self.searchDisplayController.searchResultsTableView indexPathForSelectedRow];
               NSDictionary *tmpDict = nil;
        
        if ([self.searchDisplayController isActive]) {
            path = [self.searchDisplayController.searchResultsTableView indexPathForSelectedRow];
            tmpDict = [arrTemplateSearch objectAtIndex:path.row ];
        }
        else
        {
            path = [self.tableView indexPathForSelectedRow];

            tmpDict = [arrTemplate objectAtIndex:path.row ];
        }
        
        dv.templateContent = [tmpDict objectForKey:@"TemplateContent"];
        dv.templateID = [tmpDict objectForKey:@"TemplateID"];
        
        
    }
    
}


 #pragma mark -  Search Filter

- (void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope
{
    arrTemplateSearch = [[NSArray alloc]init];
    NSString *nameFilter = [NSString stringWithFormat:@"%@*", searchText];
   // NSString *desFilter = [NSString stringWithFormat:@"*%@*", searchText];
    
    NSPredicate *resultPredicate = [NSPredicate
                                    predicateWithFormat:@"(TemplateContent LIKE [cd]%@)",
                                    nameFilter];
    
    arrTemplateSearch = [arrTemplate filteredArrayUsingPredicate:resultPredicate];
    
    
 
}

-(BOOL)searchDisplayController:(UISearchDisplayController *)controller
shouldReloadTableForSearchString:(NSString *)searchString
{
    [self filterContentForSearchText:searchString
                               scope:[[self.searchDisplayController.searchBar scopeButtonTitles]
                                      objectAtIndex:[self.searchDisplayController.searchBar
                                                     selectedScopeButtonIndex]]];
    
    return YES;
}




/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

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
