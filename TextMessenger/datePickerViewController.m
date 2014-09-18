//
//  datePickerViewController.m
//  TextMessenger
//
//  Created by Lichard Baliuag on 30/8/14.
//  Copyright (c) 2014 Lichard Baliuag. All rights reserved.
//

#import "datePickerViewController.h"
#import "ControlViewController.h"
#import "AppDelegate.h"

@implementation datePickerViewController
{
    BOOL didLoad;
}

-(void)GetSelectedPerson:(EntityPerson *)selectedPerson
{
    //self.btnPersonName.titleLabel.text = selectedPerson.Name;
    didLoad = true;
    [self.btnPersonName setTitle:selectedPerson.Name forState:UIControlStateNormal];
    //self.lbldateSelected.text = selectedPerson.Name;
}

- (void)callPhoneBook
{
    
    [self performSegueWithIdentifier:@"showphonebook" sender:nil];

}

- (IBAction)btnRecipient:(id)sender {
    
    [self performSegueWithIdentifier:@"showphonebook" sender:self];
}

- (IBAction)btnSend:(id)sender {

    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
 
    // Initialize UILabel
    AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    NSDateFormatter *dateFormatForDB = [[NSDateFormatter alloc] init];
    [dateFormatForDB setDateFormat:@"dd-MMM-YYYY hh:mm a"];
    
    if(delegate.selectedDate == nil)
    {
        NSDate *currentDate = [NSDate date];
        delegate.selectedDate = currentDate;
    }
    //[self.lbldateSelected setText:[NSString stringWithFormat:@""], [dateFormatForDB stringFromDate:delegate.selectedDate]];
    //[self.labelDateSelected setText:[NSString stringWithFormat:@"%@", [dateFormatForDB stringFromDate:delegate.selectedDate]]];
    
    // Initialize UIPickerView
    //_datePicker = [[UIDatePicker alloc]initWithFrame:CGRectMake(0, 180, 300, 160)];
    [_getDate addTarget:self action:@selector(pickDate:) forControlEvents:UIControlEventValueChanged];
    [_getDate setMinuteInterval:5];
    [_getDate setTag: kDatePickerTag];
    didLoad =false;
    [self.view addSubview:_getDate];
    
    [self callPhoneBook];

    
}
-(void)viewDidAppear:(BOOL)animated
{
    
       // [self performSelector:@selector(callPhoneBook) withObject:nil];
    
    

}

- (void) pickDate:(id)sender
{
    
    _formatter = [[NSDateFormatter alloc] init];
    [_formatter setDateFormat:@"dd-MMM-YYY h:mm a "];
    _chosenDate = [_getDate date];
    self.lbldateSelected.text = [_formatter stringFromDate:_getDate.date];
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"showphonebook"])
    {
        PhoneBookTableViewController *phonebook = segue.destinationViewController;
        
        phonebook.Xdelexgate = self;
    }
}

/*
- (void) composeView
{
    // Background View
    CGSize size = self.frame.size;
	_backgroundView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height)];
	_backgroundView.autoresizingMask = UIViewAutoresizingNone;
    _backgroundView.contentMode = UIViewContentModeScaleToFill;
    _backgroundView.userInteractionEnabled = YES;
    //_inputBackgroundView.alpha = .5;
    _backgroundView.backgroundColor = [UIColor clearColor];
    //_inputBackgroundView.backgroundColor = [[UIColor redColor] colorWithAlphaComponent:.5];
	[self addSubview:_backgroundView];
  
    // Date Label
    //_lblDateCollected = [[UILabel alloc] initWithFrame:CGRectMake(55.0f, 14, 160, 30)];    // 78.0f, 14, 160, 30
    //_lblDateCollected = [UIFont systemFontOfSize:15.0f];
    _lblDateCollected.font = [UIFont fontWithName:@"Helvetica" size:15.0f];
    _lblDateCollected.text = @"Message here...";
    _lblDateCollected.textColor = [UIColor lightGrayColor];
    _lblDateCollected.backgroundColor = [UIColor clearColor];
     [self addSubview:_lblDateCollected];
        
}

-(void)showActionSheet : (UIViewController *)controller
{
    
    [self composeView];
    
    UIActionSheet *asheet = [[UIActionSheet alloc] initWithTitle:@"When do you want to send your message?"
														delegate:self
											   cancelButtonTitle:@"Cancel"
										  destructiveButtonTitle:nil
											   otherButtonTitles:@"Select", nil];
	[asheet showInView:controller.view];
	[asheet setFrame:CGRectMake(0, 100, 320, 400)]; // 0, 117, 320, 383
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex != [actionSheet cancelButtonIndex])
    {
        // set Date formatter
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"dd-MMM-YYYY hh:mm a"];

        // Gets our picker
        UIDatePicker *ourDatePicker = (UIDatePicker *) [actionSheet viewWithTag:kDatePickerTag];
        NSDate *selectedDate = [ourDatePicker date];
		
        
        [self.dpDelegate getSelectedDate:selectedDate];
        
    }
}

// Action Sheet tha contains UIdate picker
-(void)willPresentActionSheet:(UIActionSheet *)actionSheet
{
	UIDatePicker *pickerView = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 40, 320, 216)];
	[pickerView setMinuteInterval:5];
	[pickerView setTag: kDatePickerTag];
    
	// Add picker to action sheet
	[actionSheet addSubview:pickerView];
	//[pickerView release];                                             // Error here
	
	// Get array of all subviews of our actionsheet
	//NSArray *subviews = [[actionSheet subviews] autorelease];
	NSArray *subviews = [actionSheet subviews];
    [[subviews objectAtIndex:SelectButtonIndex] setFrame:CGRectMake(40, 266, 280, 46)]; // Select Button 20, 266, 280, 46
    [[subviews objectAtIndex:CancelButtonIndex] setFrame:CGRectMake(20, 320, 280, 46)]; // Cancel Button 20, 317, 280, 46
    //[[subviews objectAtIndex:SelectButtonIndex] setFrame:CGRectMake(15, 280, 130, 46)];
	//[[subviews objectAtIndex:CancelButtonIndex] setFrame:CGRectMake(170, 280, 130, 46)];
    
}
*/



@end
