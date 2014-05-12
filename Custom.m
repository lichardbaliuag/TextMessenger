//
//  Custom.m
//  TextMessenger
//
//  Created by Lichard Baliuag on 24/11/12.
//  Copyright (c) 2012 Lichard Baliuag. All rights reserved.
//

#import "Custom.h"

@implementation Custom
@synthesize name, dateTimeSent, dateTimeActivate, msgContent;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
