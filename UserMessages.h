//
//  UserMessages.h
//  TextMessenger
//
//  Created by Lichard Baliuag on 31/7/14.
//  Copyright (c) 2014 Lichard Baliuag. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class UserProfile;

@interface UserMessages : NSManagedObject

@property (nonatomic, retain) NSString * deletedBy;
@property (nonatomic, retain) NSDate * deletedDate;
@property (nonatomic, retain) NSNumber * isdeleted;
@property (nonatomic, retain) NSString * messageContent;
@property (nonatomic, retain) NSDate * messageDateCreated;
@property (nonatomic, retain) NSString * messageGuid;
@property (nonatomic, retain) NSNumber * messageStatusCode;
@property (nonatomic, retain) NSString * modifiedBy;
@property (nonatomic, retain) NSString * recipientName;
@property (nonatomic, retain) NSNumber * recipientNumber;
@property (nonatomic, retain) NSDate * sendDate;
@property (nonatomic, retain) NSString * senderEmail;
@property (nonatomic, retain) NSNumber * senderNumber;
@property (nonatomic, retain) NSNumber * templateId;
@property (nonatomic, retain) NSNumber * userGuid;
@property (nonatomic, retain) UserProfile *userProfile;

@end
