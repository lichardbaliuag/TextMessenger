//
//  Templates.h
//  TextMessenger
//
//  Created by Lichard Baliuag on 7/5/14.
//  Copyright (c) 2014 Lichard Baliuag. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class UserProfile;

@interface Templates : NSManagedObject

@property (nonatomic, retain) NSString * backGroundImage;
@property (nonatomic, retain) NSString * createdBy;
@property (nonatomic, retain) NSDate * dateCreated;
@property (nonatomic, retain) NSDate * dateModified;
@property (nonatomic, retain) NSString * modifiedBy;
@property (nonatomic, retain) NSString * templateContent;
@property (nonatomic, retain) NSNumber * templateId;
@property (nonatomic, retain) NSString * templateTitle;
@property (nonatomic, retain) UserProfile *userProfile;

@end
