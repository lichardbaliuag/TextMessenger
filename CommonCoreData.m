//
//  CommonCoreData.m
//  TextMessenger
//
//  Created by Lichard Baliuag on 31/7/14.
//  Copyright (c) 2014 Lichard Baliuag. All rights reserved.
//

#import "CommonCoreData.h"


@implementation CommonCoreData

+ (NSArray *)GetUserMessages:(NSPredicate *)predicate;
{
    
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context =   [appDelegate managedObjectContext];
    NSEntityDescription *entityDesc =    [NSEntityDescription entityForName:@"UserMessages" inManagedObjectContext:context];
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDesc];
    //
    //    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"(reminderDate >= %@)", [NSDate dateWithTimeIntervalSinceNow:1]];
    if ([predicate isEqual:nil]) {
        NSLog(@"predicate is nil");
    }
    else
    {
        [request setPredicate:predicate];
    }
    
    NSError *error;
    
    //dataArray = [[NSArray alloc]init];
    
    return [context executeFetchRequest:request
                                  error:&error];
    
}

@end
