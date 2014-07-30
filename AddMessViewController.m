//
//  AddMessViewController.m
//  TextMessenger
//
//  Created by Lichard Baliuag on 19/12/12.
//  Copyright (c) 2012 Lichard Baliuag. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "AddMessViewController.h"
#import "MainController.h"
#import "JSTokenField.h"
//#import "THChatInput.h"
#import "UserMessages.h"
//#import "AppDelegate.h"
#import "selectDateViewController.h"

#define msgCodeOne 1
#define kDatePickerTag 100
#define SelectButtonIndex 1
#define CancelButtonIndex 2
#define titleName "New message"
#define cWR 24/255.0f
#define cGN 177/255.0f
#define cBL 16/255.0f
#define cAL 1.0f

@interface AddMessViewController ()

@property (assign) NSString *phoneTempVar;              // Variable to receive phone no. and present globaly
@property (assign) NSString *msgTempVar;

@end

@implementation AddMessViewController

@synthesize personRecipient = _personRecipient;         // Recipient number
@synthesize recipientName = _recipientName;             // Name
@synthesize sendDate = _sendDate;                       // Recepient & Date to send message
@synthesize textViewMsgContent = _textViewMsgContent;   // Message content
@synthesize chatInput = _chatInput;
@synthesize addMessage;
@synthesize message;

- (void)viewDidLoad
{
    [super viewDidLoad];
        
    // -- Initialize DATABASE -- //
    if (self.addMessage)
    {
        [self.personRecipient setText:[self.addMessage valueForKey:@"recipientNumber"]];
        [self.textViewMsgContent setText:[self.addMessage valueForKey:@"messageContent"]];
    }
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    // To change navigation bar color.
    //self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:24/255.0f green:177/255.0f blue:16/255.0f alpha:1.0f];
    
    self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:cWR green:cGN blue:cBL alpha:cAL];

    // Customize UITextfield programatically for Recepient 
    //CGRect textViewFrame = CGRectMake(30.0f, 10.0f, 250.0f, 30.0f);                   // CGRectMake(X, Y, W, H)
    CGRect textViewFrame = CGRectMake(33, 70, 240, 30);                                 // CGRectMake(X, Y, W, H)
    _personRecipient = [[UITextView alloc] initWithFrame:textViewFrame];
    //_personRecipient.text = @"fff";
    _personRecipient.font = [UIFont fontWithName:@"Arial" size:15];
    _personRecipient.textColor = [UIColor blackColor];                                  // Text color
    //_personRecipient setBorderStyle:UITextBorderStyleBezel];                          // TextField Border Style
    _personRecipient.textAlignment = NSTextAlignmentLeft;                               // UITextField Left Justify
    _personRecipient.textAlignment = UIControlContentVerticalAlignmentCenter;           // Vertical Center Alignment
    _personRecipient.autocorrectionType = UITextAutocorrectionTypeNo;                   // Disable auto correction
    _personRecipient.returnKeyType = UIReturnKeyDefault;                                // Keyboard retun - DONE
    _personRecipient.backgroundColor = [UIColor clearColor];                            // Set clear background for textview
    _personRecipient.tintColor = [UIColor grayColor];                                   // Set cursor colr to gray
    
    //To make the border look very close to a UITextField
    [_personRecipient.layer setBorderColor:[[[UIColor grayColor] colorWithAlphaComponent:0.5] CGColor]];
    [_personRecipient.layer setBorderWidth:0.5];

    //The rounded corner part, where you specify your view's corner radius:
    _personRecipient.layer.cornerRadius = 5;
    _personRecipient.clipsToBounds = YES;
    
    //[_personRecipient setDelegate:self];                                              // * uses when using uitextview
    [self.view addSubview:_personRecipient];
    [_personRecipient becomeFirstResponder];                                          // Focus cursor in Recipient field
    
    //[_chatInput respondsToSelector:@selector(awakeFromNib:)]; // To launch message editor
    //[_chatInput.textView becomeFirstResponder];
    
    // ********* Create UILable for "To" *********** //
    // ********************************************* //
    UILabel *toLabel1 = [[UILabel alloc]init];                                          // Label "To:"
    //_toLabel = [[UILabel alloc]init];
    //[toLabel1 setFrame:CGRectMake(3, 3, 25, 30)];                                     // CGRectMake(X, Y, W, H)
    [toLabel1 setFrame:CGRectMake(6, 75, 26, 21)];
    [toLabel1 setText:@"To:"];
    [toLabel1 setTextColor:[UIColor grayColor]];
    [self.view addSubview:toLabel1];
    //[toLabel1 release];

    /*
    // **** Create UIButton for Contact List ******* //
    // ********************************************* //
    
    UIButton *addContact = [UIButton buttonWithType:UIButtonTypeContactAdd];
    [addContact setTitle:@"" forState:UIControlStateNormal];
    [addContact addTarget:self action:@selector(pickContact:) forControlEvents:UIControlEventTouchDown];
    addContact.center = CGPointMake(296.0f, 22.0f);
    //addContact.center = CGPointMake(295, 85);
    [self.view addSubview:addContact];
    //[addContact release];                                     // ** Causes to crash
     */
    
    // ********** RESERVE FOR ROUND BUTTON ********** //
    /*
    self.orangeBall = [[UIView alloc] initWithFrame:CGRectMake(5.0, 80.0, 50.0, 50.0)];
    self.orangeBall.backgroundColor = [UIColor orangeColor];
    self.orangeBall.layer.cornerRadius = 25.0;
    self.orangeBall.layer.borderColor = [UIColor blackColor].CGColor;
    self.orangeBall.layer.borderWidth = 0.0;
    [self.view addSubview:self.orangeBall];
    // Initialize the animator.
    //self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    */
    //********************************************** //

    // **** Create UIButton for Date Picker ******** //
    // ********************************************* //
    /*
    _sendDate = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_sendDate addTarget:self action:@selector(getDate:) forControlEvents:UIControlEventTouchDown];
    [_sendDate setTitle:@" When:                  " forState:UIControlStateNormal];
   
    [_sendDate setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
            //_sendDate.frame = CGRectMake(3.0, 40.0, 315.0, 45.0);
    _sendDate.frame = CGRectMake(12, 111, 298, 40);
    //_sendDate.titleLabel.font = [UIFont systemFontOfSize: 15];
    _sendDate.titleLabel.font = [UIFont fontWithName:@"Helvetica" size:15];
    
    [_sendDate setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    _sendDate.layer.borderColor = [[UIColor lightGrayColor]CGColor];
    _sendDate.layer.borderWidth = 0.5f;
    _sendDate.layer.cornerRadius = 5;
    
    [self.view addSubview:_sendDate];
    //[_sendDate release];                                      // ** Causes to crash
    //[toLabel1 release];

    // ********************************************* //
    */
    
    // **** SEND DATE BUTTON FROM STORYBOARD ******* //
    // ********************************************* //
    [self.sendDate setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    self.sendDate.layer.borderColor = [[UIColor lightGrayColor]CGColor];
    self.sendDate.layer.borderWidth = 0.5f;
    self.sendDate.layer.cornerRadius = 5;
    
    // -- This block is temporary -- //
    NSDateFormatter *dateFormatForDB = [[NSDateFormatter alloc] init];
    [dateFormatForDB setDateFormat:@"dd-MMM-YYY h:mm a"];
    NSDate *currentDate = [NSDate date];
    [self.sendDate setTitle:[NSString stringWithFormat:@"%@", [dateFormatForDB stringFromDate:currentDate]] forState:UIControlStateNormal];
    //[dateFormatForDB release];
    // ********************************************* //
    
    // **** Create UITextView for message content ** //
    // ********************************************* //
    
    CGRect msgViewFrame = CGRectMake(10, 170, 300, 130);                                 // CGRectMake(X, Y, W, H)
    _textViewMsgContent = [[UITextView alloc] initWithFrame:msgViewFrame];
    _textViewMsgContent.backgroundColor = [UIColor clearColor];
    _textViewMsgContent.font = [UIFont fontWithName:@"Helvetica" size:15];
    //_textViewMsgContent.text = @"fff1";

    [_textViewMsgContent setEditable:NO];
    
    //To make the border look very close to a UITextField
    [_textViewMsgContent.layer setBorderColor:[[[UIColor grayColor] colorWithAlphaComponent:0.5] CGColor]];
    [_textViewMsgContent.layer setBorderWidth:0.5];
    
    //The rounded corner part, where you specify your view's corner radius:
    _textViewMsgContent.layer.cornerRadius = 5;
    _textViewMsgContent.clipsToBounds = YES;
    [self.view addSubview:_textViewMsgContent];

    
    // HANDLE TOKEN FIELD
    // *******
    /*
    // SEARCH ADDRESS BOOK WHIL TYPING UITEXTFIELD
    //[_personRecipient addTarget:self action:@selector(textFieldDidBeginEditing:) forControlEvents:UIControlEventEditingChanged];
    
    //[_chatInput.sendButton setTitle:@"Send" forState:UIControlStateNormal];
    //[_chatInput.sendButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    //_chatInput.sendButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:14];
    // ********
    
    //[_chatInput.sendButton setBackgroundImage:[UIImage imageNamed:@"Chat_Send_Button.png"] forState:UIControlStateNormal];
    //[_chatInput.sendButton setBackgroundImage:[UIImage imageNamed:@"Chat_Send_Button_Pressed.png"] forState:UIControlStateHighlighted];
    //[_chatInput.sendButton setBackgroundImage:[UIImage imageNamed:@"Chat_Send_Button_Pressed.png"] forState:UIControlStateSelected];
    
    
      _chatInput.backgroundColor = [UIColor clearColor];
      //_chatInput.inputBackgroundView.image = [[UIImage imageNamed:@"Chat_Footer_BG.png"] stretchableImageWithLeftCapWidth:80 topCapHeight:25];
      _chatInput.inputBackgroundView.image = [[UIImage imageNamed:@"Chat_Footer_BG.png"] stretchableImageWithLeftCapWidth:80 topCapHeight:25];
      
	[_chatInput.attachButton setBackgroundImage:[UIImage imageNamed:@"Chat_Footer_ArrowUp.png"] forState:UIControlStateNormal];
	[_chatInput.attachButton setBackgroundImage:[UIImage imageNamed:@"Chat_Footer_ArrowUp_Pressed.png"] forState:UIControlStateHighlighted];
	[_chatInput.attachButton setBackgroundImage:[UIImage imageNamed:@"Chat_Footer_ArrowUp_Pressed.png"] forState:UIControlStateSelected];
    
	[_chatInput.emojiButton setBackgroundImage:[UIImage imageNamed:@"Chat_Footer_Smiley_Icon.png"] forState:UIControlStateNormal];
	[_chatInput.emojiButton setBackgroundImage:[UIImage imageNamed:@"Chat_Footer_Smiley_Icon_Pressed.png"] forState:UIControlStateHighlighted];
	[_chatInput.emojiButton setBackgroundImage:[UIImage imageNamed:@"Chat_Footer_Smiley_Icon_Pressed.png"] forState:UIControlStateSelected];
    */
    // ********
}

- (void) passDateString:(selectDateViewController *)controller didPassDateString:(NSString *)item
{
    self.sendDate.titleLabel.text = item;
}

#pragma mark - NSManageObjectContext

- (NSManagedObjectContext *)manageObjectContext
{
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication]delegate];
    if ([delegate performSelector:@selector(managedObjectContext)])
    {
        context = [delegate managedObjectContext];
    }
    return context;
}

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
	NSLog(@"Deleted token %lu\n%@", (unsigned long)index, _personRecipient);
}

- (BOOL)tokenFieldShouldReturn:(JSTokenField *)tokenField {
    NSMutableString *recipient = [NSMutableString string];
	
	NSMutableCharacterSet *charSet = [[NSCharacterSet whitespaceCharacterSet] mutableCopy];
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
    //[self setTextView:nil];
    [self setChatInput:nil];
    //[self setEmojiInputView:nil];
    [super viewDidUnload];
}

- (void) keyboardWillAnimate:(NSNotification*) notification
{
	//NSLog(@"%@", notification);
}

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

#pragma mark - Selecting People from Contact List

- (BOOL)peoplePickerNavigationController:(ABPeoplePickerNavigationController *)peoplePicker
      shouldContinueAfterSelectingPerson:(ABRecordRef)person
                                property:(ABPropertyID)property
                              identifier:(ABMultiValueIdentifier)identifier
{
	ABMultiValueRef phoneProperty = ABRecordCopyValue(person,property);
	//NSString *phone = (__bridge_transfer NSString *)ABMultiValueCopyValueAtIndex(phoneProperty,identifier);
    NSString *phone = (__bridge NSString *)ABMultiValueCopyValueAtIndex(phoneProperty, identifier);
    
    _phoneTempVar = phone;
    
    //NSString *name = (__bridge NSString *)ABRecordCopyCompositeName(person);
    NSString *name = (__bridge NSString *)ABRecordCopyCompositeName(person);
    
    //ABMutableMultiValueRef emails = ABRecordCopyValue(person, kABPersonEmailProperty);
    //NSString *addresses = (__bridge_transfer NSString *)ABMultiValueCopyArrayOfAllValues(emails);
    
    //if (phoneProperty)
    //{
        CFRelease(phoneProperty);                                                   // Release phone properly
        if (![_personRecipient.text isEqualToString:nil])                           // Check if NOT empty
        {
         // Reference: http://www.shaunmccarthy.com/2012/04/finding-the-cursor-position-in-a-uitextfield/
            
            // Get the selected text range
            UITextRange *selectedRange = [_personRecipient selectedTextRange];
        
            // Calculate the existing position, relative to the end of the field (will be a - number)
            NSInteger pos = [_personRecipient offsetFromPosition:_personRecipient.endOfDocument toPosition:selectedRange.start];
            
            // Work out the position based by offsetting the end of the field to the same
            // offset we had before editing
            UITextPosition *newPos = [_personRecipient positionFromPosition:_personRecipient.endOfDocument offset:pos];
            
            // Reselect the range, to move the cursor to that position
            _personRecipient.selectedTextRange = [_personRecipient textRangeFromPosition:newPos toPosition:newPos];
            
            _personRecipient.text = [NSString stringWithFormat:@"%@ ", name];      // Passing Name- recipient field
            //[_personRecipient.text stringByAppendingString:name];
            
            [self dismissViewControllerAnimated:YES completion:nil];                // Dismiss View Controller
             NSLog(@"First: %@ %@ ", name, phone);
            //[self getDate:self];                                                  // Call getDate function
        
            
        }
        else
        //if (![_personRecipient.text isEqualToString:nil])                         // Check if empty
        {
            _personRecipient.text = [NSString stringWithFormat:@"%@, ", name];      // Passing Name- recipient field
            [self dismissViewControllerAnimated:YES completion:nil];                // Dismiss View Controller
            NSLog(@"Second: %@ %@ ", name, phone);
        }
    
        //NSLog(@"%@",[NSString stringWithFormat:@"%@",phone]);                     // Show passed value in console
        //NSLog( @"name=%@, phone = %@, email = %@", name, phone, addresses);       // Show more person contact details
        //NSLog(@"%@ %@ ", name, phone);                                            // Pass selected value to variable
        //_personRecipient.text = [NSString stringWithFormat:@"%@, ", name];        // Passing Name- recipient field
        //[self dismissViewControllerAnimated:YES completion:nil];                  // Dismiss View Controller
        //[self getDate:self];                                                      // Call getDate function
    //}
    //CFRelease(phoneProperty);
    //return phone;
    return name;
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
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
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

#pragma mark Date Picker

-(IBAction)getDate:(id)sender
{
    [_personRecipient resignFirstResponder];        // Hide keyboard when selecting date
    
    UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"Select date" message:nil delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Select", nil];
    UIView *dateView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 200)];
    dateView.backgroundColor = [UIColor clearColor];
    
    // Initialize UIPickerView
    UIDatePicker *pickDate = [[UIDatePicker alloc]initWithFrame:CGRectMake(0, 0, 100, 50)];
    [pickDate setMinuteInterval:1];
    [pickDate setTag: kDatePickerTag];
    
    //NSDateFormatter *formatter = [[[NSDateFormatter alloc]init]autorelease];
    //[formatter setDateFormat:@"dd-MMM-YYY h:mm a"];
    
    [dateView addSubview:pickDate];
    [av setValue:dateView forKey:@"accessoryView"]; // body of view
    [av show];                                      // to show the vie
    
    //[pickDate release];
    //[dateView release];
    
}

// Method to respond to "Select" from UIAlertview
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    //NSString *title = [alertView buttonTitleAtIndex:buttonIndex];
    if (buttonIndex != [alertView cancelButtonIndex])
    {
        //NSLog(@"Button Select pressed");
        
        //Set Date Formatter
        NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
        [formatter setDateFormat:@"dd-MMM-YYY h:mm a "];
        
        // Gets our picker
        //UIDatePicker *ourDatePicker = (UIDatePicker *) [alertView viewWithTag:kDatePickerTag];
        //NSDate *chosenDate = [ourDatePicker date];
        NSDate *chosenDate = [NSDate date];
        
        // Change the label of button into date
        [_sendDate setTitle:[NSString stringWithFormat:@"Will send on: %@", [formatter stringFromDate:chosenDate]] forState:UIControlStateNormal];
        //[_sendDate setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
        //[formatter release];
        
        NSLog(@"%@", chosenDate);
        //NSLog(@"%@",[NSString stringWithFormat:@"%@", chosenDate]);
        
        // ****** End of this point is NOT working ************
    }
}

/*
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
*/

// Action Sheet that contains UIdate picker
-(void)willPresentActionSheet:(UIActionSheet *)actionSheet
{
/*
	UIDatePicker *pickerView = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 100, 320, 162)];
	[pickerView setMinuteInterval:5];
	[pickerView setTag: kDatePickerTag];
    
	// Add picker to action sheet
	[actionSheet addSubview:pickerView];
	//[pickerView release];                                                                 // Error here
    
	// Get array of all subviews of our actionsheet
	NSArray *subviews = [[actionSheet subviews] autorelease];
	//NSArray *subviews = [actionSheet subviews];
    //[[subviews objectAtIndex:SelectButtonIndex] setFrame:CGRectMake(20, 250, 280, 46)];   // Select Button
    //[[subviews objectAtIndex:CancelButtonIndex] setFrame:CGRectMake(20, 317, 280, 46)];   // Cancel Button
    
    [[subviews objectAtIndex:SelectButtonIndex] setFrame:CGRectMake(139, 470, 43, 30)];     // Select Button
	[[subviews objectAtIndex:CancelButtonIndex] setFrame:CGRectMake(136, 518, 43, 30)];     // Cancel Button
     */
}

#pragma mark -
#pragma Text Editing control for personRecipient

 - (BOOL)personRecipient:(UITextView *)personRecipient shouldChangeTextInRange:(NSRange)range replacementText:
    (NSString*)text 
{
    /*
    if ([text isEqualToString:@"\n"])
    {
        [_chatInput becomeFirstResponder];
    }
    else if (text.length > 0)
    {
        //[self adjustTextInputHeightForText:[NSString stringWithFormat:@"%@%@", _textView.text, text] animated:YES];
    } */
    
    NSLog(@"textview in action");
    return YES;
}

- (IBAction)editingChanged:(id)sender
{
    
}

-(IBAction)cancelButton:(id)sender
{

    [self dismissViewControllerAnimated:YES completion:nil];
    //[super cancelAndDismiss];
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
    //[self dismissViewControllerAnimated:YES completion:nil];        // Dismiss UIView after send button pressed
    [super doneAndDismiss];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
// When background is tapped.
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
    [super touchesBegan:touches withEvent:event];
    NSLog(@"touchesBegan:withEvent:");
}
*/

- (void)dealloc {
    //[[NSNotificationCenter defaultCenter] removeObserver:self];
	//[_personRecipient release], _personRecipient = nil;
	//[_toField release], _toField = nil;

    //[_textViewMsgContent release];
    //[_chatInput release];
    
    //[_emojiInputView release];
    //[super dealloc];
}

#pragma The SEND Button

- (void)sendButtonPressed:(id)sender
{
    // ************** SAMPLE **************** //
    
    NSString *msg = [NSString stringWithFormat:@"%@", _chatInput.textView.text ];
    
    NSManagedObjectContext *context = [self manageObjectContext];
    // Create new Managed Object
    if (self.message)
    {
        // Update message using self.message which declared as ManageObject.
        [self.message setValue:self.personRecipient.text forKey:@"recipientName"];
        [self.message setValue:self.textViewMsgContent.text forKey:@"messageContent"];
        NSLog(@"New: %@", _textViewMsgContent.text);
        
    } else
    {
        // This created pointer to the NSManageObject then use the pointer to populate the attributes.
        NSManagedObject *myMO = [NSEntityDescription insertNewObjectForEntityForName:@"UserMessages"
                                 inManagedObjectContext:context];
        
        NSString *number = _phoneTempVar;
        
        //NSString *msgTemp = [NSString stringWithFormat:@"%@", _textViewMsgContent.text];
        NSTimeZone *timeZone = [NSTimeZone defaultTimeZone];
                
        // Manipulate Phone Number and convert all to NUMBERS
        NSString *strippedNumber = [number stringByReplacingOccurrencesOfString:@"[^0-9]" withString:@"" options:NSRegularExpressionSearch range:NSMakeRange(0, [number length])];
        
        if ([self.isFromTemplate isEqual: @"1"]) {
            [myMO setValue:self.templateContent forKey:@"messageContent"];
        }
        else
        {
            [myMO setValue:msg forKey:@"messageContent"];

        }
        
        
        [myMO setValue:[NSNumber numberWithInteger:[strippedNumber integerValue]] forKey:@"recipientNumber"];
        [myMO setValue:_personRecipient.text forKey:@"recipientName"];
        //[myMO setValue:_textView.text forKey:@"messageContent"];
        [myMO setValue:[NSDate date] forKey:@"sendDate"];
        [myMO setValue:[NSDate date] forKey:@"messageDateCreated"];
        [myMO setValue:@11 forKey:@"messageStatusCode"];
        [myMO setValue:@"lichard@yahoo.com" forKey:@"senderEmail"];
        
        NSUUID  *UUID = [NSUUID UUID];
        NSString* stringUUID = [UUID UUIDString];

        [myMO setValue:stringUUID forKey:@"messageGuid"];
        
        
        //[myMO setValue:87651234 forKey:@"senderNumber"];
        NSLog(@"%@", stringUUID);
        
        NSLog(@"Recipient No: %@", [NSNumber numberWithInteger:[strippedNumber integerValue]]);
        NSLog(@"Name: %@", _personRecipient.text);
        NSLog(@"Msg content: %@", _textViewMsgContent.text);
        NSLog(@"Chat textview: %@", _chatInput.textView.text);
        NSLog(@"Time Zone: %@", timeZone);
    }
    
    NSError *error = nil;
    if (![context save:&error]) {
        NSLog(@"Unresolved error %@, %@", error, [error localizedDescription]);         // error userInfo
        //abort();
    }
    // ************************************** //
    //[super doneAndDismiss];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma The RETURNKEY Button
- (void)returnButtonPressed:(id)sender
{
    _textViewMsgContent.text = [sender text];
    _chatInput.textView.text = @" ";
    [_chatInput fitText];
    
    //[_textView setText:@""];          //Clear textview
    //[_textView resignFirstResponder]; // DOES NOT WORK
    //[self dismissViewControllerAnimated:YES completion:nil];
}

#pragma UITextView above UIKeyboard
/*
 - (void)keyboardWillShow:(NSNotification *)notification
 {
 //http://www.randomsequence.com/articles/adding-a-toolbar-with-next-previous-above-uitextfield-keyboard-iphone/
 }
 */

/*
- (void) showEmojiInput:(id)sender {
 _chatInput.textView.inputView = _chatInput.textView.inputView == nil ? _emojiInputView : nil;
 [_chatInput.textView reloadInputViews];
 }
 */

-(void)viewWillAppear:(BOOL)animated
{
    
}

@end
