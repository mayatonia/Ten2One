//
//  MainMenuViewController.h
//  Ten1
//
//  Created by Oswald on 7/14/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Level01ViewController;
@class CreditsViewController;
@class HowToPlayViewController;
@class OptionsViewController;
@class OnlineScoreBoardViewController;
@class GameBase;

@interface MainMenuViewController : UIViewController < UIAlertViewDelegate > {

	Level01ViewController *GameViewController;
	GameBase			  *GameBaseEngine;
	BOOL				  bSoundMode;
	
}
@property (nonatomic, retain) IBOutlet Level01ViewController	*GameViewController;
@property (nonatomic, retain) GameBase							*GameBaseEngine;
@property (nonatomic)		  BOOL								bSoundMode;

- (IBAction)NewGameButtonPressed:(id)sender;
- (IBAction)QuitGameButtonPressed:(id)sender;
- (IBAction)btnCreditsPressed:(id)sender;
- (IBAction)btnHowToPlayPressed:(id)sender;
- (IBAction)btnOnlineScoreBoardPressed:(id)sender;
- (IBAction)btnOptionsPressed:(id)sender;

- (IBAction)ButtonSelected:(id)sender;
- (IBAction)ButtonUnselected:(id)sender;

//- (void)StartNewGame;
- (void)StartNewGame2:(NSInteger)nDifficultySetting;
- (void)PlayButtonClickSound;


@end
