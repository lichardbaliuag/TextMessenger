//
//  SystemCode.h
//  TextMessenger
//
//  Created by Lichard Baliuag on 7/5/14.
//  Copyright (c) 2014 Lichard Baliuag. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface SystemCode : NSManagedObject

@property (nonatomic, retain) NSString * codeDescription;
@property (nonatomic, retain) NSString * codeId;
@property (nonatomic, retain) NSString * codeText;
@property (nonatomic, retain) NSNumber * isdeleted;
@property (nonatomic, retain) NSString * sortOption;

@end
