//
//  Ten1AppDelegate.h
//  Ten1
//
//  Created by Oswald on 7/13/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Ten1ViewController;

@interface Ten1AppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    Ten1ViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet Ten1ViewController *viewController;

@end

