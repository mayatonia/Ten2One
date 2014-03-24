//
//  LevelBase.m
//  Ten1
//
//  Created by Oswald on 7/22/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "LevelBase.h"


@implementation LevelBase

@synthesize C_VIEW;
@synthesize C_VIEWCONTROLLER;
@synthesize C_LEVELID;
@synthesize C_DIFFICULTY;

- (void)initWithLevelID:(NSInteger)levelid{
	self.C_LEVELID = levelid;
}

- (void)initWithView:(UIView *)view{
	self.C_VIEW = view;
}

- (void)initWithViewController:(UIViewController *)viewcontroller{
	self.C_VIEWCONTROLLER = viewcontroller;
}
@end
