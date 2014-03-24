//
//  PlayerScore.m
//  Ten1
//
//  Created by Oswald on 10/9/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "PlayerScore.h"
#define kPLAYERNAME  @"S_PLAYERNAME"
#define kLOCATION_CITY  @"S_LOCATION_CITY"
#define kLOCATION_STATE  @"S_LOCATION_STATE"
#define kLOCATION_COUNTRY  @"S_LOCATION_COUNTRY"
#define kAGE  @"N_AGE"
#define kDIFFICULTY  @"N_DIFFICULTY"
#define kGENDER  @"N_GENDER"
#define kLIVESREMAINING  @"N_LIVESREMAINING"
#define kPOINTS  @"N_POINTS"
#define kSCORE  @"N_SCORE"
#define kSECONDS_REMAINING @"N_SECONDS_REMAINING"



@implementation PlayerScore
@synthesize S_PLAYERNAME;
@synthesize S_LOCATION_CITY;
@synthesize S_LOCATION_STATE;
@synthesize S_LOCATION_COUNTRY;
@synthesize N_AGE;
@synthesize	N_DIFFICULTY;
@synthesize N_GENDER;
@synthesize	N_LIVESREMAINING;
@synthesize	N_POINTS;
@synthesize N_SCORE;
@synthesize N_SECONDS_REMAINING;



- (void)encodeWithCoder:(NSCoder *)encoder
{
	[encoder encodeObject:S_PLAYERNAME forKey:kPLAYERNAME];
	[encoder encodeObject:S_LOCATION_CITY forKey:kLOCATION_CITY];
	[encoder encodeObject:S_LOCATION_CITY forKey:kLOCATION_STATE];
	[encoder encodeObject:S_LOCATION_CITY forKey:kLOCATION_COUNTRY];
	
	[encoder encodeInteger:N_AGE forKey:kAGE];
	[encoder encodeInteger:N_DIFFICULTY forKey:kDIFFICULTY];
	[encoder encodeInteger:N_LIVESREMAINING forKey:kLIVESREMAINING];
	[encoder encodeInteger:N_POINTS forKey:kPOINTS];
	[encoder encodeInteger:N_SCORE forKey:kSCORE];
	[encoder encodeInteger:N_SECONDS_REMAINING forKey:kSECONDS_REMAINING];

}

- (id)initWithCoder:(NSCoder *)decoder
{
	if ((self == [super init]))
	{
		S_PLAYERNAME = [[decoder decodeObjectForKey:kPLAYERNAME] retain];
		S_LOCATION_CITY = [[decoder decodeObjectForKey:kLOCATION_CITY] retain];
		S_LOCATION_STATE = [[decoder decodeObjectForKey:kLOCATION_STATE] retain];
		S_LOCATION_COUNTRY = [[decoder decodeObjectForKey:kLOCATION_COUNTRY] retain];
		N_AGE = [decoder decodeIntegerForKey:kAGE];
		N_DIFFICULTY = [decoder decodeIntegerForKey:kDIFFICULTY];
		N_LIVESREMAINING = [decoder decodeIntegerForKey:kLIVESREMAINING];
		N_POINTS = [decoder decodeIntegerForKey:kPOINTS];
		N_SCORE = [decoder decodeIntegerForKey:kSCORE];
		N_SECONDS_REMAINING = [decoder decodeIntegerForKey:kSECONDS_REMAINING];
	}
	
	return self;
}


@end
