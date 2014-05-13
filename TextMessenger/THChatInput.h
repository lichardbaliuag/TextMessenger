//
//  Created by Marat Alekperov (aka Timur Harleev) (m.alekperov@gmail.com) on 18.11.12.
//  Copyright (c) 2012 Me and Myself. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface THChatInput : UIView <UITextViewDelegate>
{

}

@property (assign) IBOutlet id delegate;
@property (assign) int inputHeight;
@property (assign) int inputHeightWithShadow;
@property (assign) BOOL autoResizeOnKeyboardVisibilityChanged;

@property (strong, nonatomic) UIButton *sendButton;
@property (strong, nonatomic) UIButton *attachButton;
@property (strong, nonatomic) UIButton *emojiButton;

@property (strong, nonatomic) UITextView *textView;

@property (strong, nonatomic) UILabel *lblPlaceholder;
@property (strong, nonatomic) UIImageView *inputBackgroundView;
//@property (strong, nonatomic) NSString *strName;

- (void) fitText;
- (void) setText:(NSString*)text;

- (void) stringReciever:(NSString*)msgString;       // To handle message from textview

@end
