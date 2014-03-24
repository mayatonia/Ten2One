//
//  PlayerBase.h
//  Ten1
//
//  Created by Oswald on 7/22/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kPlayerName			= "UndefinedPlayer";


@interface PlayerBase : NSObject {
	NSArray * C_ARR_TOUCHES;
	UIImage * C_ICON;
	NSInteger C_LIVES;
	NSInteger C_POINTS;
	BOOL	  C_LEVEL03_SWITCH_ON;
	BOOL	  C_LEVEL01a_SWITCH_ON;
}

@property (nonatomic, retain) IBOutlet NSArray * C_ARR_TOUCHES;
@property (nonatomic, retain) IBOutlet UIImage * C_ICON;
@property (nonatomic) NSInteger					 C_LIVES;
@property (nonatomic) NSInteger					 C_POINTS;
@property (nonatomic) BOOL						 C_LEVEL03_SWITCH_ON;
@property (nonatomic) BOOL						 C_LEVEL01a_SWITCH_ON;

@end
