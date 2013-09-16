//
//  AppDelegate.m
//  RedBourne
//
//  Created by Jerry on 22/08/13.
//  Copyright (c) 2013 Jerry. All rights reserved.
//

#import "AppDelegate.h"
#import "RightViewController.h"
#import "LeftViewController.h"

@implementation AppDelegate

- (void)UIInitialize
{


    //Grab a reference to the UISplitViewController
    UISplitViewController *splitViewController = (UISplitViewController *)self.window.rootViewController;
    
    //Grab a reference to the RightViewController and set it as the SVC's delegate.
    RightViewController *rightViewController = [splitViewController.viewControllers lastObject];
    splitViewController.delegate = rightViewController;
    
    //Grab a reference to the LeftViewController and get the first child in the list.
    UINavigationController *leftNavController = [splitViewController.viewControllers objectAtIndex:0];
    LeftViewController *leftViewController = (LeftViewController *)[leftNavController topViewController];
  
    //Set the RightViewController as the left's delegate.
    leftViewController.delegate = rightViewController;
    
    
    
/*      ChildModel *firstChild = [[leftViewController childList] objectAtIndex:0];
    NSLog(@"load first child!");

    //Set it as the RightViewController's child.
    [rightViewController setChild:firstChild];
*/  


}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{ 
    //AuthenticationViewController *authenticationVC = [[AuthenticationViewController alloc]init];
       
    //Figure out that we're on an iPad.
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        [self UIInitialize];
    }
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application{}
- (void)applicationDidEnterBackground:(UIApplication *)application{}
- (void)applicationWillEnterForeground:(UIApplication *)application{}
- (void)applicationDidBecomeActive:(UIApplication *)application{}
- (void)applicationWillTerminate:(UIApplication *)application{}

@end
