//
//  datePickerViewController.h
//  TextMessenger
//
//  Created by Lichard Baliuag on 30/8/14.
//  Copyright (c) 2014 Lichard Baliuag. All rights reserved.
//

//#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "PhoneBookTableViewController.h"


//@protocol DatePickerDelegate <NSObject>
//-(void)getSelectedDate : (NSDate *)date;
//@end

@interface datePickerViewController : UIViewController <ModalViewControllerDelegate> //UIView <UIActionSheetDelegate>

//@property (nonatomic, strong) IBOutlet UILabel *lblDateCollected;
//@property (nonatomic, strong) UIButton *btnGetDate;
//@property (nonatomic, strong) IBOutlet UIDatePicker *pickDate;
//@property (strong, nonatomic) UIImageView *backgroundView;
//@property (nonatomic, strong) id<DatePickerDelegate> dpDelegate;
//-(void)showActionSheet : (UIViewController *)controller;

@property (nonatomic, retain) NSDateFormatter *formatter;
@property (nonatomic, retain) NSDate *chosenDate;

@property (strong, nonatomic) IBOutlet UIDatePicker *getDate;
@property (strong, nonatomic) IBOutlet UILabel *lbldateSelected;

@property (strong, nonatomic) IBOutlet UIButton *btnPersonName;

- (IBAction)btnRecipient:(id)sender;
- (IBAction)btnSend:(id)sender;
- (void)callPhoneBook;
@end
