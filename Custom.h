//
//  Custom.h
//  TextMessenger
//
//  Created by Lichard Baliuag on 24/11/12.
//  Copyright (c) 2012 Lichard Baliuag. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Custom : UITableViewCell

@property (retain, nonatomic) IBOutlet UILabel *name;
@property (retain, nonatomic) IBOutlet UILabel *dateTimeSent;
@property (retain, nonatomic) IBOutlet UILabel *dateTimeActivate;
@property (retain, nonatomic) IBOutlet UILabel *msgContent;

@end
