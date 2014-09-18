//
//  TestChat.m
//  TextMessenger
//
//  Created by Lichard Baliuag on 28/8/14.
//  Copyright (c) 2014 Lichard Baliuag. All rights reserved.
//

#import "TestChat.h"

@implementation TestChat

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (IBAction)getValue:(id)sender {
    
    [self.GetValueInBoxDelegate GetValueInBox:self.txtName.text];
}

- (void)viewDidLoad
{
    
}
@end
