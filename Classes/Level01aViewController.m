//
//  Level01aViewController.m
//  Ten1
//
//  Created by Oswald on 11/15/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "Level01aViewController.h"


@implementation Level01aViewController


- (void)InitializeLevel:(id)sender{
	[self setNMaxSwitches:0];
	[self setNMaxCones:0];		
}

- (void)InitializePoints:(id)sender
{
	NSLog(@"Randomizer - Initialize Points for Level %d", [self nLevelID]);
	ptLoc1 = CGPointMake(14.0, 70.0);
	ptLoc2 = CGPointMake(14.0, 295.0);
	ptLoc3 = CGPointMake(183.0, 295.0);
	ptLoc4 = CGPointMake(93.0, 70.0);
	ptLoc5 = CGPointMake(243.0, 70.0);
}


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
