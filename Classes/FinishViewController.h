//
//  FinishViewController.h
//  Ten1
//
//  Created by Oswald on 9/20/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlayerScore.h"
#import "GameBase.h"

@class PlayerScore;
@class GameBase;

@interface FinishViewController : UIViewController {

	UITextField	*txtPlayerName;
	UITextField	*txtLocationCity;
	UITextField	*txtLocationState;
	UITextField	*txtLocationCountry;
	UITextField	*txtAge;
	UILabel		*lblScore;
	UISegmentedControl *segGender;
	UILabel		*lblAge;
	UISlider	*slideAge;
	
	PlayerScore *_PlayerScore;
	GameBase	*GameBaseEngine;
	
}

@property (nonatomic, retain) IBOutlet UITextField		*txtPlayerName;
@property (nonatomic, retain) IBOutlet UITextField		*txtLocationCity;
@property (nonatomic, retain) IBOutlet UITextField		*txtLocationState;
@property (nonatomic, retain) IBOutlet UITextField		*txtLocationCountry;
@property (nonatomic, retain) IBOutlet UITextField		*txtAge;
@property (nonatomic, retain) IBOutlet UILabel			*lblScore;
@property (nonatomic, retain) IBOutlet UISegmentedControl	*segGender;
@property (nonatomic, retain) IBOutlet UILabel			*lblAge;
@property (nonatomic, retain) IBOutlet UISlider			*slideAge;
@property (nonatomic, retain) PlayerScore			*_PlayerScore;
@property (nonatomic, retain) GameBase				*GameBaseEngine;

- (IBAction)btnSubmitScorePressed:(id)sender;
- (IBAction)btnReturnToMainMenuPressed:(id)sender;
- (IBAction)dismissKeyboard:(id)sender;
- (IBAction)slideAgeValueChanged:(id)sender;
- (void)PlayButtonClickSound;
@end
