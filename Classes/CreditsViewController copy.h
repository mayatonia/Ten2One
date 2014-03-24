//
//  CreditsViewController.h
//  Ten1
//
//  Created by Oswald on 9/19/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface CreditsViewController : UIViewController {

	UIButton	*btnBack;
	UIViewController *previousVC;
	
	
}
@property (nonatomic, retain) IBOutlet UIButton *btnBack;
@property (nonatomic, retain) UIViewController	*previousVC;

- (IBAction)btnBackPressed:(id)sender;

@end
