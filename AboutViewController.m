//
//  AboutViewController.m
//  TextMessenger
//
//  Created by Lichard Baliuag on 23/4/14.
//  Copyright (c) 2014 Lichard Baliuag. All rights reserved.
//

#import "AboutViewController.h"
#import "ControlViewController.h"

#define cWR 24/255.0f
#define cGN 177/255.0f
#define cBL 16/255.0f
#define cAL 1.0f


@interface AboutViewController ()
 
@end


@implementation AboutViewController


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
    //[super navColor];
    
    self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:cWR green:cGN blue:cBL alpha:cAL];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
