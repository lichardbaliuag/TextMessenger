//
//  FetchViewController.m
//  TextMessenger
//
//  Created by Lichard Baliuag on 10/4/14.
//  Copyright (c) 2014 Lichard Baliuag. All rights reserved.
//

#import "FetchViewController.h"
#import "AddMessViewController.h"
#import "datePickerViewController.h"

#define cWR 24/255.0f
#define cGN 177/255.0f
#define cBL 16/255.0f
#define cAL 1.0f

@interface FetchViewController ()
{
    //datePickerViewController *datepicker;
}

@end


@implementation FetchViewController

//@synthesize popoverController;

-(void)getSelectedDate:(NSDate *)date
{
    self.sendDate = date;
    NSLog(@"my selected date %@", date);
    [self sendMessageNow:date contact:self.selectedContact];
}

-(void)sendMessageNow : (NSDate *)selectedDate  contact:(NSString *)selectedContact
{
    //send program here
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //datepicker= [[datePickerViewController alloc]init];
    
    self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:cWR green:cGN blue:cBL alpha:cAL];
    
    self.lblContent.text = self.templateContent;
    self.messageDetail.text = self.templateContent;
    
    [self.tabBarController.tabBar setHidden:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}



#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"ShareTemplate"])
    {
        //datePickerViewController *dv;// = (datePickerViewController *)segue.destinationViewController;
        
        //[dv callPhoneBook];
//        dv.templateContent = self.templateContent;
//        dv.templateID = self.templateID;
//        dv.isFromTemplate = @"1";
    }
}

- (IBAction)shareTemplate:(id)sender
{
    [self performSegueWithIdentifier:@"ShareTemplate" sender:self];
}
@end
