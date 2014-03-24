//
//  FinishViewController.m
//  Ten1
//
//  Created by Oswald on 9/20/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "FinishViewController.h"
#import <Foundation/Foundation.h>
#import "SimpleDb.h"
#define kMAXLENGTHNAME		28
#define kMAXLENGTHCITY		28
#define kMAXLENGTHSTATE		3
#define kMAXLENGTHCOUNTRY	3
	

@implementation FinishViewController
@synthesize txtPlayerName;
@synthesize txtLocationCity;
@synthesize txtLocationState;
@synthesize txtLocationCountry;
@synthesize txtAge;
@synthesize lblScore;
@synthesize _PlayerScore;
@synthesize segGender;
@synthesize lblAge;
@synthesize slideAge;
@synthesize GameBaseEngine;

- (IBAction)slideAgeValueChanged:(id)sender
{
	lblAge.text = [NSString stringWithFormat:@"%d", [[NSNumber numberWithFloat:slideAge.value] intValue] ];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
	NSInteger nMax = 0;
	
	if (textField == txtPlayerName)
	{
		nMax = kMAXLENGTHNAME;
	}
	else if (textField == txtLocationCity)
	{
		nMax = kMAXLENGTHCITY;
	}
	else if (textField == txtLocationState)
	{
	    nMax = kMAXLENGTHSTATE;
	}
	else if (textField == txtLocationCountry)
	{
		nMax = kMAXLENGTHCOUNTRY;
	}
	else
	{
		nMax = kMAXLENGTHNAME;
	}
	
	if (textField.text.length >= nMax && range.length == 0 &&
		![string isEqualToString:@"\n"])
	{
		return NO; //do not change text
	}
	
	return YES;
}

- (IBAction)btnReturnToMainMenuPressed:(id)sender
{
	UIWindow *curWindow = [self.view window];
	
	[self PlayButtonClickSound];
	
	[GameBaseEngine EndGame];

	[self.view removeFromSuperview];
	
	[curWindow addSubview:[GameBaseEngine._ParentViewController view]];
	[GameBaseEngine._ParentViewController.view  setHidden:FALSE];
	[self release];
	
}

-(IBAction)btnSubmitScorePressed:(id)sender
{
	UIButton *button = sender;
	
	if (![button.titleLabel.text isEqualToString:@"View Leaderboard"])
	{
		[self PlayButtonClickSound];
		if (_PlayerScore != nil)
		{
			if ([txtPlayerName.text length] > 0) 
			{
				[_PlayerScore setS_PLAYERNAME:txtPlayerName.text];
			}
			else
			{
				[_PlayerScore setS_PLAYERNAME:@""];
			}
			
			
			if ([txtLocationCity.text length] > 0) 
			{
				[_PlayerScore setS_LOCATION_CITY:txtLocationCity.text];
			}
			else
			{
				[_PlayerScore setS_LOCATION_CITY:@""];
			}
			
			
			if ([txtLocationState.text length] > 0) 
			{
				[_PlayerScore setS_LOCATION_STATE:txtLocationState.text];
			}
			else
			{
				[_PlayerScore setS_LOCATION_STATE:@""];
			}
			
			if ([txtLocationCountry.text length] > 0) 
			{
				[_PlayerScore setS_LOCATION_COUNTRY:txtLocationCountry.text];
			}
			else
			{
				[_PlayerScore setS_LOCATION_COUNTRY:@""];
			}

		    [_PlayerScore setN_AGE:[lblAge.text intValue]];

			if ([segGender selectedSegmentIndex] == 0)
			{
				[_PlayerScore setN_GENDER: 0];
			}
			else
			{
				[_PlayerScore setN_GENDER:1];
			}
			

			NSString *docsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
			NSString *filePath = [docsPath stringByAppendingPathComponent:@"playerscore"];
			
			NSString *sUID = [[NSProcessInfo processInfo] globallyUniqueString];
			
			
			//[NSKeyedArchiver archiveRootObject:_PlayerScore toFile:filePath];
		
			SimpleDb *sdb = [[SimpleDb alloc] init];
			NSMutableArray *myparams = [NSMutableArray new];
			//[myparams addObject:[SimpleDbAttribute create:@"PID" value:sUID replace:FALSE]];
			[myparams addObject:[SimpleDbAttribute create:@"ENTRYDATE" value:[sdb getTimestamp] replace:FALSE]];
			[myparams addObject:[SimpleDbAttribute create:@"NAME" value:_PlayerScore.S_PLAYERNAME replace:FALSE]];
			[myparams addObject:[SimpleDbAttribute create:@"SCORE" value:[NSString stringWithFormat: @"%09d", _PlayerScore.N_SCORE] replace:FALSE]];
			[myparams addObject:[SimpleDbAttribute create:@"AGE" value:[NSString stringWithFormat: @"%d", _PlayerScore.N_AGE] replace:FALSE]];
			[myparams addObject:[SimpleDbAttribute create:@"DIFFICULTY" value:[NSString stringWithFormat: @"%d", _PlayerScore.N_DIFFICULTY] replace:FALSE]];
			[myparams addObject:[SimpleDbAttribute create:@"GENDER" value:[NSString stringWithFormat: @"%d", _PlayerScore.N_GENDER] replace:FALSE]];
			[myparams addObject:[SimpleDbAttribute create:@"POINTS" value:[NSString stringWithFormat: @"%d", _PlayerScore.N_POINTS] replace:FALSE]];
			[myparams addObject:[SimpleDbAttribute create:@"LIVESREMAINING" value:[NSString stringWithFormat: @"%d", _PlayerScore.N_LIVESREMAINING] replace:FALSE]];
			[myparams addObject:[SimpleDbAttribute create:@"SECONDSREMAINING" value:[NSString stringWithFormat: @"%d", _PlayerScore.N_SECONDS_REMAINING] replace:FALSE]];
			[myparams addObject:[SimpleDbAttribute create:@"LOC_CITY" value:_PlayerScore.S_LOCATION_CITY replace:FALSE]];
			[myparams addObject:[SimpleDbAttribute create:@"LOC_STATE" value:_PlayerScore.S_LOCATION_STATE replace:FALSE]];
			[myparams addObject:[SimpleDbAttribute create:@"LOC_COUNTRY" value:_PlayerScore.S_LOCATION_COUNTRY replace:FALSE]];
			
			NSString *awsSK = [NSString stringWithString:@"--"];
			NSString *awsSSK = [NSString stringWithString:@"--"];
			
			[sdb setAWSAccount:awsSK secret:awsSSK];
			sdb.delegate = self;
			[sdb putAttributes:@"ten2oneleaderboard" itemName:sUID attributes:myparams];
			
			[button setTitle:@"Score Submitted!" forState:UIControlStateDisabled];
			[button setAlpha:0.6];
			[button setEnabled:FALSE];
		}
	}
	else
	{
		//Show leader board.
		
	}		
}

- (IBAction)dismissKeyboard:(id)sender
{
	[sender resignFirstResponder];
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


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	[lblScore setText:[NSString stringWithFormat:@"Score: %d", _PlayerScore.N_SCORE]];
	[GameBaseEngine StopMusic];
    [super viewDidLoad];
}

- (void)PlayButtonClickSound
{
	NSString * soundfile = [NSString stringWithString:@"/ButtonClick.wav"];
	[GameBaseEngine PlaySoundFile:soundfile];
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
