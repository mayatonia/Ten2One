//
//  GameBase.m
//  Ten1
//
//  Created by Oswald on 7/22/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "GameBase.h"
#import "PlayerBase.h"
#import "PlayerAction.h"
#import "LevelBase.h"
#import "CustomParameter.h"

#import "LevelTemplateViewController.h"
#import "Level01ViewController.h"
#import "Level01aViewController.h"
#import "Level02ViewController.h"
#import "Level03ViewController.h"
#import "Level04ViewController.h"
#import "Level05ViewController.h"
#import "Level06ViewController.h"
#import "Level07ViewController.h"
#import "Level08ViewController.h"
#import "Level09ViewController.h"
#import "Level10ViewController.h"


@implementation GameBase

@synthesize C_ARR_PLAYERS;
@synthesize C_ARR_GAMEELEMENTS;
@synthesize C_ARR_VIEWS;
@synthesize C_GAME_TIMER;
@synthesize C_CURRENTINTERVAL;
@synthesize C_TIMEREMAINING;
@synthesize C_GAME_DIFFICULTY;
@synthesize C_UPDATE_LEVEL;
@synthesize C_UPDATE_LIVES;
@synthesize C_UPDATE_POINTS;
@synthesize C_UPDATE_DIFFICULTY;
@synthesize C_RUNNING;
@synthesize C_RESTART_GAME;
@synthesize C_ARR_PLAYERACTIONS;
@synthesize C_ANIMATION_RUNNING;
@synthesize C_SOUND_MODE;
@synthesize _Instance;
@synthesize _LevelBase;
@synthesize _PlayerBase;
@synthesize _AVPlayer;
@synthesize Level01VC;
@synthesize Level01aVC;
@synthesize Level02VC;
@synthesize Level03VC;
@synthesize Level04VC;
@synthesize Level05VC;
@synthesize Level06VC;
@synthesize Level07VC;
@synthesize Level08VC;
@synthesize Level09VC;
@synthesize Level10VC;

@synthesize _ParentViewController;


- (void)initWithGameName:(NSString *)strName{

	//self.GAMENAME = strName;
}

- (void) StartGame:(UIView *) view: (UIViewController *)viewcontroller: (NSInteger )challengeid{
	//Take the current view and show the first level of the game
	
	if (C_SOUND_MODE)
	{
	    //Start Playing Sound Loop
		
		 NSString *soundFilePath = [[NSBundle mainBundle] pathForResource: @"GameSoundLoop"
		 ofType: @"wav"];
		 NSURL *fileURL = [[NSURL alloc] initFileURLWithPath: soundFilePath];
		 AVAudioPlayer *newPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL: fileURL error: nil];
		 [fileURL release];
		 [self set_AVPlayer: newPlayer];
		 [newPlayer release];
		 
		 [_AVPlayer setNumberOfLoops:-1]; // Loop indefinately
		 [_AVPlayer setCurrentTime: 1000]; // start at beginning
		 [_AVPlayer setVolume:0.1];
		 [_AVPlayer play];
		 
	}
	//Keep a reference to the parent view controller.
	[self set_ParentViewController:viewcontroller];
	
	//Initialize the game layout.
	[self InitializeFirstLevelOfChallenge:view :viewcontroller :challengeid];
	
	[self setC_RUNNING:TRUE];
	[self setC_RESTART_GAME:FALSE];
	if ([self C_GAME_TIMER] == nil)
	{
		NSTimer * myTimer = [NSTimer scheduledTimerWithTimeInterval:0.01
									 target:self 
								   selector:@selector(OnGameTimerTicked) 
								   userInfo:nil 
									repeats:YES];
		[self setC_GAME_TIMER:myTimer];
	}
	//[myTimer release];
}

- (void)InitializeFirstLevelOfChallenge:(UIView *) view: (UIViewController *)viewcontroller: (NSInteger) challengeid{
	switch (challengeid) {
		case 0:
		{
			NSLog(@"Initalizing the first level of challenged %d", challengeid);
			[self LoadChallenge0:view :viewcontroller];
			
		}
			break;
		default:
			break;
	}
	
	
}
- (void)ResetPlayerSettings{
	[_PlayerBase setC_LIVES:10];
	[_PlayerBase setC_POINTS:0];
	
	//Cleanup
	if (!C_ARR_PLAYERACTIONS)
	{
		[C_ARR_PLAYERACTIONS release];
		[self setC_ARR_PLAYERS:nil];
	}
	
	//Assign the arraylist
	NSMutableArray *myPlayerActions = [NSMutableArray new];
	[self setC_ARR_PLAYERACTIONS:myPlayerActions];
	
}
- (void)AddRecordPlayerAction:(NSInteger)nActionType:(UIButton*)btnTarget:(NSString*)strButtonType:(LevelTemplateViewController*)VC:(NSInteger)nLevelID{
	
	PlayerAction *action = [PlayerAction new];
	[action set_ActionType:nActionType];
	[action set_ParentViewController:VC];
	[action set_TargetButton:btnTarget];
	[action set_TargetButtonType:strButtonType];
	[action set_LevelID:nLevelID];
	
	[action set_PlayerID:_PlayerBase.C_LIVES];
	[action set_TargetButtonType:strButtonType];
	[action set_Timestampt:C_CURRENTINTERVAL];
	
	[C_ARR_PLAYERACTIONS addObject:action];
	
	//SORT THE LIST BY TIMESTAMPT VALUE
	NSSortDescriptor *mySorter = [[NSSortDescriptor alloc] initWithKey:@"_Timestampt" ascending:TRUE];
	[C_ARR_PLAYERACTIONS sortUsingDescriptors:[NSArray arrayWithObject:mySorter]];
}

- (void)ReplayPreviousPlayerActions{

	NSInteger nActionLookupThreshold = 0;
	
	if ([C_ARR_PLAYERACTIONS count] > 0)
	{
		nActionLookupThreshold = [C_ARR_PLAYERACTIONS count];

		for (int i = 0; i < nActionLookupThreshold; i++) {
			PlayerAction *action;
			action = [C_ARR_PLAYERACTIONS objectAtIndex:i];
		
			if (action._Timestampt < C_CURRENTINTERVAL)
			{
				if (action._PlayerID != _PlayerBase.C_LIVES) //Ignore current player moves, we do not reply them..
				{
					BOOL isReplayable = (action._LastPlayerIDPlayedFor != _PlayerBase.C_LIVES);
					if (isReplayable)//Ignore actions already replayed...
					{
						if (!(C_ANIMATION_RUNNING))
						{
							[self setC_ANIMATION_RUNNING:TRUE];
							NSLog(@"ANIMATION RUNNING MODE = ON");
						}
						[action set_LastPlayerIDPlayedFor:_PlayerBase.C_LIVES];
						
						///This is where animation would be executed
						if (action._LevelID == _LevelBase.C_LEVELID)
						{
							UIButton *playerbutton;
							UIImageView *playeranimationimage;
							
							LevelTemplateViewController *VC = action._ParentViewController;
							playeranimationimage = VC.imgPlayerAnimation01;
							switch (action._PlayerID) {
								case 10:
									playerbutton = VC.btnPlayer01;

									break;
								case 9:
									playerbutton = VC.btnPlayer02;
									break;
								case 8:
									playerbutton = VC.btnPlayer03;
									break;
								case 7:
									playerbutton = VC.btnPlayer04;
									break;
								case 6:
									playerbutton = VC.btnPlayer05;
									break;
								case 5:
									playerbutton = VC.btnPlayer06;
									break;
								case 4:
									playerbutton = VC.btnPlayer07;
									break;
								case 3:
									playerbutton = VC.btnPlayer08;
									break;
								case 2:
									playerbutton = VC.btnPlayer09;
									break;
								default:
									playerbutton = nil;
									break;
							}
							
							if (playerbutton != nil)
							{
								if (playerbutton.hidden || playerbutton.alpha == 0.0)
								{
									[playerbutton setHidden:FALSE];
									[playerbutton setAlpha:1.0];
									
								}

							
								CGPoint dstPoint = [action._TargetButton center];
								
								//Animate the click
								CGFloat _multiFactor = 5.0;
								[playeranimationimage setCenter:dstPoint];
								CGRect curSize = playeranimationimage.bounds;
								
								CGFloat image_x = dstPoint.x - ((16.0 * _multiFactor)/2);
								CGFloat image_y = dstPoint.y - ((16.0 * _multiFactor)/2);;
								CGFloat image_width = 16.0 * _multiFactor;
								CGFloat image_height = 16.0 * _multiFactor;
								
								CGRect rectNewSize = CGRectMake(image_x, image_y, image_width, image_height);
								
								[playeranimationimage setHidden:FALSE];
								[playeranimationimage setAlpha:1.0];
								[UIView beginAnimations:nil context:NULL];
								[UIView setAnimationDuration:0.6];
								[UIView setAnimationCurve:(UIViewAnimationCurveLinear)];
								
								
								[playeranimationimage setFrame:rectNewSize];
								[playeranimationimage setAlpha:0.0];
								
								[UIView commitAnimations];
								//[playeranimationimage setFrame:curSize];
								//[playeranimationimage setHidden:TRUE];
								
								//Move the player icon
								[UIView beginAnimations:nil context:NULL];
								[UIView setAnimationDuration:0.3];
								[UIView setAnimationCurve:(UIViewAnimationCurveLinear)];
								
								[playerbutton setCenter:dstPoint];
								
								[UIView commitAnimations];
													
								
								if (action._TargetButton == VC.btnLevelUp ||
									action._TargetButton == VC.btnLevelDown)
								{
									[UIView beginAnimations:nil context:NULL];
									[UIView setAnimationDuration:0.1];
									[UIView setAnimationCurve:(UIViewAnimationCurveLinear)];
									
									[playerbutton setAlpha:0.0];
									
									[UIView commitAnimations];
									//[playerbutton setHidden:TRUE];
								}
							}
						}
						UIButton *targetbutton = action._TargetButton;
						if (!(targetbutton.hidden) || !(targetbutton.enabled))
						{
							CustomParameter *par = [CustomParameter alloc];
							[par setSender:action._TargetButton];
							[par setParameter:action];
							
							if ([KTYPE_BOX isEqualToString:action._TargetButtonType])
							{
								[action._ParentViewController btnBoxPressed:par];
								NSLog(@"Replayed Action ID: %d for %@ on Level %d - Player %d", action._ActionID, action._TargetButtonType, action._LevelID, action._PlayerID);
							}
							else if ([KTYPE_CONE isEqualToString:action._TargetButtonType])
							{
								[action._ParentViewController btnConePressed:par];
								NSLog(@"Replayed Action ID: %d for %@ on Level %d - Player %d", action._ActionID, action._TargetButtonType, action._LevelID, action._PlayerID);
							}				
							else if ([KTYPE_COIN isEqualToString:action._TargetButtonType])
							{
								[action._ParentViewController btnCoinPressed:par];
								NSLog(@"Replayed Action ID: %d for %@ on Level %d - Player %d", action._ActionID, action._TargetButtonType, action._LevelID, action._PlayerID);
							}
							else if ([KTYPE_COINBOX isEqualToString:action._TargetButtonType])
							{
								[action._ParentViewController btnCoinBoxPressed:par];
								NSLog(@"Replayed Action ID: %d for %@ on Level %d - Player %d", action._ActionID, action._TargetButtonType, action._LevelID, action._PlayerID);
							}
							else if ([KTYPE_GENERALBOX isEqualToString:action._TargetButtonType])
							{
								[action._ParentViewController btnBoxPressed:par];
								NSLog(@"Replayed Action ID: %d for %@ on Level %d - Player %d", action._ActionID, action._TargetButtonType, action._LevelID, action._PlayerID);
							}
							else if ([KTYPE_GENERALCOIN isEqualToString:action._TargetButtonType])
							{
								[action._ParentViewController btnCoinPressed:par];
								NSLog(@"Replayed Action ID: %d for %@ on Level %d - Player %d", action._ActionID, action._TargetButtonType, action._LevelID, action._PlayerID);
							}
							else if ([KTYPE_SWITCH isEqualToString:action._TargetButtonType])
							{
								[action._ParentViewController btnSwitchPressed:par];
								NSLog(@"Replayed Action ID: %d for %@ on Level %d - Player %d", action._ActionID, action._TargetButtonType, action._LevelID, action._PlayerID);
							}
							else if ([KTYPE_LEVELUPBOX isEqualToString:action._TargetButtonType])
							{
								[action._ParentViewController btnLevelUpBoxPressed:par];
								NSLog(@"Replayed Action ID: %d for %@ on Level %d - Player %d", action._ActionID, action._TargetButtonType, action._LevelID, action._PlayerID);
							}
							else if ([KTYPE_LEVELUP isEqualToString:action._TargetButtonType])
							{
								//DO NOTHING as to never replay this action
							}
							else if ([KTYPE_LEVELDOWN isEqualToString:action._TargetButtonType])
							{
								//DO NOTHING as to never replay this action
							}
							else if ([KTYPE_SWITCH_HOLDUP isEqualToString:action._TargetButtonType])
							{
								[action._ParentViewController btnSwitchHoldUpPressed:par];
								NSLog(@"Replayed Action ID: %d for %@ on Level %d - Player %d", action._ActionID, action._TargetButtonType, action._LevelID, action._PlayerID);
							}
							else if ([KTYPE_SWITCH_HOLDDOWN isEqualToString:action._TargetButtonType])
							{
								[action._ParentViewController btnSwitchHoldDownPressed:par];
								NSLog(@"Replayed Action ID: %d for %@ on Level %d - Player %d", action._ActionID, action._TargetButtonType, action._LevelID, action._PlayerID);
							}
							
						}
						
					}
				}
			}
			else //We've reached the limits of clicks to replay this iteration
			{
				i = nActionLookupThreshold;
			}
		}

	}
	if (C_ANIMATION_RUNNING)
	{
		[self setC_ANIMATION_RUNNING:FALSE];
		NSLog(@"ANIMATION RUNNING MODE = OFF");	
	}
}

- (void)ResetLevelSettings{
	//[_LevelBase setC_DIFFICULTY:0];
}

- (void)LoadChallenge0:(UIView *)view: (UIViewController *)viewcontroller{
	Level01ViewController * level1 = 
	[[Level01ViewController alloc]  
		initWithNibName:@"Level01View" bundle:nil];
	[level1 setGameBaseEngine:self];
	//NSLog(@"Allocated Level 01 Object");
	//[level1 setGameBaseEngine:self];
	//NSLog(@"Assigned GamebaseEngine to Level 01.");
	//[level1 initWithNibName:@"Level01View" bundle:nil];
	//NSLog(@"Initialized Level01 with Nib");
	//[self.Level01VC setGameBaseEngine:self];
//initWithNibName: @"Level01View" bundle:nil];
	[level1 setNLevelID:1];
	self.Level01VC = level1;
	[level1 release];
	
	[self InitializeTimeVars];
	
	if (_PlayerBase == nil)
	{
		_PlayerBase = [PlayerBase alloc];
		[self ResetPlayerSettings];
	}
		
	if (_LevelBase == nil)
	{
		_LevelBase = [LevelBase alloc];
		[_LevelBase setC_VIEWCONTROLLER:Level01VC];
		[_LevelBase setC_VIEW:Level01VC.view];
		[_LevelBase setC_LEVELID:01];
		[_LevelBase setC_DIFFICULTY:self.C_GAME_DIFFICULTY];
		[self ResetLevelSettings];
	}
	
	[self setC_UPDATE_LEVEL:TRUE];
	
	NSLog(@"Created Challenge 0 - Level 01 View Controller");
	
	
	[UIView beginAnimations:@"View Flip" context:nil];
	[UIView setAnimationDelay: 2];
	[UIView setAnimationDuration:1.25];
	
	[UIView setAnimationCurve: UIViewAnimationCurveEaseIn];
	[self.Level01VC viewWillAppear:YES];
	[viewcontroller viewWillDisappear:YES];
	[UIView setAnimationTransition:
	 UIViewAnimationTransitionFlipFromRight
						   forView:view cache: YES];
	
	UIWindow *currWnd = view.window;
	[view removeFromSuperview];
	
	NSLog(@"Removed current view from SuperView");
	[currWnd addSubview:level1.view];
	//[self.view insertSubview:self.mmViewController.view atIndex:0];
	
	[viewcontroller viewDidDisappear: YES];
	[self.Level01VC viewDidAppear: YES];
	[UIView commitAnimations];
	
	NSLog(@"Inserted the Level 01  View");
}

- (void)ResetLevels{
	if (Level01VC != nil)
	{
		[Level01VC InitializeLevelComponentsGeneral:self];
		if (C_RESTART_GAME == TRUE)
		{
			NSLog(@"Randomizer - set bRandomizerInitialized to FALSE for Level 01");
			[Level01VC setBRandomizerInitialized:FALSE];
			[Level01VC InitializeRandomizer:self];
		}
	}
	
	if (Level01aVC != nil)
	{
		[Level01aVC InitializeLevelComponentsGeneral:self];
		if (C_RESTART_GAME == TRUE)
		{
			NSLog(@"Randomizer - set bRandomizerInitialized to FALSE for Level 01a");
			[Level01aVC setBRandomizerInitialized:FALSE];
			[Level01aVC InitializeRandomizer:self];
		}
	}
	
	if (Level02VC != nil)
	{
		[Level02VC InitializeLevelComponentsGeneral:self];
		
		if (C_RESTART_GAME == TRUE)
		{
			[Level02VC setBRandomizerInitialized:FALSE];
			[Level02VC InitializeRandomizer:self];
		}
	}
	if (Level03VC != nil)
	{
		[Level03VC InitializeLevelComponentsGeneral:self];
		if (C_RESTART_GAME == TRUE)
		{
			[Level03VC setBRandomizerInitialized:FALSE];
			[Level03VC InitializeRandomizer:self];
		}
	}
	if (Level04VC != nil)
	{
		[Level04VC InitializeLevelComponentsGeneral:self];
		if (C_RESTART_GAME == TRUE)
		{
			[Level04VC setBRandomizerInitialized:FALSE];
			[Level04VC InitializeRandomizer:self];
		}
	}	
	if (Level05VC != nil)
	{
		[Level05VC InitializeLevelComponentsGeneral:self];
		if (C_RESTART_GAME == TRUE)
		{
			[Level05VC setBRandomizerInitialized:FALSE];
			[Level05VC InitializeRandomizer:self];
		}
	}	
	if (Level06VC != nil)
	{
		[Level06VC InitializeLevelComponentsGeneral:self];
		if (C_RESTART_GAME == TRUE)
		{
			[Level06VC setBRandomizerInitialized:FALSE];
			[Level06VC InitializeRandomizer:self];
		}
	}	
	if (Level07VC != nil)
	{
		[Level07VC InitializeLevelComponentsGeneral:self];
		if (C_RESTART_GAME == TRUE)
		{
			[Level07VC setBRandomizerInitialized:FALSE];
			[Level07VC InitializeRandomizer:self];
		}
	}	
	if (Level08VC != nil)
	{
		[Level08VC InitializeLevelComponentsGeneral:self];
		if (C_RESTART_GAME == TRUE)
		{
			[Level08VC setBRandomizerInitialized:FALSE];
			[Level08VC InitializeRandomizer:self];
		}
	}	
	if (Level09VC != nil)
	{
		[Level09VC InitializeLevelComponentsGeneral:self];
		if (C_RESTART_GAME == TRUE)
		{
			[Level09VC setBRandomizerInitialized:FALSE];
			[Level09VC InitializeRandomizer:self];
		}
	}	
	if (Level10VC != nil)
	{
		[Level10VC InitializeLevelComponentsGeneral:self];
		if (C_RESTART_GAME == TRUE)
		{
			[Level10VC setBRandomizerInitialized:FALSE];
			[Level10VC InitializeRandomizer:self];
		}
	}	
}

//Method that should be called by active game elements
- (void)PlaySoundFile:(NSString *)strFileName:(NSInteger)nPlayerID{
	
	if (C_SOUND_MODE)
	{
		if (nPlayerID == _PlayerBase.C_LIVES)
		{
			//Get the filename of the sound file:
			NSString *path = [NSString stringWithFormat:@"%@%@",
							  [[NSBundle mainBundle] resourcePath],
							  strFileName];
			
			
			//declare a system sound id
			SystemSoundID soundID;
			
			//Get a URL for the sound file
			NSURL *filePath = [NSURL fileURLWithPath:path isDirectory:NO];
			
			//Use audio sevices to create the sound
			AudioServicesCreateSystemSoundID((CFURLRef)filePath, &soundID);
			
			//Use audio services to play the sound
			AudioServicesPlaySystemSound(soundID);
		}
	}
}

//Method that should be called for non-game elements
- (void)PlaySoundFile:(NSString *)strFileName{
	
	if (C_SOUND_MODE)
	{
		//Get the filename of the sound file:
		NSString *path = [NSString stringWithFormat:@"%@%@",
						  [[NSBundle mainBundle] resourcePath],
						  strFileName];
		
		
		//declare a system sound id
		SystemSoundID soundID;
		
		//Get a URL for the sound file
		NSURL *filePath = [NSURL fileURLWithPath:path isDirectory:NO];
		
		//Use audio sevices to create the sound
		AudioServicesCreateSystemSoundID((CFURLRef)filePath, &soundID);
		
		//Use audio services to play the sound
		AudioServicesPlaySystemSound(soundID);
	}
}

- (void)InitializeTimeVars{
	self.C_CURRENTINTERVAL = 0;
	self.C_TIMEREMAINING = kFinalInterval;
	if (C_GAME_DIFFICULTY == 2)
	{
		self.C_TIMEREMAINING = C_TIMEREMAINING/2;
	}
}

- (void)OnGameTimerTicked{
	if (C_RUNNING)
	{
		C_CURRENTINTERVAL++;
		if ((C_CURRENTINTERVAL % 10) == 0)
		{
			if (!(C_ANIMATION_RUNNING))
			{
				[self ReplayPreviousPlayerActions];
			}
			
		   //NSLog(@"Timer ticked for interval %d", C_CURRENTINTERVAL );
			LevelTemplateViewController *vc = _LevelBase.C_VIEWCONTROLLER;
			//UPDATE TIME REMAINING
			C_TIMEREMAINING--;
			
			if (C_TIMEREMAINING/10.0 < 0.2)
			{
				[self setC_TIMEREMAINING:0];
			}
			if (C_TIMEREMAINING/10.0 <= 5.0)
			{
				if (C_TIMEREMAINING/10.0 < 0.4)
				{
					[vc.lblTime setTextColor:[UIColor redColor]];
				}
				else if (C_TIMEREMAINING/10.0 < 0.8)
				{
					[vc.lblTime setTextColor:[UIColor whiteColor]];
				}
				else if (C_TIMEREMAINING/10.0 < 1.2)
				{
					[vc.lblTime setTextColor:[UIColor redColor]];
				}
				else if (C_TIMEREMAINING/10.0 < 1.6)
				{
					[vc.lblTime setTextColor:[UIColor whiteColor]];
				}
				else if (C_TIMEREMAINING/10.0 < 2.0)
				{
					[vc.lblTime setTextColor:[UIColor redColor]];
				}
				else if (C_TIMEREMAINING/10.0 < 2.4)
				{
					[vc.lblTime setTextColor:[UIColor whiteColor]];
				}
				else if (C_TIMEREMAINING/10.0 < 2.8)
				{
					[vc.lblTime setTextColor:[UIColor redColor]];
				}
				else if (C_TIMEREMAINING/10.0 < 3.2)
				{
					[vc.lblTime setTextColor:[UIColor whiteColor]];
				}
				else if (C_TIMEREMAINING/10.0 < 3.8)
				{
					[vc.lblTime setTextColor:[UIColor redColor]];
				}
				else if (C_TIMEREMAINING/10.0 < 4.2)
				{
					[vc.lblTime setTextColor:[UIColor whiteColor]];
				}
				else if (C_TIMEREMAINING/10.0 < 4.6)
				{
					[vc.lblTime setTextColor:[UIColor redColor]];
				}
				else if (C_TIMEREMAINING/10.0 == 5.0)
				{
					[vc.lblTime setTextColor:[UIColor yellowColor]];
				}
			}
			else
			{
				[vc.lblTime setTextColor:[UIColor whiteColor]];
			}
			
			
			NSString *timereminaing = [NSString stringWithFormat:@"Time: %1.2f", (C_TIMEREMAINING/10.0)];
			[vc.lblTime setText:timereminaing];
			
			if (C_UPDATE_LIVES)
			{
				NSString *livesremaining = [NSString stringWithFormat:@"Lives: %d", _PlayerBase.C_LIVES];
				[vc.lblLives setText:livesremaining];
				[self setC_UPDATE_LIVES:FALSE];
			}
			if (C_UPDATE_POINTS)
			{
				NSString *points = [NSString stringWithFormat:@"Points: %d", _PlayerBase.C_POINTS];
				[vc.lblPoints setText:points];
				[self setC_UPDATE_POINTS:FALSE];
			}
			
			if (C_UPDATE_LEVEL)
			{
				NSString *level = [NSString stringWithFormat:@"Level: %d", _LevelBase.C_LEVELID];
				[vc.lblLevel setText:level];
				[self setC_UPDATE_LEVEL:FALSE];
			}
			
			if (C_UPDATE_DIFFICULTY)
			{
				NSString *difficulty;
				switch (_LevelBase.C_DIFFICULTY) {
					case 0:
						difficulty = [NSString stringWithString:@"Mode: EASY"];
						break;
					case 1:
						difficulty = [NSString stringWithString:@"Mode: HARD"];
						break;
					case 2:
						difficulty = [NSString stringWithString:@"Mode: HELL"];
						break;
					default:
						difficulty = [NSString stringWithString:@"Mode: WTF"];
						break;
				}
				
				[vc.lblDifficulty setText:difficulty];
				[self setC_UPDATE_DIFFICULTY:FALSE];
			}
			
			///Handle special press down switch.
			if (_LevelBase.C_LEVELID == 2)
			{
				if (Level01aVC != nil && Level01aVC.btnLevelUp.hidden == _PlayerBase.C_LEVEL01a_SWITCH_ON)
				{
					[Level01aVC.btnLevelUp setHidden:!_PlayerBase.C_LEVEL01a_SWITCH_ON];	
				}	
			}
			else if (_LevelBase.C_LEVELID == 11  )
			{
				if (Level10VC != nil && Level10VC.btnFinishGame.hidden)
				{
					[Level10VC.btnFinishGame setHidden:!_PlayerBase.C_LEVEL03_SWITCH_ON];
				}
			}
			
			//TIME IS OUT, RESET THE CLOCK AND REDUCE PLAYER LIVES
			if (C_TIMEREMAINING == 0)
			{
				if (_PlayerBase.C_LIVES > 1)
				{
					NSString * soundfile = [NSString stringWithString:@"/TimeUpNotice.wav"];
					[self PlaySoundFile:soundfile :_PlayerBase.C_LIVES];
					
					[_PlayerBase setC_LIVES:_PlayerBase.C_LIVES - 1];
					[self setC_UPDATE_LIVES:TRUE];
					[self ResetLevels];	
					
					//Restart the game with player's remaining lives
					
					if (_LevelBase.C_LEVELID > 1)
					{
						[self switchViews:vc :_LevelBase.C_LEVELID :1];
					}
					
					[self InitializeTimeVars];
				}
				else //GAME OVER
				{
					[self setC_RUNNING:FALSE];
					NSString * soundfile = [NSString stringWithString:@"/GameOver.wav"];
					[self PlaySoundFile:soundfile :_PlayerBase.C_LIVES];
					
					UIAlertView *alert = [[UIAlertView alloc] init];
					[alert setTitle:@"GAME OVER!"];
					[alert setDelegate:self];
					[alert setNeedsLayout];
					[alert addButtonWithTitle:@"Play Again"];
					[alert addButtonWithTitle:@"Main Menu"];
					
					[alert show];
					[alert release];
					
					
				}
			}
		}
	}
}

//Process the Game Over Alert View Response
- (void)alertView:(UIAlertView *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
	if (buttonIndex == 0)
	{
		[self setC_RESTART_GAME:TRUE];
	}
	else
	{
		[self setC_RESTART_GAME:FALSE];
	}
	
	if (C_RESTART_GAME)
	{
		[self RestartGame];
	}
	else
	{
		[self EndGame];
	}
}
- (void)PauseGame
{
	[self setC_RUNNING:FALSE];	
}

- (void)ResumeGame
{
	[self setC_RUNNING:TRUE];
}

- (void)EndGame
{
	[self PauseGame];
	//RETURN TO MAIN MENU.
	UIWindow *currWindow = _LevelBase.C_VIEW.window;
	[_LevelBase.C_VIEW removeFromSuperview];
	[currWindow addSubview:_ParentViewController.view];
	[self StopMusic];
	[_AVPlayer release];
	_AVPlayer = nil;
	//[_AVPlayer release];
	[_LevelBase release];
	_LevelBase = nil;
	[_PlayerBase release];
	_PlayerBase = nil;
	
	[C_ARR_PLAYERACTIONS removeAllObjects];
	[Level01VC release];
	[Level01aVC release];
	[Level02VC release];
	[Level03VC release];
	[Level04VC release];
	[Level05VC release];
	[Level06VC release];
	[Level07VC release];
	[Level08VC release];
	[Level09VC release];
	[Level10VC release];
	Level01VC = nil;
	Level01aVC = nil;
	Level02VC = nil;
	Level03VC = nil;
	Level04VC = nil;
	Level05VC = nil;
	Level06VC = nil;
	Level07VC = nil;
	Level08VC = nil;
	Level09VC = nil;
	Level10VC = nil;
	
	[self.C_GAME_TIMER release];
	self.C_GAME_TIMER = nil;
}

- (void)StopMusic
{
	if (_AVPlayer != nil)
	{
		if ([_AVPlayer isPlaying])
			[_AVPlayer stop];	
	}
}
	

- (void)RestartGame{
	[self ResetLevels];
	
	if (_LevelBase.C_LEVELID > 1)
	{
		[self switchViews:_LevelBase.C_VIEWCONTROLLER :_LevelBase.C_LEVELID :1];
	}
	[self InitializeTimeVars];
	[self ResetPlayerSettings];
	[self ResetLevelSettings];
	
	[self setC_UPDATE_LEVEL:TRUE];
	[self setC_UPDATE_LIVES:TRUE];
	[self setC_UPDATE_POINTS:TRUE];
	[self setC_UPDATE_DIFFICULTY:TRUE];
	
	[self setC_RUNNING:TRUE];
	[self setC_RESTART_GAME:FALSE];
}

- (void)SetGameDifficulty:(NSInteger)nDifficultySetting{
	[self setC_GAME_DIFFICULTY:nDifficultySetting];
	[self setC_UPDATE_DIFFICULTY:TRUE];
}

- (void)switchViews:(UIViewController *)viewcontroller:(NSInteger)levelIdFrom:(NSInteger)LevelIdTo
{
	
	LevelTemplateViewController *coming = nil;
	LevelTemplateViewController *going = nil;
	UIViewAnimationTransition transition;
	
	//Assign the appropriate view that is coming into view
	switch (LevelIdTo) {
		case 1:
			coming = self.Level01VC;
			break;
		case 2:
			if (self.Level01aVC == nil)
			{
				NSLog(@"Initializing Level 01a View");
				Level02ViewController *vc = 
				[[Level02ViewController alloc] 
				 initWithNibName:@"Level01aView"
				 bundle:nil];
				[vc setGameBaseEngine:self];
				
				self.Level01aVC = vc;
				[vc release];
			}
			
			coming = self.Level01aVC;
			
			break;
		case 3:
			if (self.Level02VC == nil)
			{
				NSLog(@"Initializing Level 02 View");
				Level02ViewController *vc = 
				[[Level02ViewController alloc] 
				 initWithNibName:@"Level02View"
				 bundle:nil];
				[vc setGameBaseEngine:self];
				
				self.Level02VC = vc;
				[vc release];
			}

			coming = self.Level02VC;

			break;
		case 4:
			if (self.Level03VC == nil)
			{
				NSLog(@"Initializing Level 03 View");
				Level03ViewController *vc = 
				[[Level03ViewController alloc]
				 initWithNibName:@"Level03View"
				 bundle:nil];
				[vc setGameBaseEngine:self];
	
				self.Level03VC = vc;
				[vc release];
			}
			coming = self.Level03VC;
			break;
		case 5:
			if (self.Level04VC == nil)
			{
				NSLog(@"Inializing Level 04 View");
				Level04ViewController *vc = 
				[[Level04ViewController alloc]
				  initWithNibName:@"Level04View" 
				 bundle:nil];
				[vc setGameBaseEngine:self];
				
				self.Level04VC = vc;
				[vc release];
			}
			coming = self.Level04VC;
			break;
		case 6:
			if (self.Level05VC == nil)
			{
				NSLog(@"Inializing Level 05 View");
				Level05ViewController *vc = 
				[[Level05ViewController alloc]
				 initWithNibName:@"Level05View" 
				 bundle:nil];
				[vc setGameBaseEngine:self];
				
				self.Level05VC = vc;
				[vc release];
			}
			coming = self.Level05VC;
			break;
		case 7:
			if (self.Level06VC == nil)
			{
				NSLog(@"Inializing Level 06 View");
				Level06ViewController *vc = 
				[[Level06ViewController alloc]
				 initWithNibName:@"Level06View" 
				 bundle:nil];
				[vc setGameBaseEngine:self];
				
				self.Level06VC = vc;
				[vc release];
			}
			coming = self.Level06VC;
			break;
		case 8:
			if (self.Level07VC == nil)
			{
				NSLog(@"Inializing Level 07 View");
				Level07ViewController *vc = 
				[[Level07ViewController alloc]
				 initWithNibName:@"Level07View" 
				 bundle:nil];
				[vc setGameBaseEngine:self];
				
				self.Level07VC = vc;
				[vc release];
			}
			coming = self.Level07VC;
			break;
		case 9:
			if (self.Level08VC == nil)
			{
				NSLog(@"Inializing Level 08 View");
				Level08ViewController *vc = 
				[[Level08ViewController alloc]
				 initWithNibName:@"Level08View" 
				 bundle:nil];
				[vc setGameBaseEngine:self];
				
				self.Level08VC = vc;
				[vc release];
			}
			coming = self.Level08VC;
			break;
		case 10:
			if (self.Level09VC == nil)
			{
				NSLog(@"Inializing Level 09 View");
				Level09ViewController *vc = 
				[[Level09ViewController alloc]
				 initWithNibName:@"Level09View" 
				 bundle:nil];
				[vc setGameBaseEngine:self];
				
				self.Level09VC = vc;
				[vc release];
			}
			coming = self.Level09VC;
			break;
		case 11:
			if (self.Level10VC == nil)
			{
				NSLog(@"Inializing Level 10 View");
				Level10ViewController *vc = 
				[[Level10ViewController alloc]
				 initWithNibName:@"Level10View" 
				 bundle:nil];
				[vc setGameBaseEngine:self];
				
				self.Level10VC = vc;
				[vc release];
			}
			coming = self.Level10VC;
			break;
		default:
			break;
	}
	[coming setNLevelID:LevelIdTo];
	

	[_LevelBase setC_VIEWCONTROLLER:coming];
	[_LevelBase setC_VIEW:coming.view];
	[_LevelBase setC_LEVELID:LevelIdTo];

	
	//Assign the appropriate view that is leaving the current view
	switch (levelIdFrom) {
		case 1:
			going = self.Level01VC;
			break;
		case 2:
			going = self.Level01aVC;
			break;
		case 3:
			going = self.Level02VC;
			break;
		case 4:
			going = self.Level03VC;
			break;
		case 5:
			going = self.Level04VC;
			break;
		case 6:
			going = self.Level05VC;
			break;
		case 7:
			going = self.Level06VC;
			break;
		case 8:
			going = self.Level07VC;
			break;
		case 9:
			going = self.Level08VC;
			break;
		case 10:
			going = self.Level09VC;
			break;
		case 11:
			going = self.Level10VC;
			break;
		default:
			break;
	}
	
	[UIView beginAnimations:@"View Flip" context:nil];
	[UIView setAnimationDuration:1.25];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
	
	
	
	/*
	 if(blueViewController.view.superview == nil)
	 {
	 coming = blueViewController;
	 going = yellowViewController;
	 transition = UIViewAnimationTransitionFlipFromLeft;
	 }
	 else
	 {
	 coming = yellowViewController;
	 going = blueViewController;
	 transition = UIViewAnimationTransitionFlipFromRight;
	 }
	 
	 */
	
	if (levelIdFrom < LevelIdTo)
	{
		transition = UIViewAnimationTransitionFlipFromLeft;
	}
	else	
	{
		transition = UIViewAnimationTransitionFlipFromRight;
	}
	
	
	
	[UIView setAnimationTransition: transition forView:viewcontroller.view cache:YES];
	
	UIWindow *currWindow = going.view.window;
	
	[coming viewWillAppear:YES];
	[going viewWillDisappear:YES];
	[going.view removeFromSuperview];
	//[going.view setHidden:TRUE];
	
	//[viewcontroller.view insertSubview: coming.view atIndex:0];
	[currWindow insertSubview:coming.view atIndex:0];
	[going viewDidDisappear:YES];
	[coming viewDidAppear:YES];
	
	[UIView commitAnimations];
	
	//[coming.view setHidden:FALSE];
	[self setC_UPDATE_LEVEL:TRUE];
	[self setC_UPDATE_LIVES:TRUE];
	[self setC_UPDATE_DIFFICULTY:TRUE];
	[self setC_UPDATE_POINTS:TRUE];
}

- (void)AddPlayerPoints:(NSInteger)Points{
	[_PlayerBase setC_POINTS:_PlayerBase.C_POINTS + Points];
	[self setC_UPDATE_POINTS:TRUE];
}

@end
