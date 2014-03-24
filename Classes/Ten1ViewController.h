//
//  Ten1ViewController.h
//  Ten1
//
//  Created by Oswald on 7/13/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MainMenuViewController;


@interface Ten1ViewController : UIViewController {

	MainMenuViewController *mmViewController;
	NSTimer *timer;
}

@property (nonatomic, retain) IBOutlet MainMenuViewController	*mmViewController; 
@property (nonatomic, retain) IBOutlet NSTimer					*timer;

- (IBAction)Touched:(id)sender;
- (IBAction)LoadMenu:(id)sender;
- (void)onTimerTicked;
- (void)ShowMainMenu;

@end

