//
//  OnlineScoreBoardViewController.h
//  Ten1
//
//  Created by Oswald on 9/27/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MenuTemplateViewController.h"

@interface OnlineScoreBoardViewController : MenuTemplateViewController {

	NSMutableArray  *arrTop50Players;
	UITableView		*tvLeaderBoard;
	UIWebView		*wvLeaderboard;
	NSMutableString *sMyPage;
}

@property (nonatomic, retain) IBOutlet UITableView *tvLeaderBoard;
@property (nonatomic, retain) IBOutlet NSMutableArray *arrTop50Players;
@property (nonatomic, retain) IBOutlet UIWebView	   *wvLeaderboard;
@property (nonatomic, retain) NSMutableString			*sMyPage;

- (void) queryComplete:(NSMutableArray*) items;
- (void) queryWithAttributesComplete:(NSMutableArray*) items;
- (void) processQuery:(NSMutableArray*) items;
@end
