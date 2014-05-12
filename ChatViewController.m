//
//  ChatViewController.m
//  TextMessenger
//
//  Created by Lichard on 28/1/14.
//  Copyright (c) 2014 Lichard Baliuag. All rights reserved.
//

#import "ChatViewController.h"

@interface ChatViewController ()

@end

@implementation ChatViewController

- (void) composeView {

    
    CGSize size = self.frame.size;
    // Input
	_inputBackgroundView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height)];
	_inputBackgroundView.autoresizingMask = UIViewAutoresizingNone;
    _inputBackgroundView.contentMode = UIViewContentModeScaleToFill;

	//_inputBackgroundView.userInteractionEnabled = YES;
    //_inputBackgroundView.alpha = .5;
    _inputBackgroundView.backgroundColor = [UIColor clearColor];

    //_inputBackgroundView.backgroundColor = [[UIColor redColor] colorWithAlphaComponent:.5];
	[self addSubview:_inputBackgroundView];
    
    //[_inputBackgroundView release];                                               // Not needed
     
    
    // Text field
    _textView = [[UITextView alloc] initWithFrame:CGRectMake(70.0f, 0, 185, 0)];
    _textView.backgroundColor = [UIColor clearColor];
    //_textView.backgroundColor = [[UIColor redColor] colorWithAlphaComponent:.3]; // Uncommented
	_textView.delegate = self;
    _textView.contentInset = UIEdgeInsetsMake(-4, -2, -4, 0);
    _textView.showsVerticalScrollIndicator = NO;
    _textView.showsHorizontalScrollIndicator = NO;
	_textView.font = [UIFont systemFontOfSize:15.0f];
	[self addSubview:_textView];
    //[_textView release];
    
    [self adjustTextInputHeightForText:@"" animated:NO];

    /*
    // Send button
	_sendButton = [[UIButton buttonWithType:UIButtonTypeCustom] retain];
	_sendButton.frame = CGRectMake(size.width - 64.0f, 12.0f, 58.0f, 27.0f);
	_sendButton.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
	_sendButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:14];
	_sendButton.titleLabel.shadowOffset = CGSizeMake(0.0f, 1.0f);
    //	[_sendButton setTitleColor:[UIColor colorWithWhite:1.0f alpha:0.4f] forState:UIControlStateNormal];
    //	[_sendButton setTitleShadowColor:[UIColor colorWithRed:0.325f green:0.463f blue:0.675f alpha:1.0f] forState:UIControlStateNormal];
	[_sendButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
	[_sendButton setTitleShadowColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_sendButton addTarget:self action:@selector(sendButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
	[self addSubview:_sendButton];
    //[_sendButton release];
     */
    
}

- (void) adjustTextInputHeightForText:(NSString*)text animated:(BOOL)animated {
    
    int h1 = [text sizeWithFont:_textView.font].height;
    int h2 = [text sizeWithFont:_textView.font constrainedToSize:CGSizeMake(_textView.frame.size.width - 16, 170.0f) lineBreakMode:NSLineBreakByWordWrapping].height;
    
    [UIView animateWithDuration:(animated ? .1f : 0) animations:^
     {
         int h = h2 == h1 ? _inputHeightWithShadow : h2 + 24;
         int delta = h - self.frame.size.height;
         CGRect r2 = CGRectMake(0, self.frame.origin.y - delta, self.frame.size.width, h);
         self.frame = r2; //CGRectMake(0, self.frame.origin.y - delta, self.superview.frame.size.width, h);
         _inputBackgroundView.frame = CGRectMake(0, 0, self.frame.size.width, h);
         
         CGRect r = _textView.frame;
         r.origin.y = 12;
         r.size.height = h - 18;
         _textView.frame = r;
         
     } completion:^(BOOL finished)
     {
         //
     }];
}




@end
