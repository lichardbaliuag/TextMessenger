//
//  MessageCell.h
//  TextMessenger
//
//  Created by Lichard Baliuag on 19/4/14.
//  Copyright (c) 2014 Lichard Baliuag. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MessageCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *imgRecipientImage;
@property (strong, nonatomic) IBOutlet UILabel *labelSendToDate;
@property (strong, nonatomic) IBOutlet UILabel *labelStatus;
@property (strong, nonatomic) IBOutlet UILabel *labelRecipientName;
@property (strong, nonatomic) IBOutlet UILabel *labelMessageDetails;


@end
