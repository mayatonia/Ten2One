//
//  Ten1AppDelegate.m
//  Ten1
//
//  Created by Oswald on 7/13/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "Ten1AppDelegate.h"
#import "Ten1ViewController.h"

@implementation Ten1AppDelegate

@synthesize window;
@synthesize viewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
    // Override point for customization after app launch    
    [window addSubview:viewController.view];
	[window makeKeyAndVisible];
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
