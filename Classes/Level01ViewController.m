//
//  Level01ViewController.m
//  Ten1
//
//  Created by Oswald on 7/14/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "Level01ViewController.h"




@implementation Level01ViewController





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
	[self setNMaxSwitches:1];
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



- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	
	// We only support single touches, so anyObject retrieves just that touch from touches
	UITouch *touch = [touches anyObject];
	NSLog(@"Touches Began");
	// Only move the placard view if the touch was in the placard view
	//if ([touch view] != placardView) {
		//// In case of a double tap outside the placard view, update the placard's display string
		//if ([touch tapCount] == 2) {
		//	[placardView setupNextDisplayString];
		//}
		//return;
	//}
	// Animate the first touch
	//CGPoint touchPoint = [touch locationInView:self];
	//[self animateFirstTouchAtPoint:touchPoint];
}


- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
	
	UITouch *touch = [touches anyObject];
	NSLog(@"Touches Moved");
	// If the touch was in the placardView, move the placardView to its location
	//if ([touch view] == placardView) {
	//	CGPoint location = [touch locationInView:self];
	//	placardView.center = location;		
	//	return;
	//}
}


- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
	
	UITouch *touch = [touches anyObject];
	NSLog(@"Touches Ended");
	
	//touch.view.hidden = YES;
	

	// If the touch was in the placardView, bounce it back to the center
	//if ([touch view] == placardView) {
		// Disable user interaction so subsequent touches don't interfere with animation
		//self.userInteractionEnabled = NO;
		//[self animatePlacardViewToCenter];
		//return;
	//}		
}


- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
	
	NSLog(@"Touches cancelled.");
	/*
     To impose as little impact on the device as possible, simply set the placard view's center and transformation to the original values.
     */
	//placardView.center = self.center;
	//placardView.transform = CGAffineTransformIdentity;
}



@end
