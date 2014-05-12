//
//  ChatViewController.h
//  TextMessenger
//
//  Created by Lichard on 28/1/14.
//  Copyright (c) 2014 Lichard Baliuag. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChatViewController : UIView <UITextViewDelegate>
{

}
@property(assign) IBOutlet id delegate;
@property(assign) int inputHeight;
@property(assign) int inputHeightWithShadow;
@property(assign) BOOL autoResizeOnKeyboardVisibilityChanged;

@property(strong, nonatomic) UIButton *sendButton;
@property(strong, nonatomic) UIButton *attachedButton;
@property(strong, nonatomic) UIButton *semojiButton;
@property(strong, nonatomic) UITextView *textView;
@property(strong, nonatomic) UILabel *lblPlaceHolder;
@property(strong, nonatomic) UIImageView *inputBackgroundView;

- (void) fitText;
- (void) setText:(NSString *)text;

@end
