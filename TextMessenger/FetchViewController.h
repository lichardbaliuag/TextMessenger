//
//  FetchViewController.h
//  TextMessenger
//
//  Created by Lichard Baliuag on 10/4/14.
//  Copyright (c) 2014 Lichard Baliuag. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ControlViewController.h"
//#import "selectDateViewController.h"
//#import "datePickerViewController.h"



@interface FetchViewController : UIViewController //ControlViewController //<DatePickerDelegate>

@property (nonatomic, strong) NSString *templateID;
@property (nonatomic, strong) NSString *templateContent;
@property (nonatomic, strong) IBOutlet UILabel *lblContent;
@property (nonatomic, strong) IBOutlet UITextView *messageDetail;
@property (nonatomic, strong) NSDate *sendDate;
@property (nonatomic, strong) NSString *selectedContact;
- (IBAction)shareTemplate:(id)sender;


@end
