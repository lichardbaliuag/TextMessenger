//
//  UserProfile.h
//  TextMessenger
//
//  Created by Lichard Baliuag on 7/5/14.
//  Copyright (c) 2014 Lichard Baliuag. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Templates, UserMessages;

@interface UserProfile : NSManagedObject

@property (nonatomic, retain) NSNumber * activationCode;
@property (nonatomic, retain) NSString * createdBy;
@property (nonatomic, retain) NSDate * dateActivated;
@property (nonatomic, retain) NSDate * dateCreated;
@property (nonatomic, retain) NSDate * dateModified;
@property (nonatomic, retain) NSNumber * isActivated;
@property (nonatomic, retain) NSDate * lastOnlineDateTime;
@property (nonatomic, retain) NSDate * modifiedBy;
@property (nonatomic, retain) NSNumber * userCurrentStatus;
@property (nonatomic, retain) NSString * userEmailAddress;
@property (nonatomic, retain) NSString * userGuid;
@property (nonatomic, retain) NSNumber * userPhoneNumber;
@property (nonatomic, retain) NSSet *messages;
@property (nonatomic, retain) NSSet *template;
@end

@interface UserProfile (CoreDataGeneratedAccessors)

- (void)addMessagesObject:(UserMessages *)value;
- (void)removeMessagesObject:(UserMessages *)value;
- (void)addMessages:(NSSet *)values;
- (void)removeMessages:(NSSet *)values;

- (void)addTemplateObject:(Templates *)value;
- (void)removeTemplateObject:(Templates *)value;
- (void)addTemplate:(NSSet *)values;
- (void)removeTemplate:(NSSet *)values;

@end
