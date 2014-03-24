//
//  OnlineScoreBoardViewController.m
//  Ten1
//
//  Created by Oswald on 9/27/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "OnlineScoreBoardViewController.h"
#import "MenuTemplateViewController.h"
#import "MainMenuViewController.h"
#import "SimpleDb.h"
#import "PlayerScore.h"


@implementation OnlineScoreBoardViewController
@synthesize tvLeaderBoard;
@synthesize arrTop50Players;
@synthesize wvLeaderboard;
@synthesize sMyPage;

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
	
	SimpleDb *sdb = [[SimpleDb alloc] init];
	
	NSString *awsSK = [NSString stringWithString:@"--"];
	NSString *awsSSK = [NSString stringWithString:@"--"];
	
	[sdb setAWSAccount:awsSK secret:awsSSK];
	sdb.delegate = self;
	
	//NSString *sGetTop50Players = @"select * from ten2oneleaderboard where SCORE > '0' order by SCORE desc limit 50";
	NSString *sGetTop50Players = @"select NAME, SCORE, DIFFICULTY, AGE, GENDER, LOC_CITY, LOC_STATE, LOC_COUNTRY from ten2oneleaderboard where SCORE > '0' order by SCORE desc limit 50";
	[sdb queryWithAttributes:@"ten2oneleaderboard" expression:sGetTop50Players];
	
	//[sdb queryWithAttributesResponse];

    [super viewDidLoad];
}

- (void) processQuery:(NSMutableArray*) items
{
	NSMutableString *mypage = [[[NSMutableString alloc] init] retain];
	[mypage appendString:@"<html>"];
	[mypage appendString:@"<table border=\"1\" width=\"100%\" >"];
	[mypage appendString:@"<tr>"];
	[mypage appendString:@"<th><font size=18>#&nbsp</font></th>"];
	[mypage appendString:@"<th><font size=18>Name</font></th>"];
	[mypage appendString:@"<th><font size=18>Score</font></th>"];
	[mypage appendString:@"<th><font size=18>Mode</font></th>"];
	[mypage appendString:@"<th><font size=18>Age</font></th>"];
	[mypage appendString:@"<th><font size=18>Sex</font></th>"];
	[mypage appendString:@"<th><font size=18>Location</font></th>"];
	[mypage appendString:@"</tr>"];
	
	NSLog(@"RECEIVED %d ROWS BACK FROM SERVER.", [items count]);
	int i = 0;
	for (i = 0;i < [items count]; i++)
	{
		[mypage appendString:@"<tr>"];
		SimpleDbItem *item = [items objectAtIndex:i];
		NSLog(@"ITEM NAME(%d): %@", i, item.name);
		int r = 0;
		NSMutableDictionary *dict = item.attributes;
		NSLog(@"RECEIVED %d ATTRIBUTES BACK FROM SERVER.", [dict count]);

		NSEnumerator *e = [dict objectEnumerator];
		SimpleDbAttribute *attribute;
		
		//PlayerScore *ps = [[PlayerScore alloc] init];
		
		[mypage appendString:[NSString stringWithFormat:@"<td><font size=8>%d</font></td>", (i + 1)]];
		
		SimpleDbAttribute *aName = [dict objectForKey:@"NAME"];
		[mypage appendString:[NSString stringWithFormat:@"<td><font size=14>%@</font></td>", aName.value]];
		
		aName = [dict objectForKey:@"SCORE"];
		NSInteger nScore = [aName.value intValue];
		[mypage appendString:[NSString stringWithFormat:@"<td><font size=14>%d</font></td>", nScore]];
		
		aName = [dict objectForKey:@"DIFFICULTY"];
		NSString *sDiff;
		if ([aName.value intValue] == 0)
		{
			sDiff = [NSString stringWithString:@"Easy"];
		}
		else if ([aName.value intValue] == 1)
		{
			sDiff = [NSString stringWithString:@"Hard"];
		}
		else if ([aName.value intValue] == 2)
		{
			sDiff = [NSString stringWithString:@"Hell"];
		}
		
		[mypage appendString:[NSString stringWithFormat:@"<td><font size=14>%@</font></td>", sDiff]];
		
		aName = [dict objectForKey:@"AGE"];
		[mypage appendString:[NSString stringWithFormat:@"<td><font size=14>%@</font></td>", aName.value]];
		
		aName = [dict objectForKey:@"GENDER"];
		NSString *sGender;
		if ([aName.value intValue] == 0)
		{
			sGender = [NSString stringWithString:@"M"];
		}
		else if ([aName.value intValue] == 1)
		{
			sGender = [NSString stringWithString:@"F"];
		}
		
		[mypage appendString:[NSString stringWithFormat:@"<td><font size=14>%@</font></td>", sGender]];
		
		NSMutableString *sLoc = [[NSMutableString alloc] init];
		aName = [dict objectForKey:@"LOC_CITY"];
		[sLoc appendString:[NSString stringWithFormat:@"%@, ", aName.value]];
		aName = [dict objectForKey:@"LOC_STATE"];
		[sLoc appendString:[NSString stringWithFormat:@"%@, ", aName.value]];
		aName = [dict objectForKey:@"LOC_COUNTRY"];
		[sLoc appendString:aName.value];
		
		[mypage appendString:[NSString stringWithFormat:@"<td><font size=14>%@</font></td>", sLoc]];
		
		while (attribute = [e nextObject])
		{
			NSLog(@"ATTRIBUTE(%d): %@: %@", r, attribute.name, attribute.value);
			r++;
		}

		[mypage appendString:@"</tr>"];
	}
	
	[mypage appendString:@"</table>"];
	[mypage appendString:@"</html>"];
	NSString *imagePath = [[NSBundle mainBundle] resourcePath];
	imagePath = [imagePath stringByReplacingOccurrencesOfString:@"/" withString:@"//"];
	imagePath = [imagePath stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
	
	NSLog(@"FORMATTED HTMLPAGE: \n%@", mypage);
	self.sMyPage = mypage;
	
	[wvLeaderboard loadHTMLString:mypage baseURL:[NSURL URLWithString:[NSString stringWithFormat:@"file:/%@//", imagePath]]];
	[wvLeaderboard sizeToFit];

}

- (void) queryWithAttributesComplete:(NSMutableArray*) items
{

	[self processQuery:items];
		
}

- (void) queryComplete:(NSMutableArray*) items
{
	
	
	
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
