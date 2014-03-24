//
//  LevelTemplateViewController.h
//  Ten1
//
//  Created by Oswald on 9/19/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GameBase;
@class PlayerBase;

extern NSString * const KTYPE_SWITCH;
extern NSString * const KTYPE_BOX;
extern NSString * const KTYPE_COIN;
extern NSString * const KTYPE_COINBOX;
extern NSString * const KTYPE_CONE;
extern NSString * const KTYPE_GENERALBOX;
extern NSString * const KTYPE_GENERALCOIN;
extern NSString * const KTYPE_SWITCH_HOLDUP;
extern NSString * const KTYPE_SWITCH_HOLDDOWN;
extern NSString * const KTYPE_LEVELUPBOX;
extern NSString * const KTYPE_LEVELUP;
extern NSString * const KTYPE_LEVELDOWN;

@interface LevelTemplateViewController : UIViewController <UIAlertViewDelegate> {
	UIButton			  *btnSwitch1;
	UIButton			  *btnSwitch2;
	UIButton			  *btnSwitch3;
	UIButton			  *btnSwitch4;
	UIButton			  *btnSwitch5;	
	UIButton			  *btnBox1;
	UIButton			  *btnBox2;
	UIButton			  *btnBox3;
	UIButton			  *btnBox4;
	UIButton			  *btnBox5;	
	UIButton			  *btnCoin1;
	UIButton			  *btnCoin2;
	UIButton			  *btnCoin3;
	UIButton			  *btnCoin4;
	UIButton			  *btnCoin5;
	UIButton			  *btnCoinBox1;
	UIButton			  *btnCoinBox2;
	UIButton			  *btnCoinBox3;
	UIButton			  *btnCoinBox4;
	UIButton			  *btnCoinBox5;	
	UIButton			  *btnCone1;
	UIButton			  *btnCone2;
	UIButton			  *btnCone3;
	UIButton			  *btnCone4;
	UIButton			  *btnCone5;
	UIButton			  *btnSwitchHold1;
	UIButton			  *btnSwitchHold2;
	UIButton			  *btnSwitchHold3;
	UIButton			  *btnSwitchHold4;
	UIButton			  *btnSwitchHold5;
	NSInteger			  nCone1TagBackup;
	NSInteger			  nCone2TagBackup;
	NSInteger			  nCone3TagBackup;
	NSInteger             nCone4TagBackup;
	NSInteger			  nCone5TagBackup;
	UIButton			  *btnGeneralBox1;
	UIButton			  *btnGeneralBox2;
	UIButton			  *btnGeneralBox3;
	UIButton			  *btnGeneralBox4;
	UIButton			  *btnGeneralBox5;
	UIButton			  *btnGeneralBox6;
	UIButton			  *btnGeneralBox7;
	UIButton			  *btnGeneralBox8;
	UIButton			  *btnGeneralBox9;
	UIButton			  *btnGeneralBox10;
	UIButton			  *btnGeneralCoin1;
	UIButton			  *btnGeneralCoin2;
	UIButton			  *btnGeneralCoin3;
	UIButton			  *btnGeneralCoin4;
	UIButton			  *btnGeneralCoin5;
	UIButton			  *btnGeneralCoin6;
	UIButton			  *btnGeneralCoin7;
	UIButton			  *btnGeneralCoin8;
	UIButton			  *btnGeneralCoin9;
	UIButton			  *btnGeneralCoin10;

	UILabel				  *lblTime;
	UILabel				  *lblLives;
	UILabel				  *lblLevel;
	UILabel				  *lblPoints;
	UILabel				  *lblDifficulty;
	UIButton			  *btnInfo;
	GameBase		      *GameBaseEngine;
	
	UIButton			  *btnLevelUp;
	UIButton			  *btnLevelUpBox;
	UIButton			  *btnLevelDown;
	UIButton			  *btnFinishGame;
	
	NSInteger			  nCountSwitchesDown;
	NSInteger			  nLevelID;
	NSInteger			  nMaxSwitches;
	NSInteger			  nMaxCones;
	NSInteger			  nCountCones;
	
	BOOL				  bLevelUpSoundPlayed;
	BOOL				  bSwitchHold1IsDown;
	
	UIButton			  *btnPlayer01;
	UIButton			  *btnPlayer02;
	UIButton			  *btnPlayer03;
	UIButton			  *btnPlayer04;
	UIButton			  *btnPlayer05;
	UIButton			  *btnPlayer06;
	UIButton			  *btnPlayer07;
	UIButton			  *btnPlayer08;
	UIButton			  *btnPlayer09;
	
	CGPoint				   ptLoc1;
	CGPoint				   ptLoc2;
	CGPoint				   ptLoc3;
	CGPoint				   ptLoc4;
	CGPoint				   ptLoc5;
	BOOL					bRandomizerInitialized;
	
	UIImageView			   *imgPlayerAnimation01;
	
}

@property (nonatomic, retain) IBOutlet UIButton					*btnSwitch1;
@property (nonatomic, retain) IBOutlet UIButton					*btnSwitch2;
@property (nonatomic, retain) IBOutlet UIButton					*btnSwitch3;
@property (nonatomic, retain) IBOutlet UIButton					*btnSwitch4;
@property (nonatomic, retain) IBOutlet UIButton					*btnSwitch5;
@property (nonatomic, retain) IBOutlet UIButton					*btnBox1;
@property (nonatomic, retain) IBOutlet UIButton					*btnBox2;
@property (nonatomic, retain) IBOutlet UIButton					*btnBox3;
@property (nonatomic, retain) IBOutlet UIButton					*btnBox4;
@property (nonatomic, retain) IBOutlet UIButton					*btnBox5;
@property (nonatomic, retain) IBOutlet UIButton					*btnCoin1;
@property (nonatomic, retain) IBOutlet UIButton					*btnCoin2;
@property (nonatomic, retain) IBOutlet UIButton					*btnCoin3;
@property (nonatomic, retain) IBOutlet UIButton					*btnCoin4;
@property (nonatomic, retain) IBOutlet UIButton					*btnCoin5;
@property (nonatomic, retain) IBOutlet UIButton					*btnCoinBox1;
@property (nonatomic, retain) IBOutlet UIButton					*btnCoinBox2;
@property (nonatomic, retain) IBOutlet UIButton					*btnCoinBox3;
@property (nonatomic, retain) IBOutlet UIButton					*btnCoinBox4;
@property (nonatomic, retain) IBOutlet UIButton					*btnCoinBox5;
@property (nonatomic, retain) IBOutlet UIButton					*btnCone1;
@property (nonatomic, retain) IBOutlet UIButton					*btnCone2;
@property (nonatomic, retain) IBOutlet UIButton					*btnCone3;
@property (nonatomic, retain) IBOutlet UIButton					*btnCone4;
@property (nonatomic, retain) IBOutlet UIButton					*btnCone5;
@property (nonatomic, retain) IBOutlet UIButton					*btnSwitchHold1;
@property (nonatomic, retain) IBOutlet UIButton					*btnSwitchHold2;
@property (nonatomic, retain) IBOutlet UIButton					*btnSwitchHold3;
@property (nonatomic, retain) IBOutlet UIButton					*btnSwitchHold4;
@property (nonatomic, retain) IBOutlet UIButton					*btnSwitchHold5;
@property (nonatomic, retain) IBOutlet UIButton					*btnGeneralBox1;
@property (nonatomic, retain) IBOutlet UIButton					*btnGeneralBox2;
@property (nonatomic, retain) IBOutlet UIButton					*btnGeneralBox3;
@property (nonatomic, retain) IBOutlet UIButton					*btnGeneralBox4;
@property (nonatomic, retain) IBOutlet UIButton					*btnGeneralBox5;
@property (nonatomic, retain) IBOutlet UIButton					*btnGeneralBox6;
@property (nonatomic, retain) IBOutlet UIButton					*btnGeneralBox7;
@property (nonatomic, retain) IBOutlet UIButton					*btnGeneralBox8;
@property (nonatomic, retain) IBOutlet UIButton					*btnGeneralBox9;
@property (nonatomic, retain) IBOutlet UIButton					*btnGeneralBox10;
@property (nonatomic, retain) IBOutlet UIButton					*btnGeneralCoin1;
@property (nonatomic, retain) IBOutlet UIButton					*btnGeneralCoin2;
@property (nonatomic, retain) IBOutlet UIButton					*btnGeneralCoin3;
@property (nonatomic, retain) IBOutlet UIButton					*btnGeneralCoin4;
@property (nonatomic, retain) IBOutlet UIButton					*btnGeneralCoin5;
@property (nonatomic, retain) IBOutlet UIButton					*btnGeneralCoin6;
@property (nonatomic, retain) IBOutlet UIButton					*btnGeneralCoin7;
@property (nonatomic, retain) IBOutlet UIButton					*btnGeneralCoin8;
@property (nonatomic, retain) IBOutlet UIButton					*btnGeneralCoin9;
@property (nonatomic, retain) IBOutlet UIButton					*btnGeneralCoin10;

@property (nonatomic, retain) IBOutlet UILabel					*lblTime;
@property (nonatomic, retain) IBOutlet UILabel					*lblLives;
@property (nonatomic, retain) IBOutlet UILabel					*lblLevel;
@property (nonatomic, retain) IBOutlet UILabel					*lblPoints;
@property (nonatomic, retain) IBOutlet UILabel					*lblDifficulty;
@property (nonatomic, retain) IBOutlet UIButton					*btnInfo;
@property (nonatomic, retain)  GameBase							*GameBaseEngine;

@property (nonatomic) NSInteger									nCountSwitchesDown;
@property (nonatomic) NSInteger									nLevelID;
@property (nonatomic) NSInteger									nMaxSwitches;
@property (nonatomic) NSInteger									nMaxCones;
@property (nonatomic) NSInteger									nCountCones;
@property (nonatomic) BOOL										bLevelUpSoundPlayed;
@property (nonatomic) BOOL										bSwitchHold1IsDown;

@property (nonatomic) NSInteger									nCone1TagBackup;
@property (nonatomic) NSInteger									nCone2TagBackup;
@property (nonatomic) NSInteger									nCone3TagBackup;
@property (nonatomic) NSInteger									nCone4TagBackup;
@property (nonatomic) NSInteger									nCone5TagBackup;


@property (nonatomic, retain) IBOutlet UIButton					*btnLevelUp;
@property (nonatomic, retain) IBOutlet UIButton					*btnLevelUpBox;
@property (nonatomic, retain) IBOutlet UIButton					*btnLevelDown;
@property (nonatomic, retain) IBOutlet UIButton					*btnFinishGame;

@property (nonatomic, retain) IBOutlet UIButton					*btnPlayer01;
@property (nonatomic, retain) IBOutlet UIButton					*btnPlayer02;
@property (nonatomic, retain) IBOutlet UIButton					*btnPlayer03;
@property (nonatomic, retain) IBOutlet UIButton					*btnPlayer04;
@property (nonatomic, retain) IBOutlet UIButton					*btnPlayer05;
@property (nonatomic, retain) IBOutlet UIButton					*btnPlayer06;
@property (nonatomic, retain) IBOutlet UIButton					*btnPlayer07;
@property (nonatomic, retain) IBOutlet UIButton					*btnPlayer08;
@property (nonatomic, retain) IBOutlet UIButton					*btnPlayer09;

@property (nonatomic) BOOL										bRandomizerInitialized;
@property (nonatomic) CGPoint									ptLoc1;
@property (nonatomic) CGPoint									ptLoc2;
@property (nonatomic) CGPoint									ptLoc3;
@property (nonatomic) CGPoint									ptLoc4;
@property (nonatomic) CGPoint									ptLoc5;


@property (nonatomic, retain) IBOutlet UIImageView					*imgPlayerAnimation01;


- (IBAction)btnSwitchPressed:(id)sender;
- (IBAction)btnBoxPressed:(id)sender;
- (IBAction)btnCoinBoxPressed:(id)sender;
- (IBAction)btnCoinPressed:(id)sender;
- (IBAction)btnConePressed:(id)sender;
- (IBAction)btnLevelUpPressed:(id)sender;
- (IBAction)btnLevelUpBoxPressed:(id)sender;
- (IBAction)btnLevelDownPressed:(id)sender;
- (IBAction)btnFinishGamePressed:(id)sender;
- (IBAction)btnSwitchHoldDownPressed:(id)sender;
- (IBAction)btnSwitchHoldUpPressed:(id)sender;
- (IBAction)btnInfoPressed:(id)sender;

- (BOOL)ProcessCompletedSwitches:(id)sender;
- (void)InitializeLevel:(id)sender;
- (void)InitializeLevelComponentsGeneral:(id)sender;
- (void)AddRecordPlayerAction:(NSInteger)nActionType:(UIButton*)btnTarget:(NSString*)strButtonType:(LevelTemplateViewController*)VC;
- (void)InitializeRandomizer:(id)sender;
- (void)InitializePoints:(id)sender;
@end
