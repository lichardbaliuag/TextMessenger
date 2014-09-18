//
//  SettingsTableViewController.h
//  TextMessenger
//
//  Created by Lichard Baliuag on 16/9/14.
//  Copyright (c) 2014 Lichard Baliuag. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingsTableViewController : UITableViewController
@property (strong, nonatomic) IBOutlet UITableViewCell *cellImage;
@property (strong, nonatomic) IBOutlet UITableViewCell *cellGray;
@property (strong, nonatomic) IBOutlet UITableViewCell *cellAccount;
@property (strong, nonatomic) IBOutlet UITableViewCell *cellNotification;

@property (strong, nonatomic) IBOutlet UIImageView *imgProfile;

@end
