//
//  ComposeMessageViewController.m
//  TextMessenger
//
//  Created by Lichard Baliuag on 8/12/12.
//  Copyright (c) 2012 Lichard Baliuag. All rights reserved.
//

#import "ComposeMessageViewController.h"
#import "MainController.h"

@interface ComposeMessageViewController ()

@end

@implementation ComposeMessageViewController
//@synthesize recepientTextField, dateButton;

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
    
    /*
    // Do any additional setup after loading the view from its nib.
    //self.navigationItem.title = @"New Message";
    
    //UIBarButtonItem *doneButton =[[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStylePlain target:self action:@selector(doneComposing)];
    //[self.navigationItem setRightBarButtonItem:doneButton];
    */
}

/*
- (void)doneComposing
{
    
}
*/

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
