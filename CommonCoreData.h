//
//  CommonCoreData.h
//  TextMessenger
//
//  Created by Lichard Baliuag on 31/7/14.
//  Copyright (c) 2014 Lichard Baliuag. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppDelegate.h"

@interface CommonCoreData : NSObject

+ (NSArray *)GetUserMessages:(NSPredicate *)predicate;

@end
