//
//  FetchViewController.h
//  TextMessenger
//
//  Created by Lichard Baliuag on 10/4/14.
//  Copyright (c) 2014 Lichard Baliuag. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ControlViewController.h"

@interface FetchViewController : ControlViewController


@property (nonatomic, strong) IBOutlet UILabel *greetingId;
@property (nonatomic, strong) IBOutlet UILabel *greetingContent;
@property (nonatomic, strong) IBOutlet UITextField *txtId;
- (IBAction)fetchGreeting;

//- (IBAction)cancelButton:(id)sender;

- (IBAction)doneButton:(id)sender;

@end
