//
//  MenuTemplateViewController.m
//  Ten1
//
//  Created by Oswald on 9/27/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "MenuTemplateViewController.h"


@implementation MenuTemplateViewController
@synthesize btnBack;
@synthesize previousVC;
@synthesize bSoundMode;
@synthesize swhSoundMode;
@synthesize tvScoreBoard;

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

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/
- (IBAction)btnBackPressed:(id)sender{
	
	[self.view removeFromSuperview];
	[previousVC.view setHidden:FALSE];
	[self release];
	
}

- (IBAction)btnSwitchPressed:(id)sender{
	UISwitch *theswitch = sender;
	
	[self setBSoundMode:theswitch.on];
}

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
