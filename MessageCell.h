//
//  MessageCell.h
//  TextMessenger
//
//  Created by Lichard Baliuag on 19/4/14.
//  Copyright (c) 2014 Lichard Baliuag. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MessageCell : UITableViewCell
@property (retain, nonatomic) IBOutlet UILabel *recipientName;
@property (retain, nonatomic) IBOutlet UILabel *composeDate;
@property (retain, nonatomic) IBOutlet UILabel *sendDateCell;
@property (retain, nonatomic) IBOutlet UILabel *msgContentCell;

@end
