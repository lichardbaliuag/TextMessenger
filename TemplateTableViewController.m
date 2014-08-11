//
//  TemplateTableViewController.m
//  TextMessenger
//
//  Created by Lichard Baliuag on 26/7/14.
//  Copyright (c) 2014 Lichard Baliuag. All rights reserved.
//

#import "TemplateTableViewController.h"
#import "FetchViewController.h"

@interface TemplateTableViewController ()
{
    NSMutableArray *arrTemplate;
    
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
    [super viewDidLoad];
    [self initializeTemplate];


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
    return arrTemplate.count;
}

-(void)initializeTemplate
{
    NSDictionary *dictionary;
    
    arrTemplate = [[NSMutableArray alloc] init];
    //CommonFunction *common = [[CommonFunction alloc]init];
    //NSString *x = [common GetJsonConnection:@"GetHiritMessage2"];
    NSString *result = nil;
    result = [NSString stringWithFormat:@"http://service.bmcseatransport.com/Service1.svc/getdata"];
    NSData *jsonSource = [NSData dataWithContentsOfURL:[NSURL URLWithString:result]];
    
    id jsonObjects = [NSJSONSerialization JSONObjectWithData:
                      jsonSource options:NSJSONReadingMutableContainers error:nil];
    
    for (NSDictionary *dataDict in jsonObjects) {

        NSString *backroundImage = [dataDict objectForKey:@"BackroundImage"];
        NSString *createdBy = [dataDict objectForKey:@"CreatedBy"];
        NSString *dateCreated = [dataDict objectForKey:@"DateCreated"];
        NSString *dateModified = [dataDict objectForKey:@"DateModified"];
        NSString *modifiedBy = [dataDict objectForKey:@"ModifiedBy"];
        NSString *templateContent = [dataDict objectForKey:@"TemplateContent"];
        NSString *templateID = [dataDict objectForKey:@"TemplateID"];
        NSString *templateTitle = [dataDict objectForKey:@"TemplateTitle"];
        
        dictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                      backroundImage, @"BackroundImage",
                      createdBy, @"CreatedBy",
                      dateCreated, @"DateCreated",
                      dateModified, @"DateModified",
                      modifiedBy, @"ModifiedBy",
                      templateContent, @"TemplateContent",
                      templateID, @"TemplateID",
                      templateTitle, @"TemplateTitle", nil];
            
        [arrTemplate addObject:dictionary];
        
    }

}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }

    NSDictionary *tmpDict = nil;

    // NSLog(@"numberOfRowsInSection %lu",(unsigned long)[[myObject filteredArrayUsingPredicate:resultPredicate] count]);
    //tmpDict =  [[arrTemplate filteredArrayUsingPredicate:resultPredicate] objectAtIndex:indexPath.row ] ;
    tmpDict = [arrTemplate objectAtIndex:indexPath.row];

    cell.textLabel.text = [tmpDict objectForKey:@"TemplateTitle"];
    cell.detailTextLabel.text = [tmpDict objectForKey:@"TemplateContent"];

    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"templateDetail"])
    {
        
        NSIndexPath *path = [self.tableView indexPathForSelectedRow];
        FetchViewController *dv = segue.destinationViewController;
        NSDictionary *tmpDict = nil;
        
        tmpDict = [arrTemplate objectAtIndex:path.row ];
        
        dv.templateContent = [tmpDict objectForKey:@"TemplateContent"];
        dv.templateID = [tmpDict objectForKey:@"TemplateID"];
    }
    
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
