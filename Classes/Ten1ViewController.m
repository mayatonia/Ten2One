//
//  Ten1ViewController.m
//  Ten1
//
//  Created by Oswald on 7/13/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "Ten1ViewController.h"
#import "MainMenuViewController.h"

@implementation Ten1ViewController
@synthesize mmViewController;
@synthesize timer;


- (IBAction)Touched:(id)sender
{

}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	//self.timer =
	//[NSTimer timerWithTimeInterval:1 target:self selector:@selector(myTimerFired) userInfo:nil repeats:NO];
	//[self.timer start];
	[NSTimer scheduledTimerWithTimeInterval:1.0 
									 target:self 
								   selector:@selector(onTimerTicked) 
								   userInfo:nil 
									repeats:NO];
}

- (void)onTimerTicked {
	NSLog(@"Timer Fired");
	
	[self ShowMainMenu];
	
}

- (void)ShowMainMenu{

		NSLog(@"Preparing to sleep.");
		//sleep(2);
		
		NSLog(@"Slept for 2 second.");
		
		if (self.mmViewController == nil)
		{
			NSLog(@"Preparing to initialize the MainMenu View Controller");
			MainMenuViewController *mmVController =
			[[MainMenuViewController alloc]
			 initWithNibName:@"MainMenuView" bundle:nil];
			
			self.mmViewController = mmVController;
			[mmVController release];
			
			NSLog(@"MainMenu View Controller created.");
		}
		else
		{
			NSLog(@"We should not enter this code area.");
		}
		
		[UIView beginAnimations:@"View Flip" context:nil];
		[UIView setAnimationDelay: 2];
		[UIView setAnimationDuration:1.25];
		
		[UIView setAnimationCurve: UIViewAnimationCurveEaseIn];
		[self.mmViewController viewWillAppear:YES];
		[self viewWillDisappear:YES];
		[UIView setAnimationTransition:
		 UIViewAnimationTransitionFlipFromRight
							   forView:self.view cache: YES];
		
		UIWindow *currWnd = self.view.window;
		[self.view removeFromSuperview];
		
		NSLog(@"Removed current view from SuperView");
		[currWnd addSubview:self.mmViewController.view];
		//[self.view insertSubview:self.mmViewController.view atIndex:0];
		
		[self viewDidDisappear: YES];
		[self.mmViewController viewDidAppear: YES];
		[UIView commitAnimations];
		
		NSLog(@"Inserted the Main Menu View");
	
}

- (IBAction)LoadMenu:(id)sender
{
 	NSLog(@"TimerFired");
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}

- (void)viewDidAppear:(BOOL)animation
{

}

- (void)dealloc {
	[self.mmViewController release];
    [super dealloc];
}

@end
