//
//  GameBase.h
//  Ten1
//
//  Created by Oswald on 7/22/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreAudio/CoreAudioTypes.h>
#import <OpenAL/al.h>
#import <OpenAL/alc.h>
#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>

#define kGameName			 "UndefinedChallenge";
#define kPlayerLives		 10;
#define kWidth				 360;
#define kHeight				 420;
#define kTimerInterval		 0.01; // 1/10 of a second
#define kCurrentInterval	 0;
#define kFinalInterval		 600; //60 seconds x Interval

@class LevelTemplateViewController;
@class Level01ViewController;
@class Level01aViewController;
@class Level02ViewController;
@class Level03ViewController;
@class Level04ViewController;
@class Level05ViewController;
@class Level06ViewController;
@class Level07ViewController;
@class Level08ViewController;
@class Level09ViewController;
@class Level10ViewController;
@class LevelBase;
@class PlayerBase;


@interface GameBase : NSObject < UIAlertViewDelegate > {
	NSArray * C_ARR_GAMEELEMENTS;
	NSArray * C_ARR_PLAYERS;
	NSArray * C_ARR_VIEWS;
	NSTimer * C_GAME_TIMER;
	
	NSInteger C_CURRENTINTERVAL;
	NSInteger C_TIMEREMAINING;
	NSInteger C_GAME_DIFFICULTY;
	BOOL	  C_UPDATE_LIVES;
	BOOL      C_UPDATE_LEVEL;
	BOOL      C_UPDATE_POINTS;
	BOOL      C_UPDATE_DIFFICULTY;
	BOOL	  C_RUNNING;
	BOOL	  C_RESTART_GAME;
	BOOL	  C_ANIMATION_RUNNING;
	BOOL	  C_SOUND_MODE;
	

	GameBase * _Instance;
	LevelBase * _LevelBase;
	PlayerBase * _PlayerBase;
	AVAudioPlayer * _AVPlayer;
	NSMutableArray		  *C_ARR_PLAYERACTIONS;
	
	Level01ViewController *Level01VC;
	Level01aViewController *Level01aVC;
	Level02ViewController *Level02VC;
	Level03ViewController *Level03VC;
	Level04ViewController *Level04VC;
	Level05ViewController *Level05VC;
	Level06ViewController *Level06VC;
	Level07ViewController *Level07VC;
	Level08ViewController *Level08VC;
	Level09ViewController *Level09VC;
	Level10ViewController *Level10VC;
	
	UIViewController	*_ParentViewController;
}

@property (nonatomic, retain) NSArray						*C_ARR_PLAYERS;
@property (nonatomic, retain) NSArray						*	C_ARR_GAMEELEMENTS;
@property (nonatomic, retain) NSArray						* C_ARR_VIEWS;
@property (nonatomic, retain) NSTimer						* C_GAME_TIMER;
@property (nonatomic, retain) GameBase						* _Instance;
@property (nonatomic) NSInteger								C_CURRENTINTERVAL;
@property (nonatomic) NSInteger								C_TIMEREMAINING;
@property (nonatomic) NSInteger								C_GAME_DIFFICULTY;
@property (nonatomic) BOOL									C_UPDATE_LIVES;
@property (nonatomic) BOOL									C_UPDATE_LEVEL;
@property (nonatomic) BOOL									C_UPDATE_POINTS;
@property (nonatomic) BOOL									C_UPDATE_DIFFICULTY;
@property (nonatomic) BOOL								    C_RUNNING;
@property (nonatomic) BOOL									C_RESTART_GAME;
@property (nonatomic) BOOL									C_ANIMATION_RUNNING;
@property (nonatomic) BOOL									C_SOUND_MODE;
@property (nonatomic, retain) LevelBase						*_LevelBase;
@property (nonatomic, retain) PlayerBase					*_PlayerBase;
@property (nonatomic, retain) AVAudioPlayer					*_AVPlayer;
@property (nonatomic, retain) NSMutableArray					*C_ARR_PLAYERACTIONS;
@property (nonatomic, retain) Level01ViewController   *Level01VC;
@property (nonatomic, retain) Level01aViewController  *Level01aVC;
@property (nonatomic, retain) Level02ViewController   *Level02VC;
@property (nonatomic, retain) Level03ViewController   *Level03VC;
@property (nonatomic, retain) Level04ViewController	  *Level04VC;
@property (nonatomic, retain) Level05ViewController	  *Level05VC;
@property (nonatomic, retain) Level06ViewController	  *Level06VC;
@property (nonatomic, retain) Level07ViewController	  *Level07VC;
@property (nonatomic, retain) Level08ViewController	  *Level08VC;
@property (nonatomic, retain) Level09ViewController	  *Level09VC;
@property (nonatomic, retain) Level10ViewController	  *Level10VC;
@property (nonatomic, retain) UIViewController		  *_ParentViewController;


- (void)initWithGameName:(NSString *)strName;
- (void)InitializeFirstLevelOfChallenge:(UIView *)view: (UIViewController *)viewcontroller: (NSInteger)challengeid;
- (void)StartGame:( UIView *)view: (UIViewController *)viewcontroller: (NSInteger)challengeid;
- (void)LoadChallenge0:(UIView *)view: (UIViewController *)viewcontroller;
- (void)InitializeTimeVars;
- (void)OnGameTimerTicked;
- (void)switchViews:(UIViewController *)viewcontroller:(NSInteger)levelIdFrom:(NSInteger)LevelIdTo;
- (void)AddPlayerPoints:(NSInteger)Points;
- (void)ResetLevels;
- (void)ResetPlayerSettings;
- (void)ResetLevelSettings;
- (void)PlaySoundFile:(NSString *)strFileName:(NSInteger)nPlayerID;
- (void)PlaySoundFile:(NSString *)strFileName;
- (void)AddRecordPlayerAction:(NSInteger)nActionType:(UIButton*)btnTarget:(NSString*)strButtonType:(LevelTemplateViewController*)VC:(NSInteger)nLevelID;
- (void)ReplayPreviousPlayerActions;
- (void)SetGameDifficulty:(NSInteger)nDifficultySetting;
- (void)RestartGame;
- (void)EndGame;
- (void)StopMusic;
- (void)PauseGame;
- (void)ResumeGame;
@end
