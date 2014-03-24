//
//  PlayerAction.h
//  Ten1
//
//  Created by Oswald on 9/22/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LevelTemplateViewController.h"

@class LevelTemplateViewController;
@interface PlayerAction : NSObject {

	LevelTemplateViewController	*_ParentViewController;
	UIButton			*_TargetButton;
	NSString			*_TargetButtonType;
	NSInteger			_Timestampt;
	NSInteger			_ActionType; //0=TOUCH DOWN INSIDE 1=TOUCH UP INSIDE	
	NSInteger			_LevelID;
	NSInteger			_PlayerID;
	NSInteger			_LastPlayerIDPlayedFor;
	NSInteger			_ActionID;
}

@property (nonatomic, retain) LevelTemplateViewController		*_ParentViewController;
@property (nonatomic, retain) UIButton				*_TargetButton;
@property (nonatomic, retain) NSString				*_TargetButtonType;
@property (nonatomic)	NSInteger					_Timestampt;
@property (nonatomic)	NSInteger					_ActionType;
@property (nonatomic)	NSInteger					_LevelID;
@property (nonatomic)	NSInteger					_PlayerID;
@property (nonatomic)   NSInteger					_LastPlayerIDPlayedFor;
@property (nonatomic)	NSInteger					_ActionID;


@end
