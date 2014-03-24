//
//  LevelBase.h
//  Ten1
//
//  Created by Oswald on 7/22/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LevelBase : NSObject {

	NSInteger			C_LEVELID;
	NSInteger			C_DIFFICULTY; //0=EASY 1=HARD 2=HELL
	UIView *			C_VIEW;
	UIViewController *	C_VIEWCONTROLLER;
}

@property (nonatomic, retain) IBOutlet UIView *				C_VIEW;
@property (nonatomic, retain) IBOutlet UIViewController *	C_VIEWCONTROLLER;
@property (nonatomic) IBOutlet NSInteger					C_LEVELID;
@property (nonatomic) IBOutlet NSInteger					C_DIFFICULTY;


- (void)initWithLevelID:(NSInteger)LevelID;
- (void)initWithView:(UIView *)view;
- (void)initWithViewController:(UIViewController *)viewcontroller;


@end
