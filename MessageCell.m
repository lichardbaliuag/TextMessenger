//
//  MessageCell.m
//  TextMessenger
//
//  Created by Lichard Baliuag on 19/4/14.
//  Copyright (c) 2014 Lichard Baliuag. All rights reserved.
//

#import "MessageCell.h"
#import "MainController.h"
#import <QuartzCore/QuartzCore.h>


@implementation MessageCell


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)dealloc {

    
}

@end
