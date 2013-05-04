//
//  AppDelegate.m
//  Support2
//
//  Created by DieGo on 4/28/13.
//  Copyright (c) 2013 Diego Goretti. All rights reserved.
//

#import "AppDelegate.h"
#import "InsertViewController.h"
#import "ListViewController.h"
#import "HomeViewController.h"
#import "SettingsViewController.h"

#import "RestKit/RestKit.h"

#import "crmLogin.h"
#import "crmCaseActions.h"

@implementation AppDelegate

@synthesize window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    // Override point for customization after application launch.
	NSMutableArray *controllers = [[NSMutableArray alloc] initWithCapacity:4];
	_tabBarController = [[UITabBarController alloc] init];
	
    HomeViewController *homeViewController = [[HomeViewController alloc] initWithNibName: nil bundle:nil];
	homeViewController.title = @"Home";
	homeViewController.tabBarItem.image = [UIImage imageNamed:@"home.png"];
    
	InsertViewController *insertViewController = [[InsertViewController alloc] initWithNibName: nil bundle:nil];
	insertViewController.title = @"Inserisci";
	insertViewController.tabBarItem.image = [UIImage imageNamed:@"insert.png"];
    
	ListViewController *listViewController = [[ListViewController alloc] initWithNibName: nil bundle:nil];
	listViewController.title = @"Lista";
	listViewController.tabBarItem.image = [UIImage imageNamed:@"list.png"];
	
	SettingsViewController *settingsViewController = [[SettingsViewController alloc] initWithNibName:nil bundle:nil];
    settingsViewController.title = @"Impostazioni";
    settingsViewController.tabBarItem.image = [UIImage imageNamed:@"settings.png"];
    
	//Definizione del delegato
	//insertViewController.delegate = listViewController;
    
	[controllers addObject:homeViewController];
	[controllers addObject:insertViewController];
	[controllers addObject:listViewController];
    [controllers addObject:settingsViewController];
	_tabBarController.viewControllers = controllers;
	
    
	
	[self.window addSubview:_tabBarController.view];
    [self.window makeKeyAndVisible];
    
    
    
    //self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    //self.window.backgroundColor = [UIColor whiteColor];
    //[self.window makeKeyAndVisible];
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
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
