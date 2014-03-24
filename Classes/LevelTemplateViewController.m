//
//  LevelTemplateViewController.m
//  Ten1
//
//  Created by Oswald on 9/19/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "LevelTemplateViewController.h"
#import "GameBase.h"
#import "LevelBase.h"
#import "CustomParameter.h"
#import "PlayerAction.h"
#import "PlayerBase.h";

@implementation LevelTemplateViewController
NSString * const KTYPE_SWITCH	= @"btnSwitch";
NSString * const KTYPE_BOX		= @"btnBox";
NSString * const KTYPE_COIN		= @"btnCoin";
NSString * const KTYPE_COINBOX   = @"btnCoinBox";
NSString * const KTYPE_CONE		= @"btnCone";
NSString * const KTYPE_GENERALBOX= @"btnGeneralBox";
NSString * const KTYPE_GENERALCOIN=@"btnGeneralCoin";
NSString * const KTYPE_SWITCH_HOLDUP=@"btnSwitchHoldUp";
NSString * const KTYPE_SWITCH_HOLDDOWN=@"btnSwitchHoldDown";
NSString * const KTYPE_LEVELUPBOX=@"btnLevelUpBox";
NSString * const KTYPE_LEVELUP=@"btnLevelUp";
NSString * const KTYPE_LEVELDOWN=@"btnLevelDown"; 

@synthesize btnSwitch1;
@synthesize btnSwitch2;
@synthesize btnSwitch3;
@synthesize btnSwitch4;
@synthesize btnSwitch5;
@synthesize btnBox1;
@synthesize btnBox2;
@synthesize btnBox3;
@synthesize btnBox4;
@synthesize btnBox5;
@synthesize btnCoin1;
@synthesize btnCoin2;
@synthesize btnCoin3;
@synthesize btnCoin4;
@synthesize btnCoin5;
@synthesize btnCone1;
@synthesize btnCone2;
@synthesize btnCone3;
@synthesize btnCone4;
@synthesize btnCone5;
@synthesize nCone1TagBackup;
@synthesize nCone2TagBackup;
@synthesize nCone3TagBackup;
@synthesize nCone4TagBackup;
@synthesize nCone5TagBackup;
@synthesize btnCoinBox1;
@synthesize btnCoinBox2;
@synthesize btnCoinBox3;
@synthesize btnCoinBox4;
@synthesize btnCoinBox5;
@synthesize btnSwitchHold1;
@synthesize btnSwitchHold2;
@synthesize btnSwitchHold3;
@synthesize btnSwitchHold4;
@synthesize btnSwitchHold5;
@synthesize btnGeneralBox1;
@synthesize btnGeneralBox2;
@synthesize btnGeneralBox3;
@synthesize btnGeneralBox4;
@synthesize btnGeneralBox5;
@synthesize btnGeneralBox6;
@synthesize btnGeneralBox7;
@synthesize btnGeneralBox8;
@synthesize btnGeneralBox9;
@synthesize btnGeneralBox10;
@synthesize btnGeneralCoin1;
@synthesize btnGeneralCoin2;
@synthesize btnGeneralCoin3;
@synthesize btnGeneralCoin4;
@synthesize btnGeneralCoin5;
@synthesize btnGeneralCoin6;
@synthesize btnGeneralCoin7;
@synthesize btnGeneralCoin8;
@synthesize btnGeneralCoin9;
@synthesize btnGeneralCoin10;

@synthesize lblTime;
@synthesize lblLives;
@synthesize lblLevel;
@synthesize lblPoints;
@synthesize lblDifficulty;
@synthesize btnInfo;
@synthesize GameBaseEngine;

@synthesize btnLevelUp;
@synthesize btnLevelUpBox;
@synthesize btnLevelDown;
@synthesize btnFinishGame;
@synthesize nLevelID;
@synthesize nCountSwitchesDown;
@synthesize nMaxSwitches;
@synthesize nMaxCones;
@synthesize nCountCones;
@synthesize bLevelUpSoundPlayed;

@synthesize btnPlayer01;
@synthesize btnPlayer02;
@synthesize btnPlayer03;
@synthesize btnPlayer04;
@synthesize btnPlayer05;
@synthesize btnPlayer06;
@synthesize btnPlayer07;
@synthesize btnPlayer08;
@synthesize btnPlayer09;

@synthesize ptLoc1;
@synthesize ptLoc2;
@synthesize ptLoc3;
@synthesize ptLoc4;
@synthesize ptLoc5;
@synthesize bRandomizerInitialized;
@synthesize bSwitchHold1IsDown;

@synthesize imgPlayerAnimation01;

- (void)AddRecordPlayerAction:(NSInteger)nActionType:(UIButton*)btnTarget:(NSString*)strButtonType:(LevelTemplateViewController*)VC{
	
	[GameBaseEngine AddRecordPlayerAction:nActionType :btnTarget :strButtonType :VC :nLevelID];
}

- (IBAction)btnInfoPressed:(id)sender
{
	
	[self.GameBaseEngine PauseGame];
	
	UIAlertView *alert = [[UIAlertView alloc] init];
	[alert setTitle:@"GAME PAUSED"];
	[alert setDelegate:self];
	[alert setNeedsLayout];
	[alert addButtonWithTitle:@"Resume"];
	[alert addButtonWithTitle:@"Main Menu"];
	
	[alert show];
	[alert release];
}

//Process the Game Over Alert View Response
- (void)alertView:(UIAlertView *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
	

	if (buttonIndex == 0)
	{
		
		[self.GameBaseEngine ResumeGame];
	}
	else
	{
		[self.GameBaseEngine EndGame];
	}
	
}


-(IBAction)btnFinishGamePressed:(id)sender{
	
}

- (IBAction)btnBoxPressed:(id)sender{
	CustomParameter *par = sender;
	UIButton * button;
	
	if ([par isKindOfClass:[UIButton class]])
	{
		button = sender;
	}
	else
	{
		button = par.sender;
	}
	
	switch (button.tag) {
		case 1:
			[button setHidden:TRUE];
			[btnSwitch1 setHidden:FALSE];
			//[btnSwitch1 setTitle:@"CLICK" forState:UIControlStateNormal];

			break;
		case 2:
			[button setHidden:TRUE];
			[btnSwitch2 setHidden:FALSE];
			//[btnSwitch2 setTitle:@"CLICK" forState:UIControlStateNormal];
			break;
		case 3:
			[button setHidden:TRUE];
			[btnSwitch3 setHidden:FALSE];
			//[btnSwitch3 setTitle:@"CLICK" forState:UIControlStateNormal];
			break;
		case 4:
			[button setHidden:TRUE];
			[btnSwitch4 setHidden:FALSE];
			//[btnSwitch4 setTitle:@"CLICK ME" forState:UIControlStateNormal];
			break;
		case 5:
			[button setHidden:TRUE];
			[btnSwitch5 setHidden:FALSE];
			break;
		default:
			[button setHidden:TRUE];
			break;
	}
	
	//Only play sound for clicks on current level.
	LevelBase *levelbase;
	levelbase = GameBaseEngine._LevelBase;
	if (levelbase.C_LEVELID == nLevelID)
	{
		PlayerBase *playerbase;
		playerbase = GameBaseEngine._PlayerBase;
		NSInteger nPlayerID = [playerbase C_LIVES];
		
		if ([par isKindOfClass:[CustomParameter class]])
		{
			PlayerAction *action = par.parameter;
			nPlayerID = action._PlayerID;
		}
		NSString *soundfile = [NSString stringWithString:@"/BoxClick.wav"];
		[GameBaseEngine PlaySoundFile:soundfile :nPlayerID];
	}
	
	if ([par isKindOfClass:[UIButton class]])
	{
		//Record player action
		[self AddRecordPlayerAction:1 :button :@"btnBox" :self];
	}

}

- (IBAction)btnSwitchHoldDownPressed:(id)sender{
	CustomParameter *par = sender;
	UIButton * button;
	
	if ([par isKindOfClass:[UIButton class]])
	{
		button = sender;
	}
	else
	{
		button = par.sender;
	}	
	[button setTag:([button tag] + 1)];
	
	if (button.tag == 1) //Ignore the button is already held down
	{
	    //[button setTag:([button tag] + 1)];
		//Only play sound for clicks on current level.
		LevelBase *levelbase;
		levelbase = GameBaseEngine._LevelBase;
		if (levelbase.C_LEVELID == nLevelID)
		{
			PlayerBase *playerbase;
			playerbase = GameBaseEngine._PlayerBase;
			NSInteger nPlayerID = [playerbase C_LIVES];
			
			if ([par isKindOfClass:[CustomParameter class]])
			{
				PlayerAction *action = par.parameter;
				nPlayerID = action._PlayerID;
			}
			NSString *soundfile = [NSString stringWithString:@"/SwitchClick.wav"];
			[GameBaseEngine PlaySoundFile:soundfile :nPlayerID];
		}
		
		PlayerBase *playerbase = GameBaseEngine._PlayerBase;
		switch (levelbase.C_LEVELID) {
			case 2:
				if ([button tag] > 0)
				{
					[playerbase setC_LEVEL01a_SWITCH_ON:TRUE];
				}
				break;
			case 4:
				if ([button tag] > 0)
				{
					[playerbase setC_LEVEL03_SWITCH_ON:TRUE];
				}
				break;
			default:
				break;
		}
		
		if ([par isKindOfClass:[UIButton class]])
		{
			//Record player action
			[self AddRecordPlayerAction:1 :button :@"btnSwitchHoldDown" :self];
			[self setBSwitchHold1IsDown:TRUE];
		}
		
		NSString *fileName = @"on_switchhold";
		NSString *imageFile = [[NSBundle mainBundle]
							   pathForResource:fileName ofType:@"png"];
		
		UIImage *myImage = [[UIImage
							 imageWithContentsOfFile:imageFile]
							stretchableImageWithLeftCapWidth:64 topCapHeight:64];
		[button setBackgroundImage:myImage forState:UIControlStateNormal];
		
		//[button setEnabled:FALSE];
		
		
		NSLog(@"Switch Hold Down Pressed: Level: %d", nLevelID);
		
		//[self ProcessCompletedSwitches:self];
	}
	
}
- (IBAction)btnSwitchHoldUpPressed:(id)sender{
	CustomParameter *par = sender;
	UIButton * button;
	
	if ([par isKindOfClass:[UIButton class]])
	{
		button = sender;
	}
	else
	{
		button = par.sender;
	}	
	[button setTag:([button tag] - 1)];
	
	if (button.tag == 0) //ignore button already up
	{
	    //[button setTag:0];
		//Only play sound for clicks on current level.
		LevelBase *levelbase;
		levelbase = GameBaseEngine._LevelBase;
		if (levelbase.C_LEVELID == nLevelID)
		{
			PlayerBase *playerbase;
			playerbase = GameBaseEngine._PlayerBase;
			NSInteger nPlayerID = [playerbase C_LIVES];
			
			if ([par isKindOfClass:[CustomParameter class]])
			{
				PlayerAction *action = par.parameter;
				nPlayerID = action._PlayerID;
			}
			NSString *soundfile = [NSString stringWithString:@"/SwitchClick.wav"];
			[GameBaseEngine PlaySoundFile:soundfile :nPlayerID];
		}
		
		PlayerBase *playerbase = GameBaseEngine._PlayerBase;
		switch (levelbase.C_LEVELID) {
			case 2:
				if ([button tag] < 1)
				{
					[playerbase setC_LEVEL01a_SWITCH_ON:FALSE];
				}
				break;
			case 4:
				if ([button tag] < 1)
				{
					[playerbase setC_LEVEL03_SWITCH_ON:FALSE];
				}
				break;
			default:
				break;
		}
		
		if ([par isKindOfClass:[UIButton class]])
		{
			//Record player action
			[self AddRecordPlayerAction:1 :button :@"btnSwitchHoldUp" :self];
			[self setBSwitchHold1IsDown:FALSE];
		}
		
		NSString *fileName = @"off_switchhold";
		NSString *imageFile = [[NSBundle mainBundle]
							   pathForResource:fileName ofType:@"png"];
		
		UIImage *myImage = [[UIImage
							 imageWithContentsOfFile:imageFile]
							stretchableImageWithLeftCapWidth:64 topCapHeight:64];
		[button setBackgroundImage:myImage forState:UIControlStateNormal];
		
		//[button setEnabled:FALSE];
		
		
		NSLog(@"Switch Hold Up Pressed: Level: %d", nLevelID);
	}
	
}


- (IBAction)btnCoinBoxPressed:(id)sender{
	CustomParameter *par = sender;
	UIButton * button;
	
	if ([par isKindOfClass:[UIButton class]])
	{
		button = sender;
	}
	else
	{
		button = par.sender;
	}
	
	switch (button.tag) {
		case 1:
			[button setHidden:TRUE];
			[btnCoin1 setHidden:FALSE];
			break;
		case 2:
			[button setHidden:TRUE];
			[btnCoin2 setHidden:FALSE];
			break;
		case 3:
			[button setHidden:TRUE];
			[btnCoin3 setHidden:FALSE];
			break;
		case 4:
			[button setHidden:TRUE];
			[btnCoin4 setHidden:FALSE];
			break;
		case 5:
			[button setHidden:TRUE];
			[btnCoin5 setHidden:FALSE];
			break;
		default:
			[button setHidden:TRUE];
			break;
	}
		
	//Only play sound for clicks on current level.
	LevelBase *levelbase;
	levelbase = GameBaseEngine._LevelBase;
	if (levelbase.C_LEVELID == nLevelID)
	{		
		PlayerBase *playerbase;
		playerbase = GameBaseEngine._PlayerBase;
		NSInteger nPlayerID = [playerbase C_LIVES];
		
		if ([par isKindOfClass:[CustomParameter class]])
		{
			PlayerAction *action = par.parameter;
			nPlayerID = action._PlayerID;
		}
		NSString *soundfile = [[NSBundle mainBundle] pathForResource: @"BoxClick"
															  ofType: @"wav"];
		[GameBaseEngine PlaySoundFile:soundfile :nPlayerID];
	}
	
	if ([par isKindOfClass:[UIButton class]])
	{
		//Record player action
		[self AddRecordPlayerAction:1 :button :@"btnCoinBox" :self];
	}
}

- (IBAction)btnLevelUpBoxPressed:(id)sender{
	CustomParameter *par = sender;
	UIButton * button;
	
	if ([par isKindOfClass:[UIButton class]])
	{
		button = sender;
	}
	else
	{
		button = par.sender;
	}
	
	//Only play sound for clicks on current level.
	LevelBase *levelbase;
	levelbase = GameBaseEngine._LevelBase;
	if (levelbase.C_LEVELID == nLevelID)
	{		PlayerBase *playerbase;
		playerbase = GameBaseEngine._PlayerBase;
		NSInteger nPlayerID = [playerbase C_LIVES];
		
		if ([par isKindOfClass:[CustomParameter class]])
		{
			PlayerAction *action = par.parameter;
			nPlayerID = action._PlayerID;
		}
		
		
		if (![self ProcessCompletedSwitches:button])
		{
			NSString *soundfile = [NSString stringWithString:@"/LevelUpBoxNotReady.wav"];
			[GameBaseEngine PlaySoundFile:soundfile :nPlayerID];
		}
		else
		{
			if (!bLevelUpSoundPlayed)
			{
				NSString *soundfile = [NSString stringWithString:@"/LevelUpVisible.wav"];
				[GameBaseEngine PlaySoundFile:soundfile :nPlayerID];	
				[self setBLevelUpSoundPlayed:TRUE];
			}
			
			[button setHidden:TRUE];
			[btnLevelUp setHidden:FALSE];
		}
	}
	
	if ([par isKindOfClass:[UIButton class]]) //Only record the move if the sender came from the View i.e. the current Player 
	{
		//Record player action
		[self AddRecordPlayerAction:1 :button :@"btnLevelUpBox" :self];
	}
}


- (IBAction)btnCoinPressed:(id)sender{
	CustomParameter *par = sender;
	UIButton * button;
	
	if ([par isKindOfClass:[UIButton class]])
	{
		button = sender;
	}
	else
	{
		button = par.sender;
	}
	
	if (button.tag > 0)
	{
		
		[GameBaseEngine AddPlayerPoints:button.tag];
		NSLog(@"Player picked up %d Points.", button.tag);
	}
	


	
	//Only play sound for clicks on current level.
	LevelBase *levelbase;
	levelbase = GameBaseEngine._LevelBase;
	if (levelbase.C_LEVELID == nLevelID)
	{
		PlayerBase *playerbase;
		playerbase = GameBaseEngine._PlayerBase;
		NSInteger nPlayerID = [playerbase C_LIVES];
		
		if ([par isKindOfClass:[CustomParameter class]])
		{
			PlayerAction *action = par.parameter;
			nPlayerID = action._PlayerID;
		}
		NSString *soundfile = [NSString stringWithString:@"/CoinClick.wav"];
		[GameBaseEngine PlaySoundFile:soundfile :nPlayerID];
	}
	
	if ([par isKindOfClass:[UIButton class]])
	{
		//Record player action
		[self AddRecordPlayerAction:1 :button :@"btnCoin" :self];
	}
	
	[button setHidden:TRUE];
	
}

- (IBAction)btnConePressed:(id)sender{

	CustomParameter *par = sender;
	UIButton * button;
	
	if ([par isKindOfClass:[UIButton class]])
	{
		button = sender;
	}
	else
	{
		button = par.sender;
	}
	
	if (button.tag > 0)
	{
		if (button.tag == 1)
		{
			[GameBaseEngine AddPlayerPoints:button.tag];
			NSLog(@"Player picked up %d Points.", button.tag);
			[button setHidden: TRUE];
			[button setTitle:@"" forState:UIControlStateNormal];
		}
		else
		{
			if (btnCone1 == button &&
				nCone1TagBackup == 0)
			{
				[self setNCone1TagBackup:button.tag];	
			
			}
			else if (btnCone2 == button &&
				nCone2TagBackup == 0)
			{
				[self setNCone2TagBackup:button.tag];
			}
			else if (btnCone3 == button &&
					 nCone3TagBackup == 0)
			{
				[self setNCone3TagBackup:button.tag];	
				
			}
			else if (btnCone4 == button &&
					 nCone4TagBackup == 0)
			{
				[self setNCone4TagBackup:button.tag];
			}
			else if (btnCone5 == button &&
					 nCone5TagBackup == 0)
			{
				[self setNCone5TagBackup:button.tag];	
			}
			
			[GameBaseEngine AddPlayerPoints:1];
			NSLog(@"Player picked up %d Points",1);
			[button setTag:button.tag - 1];
			[button setTitle:[NSString stringWithFormat:@"%d", (button.tag)] forState:UIControlStateNormal];
			
		}
		
		nCountCones++;
	
		
		//Only play sound for clicks on current level.
		LevelBase *levelbase;
		levelbase = GameBaseEngine._LevelBase;
		if (levelbase.C_LEVELID == nLevelID)
		{
			PlayerBase *playerbase;
			playerbase = GameBaseEngine._PlayerBase;
			NSInteger nPlayerID = [playerbase C_LIVES];
			
			if ([par isKindOfClass:[CustomParameter class]])
			{
				PlayerAction *action = par.parameter;
				nPlayerID = action._PlayerID;
			}
			NSString *soundfile = [NSString stringWithString:@"/ConeClick.wav"];

			[GameBaseEngine PlaySoundFile:soundfile :nPlayerID];
		}
		
		if ([par isKindOfClass:[UIButton class]])
		{
			//Record player action
			[self AddRecordPlayerAction:1 :button :@"btnCone" :self];
		}
		
		
		[self ProcessCompletedSwitches:self];
		
	}
}

- (IBAction)btnSwitchPressed:(id)sender{
	CustomParameter *par = sender;
	UIButton * button;
	
	if ([par isKindOfClass:[UIButton class]])
	{
		button = sender;
	}
	else
	{
		button = par.sender;
	}
	
	switch (button.tag) {
		case 1:
			//[btnSwitch1 setBackgroundImage:[[UIImage alloc] initWithContentsOfFile:@"Switch_Down.png"] forState:UIControlStateDisabled];
			//[btnSwitch1 setEnabled:FALSE];
			nCountSwitchesDown++;
			break;
		case 2:
			nCountSwitchesDown++;
			break;
		case 3:
			nCountSwitchesDown++;
			break;
		case 4:
			nCountSwitchesDown++;
			break;
		case 5:
			nCountSwitchesDown++;
			break;
		default:
			break;
	}

	
	//Only play sound for clicks on current level.
	LevelBase *levelbase;
	levelbase = GameBaseEngine._LevelBase;
	if (levelbase.C_LEVELID == nLevelID)
	{
		PlayerBase *playerbase;
		playerbase = GameBaseEngine._PlayerBase;
		NSInteger nPlayerID = [playerbase C_LIVES];
		
		if ([par isKindOfClass:[CustomParameter class]])
		{
			PlayerAction *action = par.parameter;
			nPlayerID = action._PlayerID;
		}
		NSString *soundfile = [NSString stringWithString:@"/SwitchClick.wav"];
		[GameBaseEngine PlaySoundFile:soundfile :nPlayerID];
	}
	
	if ([par isKindOfClass:[UIButton class]])
	{
		//Record player action
		[self AddRecordPlayerAction:1 :button :@"btnSwitch" :self];
	}
	
	NSString *fileName = @"on_switch";
	NSString *imageFile = [[NSBundle mainBundle]
						   pathForResource:fileName ofType:@"png"];
	
	UIImage *myImage = [[UIImage
						imageWithContentsOfFile:imageFile]
						stretchableImageWithLeftCapWidth:64 topCapHeight:64];
	[button setBackgroundImage:myImage forState:UIControlStateNormal];
	
	[button setEnabled:FALSE];
	
	
	NSLog(@"Count Of Switches Down: %d  Level: %d", nCountSwitchesDown, nLevelID);

	[self ProcessCompletedSwitches:self];
}

- (BOOL)ProcessCompletedSwitches:(id)sender{
	
	if ((nCountSwitchesDown >= nMaxSwitches) &&
		(nCountCones >= nMaxCones) &&
		((btnLevelUpBox == nil) || 
		((btnLevelUpBox != nil) && 
		(btnLevelUpBox.hidden == FALSE))))
	{
		if (btnLevelUpBox == nil)
		{
			[btnLevelUp setHidden:FALSE];
			NSLog(@"Set Level Up Button to Visible");
		}
		if (!bLevelUpSoundPlayed)
		{
			if ((sender != btnLevelUpBox) && (btnLevelUpBox == nil))
			{
				PlayerBase *playerbase = GameBaseEngine._PlayerBase;
				NSString *soundfile = [NSString stringWithString:@"/LevelUpVisible.wav"];
				[GameBaseEngine PlaySoundFile:soundfile :[playerbase C_LIVES]];		
				[self setBLevelUpSoundPlayed:TRUE];
			}
		}
				
		return TRUE;
	}
	else
	{
		return FALSE;	
	}
}

- (IBAction)btnLevelUpPressed:(id)sender{

	if (nLevelID == 2 &&
		(([btnSwitchHold1 tag] > 0 ) &&
		bSwitchHold1IsDown == TRUE))
	{
		[self btnSwitchHoldUpPressed: btnSwitchHold1 ];
	}

	
	[self.GameBaseEngine switchViews:self :nLevelID :nLevelID + 1];
	
	PlayerBase *playerbase = GameBaseEngine._PlayerBase;
	NSString *soundfile = [NSString stringWithString:@"/ButtonClick.wav"];
	[GameBaseEngine PlaySoundFile:soundfile :[playerbase C_LIVES]];
	
	//Record player action
	[self AddRecordPlayerAction:1 :sender :@"btnLevelUp" :self];
	
}



- (IBAction)btnLevelDownPressed:(id)sender{
	
	[self.GameBaseEngine switchViews:self :nLevelID :nLevelID - 1];
	
	PlayerBase *playerbase = GameBaseEngine._PlayerBase;
	
	NSString *soundfile = [NSString stringWithString:@"/ButtonClick.wav"];
	[GameBaseEngine PlaySoundFile:soundfile :[playerbase C_LIVES]];
	
	//Record player action
	[self AddRecordPlayerAction:1 :sender :@"btnLevelDown" :self];
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


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	/*
	[GameBaseEngine setC_UPDATE_LIVES:TRUE];
	[GameBaseEngine setC_UPDATE_LEVEL:TRUE];
	[GameBaseEngine setC_UPDATE_POINTS:TRUE];
	[GameBaseEngine setC_UPDATE_DIFFICULTY:TRUE];
	*/
	[self InitializeLevelComponentsGeneral:self];
	[self InitializeRandomizer:self];
	[super viewDidLoad];
	//[self InitializeLevel:self];
}

- (void)InitializeLevel:(id)sender{
	//Each unique level must override this method with
	//own specific initialization requirements
	
}
- (void)InitializePoints:(id)sender
{
  //This method define the locations that can be randomized.
}

- (void)InitializeRandomizer:(id)sender
{	
	NSLog(@"InitializeRandomier() Called. DIFFICULTY: %d, bRandomizerInitialized: %d", GameBaseEngine.C_GAME_DIFFICULTY, bRandomizerInitialized);
	
	if (GameBaseEngine.C_GAME_DIFFICULTY > 0
		&& !bRandomizerInitialized) //HARD, HELL Difficulty modes
	{
		NSLog(@"Randomizer - This Game is eligble for randomization.");
		[self InitializePoints:self];
		
		NSInteger nRandomValue = 0;
		//uncomment when we are ready for true randomness
		srand(time(NULL));
		for(int i = 1; i < 6; i++)
		{
			NSLog(@"Randomizer - Cycle %d for Level %d.", i, [self nLevelID]);
			
			UIButton *theBoxButton = nil;
			UIButton *theSwitchButton = nil;
			
			switch (i) {
				case 1 :
					theBoxButton = btnBox1;
					theSwitchButton = btnSwitch1;
					break;
				case 2:
					theBoxButton = btnBox2;
					theSwitchButton  = btnSwitch2;
					break;
				case 3:
					theBoxButton = btnBox3;
					theSwitchButton = btnSwitch3;
					break;
				case 4:
					theBoxButton = btnBox4;
					theSwitchButton = btnSwitch4;
					break;
				case 5:
					theBoxButton = btnBox5;
					theSwitchButton = btnSwitch5;
					break;
				default:
					break;
			}
			
			CGPoint ptLocation =  CGPointMake(0.0,0.0);
			
			///for(int r = 1; r < 6; r++)
			//{
			NSInteger nRandLow = 1;
			NSInteger nRandHigh = 5;
			BOOL bRand1 = FALSE;
			BOOL bRand2 = FALSE;
			BOOL bRand3 = FALSE;
			BOOL bRand4 = FALSE;
			BOOL bRand5 = FALSE;
			
			while (ptLocation.y == 0.0 && ptLocation.x == 0.0)
			{
				nRandomValue = nRandLow + arc4random() % nRandHigh;
				switch (nRandomValue) {
					case 1:
						if (ptLoc1.x > 0.0 || ptLoc1.y > 0.0 )
						{
							ptLocation = ptLoc1;
							ptLoc1= CGPointMake(0.0,0.0);
						}
						bRand1 = TRUE;
						if (nRandLow == 1)
							nRandLow++;
						break;
					case 2:
						if (ptLoc2.x > 0.0 || ptLoc2.y > 0.0)
						{
							ptLocation = ptLoc2;
							ptLoc2 = CGPointMake(0.0,0.0);
						}
						bRand2 = TRUE;
						if (nRandLow == 2)
							nRandLow++;
						break;
					case 3:
						if (ptLoc3.x > 0.0 || ptLoc3.y > 0.0)
						{
							ptLocation = ptLoc3;
							ptLoc3 = CGPointMake(0.0,0.0);
						}
						bRand3 = TRUE;
						break;
					case 4:
						if (ptLoc4.x > 0.0 || ptLoc4.y > 0.0)
						{
							ptLocation = ptLoc4;
							ptLoc4 = CGPointMake(0.0,0.0);
						}
						bRand4 = TRUE;
						if (nRandHigh == 4)
							nRandHigh--;
						break;
						
					case 5:
						if (ptLoc5.x > 0.0 || ptLoc5.y > 0.0)
						{
							ptLocation = ptLoc5;
							ptLoc5 = CGPointMake(0.0,0.0);
						}
						bRand5 = TRUE;
						if (nRandHigh == 5)
							nRandHigh--;
						break;
					default:
						break;
				}
				
				if (ptLocation.x > 0.0 || ptLocation.y > 0.0)
					break;
				else if (bRand1 && bRand2 && bRand3 && bRand4 && bRand5)
					break;
			}
			//} //END FOR
			
			if ((ptLocation.x > 0.0 || ptLocation.y > 0.0) && theBoxButton != nil)
			{
				NSLog(@"Randomizer - Assign New location (%d, %d) in Cycle %d for Level %d.", ptLocation.x, ptLocation.y, i, [self nLevelID]);
				
				CGRect newRect = CGRectMake(ptLocation.x, ptLocation.y, 64, 64);
				[theBoxButton setFrame:newRect];
				[theSwitchButton setFrame:newRect];
			}
			
		}
		
		NSLog(@"Randomizer - Set bRandomizerInitialzed to TRUE");
		[self setBRandomizerInitialized:TRUE];
	}
	
}

- (void)InitializeLevelComponentsGeneral:(id)sender{

	[self setBLevelUpSoundPlayed:TRUE]; //Don't play this sound for now..
	
	if (imgPlayerAnimation01 != nil)
	{
		CGRect rect = CGRectMake(0.0, 0.0, 16, 16);
		[imgPlayerAnimation01 setFrame:rect];
		[imgPlayerAnimation01 setHidden:TRUE];
	}
	if (btnPlayer01 != nil)
	{
		CGRect rect = CGRectMake(20.0, 0.0, 16.0, 16.0);
		[btnPlayer01 setFrame:rect];
		[btnPlayer01 setHidden:TRUE];
	}
	if (btnPlayer02 != nil)
	{
		CGRect rect = CGRectMake(40.0, 0.0, 16.0, 16.0);
		[btnPlayer02 setFrame:rect];
		[btnPlayer02 setHidden:TRUE];
	}
	if (btnPlayer03 != nil)
	{
		CGRect rect = CGRectMake(60.0, 0.0, 16.0, 16.0);
		[btnPlayer03 setFrame:rect];
		[btnPlayer03 setHidden:TRUE];
	}
	if (btnPlayer04 != nil)
	{
		CGRect rect = CGRectMake(80.0, 0.0, 16.0, 16.0);
		[btnPlayer04 setFrame:rect];
		[btnPlayer04 setHidden:TRUE];
	}
	if (btnPlayer05 != nil)
	{
		CGRect rect = CGRectMake(100.0, 0.0, 16.0, 16.0);
		[btnPlayer05 setFrame:rect];
		[btnPlayer05 setHidden:TRUE];
	}
	if (btnPlayer06 != nil)
	{
		CGRect rect = CGRectMake(120.0, 0.0, 16.0, 16.0);
		[btnPlayer06 setFrame:rect];
		[btnPlayer06 setHidden:TRUE];
	}
	if (btnPlayer07 != nil)
	{
		CGRect rect = CGRectMake(140.0, 0.0, 16.0, 16.0);
		[btnPlayer07 setFrame:rect];
		[btnPlayer07 setHidden:TRUE];
	}
	if (btnPlayer08 != nil)
	{
		CGRect rect = CGRectMake(160.0, 0.0, 16.0, 16.0);
		[btnPlayer08 setFrame:rect];
		[btnPlayer08 setHidden:TRUE];
	}
	if (btnPlayer09 != nil)
	{
		CGRect rect = CGRectMake(180.0, 0.0, 16.0, 16.0);
		[btnPlayer09 setFrame:rect];
		[btnPlayer09 setHidden:TRUE];
	}
	
	
	NSString *fileName = @"off_switch";
	NSString *imageFile = [[NSBundle mainBundle]
						   pathForResource:fileName ofType:@"png"];
	
	UIImage *myImage = [[UIImage
						 imageWithContentsOfFile:imageFile]
						stretchableImageWithLeftCapWidth:64.0 topCapHeight:64.0];
	[myImage retain];

	
	
	if (btnSwitch1 != nil)
	{
		[btnSwitch1 setHidden:TRUE];
		[btnSwitch1 setBackgroundImage:myImage forState:UIControlStateNormal];
		[btnSwitch1 setEnabled:TRUE];
	}
	
	if (btnSwitch2 != nil)
	{
		[btnSwitch2 setHidden:TRUE];
		[btnSwitch2 setBackgroundImage:myImage forState:UIControlStateNormal];
		[btnSwitch2 setEnabled:TRUE];
	}

	if (btnSwitch3 != nil)
	{
		[btnSwitch3 setHidden:TRUE];
		[btnSwitch3 setBackgroundImage:myImage forState:UIControlStateNormal];
		[btnSwitch3 setEnabled:TRUE];
	}
	
	if (btnSwitch4 != nil)
	{
		[btnSwitch4 setHidden:TRUE];
		[btnSwitch4 setBackgroundImage:myImage forState:UIControlStateNormal];
		[btnSwitch4 setEnabled:TRUE];
	}
	
	if (btnSwitch5 != nil)
	{
		[btnSwitch5 setHidden:TRUE];
		[btnSwitch5 setBackgroundImage:myImage forState:UIControlStateNormal];
		[btnSwitch5 setEnabled:TRUE];
	}
	
	
	NSString *fileNamehold = @"off_switchhold";
	NSString *imageFilehold = [[NSBundle mainBundle]
						   pathForResource:fileNamehold ofType:@"png"];
	
	UIImage *myImagehold = [[UIImage
						 imageWithContentsOfFile:imageFilehold]
						stretchableImageWithLeftCapWidth:64.0 topCapHeight:64.0];
	[myImagehold retain];
	
	if (btnSwitchHold1 != nil)
	{
		//[btnSwitchHold1 setHidden:TRUE];
		[btnSwitchHold1 setBackgroundImage:myImagehold forState:UIControlStateNormal];
		//[btnSwitchHold1 setEnabled:TRUE];
		[btnSwitchHold1 setTag:0];
	}
	if (btnSwitchHold2 != nil)
	{
		//[btnSwitchHold2 setHidden:TRUE];
		[btnSwitchHold2 setBackgroundImage:myImagehold forState:UIControlStateNormal];
		//[btnSwitchHold2 setEnabled:TRUE];
		[btnSwitchHold1 setTag:0];
	}
	if (btnSwitchHold3 != nil)
	{
		//[btnSwitchHold3 setHidden:TRUE];
		[btnSwitchHold3 setBackgroundImage:myImagehold forState:UIControlStateNormal];
		//[btnSwitchHold3 setEnabled:TRUE];
		[btnSwitchHold1 setTag:0];
	}
	if (btnSwitchHold4 != nil)
	{
		//[btnSwitchHold4 setHidden:TRUE];
		[btnSwitchHold4 setBackgroundImage:myImagehold forState:UIControlStateNormal];
		//[btnSwitchHold4 setEnabled:TRUE];
		[btnSwitchHold1 setTag:0];
	}
	if (btnSwitchHold5 != nil)
	{
		//[btnSwitchHold5 setHidden:TRUE];
		[btnSwitchHold5 setBackgroundImage:myImagehold forState:UIControlStateNormal];
		//[btnSwitchHold5 setEnabled:TRUE];
		[btnSwitchHold1 setTag:0];
	}
	
	
	if (btnBox1 != nil)
	{
		[btnBox1 setHidden:FALSE];
	}
	if (btnBox2 != nil)
	{
		[btnBox2 setHidden:FALSE];
	}
	if (btnBox3 != nil)
	{
		[btnBox3 setHidden:FALSE];
	}
	if (btnBox4 != nil)
	{
		[btnBox4 setHidden:FALSE];
	}
	if (btnBox5 != nil)
	{
		[btnBox5 setHidden:FALSE];
	}
	
	if (btnCoin1 != nil)
	{
		[btnCoin1 setHidden:TRUE];
	}
	if (btnCoin2 != nil)
	{
		[btnCoin2 setHidden:TRUE];
	}
	if (btnCoin3 != nil)
	{
		[btnCoin3 setHidden:TRUE];
	}
	if (btnCoin4 != nil)
	{
		[btnCoin4 setHidden:TRUE];
	}
	if (btnCoin5 != nil)
	{
		[btnCoin5 setHidden:TRUE];
	}
	
	if (btnCoinBox1 != nil)
	{
		[btnCoinBox1 setHidden:FALSE];
	}
	if (btnCoinBox2 != nil)
	{
		[btnCoinBox2 setHidden:FALSE];
	}
	if (btnCoinBox3 != nil)
	{
		[btnCoinBox3 setHidden:FALSE];
	}
	if (btnCoinBox4 != nil)
	{
		[btnCoinBox4 setHidden:FALSE];
	}
	if (btnCoinBox5 != nil)
	{
		[btnCoinBox5 setHidden:FALSE];
	}
	
	if (btnCone1 != nil)
	{
		if (nCone1TagBackup > 0)
		{
			[btnCone1 setTag:nCone1TagBackup];
			[btnCone1 setTitle:[NSString stringWithFormat:@"%d",nCone1TagBackup] forState:UIControlStateNormal];
		}
		[btnCone1 setHidden:FALSE];
	}
	if (btnCone2 != nil)
	{
		if (nCone2TagBackup > 0)
		{
			[btnCone2 setTag:nCone2TagBackup];
			[btnCone2 setTitle:[NSString stringWithFormat:@"%d",nCone2TagBackup] forState:UIControlStateNormal];
		}
		[btnCone2 setHidden:FALSE];
	}
	if (btnCone3 != nil)
	{
		if (nCone3TagBackup > 0)
		{
			[btnCone3 setTag:nCone3TagBackup];
			[btnCone3 setTitle:[NSString stringWithFormat:@"%d",nCone3TagBackup] forState:UIControlStateNormal];
		}
		[btnCone3 setHidden:FALSE];
	}
	if (btnCone4 != nil)
	{
		if (nCone4TagBackup > 0)
		{
			[btnCone4 setTag:nCone4TagBackup];
			[btnCone4 setTitle:[NSString stringWithFormat:@"%d",nCone4TagBackup] forState:UIControlStateNormal];
		}
		[btnCone4 setHidden:FALSE];
	}
	if (btnCone5 != nil)
	{
		if (nCone5TagBackup > 0)
		{
			[btnCone5 setTag:nCone5TagBackup];
			[btnCone5 setTitle:[NSString stringWithFormat:@"%d",nCone5TagBackup] forState:UIControlStateNormal];
		}
		[btnCone5 setHidden:FALSE];
	}
	
	if (btnGeneralBox1 != nil)
	{
		[btnGeneralBox1 setHidden:FALSE];
	}
	if (btnGeneralBox2 != nil)
	{
		[btnGeneralBox2 setHidden:FALSE];
	}
	if (btnGeneralBox3 != nil)
	{
		[btnGeneralBox3 setHidden:FALSE];
	}
	if (btnGeneralBox4 != nil)
	{
		[btnGeneralBox4 setHidden:FALSE];
	}
	if (btnGeneralBox5 != nil)
	{
		[btnGeneralBox5 setHidden:FALSE];
	}
	if (btnGeneralBox6 != nil)
	{
		[btnGeneralBox6 setHidden:FALSE];
	}
	if (btnGeneralBox7 != nil)
	{
		[btnGeneralBox7 setHidden:FALSE];
	}
	if (btnGeneralBox8 != nil)
	{
		[btnGeneralBox8 setHidden:FALSE];
	}
	if (btnGeneralBox9 != nil)
	{
		[btnGeneralBox9 setHidden:FALSE];
	}
	if (btnGeneralBox10 != nil)
	{
		[btnGeneralBox10 setHidden:FALSE];
	}
	
	if (btnGeneralCoin1 != nil)
	{
		[btnGeneralCoin1 setHidden:FALSE];
	}
	if (btnGeneralCoin2 != nil)
	{
		[btnGeneralCoin2 setHidden:FALSE];
	}
	if (btnGeneralCoin3 != nil)
	{
		[btnGeneralCoin3 setHidden:FALSE];
	}
	if (btnGeneralCoin4 != nil)
	{
		[btnGeneralCoin4 setHidden:FALSE];
	}
	if (btnGeneralCoin5 != nil)
	{
		[btnGeneralCoin5 setHidden:FALSE];
	}
	if (btnGeneralCoin6 != nil)
	{
		[btnGeneralCoin6 setHidden:FALSE];
	}
	if (btnGeneralCoin7 != nil)
	{
		[btnGeneralCoin7 setHidden:FALSE];
	}
	if (btnGeneralCoin8 != nil)
	{
		[btnGeneralCoin8 setHidden:FALSE];
	}
	if (btnGeneralCoin9 != nil)
	{
		[btnGeneralCoin9 setHidden:FALSE];
	}
	if (btnGeneralCoin10 != nil)
	{
		[btnGeneralCoin10 setHidden:FALSE];
	}
	
	if (btnLevelUp != nil)
	{
		[btnLevelUp setHidden:TRUE];
	}
	
	if (btnLevelUpBox != nil)
	{
		[btnLevelUpBox setHidden:FALSE];
	}
	
	if (btnLevelDown != nil)
	{
		[btnLevelDown setHidden:FALSE];
	}
	
	[self setNCountCones:0];
	[self setNCountSwitchesDown:0];
	
	[self InitializeLevel:self];
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
