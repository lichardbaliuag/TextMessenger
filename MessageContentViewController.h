//
//  MessageContentViewController.h
//  TextMessenger
//
//  Created by Lichard Baliuag on 28/11/12.
//  Copyright (c) 2012 Lichard Baliuag. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserMessages.h"
@interface MessageContentViewController : UIViewController

@property (nonatomic, strong) IBOutlet UITextView *messageContent;
@property (nonatomic, strong) id detailItem;
@property (nonatomic, strong) UserMessages *userMessages;
@property (nonatomic, strong) NSString *messageGuid;
//@property (nonatomic, strong) IBOutlet UILabel *msgContentDetails;
@property (nonatomic, strong) IBOutlet UILabel *dateToSend;
@property (nonatomic, strong) IBOutlet UILabel *status;
@property (nonatomic, strong) IBOutlet UILabel *contentLabel;
@property (strong, nonatomic) IBOutlet UITextView *messageDetail;

- (void)setDefaultPropertiesForLabel:(UILabel*)label;
@property (strong, nonatomic) IBOutlet UIImageView *imgbackground;

@end
