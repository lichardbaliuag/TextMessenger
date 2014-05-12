//
//  AddMessViewController.m
//  TextMessenger
//
//  Created by Lichard Baliuag on 19/12/12.
//  Copyright (c) 2012 Lichard Baliuag. All rights reserved.
//

#import "AddMessViewController.h"
#import "MainController.h"
#import "ChatViewController.h"
#import "JSTokenField.h"

#define kDatePickerTag 100
#define SelectButtonIndex 1
#define CancelButtonIndex 2
#define titleName "New message"
#define cWR 24/255.0f
#define cGN 177/255.0f
#define cBL 16/255.0f
#define cAL 1.0f

@interface AddMessViewController ()

@end

@implementation AddMessViewController

@synthesize personRecipient = _personRecipient, sendDate = _sendDate;   // Recepient & Date to send message

//@synthesize personRecipientString, contactNumberString;
@synthesize keyboardToolbar, nextPreviousControl;                       // Keyboard control
@synthesize nameField = _nameField, mainDummyController;

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    // To change navigation bar color.
    //self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:24/255.0f green:177/255.0f blue:16/255.0f alpha:1.0f];
    self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:cWR green:cGN blue:cBL alpha:cAL];

    // Customize UITextfield programatically for Recepient 
    //CGRect textViewFrame = CGRectMake(30.0f, 10.0f, 250.0f, 30.0f);                      // CGRectMake(X, Y, W, H)
    CGRect textViewFrame = CGRectMake(150, 90, 240, 30);                      // CGRectMake(X, Y, W, H)
    _personRecipient = [[UITextView alloc] initWithFrame:textViewFrame];
    _personRecipient.text = @"";
    _personRecipient.font = [UIFont fontWithName:@"Arial" size:15];
    _personRecipient.textColor = [UIColor blackColor];                                  // Text color
    //_personRecipient setBorderStyle:UITextBorderStyleBezel];                          // TextField Border Style
    _personRecipient.textAlignment = NSTextAlignmentLeft;                               // UITextField Left Justify
    _personRecipient.textAlignment = UIControlContentVerticalAlignmentCenter;           // Vertical Center Alignment
    _personRecipient.autocorrectionType = UITextAutocorrectionTypeNo;                   // Disable auto correction
    _personRecipient.returnKeyType = UIReturnKeyDefault;                                // Keyboard retun - DONE
    //[_personRecipient placeholder = @"Recipient"];
    [_personRecipient becomeFirstResponder];
    
    //[_personRecipient setDelegate:self];                  // * uses when using uitextview
    [self.view addSubview:_personRecipient];
    
    // Create UILable for "To"
    UILabel *toLabel1 = [[UILabel alloc]init];                                     // Label "To:"
    //_toLabel = [[UILabel alloc]init];
    //[toLabel1 setFrame:CGRectMake(3, 3, 25, 30)];                                  // CGRectMake(X, Y, W, H)
    [toLabel1 setFrame:CGRectMake(22, 90, 26, 21)];
    [self.view addSubview:toLabel1];
    [toLabel1 setText:@"To:"];
    [toLabel1 release];
    
    // Customize UIButton for Date Picker
    //UIButton *dateButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    //_sendDate = [[UIButton buttonWithType:UIButtonTypeRoundedRect]autorelease];
    _sendDate = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_sendDate addTarget:self action:@selector(getDate:) forControlEvents:UIControlEventTouchDown];
    [_sendDate setTitle:@" When:                                         " forState:UIControlStateNormal];
    [_sendDate setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
    
    //_sendDate.frame = CGRectMake(3.0, 40.0, 315.0, 45.0);
    _sendDate.frame = CGRectMake(160.0, 127.0, 288.0, 30.0);
    _sendDate.titleLabel.font = [UIFont systemFontOfSize: 15];
    [self.view addSubview:_sendDate];
    //[_sendDate release];
    
    // UIButton for Contact List
    UIButton *addContact = [UIButton buttonWithType:UIButtonTypeContactAdd];
    [addContact addTarget:self action:@selector(pickContact:) forControlEvents:UIControlEventTouchDown];
    //addContact.center = CGPointMake(296.0f, 22.0f);
    addContact.center = CGPointMake(290, 90);
    //addContact.clearsContextBeforeDrawing;
    [self.view addSubview:addContact];
    
    // HANDLE TOKEN FIELD
	[[NSNotificationCenter defaultCenter] addObserver:self
											 selector:@selector(handleTokenFieldFrameDidChange:)
												 name:JSTokenFieldFrameDidChangeNotification
											   object:nil];
    //_personRecipient = [[NSMutableArray alloc]initWithArray:_personRecipient];
    
    
    
    // SEARCH ADDRESS BOOK WHIL TYPING UITEXTFIELD
    //[_personRecipient addTarget:self action:@selector(textFieldDidBeginEditing:) forControlEvents:UIControlEventEditingChanged];
    
}

#pragma mark - 
#pragma mark JSTokenFieldDelegate

- (void)tokenField:(JSTokenField *)tokenField didAddToken:(NSString *)title representedObject:(id)obj
{
	//NSDictionary *recipient = [NSDictionary dictionaryWithObject:obj forKey:title];
	//[_personRecipient addObject:recipient];
	NSLog(@"Added token for < %@ : %@ >\n%@", title, obj, _personRecipient);
    
}

- (void)tokenField:(JSTokenField *)tokenField didRemoveTokenAtIndex:(NSUInteger)index
{
	//[_personRecipient removeObjectAtIndex:index];
	NSLog(@"Deleted token %d\n%@", index, _personRecipient);
}

- (BOOL)tokenFieldShouldReturn:(JSTokenField *)tokenField {
    NSMutableString *recipient = [NSMutableString string];
	
	NSMutableCharacterSet *charSet = [[[NSCharacterSet whitespaceCharacterSet] mutableCopy] autorelease];
	[charSet formUnionWithCharacterSet:[NSCharacterSet punctuationCharacterSet]];
	
    NSString *rawStr = [[tokenField textField] text];
	for (int i = 0; i < [rawStr length]; i++)
	{
		if (![charSet characterIsMember:[rawStr characterAtIndex:i]])
		{
			[recipient appendFormat:@"%@",[NSString stringWithFormat:@"%c", [rawStr characterAtIndex:i]]];
		}
	}
    
    if ([rawStr length])
	{
		[tokenField addTokenWithTitle:rawStr representedObject:recipient];
	}
    return NO;
}

- (void)handleTokenFieldFrameDidChange:(NSNotification *)note
{
	if ([[note object] isEqual:_toField])
	{
		[UIView animateWithDuration:0.0
						 animations:^{
                 [_toField setFrame:CGRectMake(0, [_toField frame].size.height + [_toField frame].origin.y, [_toField frame].size.width, [_toField frame].size.height)];
						 }
						 completion:nil];
	}
}

- (void)viewDidUnload
{
	[[NSNotificationCenter defaultCenter] removeObserver:self];
	[_personRecipient release], _personRecipient = nil;
	[_toField release], _toField = nil;
	[super viewDidUnload];
}

- (void) keyboardWillAnimate:(NSNotification*) notification
{
	//NSLog(@"%@", notification);
}


#pragma mark -
#pragma mark Launch Contact List

-(IBAction)pickContact:(id)sender
{
    ABPeoplePickerNavigationController *getPersonContact = [[ABPeoplePickerNavigationController alloc]init];
    [getPersonContact setPeoplePickerDelegate:(id)self];
    
    // Customize colors
	//getPersonContact.topViewController.navigationController.navigationBar.tintColor = [UIColor colorWithRed:0.294 green:0.500 blue:0.247 alpha:1.0];
    getPersonContact.topViewController.navigationController.navigationBar.tintColor = [UIColor colorWithRed:cWR green:cGN blue:cBL alpha:cAL];

	//getPersonContact.topViewController.searchDisplayController.searchBar.tintColor = [UIColor colorWithRed:0.294 green:0.278 blue:0.247 alpha:1.0];
    getPersonContact.topViewController.searchDisplayController.searchBar.tintColor = [UIColor colorWithRed:cWR green:cGN blue:cBL alpha:cAL];
    
    // Only display phone numbers
	NSArray *displayedItems = [NSArray arrayWithObjects:[NSNumber numberWithInt:kABPersonPhoneProperty], nil];
	getPersonContact.displayedProperties = displayedItems;
    
    // Show the picker
	[self presentViewController:getPersonContact animated:YES completion:nil];
    
}

// Dismiss view controller when people view contact list cancel
- (void)peoplePickerNavigationControllerDidCancel:(ABPeoplePickerNavigationController *)peoplePicker
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark -
#pragma mark Selecting people from contact list

- (BOOL)peoplePickerNavigationController:(ABPeoplePickerNavigationController *)peoplePicker
      shouldContinueAfterSelectingPerson:(ABRecordRef)person
                                property:(ABPropertyID)property
                              identifier:(ABMultiValueIdentifier)identifier
{
	ABMultiValueRef phoneProperty = ABRecordCopyValue(person,property);
	//NSString *phone = (__bridge_transfer NSString *)ABMultiValueCopyValueAtIndex(phoneProperty,identifier);
    NSString *phone = (NSString *)ABMultiValueCopyValueAtIndex(phoneProperty, identifier);
    
    //NSString *name = (__bridge NSString *)ABRecordCopyCompositeName(person);
    NSString *name = (NSString *)ABRecordCopyCompositeName(person);
    
    //ABMutableMultiValueRef emails = ABRecordCopyValue(person, kABPersonEmailProperty);
    //NSString *addresses = (__bridge_transfer NSString *)ABMultiValueCopyArrayOfAllValues(emails);
    
    //if (phoneProperty)
    //{
        CFRelease(phoneProperty);                                               // Release phone properly
        if (![_personRecipient.text isEqualToString:nil])                      // Check if NOT empty
        {
         // Reference: http://www.shaunmccarthy.com/2012/04/finding-the-cursor-position-in-a-uitextfield/
            
            // Get the selected text range
            UITextRange *selectedRange = [_personRecipient selectedTextRange];
            
            // Calculate the existing position, relative to the end of the field (will be a - number)
            int pos = [_personRecipient offsetFromPosition:_personRecipient.endOfDocument toPosition:selectedRange.start];
            
            // Work out the position based by offsetting the end of the field to the same
            // offset we had before editing
            UITextPosition *newPos = [_personRecipient positionFromPosition:_personRecipient.endOfDocument offset:pos];
            
            // Reselect the range, to move the cursor to that position
            _personRecipient.selectedTextRange = [_personRecipient textRangeFromPosition:newPos toPosition:newPos];
            
            //_personRecipient.text = [NSString stringWithFormat:@"Content= %@, ", name];     // Passing Name- recipient field
            [_personRecipient.text stringByAppendingString:name];
            
            [self dismissViewControllerAnimated:YES completion:nil];                // Dismiss View Controller
             NSLog(@"NOT = %@ %@ ", name, phone); 
            //[self getDate:self];                                                    // Call getDate function
        }
        else
        //if (![_personRecipient.text isEqualToString:nil])                           // Check if empty
        {
            _personRecipient.text = [NSString stringWithFormat:@"%@, ", name];      // Passing Name- recipient field
            [self dismissViewControllerAnimated:YES completion:nil];                // Dismiss View Controller
            NSLog(@"Empty = %@ %@ ", name, phone);
        }
        
        //NSLog(@"%@",[NSString stringWithFormat:@"%@",phone]);                     // Show passed value in console
        //NSLog( @"name=%@, phone = %@, email = %@", name, phone, addresses);       // Show more person contact details
        //NSLog(@"%@ %@ ", name, phone);                                            // Pass selected value to variable
        //_personRecipient.text = [NSString stringWithFormat:@"%@, ", name];        // Passing Name- recipient field

        //[self dismissViewControllerAnimated:YES completion:nil];                  // Dismiss View Controller
        //[self getDate:self];                                                      // Call getDate function
    //}
    //CFRelease(phoneProperty);
    //CFRelease(phone);
    return NO;
}

- (void) insertString:(NSString *) insertingString intoTextView:(UITextView *) textView
{
    NSRange range = _personRecipient.selectedRange;
    NSString *firstHalfString = [_personRecipient.text substringToIndex:range.location];
    NSString *secondHalfString = [_personRecipient.text substringFromIndex:range.location];
    _personRecipient.scrollEnabled = NO;
    
    _personRecipient.text = [NSString stringWithFormat:@"%@ %@ %@", firstHalfString, insertingString, secondHalfString];
    range.location += [insertingString length];
    _personRecipient.selectedRange = range;
    _personRecipient.scrollEnabled = YES;  // turn scrolling back on.
    
    
}


/*
- (BOOL) textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    UITextPosition *beginning = _personRecipient.beginningOfDocument;
    UITextPosition *start = [_personRecipient positionFromPosition:beginning offset:range.location];
    UITextPosition *end = [_personRecipient positionFromPosition:start offset:range.length];
    UITextRange *textRange = [_personRecipient textRangeFromPosition:start toPosition:end];
    
    //NSInteger cursorOffset = [_personRecipient offsetFromPosition:beginning toPosition:end];
    [_personRecipient replaceRange:textRange withText:string];
    _personRecipient.text = [NSString stringWithFormat:@"name"];
}
*/
#pragma mark -
#pragma mark Date Picker

-(IBAction)getDate:(id)sender
{
    // Resign Keyboard when date picker clicked
    [self.personRecipient resignFirstResponder];
    
    //[self dismissViewControllerAnimated:YES completion:nil];
    
    UIActionSheet *asheet = [[UIActionSheet alloc] initWithTitle:@"When do you want to send your message?"
														delegate:self
											   cancelButtonTitle:@"Cancel"
										  destructiveButtonTitle:nil
											   otherButtonTitles:@"Select", nil];
	[asheet showInView:[self.view superview]];
	[asheet setFrame:CGRectMake(0, 117, 320, 383)];
	//[asheet release];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex != [actionSheet cancelButtonIndex])
    {
        // set Date formatter
        NSDateFormatter *formatter = [[[NSDateFormatter alloc] init]autorelease];
        //[formatter setDateFormat:@"MMMM-dd-YYYY h:mm a"];
        [formatter setDateFormat:@"dd-MMM-YYYY h:mm a"];
        
        // Gets our picker
        UIDatePicker *ourDatePicker = (UIDatePicker *) [actionSheet viewWithTag:kDatePickerTag];
        NSDate *selectedDate = [ourDatePicker date];
		
        // Change the label of button into date
        _sendDate.titleLabel.text = [NSString stringWithFormat:@" When: %@ ",[formatter stringFromDate:selectedDate]];
        [_sendDate setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
        
        //return [_personRecipient firstResponder];
        NSLog(@"%@",[NSString stringWithFormat:@"%@",selectedDate]);
      
    }
	//[sendDate release];
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
    //[[subviews objectAtIndex:SelectButtonIndex] setFrame:CGRectMake(20, 266, 280, 46)]; // Select Button
    //[[subviews objectAtIndex:CancelButtonIndex] setFrame:CGRectMake(20, 317, 280, 46)]; // Cancel Button
    [[subviews objectAtIndex:SelectButtonIndex] setFrame:CGRectMake(15, 280, 130, 46)];
	[[subviews objectAtIndex:CancelButtonIndex] setFrame:CGRectMake(170, 280, 130, 46)];

}

#pragma mark -
#pragma mark Search Address book while typing in UITextField

- (void) textFieldDidBeginEditing:(UITextField *) textField
{
    NSLog(@"User type: %@ ", _personRecipient);
    //ABPeoplePickerNavigationController  *searchContact = [[ABPeoplePickerNavigationController alloc]init];
    //searchContact.peoplePickerDelegate = self;
    
    //[self presentViewController:searchContact animated:YES completion:nil];
}


#pragma mark - 
#pragma UITextView above UIKeyboard

/*
- (void)keyboardWillShow:(NSNotification *)notification
{
//http://www.randomsequence.com/articles/adding-a-toolbar-with-next-previous-above-uitextfield-keyboard-iphone/

    //CGPoint beginCentre = [[[notification userInfo] valueForKey:UIKeyboardCenterBeginUserInfoKey] CGPointValue];
    CGPoint beginCentre = [[[notification userInfo] valueForKey:UIKeyboardFrameBeginUserInfoKey] CGPointValue];
    
    //CGPoint endCentre = [[[notification userInfo] valueForKey:UIKeyboardCenterEndUserInfoKey] CGPointValue];
    CGPoint endCentre = [[[notification userInfo] valueForKey:UIKeyboardFrameEndUserInfoKey] CGPointValue];
    
    //CGRect keyboardBounds = [[[notification userInfo] valueForKey:UIKeyboardBoundsUserInfoKey] CGRectValue];
    CGRect keyboardBounds = [[[notification userInfo] valueForKey:@"UIKeyboardBoundsUserInfoKey"] CGRectValue];
    
    UIViewAnimationCurve animationCurve = [[[notification userInfo] valueForKey:UIKeyboardAnimationCurveUserInfoKey] intValue];
    NSTimeInterval animationDuration = [[[notification userInfo] valueForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    
    if (nil == keyboardToolbar) {
        
        if(nil == keyboardToolbar) {
            keyboardToolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0,0,self.view.bounds.size.width,44)];
            keyboardToolbar.barStyle = UIBarStyleBlackTranslucent;
            keyboardToolbar.tintColor = [UIColor darkGrayColor];
            
            UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(dismissKeyboard:)];
            UIBarButtonItem *flex = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
            
            UISegmentedControl *control = [[UISegmentedControl alloc]
                                           initWithItems:[NSArray arrayWithObjects:
                                        NSLocalizedString(@"Previous",@"Previous form field"),
                                        NSLocalizedString(@"Next",@"Next form field"),nil]];
            
            control.segmentedControlStyle = UISegmentedControlStyleBar;
            control.tintColor = [UIColor darkGrayColor];
            control.momentary = YES;
            [control addTarget:self action:@selector(nextPrevious:) forControlEvents:UIControlEventValueChanged];
            UIBarButtonItem *controlItem = [[UIBarButtonItem alloc] initWithCustomView:control];
            self.nextPreviousControl = control;
            
            NSArray *items = [[NSArray alloc] initWithObjects:controlItem, flex, barButtonItem, nil];
            [keyboardToolbar setItems:items];
            
            //[control release];
            //[barButtonItem release];
            //[flex release];
            //[items release];
            
            keyboardToolbar.frame = CGRectMake(beginCentre.x - (keyboardBounds.size.width/2),
                                            beginCentre.y - (keyboardBounds.size.height/2) - keyboardToolbar.frame.size.height, keyboardToolbar.frame.size.width, keyboardToolbar.frame.size.height);
            [self.view addSubview:keyboardToolbar];
        }
    }
    
    [UIView beginAnimations:@"RS_showKeyboardAnimation" context:nil];
    [UIView setAnimationCurve:animationCurve];
    [UIView setAnimationDuration:animationDuration];
    
    keyboardToolbar.alpha = 1.0;  
    keyboardToolbar.frame = CGRectMake(endCentre.x - (keyboardBounds.size.width/2), 
                                       endCentre.y - (keyboardBounds.size.height/2) - keyboardToolbar.frame.size.height - self.view.frame.origin.y, 
                                       keyboardToolbar.frame.size.width, 
                                       keyboardToolbar.frame.size.height);
    [UIView commitAnimations];
    keyboardToolbarShouldHide = YES;
}


- (void)keyboardWillHide:(NSNotification *)notification
{
    if (nil == keyboardToolbar || !keyboardToolbarShouldHide) {
        return;
    }
    
    //CGPoint endCentre = [[[notification userInfo] valueForKey:UIKeyboardCenterEndUserInfoKey] CGPointValue];
    CGPoint endCentre = [[[notification userInfo] valueForKey:UIKeyboardFrameEndUserInfoKey] CGPointValue];

    //CGRect keyboardBounds = [[[notification userInfo] valueForKey:UIKeyboardBoundsUserInfoKey] CGRectValue];
    CGRect keyboardBounds = [[[notification userInfo] valueForKey:@"UIKeyboardBoundsUserInfoKey"] CGRectValue];
    
    UIViewAnimationCurve animationCurve = [[[notification userInfo] valueForKey:UIKeyboardAnimationCurveUserInfoKey] intValue];
    NSTimeInterval animationDuration = [[[notification userInfo] valueForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    
    [UIView beginAnimations:@"RS_hideKeyboardAnimation" context:nil];
    [UIView setAnimationCurve:animationCurve];
    [UIView setAnimationDuration:animationDuration];
    
    keyboardToolbar.alpha = 0.0;
    keyboardToolbar.frame = CGRectMake(endCentre.x - (keyboardBounds.size.width/2),
                                       endCentre.y - (keyboardBounds.size.height/2) - keyboardToolbar.frame.size.height,
                                       keyboardToolbar.frame.size.width,
                                       keyboardToolbar.frame.size.height);
    [UIView commitAnimations];
}

*/
 
-(void)viewWillAppear:(BOOL)animated
{

}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    return [_personRecipient resignFirstResponder];
    //return NO;
}

// ****************** UITextField Manipulation *************** //

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField                        // UItextField Begin Editing
{
    //keyboardToolbarShouldHide = NO;
    NSLog(@"%@",[NSString stringWithFormat:@"%@",textField]);
    
    return YES;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField                          // UItextField Should End Editing
{
    //DebugLog(@"textFieldShouldEndEditing: %@",textField);
    return YES;
}

/*
 
- (IBAction)dismissKeyboard:(id)sender
{
[self.personRecipient resignFirstResponder];
}
*/

- (IBAction)editingChanged:(id)sender
{

}

/*
- (IBAction)nextPrevious:(id)sender
{
    
}
*/

-(IBAction)cancelButton:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(IBAction)doneButton:(id)sender
{
    if ([_personRecipient.text isEqualToString:@""])
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Empty recipient"
                                                        message:@"Empty recipient not allowed"
                                                       delegate:self
                                              cancelButtonTitle:@"Okay"
                                              otherButtonTitles:nil];
        [alert show];
        return;
    }
    
    /*
    // Message alert after message sent
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Message sender"
													message:@"Your message has been sent!!!"
												   delegate:self
										  cancelButtonTitle:@"Okay"
										  otherButtonTitles:nil, nil];
	//[alert show];
     */
     
    [self dismissViewControllerAnimated:YES completion:nil];        // Dismiss UIView after send button pressed
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// Resigning keyboard background is tapped
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    //NSLog(@"touchesBegan:withEvent:");
    [self.view endEditing:YES];
    [super touchesBegan:touches withEvent:event];
}

- (void)dealloc {
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
	[_personRecipient release], _personRecipient = nil;
	[_toField release], _toField = nil;

    [super dealloc];
}

@end
