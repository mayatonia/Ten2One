//
//  Level10ViewController.m
//  Ten1
//
//  Created by Oswald on 9/20/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "Level10ViewController.h"
#import "GameBase.h"
#import "PlayerBase.h"
#import "LevelBase.h"

@implementation Level10ViewController

-(IBAction)btnFinishGamePressed:(id)sender{
	/*
	UIAlertView *alert = [[UIAlertView alloc]
						  initWithTitle:@"YOU WON!"
						  message:@"You reached the final level."
						  delegate:nil
						  cancelButtonTitle:@"Start Over"
						  otherButtonTitles:@"Main Menu"];
	[alert show];
	[alert release];
	 */
	PlayerBase *playerbase = GameBaseEngine._PlayerBase;
	NSString * soundfile = [NSString stringWithString:@"/GameCompleted.wav"];
	[GameBaseEngine PlaySoundFile:soundfile :playerbase.C_LIVES];
	
	[GameBaseEngine PauseGame];
	
	PlayerScore *playerscore = [PlayerScore alloc];
	LevelBase *levelbase = GameBaseEngine._LevelBase;
	[playerscore setN_DIFFICULTY:levelbase.C_DIFFICULTY];
	[playerscore setN_LIVESREMAINING:playerbase.C_LIVES];
	[playerscore setN_POINTS:playerbase.C_POINTS];
	[playerscore setN_SECONDS_REMAINING:GameBaseEngine.C_TIMEREMAINING];
	NSInteger nFinalScore = (playerscore.N_DIFFICULTY+1) * ((playerscore.N_LIVESREMAINING * 10) + playerscore.N_POINTS + playerscore.N_SECONDS_REMAINING);
	NSLog(@"FINAL SCORE: %d", nFinalScore);
	
	[playerscore setN_SCORE:nFinalScore];
	
	UIWindow *currWindow = self.view.window;
	[self.view removeFromSuperview];
	FinishViewController *vc = [[FinishViewController alloc]
								initWithNibName:@"FinishView"
								bundle:nil];

	[vc set_PlayerScore:playerscore];
	[vc setGameBaseEngine:[self GameBaseEngine]];
//	[GameBaseEngine._AVPlayer stop];

	[currWindow addSubview:vc.view];
}

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

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/
- (void)InitializeLevel:(id)sender{
	[self setNMaxSwitches:0];
	[self setNMaxCones:0];	
}
/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
