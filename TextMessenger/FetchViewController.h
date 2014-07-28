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

@property (nonatomic, strong) NSString *templateID;
@property (nonatomic, strong) NSString *templateContent;

@property (strong, nonatomic) IBOutlet UILabel *lblContent;

- (IBAction)Send:(id)sender;
- (IBAction)doneButton:(id)sender;
//- (IBAction)fetchGreeting;
//- (IBAction)cancelButton:(id)sender;



@end
