//
//  Level08ViewController.m
//  Ten1
//
//  Created by Oswald on 9/20/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "Level08ViewController.h"


@implementation Level08ViewController

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
- (void)InitializeLevel:(id)sender{
	[self setNMaxSwitches:5];
	[self setNMaxCones:40];	
}
- (void)InitializePoints:(id)sender
{
	NSLog(@"Randomizer - Initialize Points for Level %d", [self nLevelID]);
	ptLoc1 = CGPointMake(2.0, 264.0);
	ptLoc2 = CGPointMake(191.0, 396.0);
	ptLoc3 = CGPointMake(218.0, 331.0);
	ptLoc4 = CGPointMake(0.0, 0.0);
	ptLoc5 = CGPointMake(0.0, 0.0);
}
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
