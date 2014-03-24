//
//  MainMenuViewController.m
//  Ten1
//
//  Created by Oswald on 7/14/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "MainMenuViewController.h"
#import "Level01ViewController.h"
#import "CreditsViewController.h"
#import "HowToPlayViewController.h"
#import "OptionsViewController.h"
#import "OnlineScoreBoardViewController.h"
#import "GameBase.h"


@implementation MainMenuViewController
@synthesize GameViewController;
@synthesize GameBaseEngine;
@synthesize bSoundMode;

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	GameBase *game = [GameBase alloc];
	[self setGameBaseEngine:game];
	[self setBSoundMode:TRUE];
    [super viewDidLoad];
	
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)PlayButtonClickSound
{
	NSString * soundfile = [NSString stringWithString:@"/ButtonClick.wav"];
	[GameBaseEngine PlaySoundFile:soundfile];
}

- (IBAction)NewGameButtonPressed:(id)sender{
	NSLog(@"NewGameButton Pressed Event received");
	
	[self PlayButtonClickSound];
	
	UIAlertView *alert = [[UIAlertView alloc] init];
	[alert setTitle:@"Select Difficulty Mode"];
	[alert setDelegate:self];
	
	[alert addButtonWithTitle:@"EASY"];
#ifdef LITEMODE

		//[alert addButtonWithTitle:@"HARD (Avail. in full version)"];
		//[alert addButtonWithTitle:@"HELL (Avail. in full version)"];
		//[[alert.subviews objectAtIndex:2] setEnabled: FALSE];
		//[[alert.subviews objectAtIndex:3] setEnabled: FALSE];
#else
		[alert addButtonWithTitle:@"HARD"];
		[alert addButtonWithTitle:@"HELL"];
#endif
		[alert setBackgroundColor:[UIColor darkGrayColor]];
	//[alert setNeedsLayout];
	//[alert setNeedsDisplay];
	
	[alert show];
	[alert release];
	
	//[self StartNewGame2];
	
}

- (IBAction)QuitGameButtonPressed:(id)sender{
	[self PlayButtonClickSound];
	NSLog(@"QuitGameButton Pressed Event received");
	exit(0);
}


- (IBAction)btnCreditsPressed:(id)sender{
	[self PlayButtonClickSound];
	
	[self ShowView:@"CreditsView"];
}

- (IBAction)ButtonSelected:(id)sender{
	
	NSLog(@"Button Selected");
	//[sender setAlpha:100.0];
}
- (IBAction)ButtonUnselected:(id)sender{
		NSLog(@"Button Unselected");
	//[sender setAlpha:0.02];
}

- (IBAction)btnHowToPlayPressed:(id)sender
{
	[self PlayButtonClickSound];
	[self ShowView:@"HowToPlayView"];
}
- (IBAction)btnOnlineScoreBoardPressed:(id)sender
{
	[self PlayButtonClickSound];
	[self ShowView:@"OnlineScoreBoardView"];
}
- (IBAction)btnOptionsPressed:(id)sender
{
	[self PlayButtonClickSound];
	[self ShowView:@"OptionsView"];
}

- (void)StartNewGame2:(NSInteger)nDifficultySetting{
	if (self.GameViewController == nil)
	{
		NSLog(@"Preparing to launch the game engine...");
		
		if (GameBaseEngine == nil)
		{
			GameBase * game = [GameBase alloc];
			[self setGameBaseEngine:game];
		}
		[GameBaseEngine SetGameDifficulty:nDifficultySetting];
		[GameBaseEngine setC_SOUND_MODE:[self bSoundMode]];
		//GameBase._Instance  = game;
		//[game InitializeFirstLevelOfChallenge:self.view :self :0];
		[GameBaseEngine set_Instance:GameBaseEngine];
		[GameBaseEngine StartGame:self.view :self :0];
		
	}
	
}

- (void)ShowView:(NSString *)strViewToShow{
	MenuTemplateViewController * vc;
	
	if ([strViewToShow isEqualToString:@"CreditsView"])
	{
		vc = [[CreditsViewController alloc]
			  initWithNibName:strViewToShow bundle:nil];
		
	}else if ([strViewToShow isEqualToString:@"HowToPlayView"])
	{
		vc = [[HowToPlayViewController alloc]
			  initWithNibName:strViewToShow bundle:nil];
	}
	else if([strViewToShow isEqualToString:@"OptionsView"])
	{
		vc = [[OptionsViewController alloc]
			  initWithNibName:strViewToShow bundle:nil];
		[vc setBSoundMode:[self bSoundMode]];
	}else if ([strViewToShow isEqualToString:@"OnlineScoreBoardView"])
	{
		vc = [[OnlineScoreBoardViewController alloc]
			  initWithNibName:strViewToShow bundle:nil];
	}
	
	[vc setPreviousVC:self];
	[self.view.superview addSubview:vc.view];
	[self.view setHidden:TRUE];
}
/*
- (void)StartNewGame{
		
	if (self.GameViewController == nil)
	{
		NSLog(@"Preparing to initialize the Level 01 View Controller");
		Level01ViewController *gameviewcontroller =
		[[Level01ViewController alloc]
		 initWithNibName:@"Level01View" bundle:nil];
		
		
		self.GameViewController = gameviewcontroller;
		[gameviewcontroller release];
		
		
		
		NSLog(@"Level 01 View Controller created.");
	}
	else
	{
		NSLog(@"We should not enter this code area.");
	}
	
	[UIView beginAnimations:@"View Flip" context:nil];
	[UIView setAnimationDelay: 2];
	[UIView setAnimationDuration:1.25];
	
	[UIView setAnimationCurve: UIViewAnimationCurveEaseIn];
	[self.GameViewController viewWillAppear:YES];
	[self viewWillDisappear:YES];
	[UIView setAnimationTransition:
	 UIViewAnimationTransitionFlipFromRight
						   forView:self.view cache: YES];
	
	UIWindow *currWnd = self.view.window;
	//[self.view removeFromSuperview];
	[self.view setHidden:TRUE];
	
	NSLog(@"Removed current view from SuperView");
	[currWnd addSubview:self.GameViewController.view];
	//[self.view insertSubview:self.mmViewController.view atIndex:0];
	
	[self viewDidDisappear: YES];
	[self.GameViewController viewDidAppear: YES];
	[UIView commitAnimations];
	
	NSLog(@"Inserted the Level 01  View");
}
*/
//Process the Game Difficulty Alert View Response
- (void)alertView:(UIAlertView *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
	[self PlayButtonClickSound];
	NSLog(@"AlertView Reponse: %d", buttonIndex);
	[self StartNewGame2:buttonIndex];
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

/*
- (IBAction)yellowButtonPressed:(id)sender
{
	UIAlertView *alert = [[UIAlertView alloc]
						  initWithTitle:@"Yellow View Button Pressed"
						  message:@"You pressed the button on the yellow view"
						  delegate:nil
						  cancelButtonTitle:@"Yep, I did."
						  otherButtonTitles:nil];
	
	[alert show];s
	[alert release];
	
}
 */


- (void)dealloc {
    [super dealloc];
}


@end
