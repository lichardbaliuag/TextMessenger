//
//  ControlViewController.h
//  TextMessenger
//
//  Created by Lichard Baliuag on 14/4/14.
//  Copyright (c) 2014 Lichard Baliuag. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kDatePickerTag 100
#define SelectButtonIndex 1
#define CancelButtonIndex 2
#define titleName "New message"
#define cWR 24/255.0f
#define cGN 177/255.0f
#define cBL 16/255.0f
#define cAL 1.0f

@interface ControlViewController : UIViewController

- (void) cancelAndDismiss;

- (void) doneAndDismiss;

- (void) navColor;

@end
