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

-(float)resizeToFit;
-(float)expectedHeight;

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
    //[self contentDisplay];
    //self.msgContentDetails.text = self.userMessages.messageContent;

//    [self.contentLabel setNumberOfLines:0];
//    [self.contentLabel setLineBreakMode:NSLineBreakByWordWrapping];
    
    
    NSDateFormatter *dateFormatter;
    dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd/MM/yyyy hh:mm a"];// here set format which you want...
    
    NSString *convertedString = [dateFormatter stringFromDate:self.userMessages.sendDate];
    //NSLog(@"messageguid %@", self.userMessages.messageGuid);
    
    //CGSize maximumLabelSize = CGSizeMake(300, FLT_MAX);
    //CGSize expectedLabelSize = [self.userMessages.messageContent sizeWithFont:self.contentLabel.font constrainedToSize:maximumLabelSize lineBreakMode:self.contentLabel.lineBreakMode];
    //CGRect labelNewFrame = self.contentLabel.frame;
    
    //self.msgContentDetails.text = expectedLabelSize.height;
    self.dateToSend.text = convertedString;
    self.status.text = [NSString stringWithFormat:@"%@", self.userMessages.messageStatusCode];
    self.msgContentDetails.text = self.userMessages.messageContent;

}

-(void)viewDidAppear:(BOOL)animated
{
    UINavigationController *navCon  = (UINavigationController*) [self.navigationController.viewControllers objectAtIndex:1];
    navCon.navigationItem.title = self.userMessages.recipientName;
}

-(float)resizeToFit
{
    float height = [self expectedHeight];
    CGRect newFrame = [self.msgContentDetails frame];
    
    newFrame.size.height = height;
    [self.msgContentDetails setFrame:newFrame];
    return newFrame.origin.y + newFrame.size.height;
}

-(float)expectedHeight
{
    [self.contentLabel setNumberOfLines:0];
    [self.contentLabel setLineBreakMode:NSLineBreakByWordWrapping];

    UIFont *font = [UIFont systemFontOfSize:14.0]; //Warning! It's an example, set the font, you need
    NSDictionary *attributesDictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                                          font, NSFontAttributeName,
                                          nil];
    
    CGSize maximumLabelSize = CGSizeMake(self.msgContentDetails.frame.size.width,9999);
    CGRect expectedLabelRect = [[self.msgContentDetails text] boundingRectWithSize:maximumLabelSize
                                                         options:(NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading)
                                                      attributes:attributesDictionary
                                                         context:nil];
    CGSize *expectedLabelSize = &expectedLabelRect.size;
    return expectedLabelSize->height;
    
}

//- (void)contentDisplay
//{
//    
//}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setDefaultPropertiesForLabel:(UILabel*)label
{
    label.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:14.0f];
    label.backgroundColor = [UIColor clearColor];
    label.numberOfLines = 0;
    //label.lineBreakMode = UILineBreakModeWordWrap;
    label.lineBreakMode = NSLineBreakByWordWrapping;
    label.backgroundColor = [UIColor redColor];

}

@end
