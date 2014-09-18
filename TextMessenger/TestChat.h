//
//  TestChat.h
//  TextMessenger
//
//  Created by Lichard Baliuag on 28/8/14.
//  Copyright (c) 2014 Lichard Baliuag. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TestViewDelegate <NSObject>

-(void)GetValueInBox: (NSString *) valueinbox;

@end

@interface TestChat : UIView
@property (strong, nonatomic) IBOutlet UITextField *txtName;
- (IBAction)getValue:(id)sender;


@property (nonatomic, assign) id<TestViewDelegate> GetValueInBoxDelegate;

@end
