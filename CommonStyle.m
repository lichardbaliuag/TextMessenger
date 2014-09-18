//
//  CommonStyle.m
//  TextMessenger
//
//  Created by Lichard Baliuag on 24/8/14.
//  Copyright (c) 2014 Lichard Baliuag. All rights reserved.
//

#import "CommonStyle.h"

@implementation CommonStyle

-(void)pickPersonContactList
{
    
}

// Background View for Recipient UITextField
+(void)setContactFieldViewBackground: (UIView *)contactView
{
    UIView *contactFrame = [[UIView alloc]initWithFrame:CGRectMake(0, 65, 320, 40)];
    [contactFrame setBackgroundColor:[UIColor grayColor]];
    [contactView addSubview:contactFrame];
}

// Circle style for Image
+(void)setMyImageImageProfileStyle: (UIImageView *)image
{
    image.layer.cornerRadius = image.frame.size.width/2;    // self.profileImageView.frame.size.width / 2
    image.clipsToBounds = YES;
    //image.layer.borderWidth = 1;
    image.layer.borderColor = [UIColor grayColor].CGColor;
}

+(void)setViewBackground:(UIImageView *)viewBG
{
   
}

+(NSString *)jsonURL
{
    return @"http://www.greetify.net/myjson/service1.svc/";
}

+(void)setProfileImage:(UIImageView *)imgProfile
{
    imgProfile.layer.cornerRadius = imgProfile.frame.size.width/2;
    imgProfile.clipsToBounds = YES;
    
}



@end
