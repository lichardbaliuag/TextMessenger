//
//  FetchViewController.m
//  TextMessenger
//
//  Created by Lichard Baliuag on 10/4/14.
//  Copyright (c) 2014 Lichard Baliuag. All rights reserved.
//

#import "FetchViewController.h"
#import "AddMessViewController.h"


#define cWR 24/255.0f
#define cGN 177/255.0f
#define cBL 16/255.0f
#define cAL 1.0f

@interface FetchViewController ()

@end


@implementation FetchViewController


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
    self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:cWR green:cGN blue:cBL alpha:cAL];

    self.lblContent.text = self.templateContent;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
- (IBAction)fetchGreeting
{
    //NSString *txt = @"55";
    //NSString *txt = self.txtId.text;
    //NSString *url = [NSString stringWithFormat:@"http://www.itzodiac.com/testjson/RestServiceImpl.svc/json/%@",txt];
    NSURL *url = [NSURL URLWithString:@"http://rest-service.guides.spring.io/greeting"];
    //NSURL *url = [NSURL URLWithString:@"http://www.itzodiac.com/testjson/RestServiceImpl.svc/GetTemplate"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    //NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response,
                                              NSData *data,
                                              NSError *connectionError)
     {
          if (data.length > 0 && connectionError == nil)
         {
             NSDictionary *greeting = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
             //self.greetingId.text = [[greeting objectForKey:@"id"] stringValue];
             //self.greetingContent.text = [greeting objectForKey:@"content"];
             
             //self.greetingContent.text = [greeting objectForKey:@"JSONDataResult"];
             
             self.greetingId.text = [[greeting objectForKey:@"id"] stringValue];
             self.greetingContent.text = [greeting objectForKey:@"content"];
         }
    }];
}
- (IBAction)cancelButton:(id)sender
{

    [super cancelAndDismiss];
}
*/

- (IBAction)doneButton:(id)sender {
    
    [super doneAndDismiss];
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

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"SendTemplate"])
    {
        AddMessViewController *dv = (AddMessViewController *)segue.destinationViewController;
        dv.templateContent = self.templateContent;
        dv.templateID = self.templateID;
        
        dv.isFromTemplate = @"1";
        
    }
    
}

- (IBAction)Send:(id)sender {
    
     //[self performSegueWithIdentifier:@"SendTemplate" sender:self];
    UIViewController *myController = [self.storyboard instantiateViewControllerWithIdentifier:@"SendTemplate"];
    [self.navigationController pushViewController: myController animated:YES];
    
}
@end
