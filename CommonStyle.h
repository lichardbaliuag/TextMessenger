//
//  CommonStyle.h
//  TextMessenger
//
//  Created by Lichard Baliuag on 24/8/14.
//  Copyright (c) 2014 Lichard Baliuag. All rights reserved.
//

#import <Foundation/Foundation.h>

#define msgCodeZero 0
#define kDatePickerTag 100
#define SelectButtonIndex 1
#define CancelButtonIndex 2
#define titleName "New message"
#define cWR 24/255.0f
#define cGN 177/255.0f
#define cBL 16/255.0f
#define cAL 1.0f

@interface CommonStyle : NSObject

@property (strong, nonatomic) IBOutlet UITextView *textViewRecipient;
@property (strong, nonatomic) IBOutlet UIButton *sendDate;
//@property (strong, nonatomic) IBOutlet UIView *contactViewBG;

-(void)pickPersonContactList;

+(void)setContactFieldViewBackground: (UIView *)contactView;

+(void)setMyImageImageProfileStyle:(UIImageView *)image;

+(NSString *)jsonURL;

+(void)setViewBackground:(UIImageView *)viewBG;

+(void)setProfileImage:(UIImageView *)imgProfile;

@end
