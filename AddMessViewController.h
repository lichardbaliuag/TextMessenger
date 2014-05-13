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

#import "MainController.h"
#import "ControlViewController.h"
#import "JSTokenField.h"
#import "THChatInput.h"
#import "UserMessages.h"
#import "UserProfile.h"
#import "selectDateViewController.h"

//#import "AppDelegate.h"
//#import "ChatViewController.h"

@class MainController;
//@class ViewController;

@interface AddMessViewController : ControlViewController
    <UITextFieldDelegate, UITextViewDelegate, sdViewControllerDelegate, UIActionSheetDelegate, UIApplicationDelegate, UIAlertViewDelegate, JSTokenFieldDelegate>
{
    //-- RECIEVER --//
    IBOutlet UITextView *personRecipient;                               // Recipient number
    IBOutlet UITextField *recipientName;                                // Recipient name
    IBOutlet UITextView *textViewMsgContent;                            // Message content
    IBOutlet UIButton *sendDate;
    IBOutlet UIButton *contactButton;
    IBOutlet UIToolbar *keyboardToolBar;

    BOOL keyboardToolbarShouldHide;
    //NSMutableArray *_personRecipients;
                //NSMutableArray *_ccRecipients;
	JSTokenField *_toField;
                //JSTokenField *_ccField;
}
@property (strong, nonatomic) IBOutlet UITextView *personRecipient;     // Recipient contact
@property (strong, nonatomic) IBOutlet UITextField *recipientName;      // Recipient name
@property (strong, nonatomic) IBOutlet UIButton *sendDate;              // Date to send message
@property (strong, nonatomic) IBOutlet UITextView *textViewMsgContent;  // Message container

@property (strong, nonatomic) IBOutlet THChatInput *chatInput;          // Message input controller
@property (nonatomic, strong) UserMessages *addMessage;                 // Add proper to a message object
@property (strong) NSManagedObject *message;                            // Message Object
//@property (assign) IBOutlet id delegate;

-(IBAction) editingChanged:(id)sender;
-(IBAction) getDate:(id)sender;
-(IBAction) cancelButton:(id)sender;
-(IBAction) doneButton:(id)sender;

- (void) sendButtonPressed:(id)sender;
- (void) returnButtonPressed:(id)sender;
- (void)textViewText:(NSNotification *)notification;

@end
