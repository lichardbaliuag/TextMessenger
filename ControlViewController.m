//
//  ControlViewController.m
//  TextMessenger
//
//  Created by Lichard Baliuag on 14/4/14.
//  Copyright (c) 2014 Lichard Baliuag. All rights reserved.
//

#import "ControlViewController.h"
#import "AppDelegate.h"

#define cWR 24/255.0f
#define cGN 177/255.0f
#define cBL 16/255.0f
#define cAL 1.0f


@interface ControlViewController ()

@property (nonatomic, strong)NSManagedObjectContext *managedObjectContext;

@end

@implementation ControlViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (NSManagedObjectContext *)managedObjectContext
{
    return [(AppDelegate *)[[UIApplication sharedApplication]delegate]managedObjectContext];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) cancelAndDismiss
{
    [self.managedObjectContext rollback];                       // Rollback object context when cancelled.
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void) doneAndDismiss
{
    NSError *error = nil;
    if ([self.managedObjectContext hasChanges])
    {
        if (![self.managedObjectContext save:&error])           // Save failed
        {
            NSLog(@"Save failed: %@", [error localizedDescription]);
        } else
        {
            NSLog(@"Save succeeded.");
        }
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void) navColor
{
    self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:cWR green:cGN blue:cBL alpha:cAL];
}




@end
