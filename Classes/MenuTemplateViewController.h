//
//  MenuTemplateViewController.h
//  Ten1
//
//  Created by Oswald on 9/27/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainMenuViewController.h"

@class MainMenuViewController;

@interface MenuTemplateViewController : UIViewController {
	UIButton		*btnBack;
	UISwitch		*swhSoundMode;
	UITableView		*tvScoreBoard;
	
	MainMenuViewController *previousVC;
	BOOL		bSoundMode;
}

@property (nonatomic, retain) IBOutlet UIButton *btnBack;
@property (nonatomic, retain) MainMenuViewController	*previousVC;
@property (nonatomic, retain) IBOutlet UISwitch			*swhSoundMode;
@property (nonatomic, retain) IBOutlet UITableView		*tvScoreBoard;

@property (nonatomic)		  BOOL				bSoundMode;

- (IBAction)btnBackPressed:(id)sender;
- (IBAction)btnSwitchPressed:(id)sender;

@end
