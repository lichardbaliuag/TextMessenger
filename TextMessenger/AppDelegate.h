//
//  AppDelegate.h
//  TextMessenger
//
//  Created by Lichard Baliuag on 24/11/12.
//  Copyright (c) 2012 Lichard Baliuag. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@class ViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate,UINavigationBarDelegate>
{
    //NSManagedObjectModel *managedObjectModel;
    //NSManagedObjectContext *managedObjectContext;
    //NSPersistentStoreCoordinator *persistentStoreCoordinator;
}

@property (nonatomic, retain, readonly) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, retain, readonly) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain, readonly)  NSPersistentStoreCoordinator *persistentStoreCoordinator;

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) ViewController *viewController;

- (void) saveContext;
- (NSURL *) applicationDocumentsDirectory;

@end
