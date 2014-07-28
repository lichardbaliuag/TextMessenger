//
//  AppDelegate.m
//  TextMessenger
//
//  Created by Lichard Baliuag on 24/11/12.
//  Copyright (c) 2012 Lichard Baliuag. All rights reserved.
//

#import "AppDelegate.h"
#import "MainController.h"
#import "MessageContentViewController.h"

@implementation AppDelegate

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    UITabBarController *tabBarController = (UITabBarController *)self.window.rootViewController;
    UINavigationController *navigationController = (UINavigationController *)[[tabBarController viewControllers] objectAtIndex:0];
    MainController  *controller = (MainController *)[[navigationController viewControllers] objectAtIndex:0];
    controller.managedObjectContext = self.managedObjectContext;

    UILocalNotification *localNotification = [launchOptions objectForKey:UIApplicationLaunchOptionsLocalNotificationKey];
    if (localNotification) {
        application.applicationIconBadgeNumber = 0;
    }
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.

    
    NSDate *alarmTime = [[NSDate date] dateByAddingTimeInterval:3.0];
    //UIApplication *app = [UIApplication sharedApplication];
    UILocalNotification *notifyAlarm = [[UILocalNotification alloc]init];
    
    if (notifyAlarm) {
        notifyAlarm.fireDate = alarmTime;
        notifyAlarm.timeZone = [NSTimeZone defaultTimeZone];
        notifyAlarm.repeatInterval = 0;
        notifyAlarm.soundName = @"";
        notifyAlarm.alertBody = @"Text Messenger in action!";
        notifyAlarm.applicationIconBadgeNumber = [[UIApplication sharedApplication] applicationIconBadgeNumber] + 1;

        NSDictionary *tempDict = [[NSDictionary alloc] initWithObjectsAndKeys:@"abc12345", @"messagekey", nil ];
        notifyAlarm.userInfo = tempDict;
        
        [[UIApplication sharedApplication] scheduleLocalNotification:notifyAlarm];
        
    }
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    
    UIApplication *app = [UIApplication sharedApplication];
    NSArray *oldNotifications = [app scheduledLocalNotifications];
    if ([oldNotifications count] > 0 ) {
        [app cancelAllLocalNotifications];
        
    }
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void) saveContext
{
    NSError *error = nil;
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil)
    {
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            NSLog(@"Unresolve error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

#pragma mark - Core Data stack

- (NSManagedObjectContext *)managedObjectContext
{
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator != nil)
    {
        _managedObjectContext = [[NSManagedObjectContext alloc]init];
        [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    }
    return _managedObjectContext;
}

- (NSManagedObjectModel *)managedObjectModel
{
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    //NSString *modelPath = [[NSBundle mainBundle] pathForResource:@"TMData" ofType:@"momd"];
    //NSURL *modelURL = [NSURL fileURLWithPath:modelPath];
    //_managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];

    NSURL *modeURL = [[NSBundle mainBundle] URLForResource:@"TMData" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modeURL];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    if (_persistentStoreCoordinator != nil)
    {
        return _persistentStoreCoordinator;
    }
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"TMData.sqlite"];
    
    NSError *error = nil;
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc]initWithManagedObjectModel:[self managedObjectModel]];
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error])
    {
        NSLog(@"Unresolve error %@, %@", error, [error userInfo]);
        abort();
    }
    return _persistentStoreCoordinator;
}


#pragma mark - Application Document Directory
//
- (NSURL *)applicationDocumentsDirectory
{
    //return [[[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject] URLByAppendingPathComponent:@"TMData.sqlite"];

    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (void) application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification
{
    application.applicationIconBadgeNumber = 0;
//    MainController *room = [[MainController alloc] init];
//    room.isFromNotification = @"1";
//    [self.window.rootViewController presentViewController:room
//                                                 animated:YES
//                                               completion:nil];
    
    [[UIApplication sharedApplication] cancelLocalNotification:notification];
    [[self window] makeKeyAndVisible];
    
    UITabBarController *tab = (UITabBarController *)self.window.rootViewController;                             // Inserted
    tab.selectedIndex = 0;                                                                                      // Inserted
    
    //UINavigationController *navigationController = (UINavigationController *)self.window.rootViewController;
    UINavigationController *navigationController = (UINavigationController *)[tab selectedViewController];      // Inserted

    //MainController *dv = nil;
    MainController *dv = [[MainController alloc]init];
    
    //dv = (MainController *)[[navigationController viewControllers] objectAtIndex:0];
    //dv = [[navigationController viewControllers]objectAtIndex:0];
    dv = [[navigationController viewControllers] objectAtIndex:0];
    
    if ([notification.userInfo valueForKey:@"messagekey"] !=nil)
    {
        NSLog(@"This is notification window 1 and key %@", notification.userInfo);
        //[dv performSegueWithIdentifier:@"segone" sender:self];
        
        NSString *sample = [NSString stringWithFormat:@"%@", [notification.userInfo valueForKey:@"messagekey"]];
        //dv.notificationID = sample; //[notification.userInfo valueForKey:@"messagekey"];
        dv.notificationID = sample;
        
    }
        [dv CallOtherView];
}

@end
