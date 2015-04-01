//
//  AppDelegate.m
//  TripEase
//
//  Created by David Patterson on 2015-02-17.
//  Copyright (c) 2015 KISS Apps. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    //Print home directory to console
    NSLog(@"HOME > %@", NSHomeDirectory());
    
    //Print documents directory to console
    NSArray *directories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documents = [directories firstObject];
    NSLog(@"DOCUMENTS > %@", documents);
    
    /*
     //Save data
     NSUserDefaults *savedTrips = [NSUserDefaults standardUserDefaults];
     NSData *data = [NSKeyedArchiver archivedDataWithRootObject:self.tripList];
     [savedTrips setObject:data forKey:@"savedTrips"];
     [savedTrips synchronize];*/
    
    //Test code
    NSArray *fruits = @[@"Apple", @"Mango", @"Pineapple", @"Plum", @"Apricot"];
    
    NSString *filePathFruits = [documents stringByAppendingPathComponent:@"fruits.plist"];
    [fruits writeToFile:filePathFruits atomically:YES];
    
    NSDictionary *miscDictionary = @{@"anArray" : fruits, @"aNumber" : @12345, @"aBoolean" : @YES};
    
    NSString *filePathDictionary = [documents stringByAppendingPathComponent:@"misc-dictionary.plist"];
    [miscDictionary writeToFile:filePathDictionary atomically:YES];
    
    NSArray *loadedFruits = [NSArray arrayWithContentsOfFile:filePathFruits];
    NSLog(@"Fruits Array > %@", loadedFruits);
    
    NSDictionary *loadedMiscDictionary = [NSDictionary dictionaryWithContentsOfFile:filePathDictionary];
    NSLog(@"Misc Dictionary > %@", loadedMiscDictionary);
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
