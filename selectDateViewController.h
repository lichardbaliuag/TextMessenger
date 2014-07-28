//
//  selectDateViewController.h
//  TextMessenger
//
//  Created by Lichard Baliuag on 14/4/14.
//  Copyright (c) 2014 Lichard Baliuag. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ControlViewController.h"

#define kDatePickerTag 100

@class selectDateViewController;

@protocol sdViewControllerDelegate <NSObject>

- (void) passDateString:(selectDateViewController *)controller didPassDateString:(NSString *)item;

@end

@interface selectDateViewController : UIViewController <UITextViewDelegate>

@property (nonatomic, retain) UIDatePicker *datePicker;
@property (nonatomic, retain) UIButton *dailyButton;
@property (nonatomic, retain) UIButton *weeklyButton;
@property (nonatomic, retain) UIButton *monthlyButton;

@property (nonatomic, retain) NSDateFormatter *formatter;
@property (nonatomic, retain) NSDate *chosenDate;
@property (nonatomic, retain) NSString *dateString;

@property (nonatomic, retain) id <sdViewControllerDelegate>delegate;

//- (IBAction)cancelButton:(id)sender;
- (IBAction)doneButton:(id)sender;
- (IBAction)dailyButtPressed:(id)sender;
- (IBAction)weeklyButtPressed:(id)sender;
- (IBAction)monthlyButtPressed:(id)sender;

- (void) pickDate:(id)sender;



@end
