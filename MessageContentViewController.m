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
    
    self.contentLabel.text = self.msgID;
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
