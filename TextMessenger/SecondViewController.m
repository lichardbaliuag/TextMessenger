//
//  SecondViewController.m
//  TextMessenger
//
//  Created by Lichard Baliuag on 24/11/12.
//  Copyright (c) 2012 Lichard Baliuag. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)postToTweeter:(id)sender
{
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter])
    {
        SLComposeViewController *tweetSheet = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
        //[tweetSheet setInitialText:@"Great fun to learn iOS Programming!"];
        [self presentViewController:tweetSheet animated:YES completion:nil];
     }
}

- (IBAction)postToFacebook:(id)sender
{
    /* -- OLD Version of SLComposeViewController --
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook])
    {
        SLComposeViewController *fbPost = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
        //[fbPost setInitialText:@"Great fun to learn FB composer!"];
        [self presentViewController:fbPost animated:YES completion:nil];
    }
    */
    
    
    // --- NEW -- //
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]) {
        
    SLComposeViewController *composeController = [SLComposeViewController
                                                  composeViewControllerForServiceType:SLServiceTypeFacebook];
    
    [composeController setInitialText:@"Just found this great website"];
    //[composeController addImage:postImage.image];
    //[composeController addURL: [NSURL URLWithString: @"http://www.ebookfrenzy.com"]];
    
    [self presentViewController:composeController animated:YES completion:nil];
    }
    
}
@end
