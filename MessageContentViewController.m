//
//  MessageContentViewController.m
//  TextMessenger
//
//  Created by Lichard Baliuag on 28/11/12.
//  Copyright (c) 2012 Lichard Baliuag. All rights reserved.
//

#import "MessageContentViewController.h"
#import "AddMessViewController.h"

@interface MessageContentViewController ()

@end

@implementation MessageContentViewController
//@synthesize characterName, characterNumber, messageContent;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self contentDisplay];
    //self.userMessages =
    
    
    self.msgContentDetails.text = self.userMessages.messageContent;
    
    NSDateFormatter *dateFormatter;
    
    dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd/MM/yyyy hh:mm a"];// here set format which you want...
    
    NSString *convertedString = [dateFormatter stringFromDate:self.userMessages.sendDate];

    NSLog(@"messageguid %@", self.userMessages.messageGuid);
    
    self.dateToSend.text = convertedString;
    self.status.text = [NSString stringWithFormat:@"%@", self.userMessages.messageStatusCode];
    
    
}

-(void)viewDidAppear:(BOOL)animated
{
    UINavigationController *navCon  = (UINavigationController*) [self.navigationController.viewControllers objectAtIndex:1];
    navCon.navigationItem.title = self.userMessages.recipientName;
}

- (void)contentDisplay
{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
