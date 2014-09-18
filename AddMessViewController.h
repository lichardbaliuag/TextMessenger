//
//  AddMessViewController.h
//  TextMessenger
//
//  Created by Lichard Baliuag on 19/12/12.
//  Copyright (c) 2012 Lichard Baliuag. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import <AddressBook/AddressBook.h>
#import <AddressBookUI/AddressBookUI.h>
#import "JSTokenField.h"
#import "THChatInput.h"
#import "ControlViewController.h"
#import "UserMessages.h"
#import "UserProfile.h"
#import "selectDateViewController.h"


@class MainController;

@interface AddMessViewController : ControlViewController
    <UITextFieldDelegate, UITextViewDelegate, sdViewControllerDelegate, UIActionSheetDelegate, UIApplicationDelegate, UIAlertViewDelegate, JSTokenFieldDelegate>
{
    BOOL keyboardToolbarShouldHide;
	JSTokenField *_toField;
}

@property (strong, nonatomic) IBOutlet UITextView *personRecipient;     // Recipient contact
@property (strong, nonatomic) IBOutlet UITextField *recipientName;      // Recipient name
@property (strong, nonatomic) IBOutlet UIButton *sendDate;              // Date to send message
@property (strong, nonatomic) IBOutlet UITextView *textViewMsgContent;  // Message container

@property (strong, nonatomic) IBOutlet THChatInput *chatInput;          // Message input controller
@property (nonatomic, strong) UserMessages *addMessage;                 // Add proper to a message object
@property (strong) NSManagedObject *message;                            // Message Object

@property (nonatomic, strong) NSString *templateID;
@property (nonatomic, strong) NSString *templateContent;
@property (nonatomic, retain) NSString *isFromTemplate;
@property (strong, nonatomic) IBOutlet UIView *recipientView;



-(IBAction) editingChanged:(id)sender;
-(IBAction) cancelButton:(id)sender;
-(IBAction) doneButton:(id)sender;

-(void) sendButtonPressed:(id)sender;
-(void) returnButtonPressed:(id)sender;

@end
